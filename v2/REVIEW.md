# V2 Review

## Verification run

Date: 2026-09-18 (Asia/Shanghai)

Dependency reproducibility: `npm install --package-lock-only` generated lockfile v3 with 111 package entries; `npm ci --ignore-scripts` installed 110 packages from that lockfile, followed by a local `npm rebuild better-sqlite3` for the active Node ABI.

Commands executed from `v2/` using a temporary mapped UNC working directory:

```text
node --check db.js
node --check fakeDevices.js
node --check stateMachine.js
node --check server.js
npm test
```

The package test script completed with **18 tests passed, 0 failed, 0 skipped**. The suite covers:

- injected real-adapter tests for ATEQ byte order/write gating, PLC shared-byte preservation, BarTender shell safety, and live-config placeholder rejection;

- fake-only guard and catalogs;
- no pretest QR/label;
- product-master program freeze, ATEQ read, conditional write, read-back, active-write refusal, and read-back mismatch;
- first active observation at step 5 and terminal completion;
- single NG with trace and no label;
- dual first NG followed by second attempt and final NG;
- dual final OK with delayed QR until completion;
- same-station label eligibility, A M0.1, B M0.0, PLC clear;
- concurrent A/B shared-byte bit preservation;
- idempotency replay/conflict;
- restart recovery without print or pulse replay;
- required POST idempotency keys and immutable station events.

## 现场联机实测（DESKTOP-TESS173）

- PLC `192.168.2.1:102`: read-only connection passed; M0..M16 read returned all zeros.
- ATEQ read-only: A=`COM4`/slave `255`, B=`COM6`/slave `1`; both realtime frames and current program `1` read successfully. No program write was executed.
- Scanner `192.168.2.10:9004`: TCP connection passed; 10-second and 30-second listens received no barcode frame, so decode was not physically confirmed.
- BarTender: accepted one real test print using `D:\data\E113015200-A.btw`.
- Follow-up after label-size adjustment: the same template was printed again with `accepted=True`; scanner then received the real frame `2DOTCOD39`.

## Limitations

- The normal station cycle remains fake-by-default. Live adapters are mounted only with an explicit live config; no physical preflight or write was executed during this review.
- Live printer, PLC, and ATEQ writes require both `V2_MODE=live` and the exact `V2_LIVE_WRITE_ENABLE` token. ATEQ has no start method; PLC acknowledgement uses approved M0.1/M0.0 read-modify-write.
- The live example encodes ATEQ A as COM4/slave 255 and B as COM6/slave 1. Printer executable/template root/name still require deployment confirmation.
- Live adapters use a 5-second connection/print timeout but do not implement automatic transport retry.
- A real printer side effect cannot be rolled back by SQLite. The simulation records print acceptance in the same transaction; a production adapter would need an external-job reconciliation protocol before use.
- If a process dies in the narrow interval between an external PLC pulse and persisting `PULSE_SENT`, the database remains at `INTENT`; restart does not repulse it and the clear endpoint requires manual recovery for that uncertain state.
- No authentication/authorization or operator-management workflow is included; this is the frozen simulation slice only.
