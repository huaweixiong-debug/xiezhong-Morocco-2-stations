# UI screenshot evidence

The current acceptance set is exactly 14 canonical screenshots, all copied from the approved Phase-1 captures and hash-matched:

- Chinese: `ui_zh_main_1920.png`, `ui_zh_setup_1920.png`, `ui_zh_query_1920.png`, `ui_zh_manual_1920.png`.
- English: `ui_en_main_1920.png`, `ui_en_setup_1920.png`, `ui_en_query_1920.png`, `ui_en_manual_1920.png`, plus simultaneous-error `ui_main_error_en_1366.png`.
- French: `ui_fr_main_1920.png`, `ui_fr_setup_1920.png`, `ui_fr_query_1920.png`, `ui_fr_manual_1920.png`, plus simultaneous-error `ui_main_error_fr_1366.png`.

Former exploratory, DPI, refresh, sheet, and non-error 1366 captures are retained only under `history_non_acceptance/` and are not current acceptance evidence.

The Main page keeps the screenshot hierarchy: mirrored top parameter fields,
scanner/reprint/watchdog row, 30-row station lists with ten measurement/result
columns, four original bottom validation categories, centered login/exit and
calibration countdown at right. Setup uses a narrow controls column beside the
parameter grid; Query uses independent calendar date/time ranges; Manual keeps
the six screenshot controls primary and moves pressure/start/recovery to the
secondary extension.

The four footer captions use content-sized widths (at least the active Qt
`sizeHint`) and a compact vertical LED/caption arrangement, so `Start /
Validation` remains fully visible at 1366x768 as well as 1920x1080.

Captures were made with `QT_QPA_PLATFORM=offscreen` and `QT_SCALE_FACTOR=1`;
the refreshed PNG dimensions are exactly 1920x1080 (all four pages) and
1366x768 (English/French simultaneous-error Main pages). The refreshed captures were visually
inspected for clipping/overlap: canonical pages have symmetric A/B cards,
12px station gap, compact footer and no outer page scroll; 1366 is explicitly
an accessible/non-crashing compatibility target rather than a proportional
acceptance target.
The measured canonical Main geometry is: A/B width delta 0px; station gap
12px; card-top to table-top 134px; table height 688px; full work denominator
`tabs.height - nav(44)=1036px`, hence 66.41%; footer 120px. This uses the full
page work area as denominator, not a card/table ratio.
The exhaustive visible-text regression checks every page's visible labels,
buttons, groups, placeholders, tabs, table headers and status/next-action text
for selected-language purity, while preserving product/query data.
The runtime also accepts 125%/150% Windows DPI; those physical captures are
not used as the canonical evidence dimensions.
The exact LabVIEW pixel rendering and undocumented glyph behavior remain
unverified; this is screenshot/control-structure equivalence with modern Qt
typography, not a pixel-identical claim. All device actions remain SIMULATE/Fake.

Before/after evidence: Before = the user's four original Main.vi screenshots
(authoritative LabVIEW reference images). After = the 14 approved Phase-1
canonical Qt screenshots listed above. Phase-1 is the approval/source set for
the current Qt after evidence, not the before reference set.
