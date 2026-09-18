# V2 Blueprint

## Requirement restatement

Build a self-contained Node.js 18+ CommonJS simulation service for independent A/B ATEQ stations. A cycle is prepared with a frozen station, product, operator, mode, and target program; ATEQ is read/conditionally written/read-back before arming. The PC only observes ATEQ steps, and final OK alone allocates a serial, creates/prints a label, and waits for a validated label scan plus PLC auto-clear.

## Scope and non-goals

- Scope: Express 4 API, express-validator 7 input validation, better-sqlite3 WAL persistence, durable state/event records, fake-by-default cycle devices, guarded Modbus RTU/S7/TCP/BarTender adapters, simulator endpoints, read-only live preflight, restart recovery, and Node test coverage.
- Non-goals: automatic production live-cycle orchestration, ATEQ start hardware, PLC start-bit writes, authentication, or changes outside `v2/`.

## Frozen data flow and rules

1. `prepare` validates catalog references and mode, creates a cycle, records the ATEQ read/write/read-back preparation, and arms only after a verified program and inactive tester.
2. An observation is durably recorded. The first step 4/5/6 after an idle/terminal baseline starts exactly one attempt; terminal 65525/65535 completes only a started attempt. Single mode needs one attempt; dual mode always permits a second attempt, including after first NG.
3. Final NG persists attempts and trace data with no label row, QR, print, or PLC action. Final OK atomically creates the label/QR and fake print record, then enters `PRINTED_AWAIT_LABEL_SCAN`.
4. A matching persisted printed label may scan only at its station. A sends M0.1; B sends M0.0. A byte-level fake PLC does read-modify-write so concurrent station pulses preserve the other bit. The handshake is persisted before the pulse is considered complete, and a separate clear observation is required for `RELEASED_OK`.
5. On restart, runtime/cycle/label/handshake rows are reloaded. No print or PLC pulse is replayed automatically; uncertain pending operations remain visible as pending/recovery state.

## Modules and verification

- `db.js`: migrations, SQLite constraints, seed catalog, append-only event helper, and idempotency storage.
- `fakeDevices.js`: simulation-only ATEQ, shared-byte PLC, and printer.
- `realDevices.js`: lazy live ATEQ RTU, S7 M-area, BarTender, and TCP scanner adapters with 5-second timeouts and explicit write gate.
- `liveConfig.js`: validates deployment point table; `tools/livePreflight.js` performs read-only PLC/ATEQ checks.
- `stateMachine.js`: transactional cycle state transitions and trace persistence.
- `server.js`: app factory, routes, request validation, response/error envelopes, and simulator guard.
- `test/v2.test.js` and `test/realDevices.test.js`: API, persistence, adapter safety, and concurrency tests.

Success means `npm test` passes (18 tests), `node --check` passes for every JS file, and only new files below `v2/` are created.
