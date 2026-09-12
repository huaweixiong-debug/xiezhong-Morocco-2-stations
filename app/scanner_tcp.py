"""TCP scanner client for network barcode readers.

Target: Keyence SR-series reader (192.168.2.10) configured through
AutoID Network Navigator.  The reader either acts as a TCP server the PC
connects to, or as a TCP client that pushes decoded codes to a listening
port on this PC.  Both roles are supported; role, address and framing are
configuration driven (config/fieldtest.toml), nothing is hard-coded.

This module is hardware-facing.  It receives decoded codes and supports the
scanner's explicit acquisition commands: ``LON`` starts scanning and ``LOFF``
stops scanning.  Commands are terminated with the configured line ending and
replayed after reconnects.
"""
from __future__ import annotations
import queue
import socket
import threading
import time
from pathlib import Path
from threading import RLock

from .scanner import ScannerFramer, ScannerGuard

_DEFAULT_TIMEOUT = 1.0


class TcpScanner:
    """Background TCP reader with auto-reconnect and duplicate guard."""

    def __init__(self, ip: str, port: int, *, role: str = "client",
                 listen_port: int = 8500, terminator: bytes = b"\r",
                 trigger: bytes = b"", duplicate_window_s: float = 2.0) -> None:
        if role not in ("client", "server"):
            raise ValueError(f"无效扫码器角色: {role}")
        if role == "client":
            socket.inet_aton(ip)  # raises OSError on bad address
            if not 1 <= port <= 65535:
                raise ValueError(f"无效扫码器端口: {port}")
        if not 1 <= listen_port <= 65535:
            raise ValueError(f"无效监听端口: {listen_port}")
        self.ip, self.port, self.role = ip, port, role
        self.listen_port = listen_port
        self.terminator, self.trigger = terminator, trigger
        self.codes: "queue.Queue[str]" = queue.Queue()
        self._framer = ScannerFramer(terminator)
        self._guard = ScannerGuard(duplicate_window_s)
        self._stop = threading.Event()
        self._connected = threading.Event()
        self._connection_lock = RLock()
        self._conn: socket.socket | None = None
        # The scanner keeps its last requested acquisition state.  When the
        # TCP link reconnects, the command is replayed so the device cannot
        # silently remain in the opposite state from the UI.
        self._desired_command: bytes | None = None
        self._last_activity = 0.0
        self.last_error = ""
        self._thread = threading.Thread(target=self._run, name=f"tcp-scanner-{role}", daemon=True)

    def start(self) -> None:
        if self._thread.is_alive():
            return
        self._stop.clear()
        self._thread.start()

    def close(self) -> None:
        self._stop.set()
        with self._connection_lock:
            conn = self._conn
        if conn is not None:
            try:
                conn.shutdown(socket.SHUT_RDWR)
            except OSError:
                pass
            try:
                conn.close()
            except OSError:
                pass

    def health(self) -> bool:
        return self._connected.is_set() and (time.monotonic() - self._last_activity) < 30.0

    def connected(self) -> bool:
        """Return the current TCP connection state, including an idle reader."""
        return self._connected.is_set()

    def set_scan_enabled(self, enabled: bool) -> bool:
        """Send the scanner acquisition command and remember the desired state.

        The Keyence command protocol used by this line is ``LON``/``LOFF``
        followed by the configured terminator.  A command requested while the
        socket is offline is queued and replayed on the next connection; the
        return value only reports whether it was sent on the current socket.
        """
        command = "LON" if enabled else "LOFF"
        payload = command.encode("ascii")
        if self.terminator and not payload.endswith(self.terminator):
            payload += self.terminator
        with self._connection_lock:
            self._desired_command = payload
        return self._send_payload(payload)

    def send_command(self, command: str | bytes) -> bool:
        """Send one raw scanner command, adding the configured terminator."""
        payload = command.encode("ascii") if isinstance(command, str) else bytes(command)
        if not payload:
            raise ValueError("扫码器命令不能为空")
        if self.terminator and not payload.endswith(self.terminator):
            payload += self.terminator
        return self._send_payload(payload)

    def read_code(self, timeout: float | None = None) -> str | None:
        try:
            return self.codes.get(timeout=timeout)
        except queue.Empty:
            return None

    def _run(self) -> None:
        backoff = 1.0
        while not self._stop.is_set():
            conn = self._open()
            if conn is None:
                self._connected.clear()
                if self._stop.wait(min(backoff, 5.0)):
                    break
                backoff = min(backoff * 2, 5.0)
                continue
            backoff = 1.0
            with self._connection_lock:
                self._conn = conn
            self._connected.set()
            try:
                with self._connection_lock:
                    command = self._desired_command or (self.trigger if self.role == "client" else b"")
                if command:
                    conn.sendall(command)
                self._pump(conn)
            except OSError as exc:
                self.last_error = f"{type(exc).__name__}: {exc}"
            finally:
                with self._connection_lock:
                    if self._conn is conn:
                        self._conn = None
                conn.close()
            self._connected.clear()

    def _send_payload(self, payload: bytes) -> bool:
        with self._connection_lock:
            conn = self._conn
            if conn is None or not self._connected.is_set():
                return False
            try:
                conn.sendall(payload)
                return True
            except OSError as exc:
                self.last_error = f"{type(exc).__name__}: {exc}"
                return False

    def _open(self) -> socket.socket | None:
        try:
            if self.role == "client":
                sock = socket.create_connection((self.ip, self.port), timeout=5.0)
                sock.settimeout(_DEFAULT_TIMEOUT)
                self.last_error = ""
                return sock
            server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            server.bind(("0.0.0.0", self.listen_port))
            server.listen(1)
            server.settimeout(_DEFAULT_TIMEOUT)
            try:
                while not self._stop.is_set():
                    try:
                        conn, addr = server.accept()
                        conn.settimeout(_DEFAULT_TIMEOUT)
                        self.last_error = ""
                        return conn
                    except socket.timeout:
                        continue
            finally:
                server.close()
            return None
        except OSError as exc:
            self.last_error = f"{type(exc).__name__}: {exc}"
            return None

    def _pump(self, conn: socket.socket) -> None:
        while not self._stop.is_set():
            try:
                data = conn.recv(1024)
            except socket.timeout:
                continue
            if not data:
                raise ConnectionError("扫码器连接关闭")
            self._last_activity = time.monotonic()
            for code in self._framer.feed(data):
                if self._guard.accept(code):
                    self.codes.put(code)


class FileScanner:
    """Line-by-line file source so the scan pipeline can be tested offline."""

    def __init__(self, path: Path, terminator: bytes = b"\r\n") -> None:
        self.path, self.terminator = Path(path), terminator
        self.codes: "queue.Queue[str]" = queue.Queue()
        self.last_error = ""

    def start(self) -> None:
        try:
            raw = self.path.read_bytes()
        except OSError as exc:
            self.last_error = f"{type(exc).__name__}: {exc}"
            return
        framer = ScannerFramer(self.terminator)
        for code in framer.feed(raw):
            self.codes.put(code)

    def close(self) -> None:
        pass

    def health(self) -> bool:
        return not self.codes.empty()

    def read_code(self, timeout: float | None = None) -> str | None:
        try:
            return self.codes.get(timeout=timeout)
        except queue.Empty:
            return None
