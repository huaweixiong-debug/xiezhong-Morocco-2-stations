# ATEQ V2 station service

This directory is a self-contained Node.js 18+ CommonJS service for two independent stations, `A` and `B`. The functional cycle remains fake-by-default; explicitly configured live adapters provide guarded PLC, ATEQ, printer, and scanner diagnostics.

## Install, run, test

```bash
npm install
npm test
npm start
```

On Windows, `cmd.exe` cannot use a UNC path as its current directory. Map the share first, then run the same commands from the mapped `v2` directory; for example:

```bat
net use U: \\server\share
U:
cd \path\to\ATEQ\v2
npm ci
npm test
```

If the installed Node ABI has no prebuilt `better-sqlite3` binary, `npm ci` may need the local C++ build toolchain and `npm rebuild better-sqlite3` once.

The default database is `v2.sqlite` beside `server.js`. Set `V2_DB_PATH` and `PORT` to override it. The test suite uses temporary databases and never touches the default database.

## API

All successful responses use `{ "data": ..., "requestId": "..." }`; errors use `{ "error": { "code", "message", "details" }, "requestId": "..." }`. Every POST requires an 8–128 character `idempotencyKey` body field or `Idempotency-Key` header.

- `GET /api/stations` and `GET /api/stations/:station` expose durable runtime, cycle, attempts, observations, label, and handshake state.
- `GET /api/catalog/products` and `GET /api/catalog/operators` expose the seeded simulation catalog.
- `POST /api/stations/:station/prepare` accepts `productId`, `operatorId`, and `mode` (`SINGLE`/`DUAL`). The ATEQ program is immutable product master data: the service reads it, conditionally writes only while inactive, reads back, and arms only when verified.
- `POST /api/stations/:station/label-scans` accepts `{ barcode }`. Only a persisted printed final-OK label at the same station is eligible.
- `POST /api/simulator/stations/:station/ateq-observations` accepts `{ stepCode, resultCode? }`. Step 4, 5, or 6 starts an attempt; 65525 or 65535 completes a previously started attempt.
- `POST /api/simulator/stations/:station/plc-clear` represents the PLC auto-clear observation. It is the only operation that moves a pending handshake to `RELEASED_OK`.

The PC has no ATEQ-start route and never writes a PLC start bit. A final NG keeps trace records but creates no label/QR and performs no PLC handshake. Final OK creates and fake-prints the label once, then waits for scan and PLC clear. On restart, SQLite WAL data is reloaded; pending print/PLC operations are not automatically replayed.

## Real-device adapters and safety gate

`realDevices.js` contains the live ATEQ RTU, S7 M-area, BarTender, and TCP scanner adapters. They are not created by the normal service and no test opens a real port or network connection. Copy `config/live.example.json`, replace every `REQUIRED` value using a signed-off point table, then run a read-only preflight:

```powershell
npm run preflight:live -- .\\config\\live.json
```

The supplied point table is encoded as ATEQ A=`COM4`/slave `255` and B=`COM6`/slave `1`, with 9600 8-E-1. PLC is S7 TCP `192.168.2.1` rack 0 slot 1; scanner defaults to `192.168.2.10:9004`. Printer executable, template root, and printer name remain required deployment values.

Set `V2_DEVICE_MODE=live` and `V2_LIVE_CONFIG=<validated-json>` to mount the live routes. Read-only routes are `GET /api/live/ateq/:station/status` and `GET /api/live/plc/m0`; controlled operations are `POST /api/live/ateq/:station/program`, `POST /api/live/plc/scan-ack`, `POST /api/live/printer/print`, and `POST /api/live/scanner/connect`. Every POST still requires an idempotency key.

Live writes are blocked unless both `V2_MODE=live` and `V2_LIVE_WRITE_ENABLE=I_UNDERSTAND_THIS_WRITES_REAL_EQUIPMENT` are explicitly set. The only PLC write method accepts the approved label acknowledgement points A=M0.1 and B=M0.0 and uses read-modify-write. There is deliberately no ATEQ start method or PLC start-bit write method.

## State and safety

The state machine implements: `IDLE`, `PREPARING_PROGRAM`, `ARMED`, `TEST_1_RUNNING`, `WAIT_TEST_2`, `TEST_2_RUNNING`, `FINALIZING`, `COMPLETED_NG`, `ALLOCATING_LABEL`, `PRINT_PENDING`, `PRINTED_AWAIT_LABEL_SCAN`, `PLC_CLEAR_PENDING`, `RELEASED_OK`, `RECOVERY_REQUIRED`, and `FAULT`. SQLite checks, foreign keys, unique constraints, and append-only event triggers enforce the core invariants. A/B PLC bits are M0.1/M0.0 respectively and are changed by byte-level read-modify-write.

See [BLUEPRINT.md](./BLUEPRINT.md) for the frozen contract and [REVIEW.md](./REVIEW.md) for verification evidence and limitations.
