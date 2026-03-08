# Kinbot_OODA

面向家庭室内场景的智能移动交互机器人系统设计项目。项目以 `OODA`（Observe、Orient、Decide、Act）为主循环，目标是在家庭环境中实现安全、自主、可演进的移动与交互能力。

## 项目目标

- 多模态交互陪伴
- 健康管理
- 安全保障

系统边界当前定义为：

- 轮式移动
- 多模态交互
- 端云协同
- 不包含机械臂或复杂物理操作

## 当前状态

当前仓库处于架构设计阶段，主要产出为需求、原则和总体架构文档，尚未进入实现阶段。

当前架构强调：

- 以 `World State` 作为认知中枢的统一状态平面
- 以 `安全 / 合规 / 授权` 作为动作前置门控
- 以高频安全闭环保证运动安全
- 以端云协同扩展知识和服务能力

术语约定：

- `World State`：统一的运行时结构化状态
- `World Model`：如后续引入，专指用于预测或仿真未来环境和任务动态的模型

## 文档索引

- `docs/REQUIREMENTS.MD`：产品需求、边界和工程约束
- `docs/RULES.MD`：系统架构设计原则
- `docs/ARCHITECTURE.md`：机器人 OODA 总体架构
- `docs/ARCHITECTURE_RULES_REVIEW.md`：总体架构与架构原则的符合度检查
- `docs/WORKFLOW.md`：从架构到落地的推进工作流
- `docs/DECISION_LOG.md`：已确认决策、开放问题与后续问题清单
- `docs/MODULE_BOUNDARIES.md`：模块分层与模块边界
- `docs/WORLD_STATE_SCHEMA.md`：世界状态与核心实体结构
- `docs/TERMINOLOGY.md`：项目术语表

## 仓库结构

```text
.
├── README.md
├── CHANGELOG.md
└── docs
    ├── ARCHITECTURE.md
    ├── ARCHITECTURE_RULES_REVIEW.md
    ├── DECISION_LOG.md
    ├── MODULE_BOUNDARIES.md
    ├── REQUIREMENTS.MD
    ├── RULES.MD
    ├── TERMINOLOGY.md
    ├── WORKFLOW.md
    └── WORLD_STATE_SCHEMA.md
```

## 推荐阅读顺序

1. `docs/REQUIREMENTS.MD`
2. `docs/RULES.MD`
3. `docs/ARCHITECTURE.md`
4. `docs/WORKFLOW.md`
5. `docs/DECISION_LOG.md`
6. `docs/MODULE_BOUNDARIES.md`
7. `docs/WORLD_STATE_SCHEMA.md`
8. `docs/TERMINOLOGY.md`
9. `docs/ARCHITECTURE_RULES_REVIEW.md`

## 下一步建议

- 模块分层与模块边界
- 世界状态与核心数据结构
- 决策状态机
- 端云职责拆分
- MVP 技术选型
