# Sol 审核包：执行摘要

状态：SIMULATE/UI-demo 候选版本；真实硬件未连接。

已实现：版本化完整 RecoveryRecord、A/B 两阶段状态机、严格 ATEQ 请求/响应身份校验及 TEST_INTENT/TEST_RESULT、DB/打印 intent/commit、统一 safe-stop 与启动恢复回读、认证审计、不可伪造 live 拒绝、生产适配器 fail-closed 边界、shadow 零写包装、配置/诊断/重放、用户输入登录、查询筛选和 BOM CSV、PySide6 Win11 风格 Main.vi 截图结构等价四页 UI、60 项 pytest 回归测试、one-folder PyInstaller 包。

UI 候选版按四页参考结构组织：测试页保留多语言页签、A/B 对称顶部参数、Scanner/Reprint/Watchdog、每站 30 行结果表、底部校验指示/登录/倒计时；设置、查询、手动页分别提供参数提交、A/B 独立筛选导出和经权限/二次确认的六类手动控制。当前验收证据严格为 `review_package` 下 14 张 canonical 截图：中/英/法四页 1920×1080，以及英/法 simultaneous-error Main 1366×768；历史与非验收截图位于 `review_package/history_non_acceptance/`。

本轮补强：中文/English/Français 主标签切换并保留输入值；Query 使用带日历的独立 A/B 起止时间；COM 仅来自只读并校验的 GBK Setup.ini，缺失时 BLOCKED；Main footer 改为 A 指示 | 登录 | B 指示 | 倒计时，Manual 保留六个原始主控件，额外诊断置于扩展区；截图以受控 DPI 生成精确尺寸。

最终补强：主/查询表格采用短多语言双行表头、禁用省略、固定表头高度和最小列宽；中央 `UiMetrics`/`UiPalette`/`UiTextCatalog` 统一 Win11 视觉规范；手动页提供六行 A/B 显式目标按钮和独立 PLC 回读；已重建 canonical one-folder 包并核验唯一 EXE、模拟诊断/烟测和 shadow/live 门禁。

本轮 P2 修复：四个底部验证指示项改为紧凑纵向 LED/文字布局，标签内容宽度动态保持不小于当前字体 `sizeHint`；1366×768 与 1920×1080 均可完整显示 `Start / Validation`，不改变信号映射或安全门禁。

最终 Sol P1/P2 closure：启动即应用单一选定语言；四页所有可见标题、按钮、分组、占位符、表头、状态、错误/下一步文本均由 `UiTextCatalog` 驱动，三语言四页截图与可见文本回归均通过，语言切换保留产品/查询输入和运行状态。canonical Main 的卡片顶部至表格 134px、表格 688px / 全工作区 1036px = 66.41%、footer 120px、A/B 宽差 0px、间隔 12px。

未执行：PLC 写入、ATEQ 实机协议确认、扫码器、生产 MySQL、BarTender、shadow 100 周期、8 小时 soak、生产许可证签发。

原始 LabVIEW 文件和 D:\data 未修改；硬件证据仍为 NOT EXECUTED。
