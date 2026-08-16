# Leak Test 2 Channels Python

这是 LabVIEW `Main.vi` 的安全迁移候选版本。默认运行模式是 `SIMULATE`，不会连接 PLC、ATEQ、扫码器、MySQL 或 BarTender。

```powershell
python -m app.main --mode simulate
python -m pytest -q
```

四个生产页面（测试、设置、查询、手动）和 PySide6 视觉层将在依赖可用时启用；当前核心服务先以无硬件模拟和命令行诊断验证。`characterization`、`shadow`、`live` 尚未通过现场门禁，未实现真实协议的部分必须在现场原始报文确认后才能启用。

原 LabVIEW 文件、OPC 配置、`D:\data` 和生产数据库未修改。

