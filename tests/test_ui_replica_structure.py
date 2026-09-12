import os
os.environ.setdefault("QT_QPA_PLATFORM", "offscreen")

from PySide6.QtWidgets import QApplication, QPushButton, QTableWidget, QWidget
from PySide6.QtCore import Qt
from PySide6.QtTest import QTest

from app.models import StationId
from app.ui import MainWindow


def _window():
    app = QApplication.instance() or QApplication([])
    window = MainWindow(); window.show(); app.processEvents()
    return app, window


class _ScannerCommandSpy:
    def __init__(self):
        self.commands = []
        self.last_error = ""

    def set_scan_enabled(self, enabled):
        self.commands.append(bool(enabled))
        return True

    def connected(self):
        return True

    def read_code(self, timeout=None):
        return None

    def close(self):
        pass


def test_confirmed_print_reenables_shared_scanner_with_lon():
    app, window = _window()
    window.shared_scanner.close()
    scanner_spy = _ScannerCommandSpy()
    window.shared_scanner = scanner_spy
    window._scan_enabled = False
    assert window._enable_scanner_after_print(StationId.B, "cal-NG-B") is True
    assert window._scan_enabled is True
    assert scanner_spy.commands == [True]
    assert "关闭" in window.scanner_toggle.text()
    window.close(); app.processEvents()


def test_replica_tabs_and_main_station_structure():
    app, window = _window()
    assert [window.tabs.tabText(i) for i in range(4)] == ["测试", "设置", "查询", "手动"]
    assert window.findChild(QWidget, "scannerStatus") is not None
    assert window.findChild(QWidget, "shared_scanner_indicator") is not None
    assert window.findChild(QPushButton, "scanner_toggle") is not None
    phases = tuple(card.controller.phase for card in window.cards)
    toggle = window.findChild(QPushButton, "scanner_toggle")
    window.shared_scanner.close()
    scanner_spy = _ScannerCommandSpy()
    window.shared_scanner = scanner_spy
    QTest.mouseClick(toggle, Qt.MouseButton.LeftButton)
    assert window._scan_enabled is False and "开启" in toggle.text()
    assert scanner_spy.commands == [False]
    assert tuple(card.controller.phase for card in window.cards) == phases
    QTest.mouseClick(toggle, Qt.MouseButton.LeftButton)
    assert window._scan_enabled is True and "关闭" in toggle.text()
    assert scanner_spy.commands == [False, True]
    assert [window.tabs.tabBar().tabText(i) for i in range(4)] == ["测试/Main/Principale", "设置/Setup/Coup Monté", "查询/Query/Requête", "手动/Manual/Manuelle"]
    for station in ("A", "B"):
        assert window.findChild(QPushButton, f"single_dual_{station}") is not None
        for name in ("main_code", "total_today", "ok_today", "ateq_no", "part_no", "staff", "reprint", "next_action"):
            assert window.findChild(QWidget, f"{name}_{station}") is not None
        card = window.cards[0 if station == "A" else 1]
        assert card.total_today.width() <= 80
        assert card.ok_today.width() <= 80
        assert card.ateq_no.width() <= 70
        assert card.code_input.width() > card.total_today.width()
        assert window.findChild(QWidget, f"scanner_indicator_{station}") is None
        assert window.findChild(QWidget, f"watchdog_{station}") is None
        table = window.findChild(QTableWidget, f"{station}List")
        assert table.rowCount() == 30 and table.columnCount() == 10
        assert table.horizontalHeaderItem(2).text() == "QR Code"
    window.close(); app.processEvents()


def test_replica_setup_query_manual_bindings_and_language():
    app, window = _window()
    setup = window.findChild(QTableWidget, "setupParameterTable")
    assert setup.rowCount() == 40 and setup.columnCount() == 9
    window.language_selector.setCurrentText("English")
    assert "English" in window.settings_status.text()

    # A and B query filters are independent and both tables have Main.vi columns.
    assert window.findChild(QTableWidget, "query_table_A").rowCount() == 30
    assert window.findChild(QTableWidget, "query_table_B").rowCount() == 30
    window.query_fields[(StationId.A, "code")].setText("ONLY-A")
    assert window.query_fields[(StationId.B, "code")].text() == ""

    # Manual screenshot controls are mirrored, permission gated and isolated.
    window.username.setText("admin"); window.password.setText("simulate-admin"); window.login()
    window.confirmation_callback = lambda *_args: True
    a_clamp = window.findChild(QPushButton, "manual_clamp_A")
    b_clamp = window.findChild(QPushButton, "manual_clamp_B")
    QTest.mouseClick(a_clamp, Qt.MouseButton.LeftButton)
    assert window.plc.read_bit(4, 4) and not window.plc.read_bit(3, 4)
    QTest.mouseClick(b_clamp, Qt.MouseButton.LeftButton)
    assert window.plc.read_bit(3, 4)
    window.close(); app.processEvents()
