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

当前仓库处于架构设计阶段。虽然已有粗放样机 Demo 用于验证概念设想，但当前仓库的主要产出仍然是需求、原则和总体架构文档，尚未进入面向量产的系统实现阶段。

当前协作方式：

- 每轮开始前先检查 `docs/REQUIREMENTS.MD` 顶部“对 Codex 的要求”是否有更新
- 关键需求、澄清和决策沉淀在仓库文档
- 阶段性待办和 issue 同步到 Linear，形成持续协作
- 本地文档和 Linear 协作条目统一用中文维护
- 当前 Linear 项目为 `Kinbot OODA 架构到量产预备`
- 涉及 VLN 路线和前瞻技术判断时，与专门的 VLN 技术评估线程交叉协作

当前项目节奏：

- 项目时间线按 2026 年 1 月 1 日起算
- 2026 年 1 到 2 月主要完成需求收集与 Demo 概念验证
- 目标是在 2026 年 12 月 31 日达到量产预备状态
- 2027 年 1 月作为 MVP 验证与验收窗口
- 当前团队约 25 到 30 人，周期内预计扩展到 100 人以上

当前已有基础：

- 所有讨论中的核心功能已经在真实自研机器人样机上做过粗放 Demo
- 具备较强的消费电子产研经验，覆盖平板类和 IoT 类产品
- 具备 VLM、VLN 能力，与行业 SOTA 差距约不到一年
- 完整产品系统包括机器人整机及服务，穿戴、智能家居、手机 App、后台云服务属于伴生系统

当前架构强调：

- 以 `World State` 作为认知中枢的统一状态平面
- 以 `安全 / 合规 / 授权` 作为动作前置门控
- 以高频安全闭环保证运动安全
- 以端云协同扩展知识和服务能力
- 当前问题澄清按“健康管理、陪伴交互、安全保障”三条主线并行推进，避免架构只围绕单一功能收敛

术语约定：

- `World State`：统一的运行时结构化状态
- `World Model`：如后续引入，专指用于预测或仿真未来环境和任务动态的模型

## 文档索引

- `docs/REQUIREMENTS.MD`：产品需求、边界和工程约束
- `docs/RULES.MD`：系统架构设计原则
- `docs/ARCHITECTURE.md`：机器人 OODA 总体架构
- `docs/VLN_ROLE_AND_PLAN.md`：VLN 在 OODA 中的角色分析、最新技术趋势与规划建议
- `docs/ARCHITECTURE_RULES_REVIEW.md`：总体架构与架构原则的符合度检查
- `docs/WORKFLOW.md`：从架构到落地的推进工作流
- `docs/DECISION_LOG.md`：已确认决策、开放问题与后续问题清单
- `docs/MODULE_BOUNDARIES.md`：模块分层与模块边界
- `docs/WORLD_STATE_SCHEMA.md`：世界状态与核心实体结构
- `docs/DECISION_STATE_MACHINE.md`：系统决策状态机
- `docs/SAFETY_COMPLIANCE_AUTHORIZATION_API.md`：安全 / 合规 / 授权接口
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
    ├── DECISION_STATE_MACHINE.md
    ├── MODULE_BOUNDARIES.md
    ├── REQUIREMENTS.MD
    ├── RULES.MD
    ├── SAFETY_COMPLIANCE_AUTHORIZATION_API.md
    ├── TERMINOLOGY.md
    ├── VLN_ROLE_AND_PLAN.md
    ├── WORKFLOW.md
    └── WORLD_STATE_SCHEMA.md
```

## 推荐阅读顺序

1. `docs/REQUIREMENTS.MD`
2. `docs/RULES.MD`
3. `docs/ARCHITECTURE.md`
4. `docs/VLN_ROLE_AND_PLAN.md`
5. `docs/WORKFLOW.md`
6. `docs/DECISION_LOG.md`
7. `docs/MODULE_BOUNDARIES.md`
8. `docs/WORLD_STATE_SCHEMA.md`
9. `docs/DECISION_STATE_MACHINE.md`
10. `docs/SAFETY_COMPLIANCE_AUTHORIZATION_API.md`
11. `docs/TERMINOLOGY.md`
12. `docs/ARCHITECTURE_RULES_REVIEW.md`

## 下一步建议

- 健康事件管线与升级链路
- 陪伴交互策略、人设边界与长期记忆规则
- 安全事件矩阵、降级策略与家庭空间风险规则
- 量产预备判定标准
- Demo 到量产架构的能力缺口梳理
- 量产预备技术选型
