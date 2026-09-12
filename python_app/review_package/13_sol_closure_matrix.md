# Sol closure matrix

| Finding | Implementation | Regression evidence |
|---|---|---|
| P0 active fault reset unlock | `StationController._safe_fault/reset` | `test_fault_with_active_record_cannot_be_cleared_by_reset` |
| P0 recovery authorization bypass | mandatory `SecurityContext.require`, audit actor/reason/time/snapshot | same test |
| P0 startup unsafe outputs | `_restore/_startup_safe_stop` with readback | `test_corrupt_startup_safe_stops_preenergized_plc` |
| P0 weak ATEQ identity | strict `AteqResponse`, station/cycle/program/sequence/timestamp/raw frame | `test_ateq_bare_or_wrong_identity_is_rejected_before_db` |
| P0 missing ATEQ durable boundary | `ateq_intents/ateq_results` in RecoveryRecord | `test_ateq_intent_survives_call_failure_and_reinstantiation` |
| P1 MySQL constructor | explicit non-connecting attributes and fail-closed methods | `test_pymysql_constructor_is_non_connecting_and_fail_closed` |
| P1 missing license | service-layer `allow_new_cycle` requires valid license | `test_missing_license_is_denied_at_service_layer` |
| P1 shadow writes | read-only PLC/ATEQ/repository/printer composition | `test_shadow_services_have_no_write_paths` |
| P1 CLI smoke | explicit `--smoke-cycle` | `test_smoke_cycle_is_explicit_and_two_station` |
| P1 concurrency/restart | real thread pool and controller re-instantiation | `test_two_real_threads_and_independent_controllers`, `test_complete_record_reconstructs_on_restart` |
| P1 UI settings/scanner/calibration | permission-gated product setting, routing methods and calibration model | `tests/test_ui.py`, `app/ui.py`, `app/calibration.py` |
| P0 wrong-station journal | mismatch is FAULT/RECOVERY_REQUIRED with safe-stop and preserved source | `test_wrong_station_journal_is_faulted_and_preserved` |
| P1 empty/constructed ATEQ raw | non-empty frame, raw equality, minimum evidence and cycle-id-only rejection | `test_empty_ateq_raw_is_rejected_before_db` |
| P1 committed product settings | `ProductSettingsService` separates draft from committed value | `test_product_settings_draft_cannot_bypass_authenticated_commit`, UI click flow |
| P1 persistent recovery audit | audit JSONL stores actor/action/reason/time/cycle/snapshot/hash before archive | `test_recovery_audit_survives_restart_and_contains_snapshot` |
| P1 visible workflows | A/B scanner controls, calibration controls and recovery admin panel with displayed errors | `test_visible_scanner_calibration_and_settings_commit_flows` |
| UI Main.vi equivalence | A/B symmetric dashboard, stage measurements, named M-point indicators, seven actuator groups including Start, mode/PLC/ATEQ legend and next-action prompts | `test_mainvi_controls_are_visible_and_a_b_readback_is_independent`; `ui_zh_main_1920.png`, `ui_en_main_1920.png`, `ui_fr_main_1920.png` |
| UI Start control | Visible bilingual A/B Start mapped to M16.0/M16.1 with independent readback and confirmation | `test_mainvi_controls_are_visible_and_a_b_readback_is_independent` |
| UI scanner false success | Station scan returns boolean; route reports success only for matching READY record and restores input on failure | `test_dangerous_output_cancel_then_confirm_and_scanner_failure_propagates` |
| UI dangerous output confirmation | All dashboard/manual outputs, including Start, require callback/dialog with station/signal/request/current readback | `test_dangerous_output_cancel_then_confirm_and_scanner_failure_propagates` |
| UI 1366 prompt visibility | Next-action prompt moved beside result before long signal/actuator sections | `test_next_action_is_in_initial_1366_view`; latest screenshots |
| UI screenshot structure | Main/Setup/Query/Manual page hierarchy, mirrored A/B groups, 30-row/40-row tables, multilingual tab labels and stable object names | `tests/test_ui_replica_structure.py`; 14 canonical screenshots in `14_ui_screenshots.md` |
| UI Sol round-2 language/query/config/layout | Three-language principal labels with value preservation; calendar date ranges and A/B isolation; read-only validated Setup.ini COM mapping; four-category footer, narrow Setup controls, six-control Manual primary view, exact screenshot dimensions | `tests/test_ui_sol_round2.py`; controlled `1920x1080`/`1366x768` captures |

