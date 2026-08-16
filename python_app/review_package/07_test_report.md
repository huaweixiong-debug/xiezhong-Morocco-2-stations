# 测试报告

执行：`python -m compileall -q .`；`python -m pytest -q`。

当前套件报告 60 passed（含原 46 项回归，以及集中式 UiMetrics/UiPalette/UiTextCatalog、1920x1080 等宽几何、字号/控件/表格行高、三语言数据保持、显式手动目标/PLC 回读和 A/B 隔离、全页面可见文本语言覆盖）。另完成 `compileall`、模拟全设备诊断和 one-folder PyInstaller 6.22 构建。当前验收包固定为 14 张 canonical 截图；其余截图仅保留在 `history_non_acceptance/`。

`python -m app.main --mode simulate --diagnose` 已完成双工位模拟；`python tools/diagnose.py --mode shadow` 和 `--mode live` 必须返回退出码 2，表示硬件门禁阻断。

已执行：`python -m compileall -q app tests installer tools` 退出码 0；`python -m app.main --mode simulate --diagnose --device all` 退出码 0；`python -m app.main --mode simulate --smoke-cycle` 输出 `SIMULATE OK: stations=2 records=2 labels=2`、退出码 0；`python tools/diagnose.py --mode shadow` 和 `--mode live` 均输出全设备 BLOCKED、退出码 2。

本轮代码已在 `C:/Users/Administrator/AppData/Local/Temp/LeakTest2ChannelsBuild_UI20260816_05/dist/LeakTest2Channels` 重新构建 one-folder 包并复制到 `package_dist_final/LeakTest2Channels`。canonical 包递归统计恰好 1 个 EXE、根目录 0 个，`LeakTest2Channels.exe` 长度 46,678,167 bytes，SHA-256 为 `2653AEE8DA55D73137F2BD39886BDA484FE0C8D499C247B80265E6B7852CB4CB`；包 `--diagnose --mode simulate` 和 `--smoke-cycle --mode simulate` 均输出预期结果、退出码 0。包以其内置 simulate 配置运行 shadow/live 参数时分别输出 mode mismatch、PowerShell 实际进程退出码 2，未打开真实资源。

原始文件核验：`Main.vi`=`8CEAEAD23222F800F344B7C7300DB522CC1C2E528A4A62FC6484A72C14A5AAFD`、`Leak Test 2 Channels.lvproj`=`5036E52C6EF6C863DAFDC10E8DF09658444C9933ECAF637E4B4A565DB6D4FFDB`、`20250828opc.opf`=`3D30ECC881631EF630A904D98FA258DD62F16287BE6983FE190935D6FD3A35DA`，均与 baseline_hashes.sha256 一致。`D:\data` 仅做只读存在/枚举，`D:\data\Setup.ini` SHA-256=`8997A80D6AA5C8247EF92F6C8EDF0DAA3CF6A4F68D2C75F5BB7C7FD20274CEA0`；未写入。

1366x768 offscreen capture 为 `(1366, 768)`，窗口可显示、切页和关闭，无崩溃；该尺寸只作为可访问兼容证据，不作为比例验收。canonical 1920x1080 工作区测量：A/B 卡宽差 0px、间隔 12px、卡片顶部到表格顶部 134px、表格高 688px、工作区分母为 `tabs.height - nav(44)=1036px`，表格占比 `688/1036=66.41%`，footer 120px。中文为 canonical 截图语言；英语/法语四页另有完整可见文本证据。三语言切换、输入保持、管理员权限/确认门禁、显式 target/readback 映射和可见文本覆盖均由 `tests/test_ui_theme_modern.py` 与既有 UI 测试覆盖。未执行：真实 PLC/ATEQ/扫码器/MySQL/BarTender、100 周期 shadow、8 小时 soak；这些仍是现场 blocker。
