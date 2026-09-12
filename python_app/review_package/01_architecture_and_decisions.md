# 架构与决策

- Python 3.10，核心无硬件依赖；PySide6 为可选 UI 依赖。
- 依赖通过接口隔离；默认 Fake 服务和 SIMULATE。
- A/B 每工位独立状态机；cycle_id 绑定数据库更新和打印 intent。
- 所有 live 能力必须在现场协议确认、shadow 对照、单程序独占和负责人批准后才可启用。
- 未确认的 ATEQ 私有协议、PLC 写时序和生产数据库行为不得通过猜测实现。