| Final header/package closure | Short wrapped multilingual headers, no-elide geometry, readable bottom labels, one canonical package directory and quarantine of known broken root EXE | `test_table_header_geometry_and_canonical_package_layout`; final screenshots and canonical EXE hash |
| Final footer geometry | Bottom four labels reserve content-sized width at least equal to `sizeHint`; compact vertical LED/caption layout keeps 1366×768 resizable and prevents `Start / Validation` clipping | `test_footer_indicator_labels_fit_text_at_1366_and_1920`; refreshed canonical screenshots |
| UI modernization theme | Central `UiMetrics`, `UiPalette`, `UiTextCatalog`; global stylesheet; canonical 18/15/13px typography, 36/40/22px controls/table rows, 10/6px radii | `tests/test_ui_theme_modern.py::test_canonical_theme_metrics_and_equal_station_geometry`; `ui_zh_main_1920.png`, `ui_zh_setup_1920.png` |
| Explicit manual target/readback | Back/Forward for clamp/transfer/block/stamp; Enable/Disable door; Automatic/Manual mode; `command_manual_target` preserves POINTS polarity and updates `manual_readback_*` | `tests/test_ui_theme_modern.py::test_explicit_manual_targets_have_readback_and_a_b_isolation`; 60-test run |
| Language/data retention | Selected Chinese/English/French catalog updates tabs, labels and target actions while preserving entered product/query data | `tests/test_ui_theme_modern.py::test_language_catalog_is_selected_only_and_preserves_manual_data`; `test_ui_sol_round2.py` |
| Canonical delivery evidence | Rebuilt PyInstaller 6.22 one-folder; exactly one EXE under `package_dist_final/LeakTest2Channels`, no root EXE; source/package simulate 0, shadow/live 2 | `07_test_report.md`, `candidate_hashes.sha256`, `source_manifest.txt`, EXE SHA-256 `2653AEE8DA55D73137F2BD39886BDA484FE0C8D499C247B80265E6B7852CB4CB` |

| P1 language completeness | Startup applies selected Chinese catalog; every visible label/button/group/table header/tab/placeholder/status and next-action is catalog-driven; English/French evidence covers all four pages, entered data survives switches | `test_every_visible_page_string_uses_one_selected_language`; `ui_zh_*`, `ui_en_*`, `ui_fr_*` screenshots |
| P2 canonical geometry | Compact top region 134px; table 688px / full work denominator 1036px = 66.41%; footer 120px; A/B width delta 0px and gap 12px | `test_canonical_theme_metrics_and_equal_station_geometry`; geometry capture |
| Final evidence refresh | 60 tests, compileall, source/package simulate 0, shadow/live 2; exactly 14 current canonical screenshots; canonical one-folder package has exactly one recursive EXE and zero root EXEs | `07_test_report.md`, `14_ui_screenshots.md`, `candidate_hashes.sha256`, `source_manifest.txt` |

Verification: 60 passed; compileall passed; source and canonical one-folder packaged simulate diagnose/smoke returned 0; source and package shadow/live safety diagnostics return 2 without opening resources. Canonical evidence is exactly 14 Phase-1 hash-matched screenshots: Chinese/English/French four pages at 1920x1080 plus English/French simultaneous-error Main at 1366x768. Hardware evidence remains NOT EXECUTED.
