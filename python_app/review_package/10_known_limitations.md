# 已知限制与 live blockers

- ATEQ 私有寄存器和实际结果帧尚未由现场原始报文确认。
- Snap7、Serial ATEQ、Serial scanner、PyMySQL 和 BarTender 已提供 capability-gated 生产边界，但未知协议操作明确 fail-closed，未启用。
- `Setup.ini` 已按 GBK 解析实际 `ATEQ F620 A/B (Restart Software to Active)` 键；其余现场参数仍需 characterization 确认。
- PySide6 已在环境中可被 PyInstaller 发现；无 PySide6 时核心诊断仍可运行并明确提示 UI 依赖。
- 未执行真实 PLC 并发、100 周期 shadow、8 小时 soak 和生产许可证签发。
- PyInstaller 6.22 one-folder 构建已完成，候选包位于 `package_dist_final/LeakTest2Channels`。
- 本次硬件证据仍为空：PLC/ATEQ/扫码器/MySQL/BarTender 均未连接；模拟 Fake readback 不代表现场验证。
