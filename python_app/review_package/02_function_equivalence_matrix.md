# 功能等价矩阵（当前候选版）

|功能|模拟实现|现场状态|
|---|---|---|
|A/B 双工位|已实现，独立状态机|待真实并发验证|
|扫码→一测→二测→贴标|已实现模拟 OK/NG|待现场协议/打印验证|
|PLC M 点|点表已登记，Fake 可用|禁止 live，待 shadow|
|ATEQ F620|CRC 基础函数、Fake|私有帧待 characterisation|
|MySQL info_A/info_B|内存幂等仓库|待隔离库对照|
|设置/查询/手动|四页可操作 UI：产品草稿/认证提交、过滤导出、A/B 手动执行器、恢复审计|PySide6 离线验证通过；现场验收待执行|
|Main.vi 操作面板|Win11 风格 A/B 对称 dashboard；二维码、两阶段压力/泄漏/结果、扫码/校准/样件/安全状态及下一步提示均可见；启动、手动/移载/封堵/夹紧/盖章/正负压按 M 点映射|功能控件与 POINTS 已有映射；危险输出含工位/信号/目标/当前回读二次确认；LabVIEW 未恢复的精确颜色/控件位置为现代化布局假设|
|Main.vi 截图结构|四个多语言页签、A/B 对称顶部参数、Scanner/Reprint/Watchdog、30 行列表、底部校验指示和登录/倒计时|`ui_zh_main_1920.png`、`ui_en_main_1920.png`、`ui_fr_main_1920.png`；真实 LabVIEW 像素渲染未宣称|
|Setup/Coup Monté|Part/Customer/ATEQ/Staff 参数表、Language、Scanner、ATEQ F620 A/B COM、校准周期、认证保存|`ui_zh_setup_1920.png`、`ui_en_setup_1920.png`、`ui_fr_setup_1920.png`；保存仍受 `ProductSettingsService` 权限门禁|
|Query/Requête|A/B 独立日期时间（带日历）/二维码/结果过滤、Search/Download、十列结果表；无效时间范围明确阻断|`ui_zh_query_1920.png`、`ui_en_query_1920.png`、`ui_fr_query_1920.png`；Download 使用 UTF-8 BOM，仅导出当前筛选表|
|Manual/Manuelle|A/B 对称夹紧/移载/封堵/盖章/门/自动手动双态控制，Fake 回读和确认|`ui_zh_manual_1920.png`、`ui_en_manual_1920.png`、`ui_fr_manual_1920.png`；真实互锁仍需现场验证|
|中文/英文/法文|主标签、四页签、表头、按钮和手动六控件可切换，输入/记录/筛选值保持|更多现场术语仍需语言审校|
|离线许可证|验证边界和阻止逻辑|公钥/签发待配置|
