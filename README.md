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
- 涉及 VLN 路线和前瞻技术判断时，与专门的 VLN 技术评估线程通过独立 issue 交叉协作
- `docs/REQUIREMENTS.MD` 由用户独占维护，其他文档由我持续推进
- 当信息不足但推进不能停时，先形成“架构师设想包”，再提交审核
- 全生命周期管理参考 IPD，当前争取在 `2026-03-31` 完成产品定义与架构冻结
- 对存在明确结构分解的架构文档，优先配套直观图示

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
- 当前执行目标到 `2026-12-31` 量产预备，但规划视图覆盖上市运营与下一代回灌
- 当前总体方法论继续以 OODA 为主，并已冻结为“多尺度、并发、可中断、可动态调度”的正式基线
- `R4 关系与服务环` 已进入一代正式架构层，`OODA Scale Scheduler` 已提升为一级架构能力

术语约定：

- `World State`：统一的运行时结构化状态
- `World Model`：如后续引入，专指用于预测或仿真未来环境和任务动态的模型

## 文档索引

- `docs/REQUIREMENTS.MD`：产品需求、边界和工程约束
- `docs/RULES.MD`：系统架构设计原则
- `docs/ARCHITECTURE.md`：机器人 OODA 总体架构
- `docs/VLN_ROLE_AND_PLAN.md`：VLN 在 OODA 中的角色分析、最新技术趋势与规划建议，由独立线程维护，当前线程只引用其结论
- `docs/ARCHITECTURE_RULES_REVIEW.md`：总体架构与架构原则的符合度检查
- `docs/WORKFLOW.md`：从架构到落地的推进工作流
- `docs/LIFECYCLE_WORKFLOW.md`：从需求形成到上市运营与下一代回灌的全生命周期工作流与阶段门
- `docs/OODA_MULTI_SCALE_ARCHITECTURE.md`：面向 AGI 与具身智能时代的多尺度动态 OODA 架构基线
- `docs/DECISION_LOG.md`：已确认决策、开放问题与后续问题清单
- `docs/MODULE_BOUNDARIES.md`：模块分层与模块边界
- `docs/WORLD_STATE_SCHEMA.md`：世界状态与核心实体结构
- `docs/DECISION_STATE_MACHINE.md`：系统决策状态机
- `docs/SAFETY_COMPLIANCE_AUTHORIZATION_API.md`：安全 / 合规 / 授权接口
- `docs/HEALTH_EVENT_PIPELINE.md`：健康事件管线、补采逻辑与升级链路
- `docs/COMPANION_INTERACTION_STRATEGY.md`：陪伴交互策略、人设边界与长期记忆规则
- `docs/SAFETY_RISK_MATRIX.md`：一代安全风险域、降级策略与空间规则
- `docs/APP_CLOUD_OPS_MINIMAL_LOOP.md`：家属 App、云服务与后台运营坐席的一代最小闭环
- `docs/DEMO_TO_MASS_PRODUCTION_GAPS.md`：当前样机 Demo 到量产预备状态的能力缺口、阻断项和优先级排序
- `docs/ENGINEERING_NPI_BASELINE.md`：工程化与 NPI 准备基线、`G2` 技术路线门和 Alpha / EVT 前置冻结项
- `docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md`：一代软硬件选型矩阵、主线 / 备线 / 观察线划分与 `G2` 前置验证项
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
    ├── LIFECYCLE_WORKFLOW.md
    ├── MODULE_BOUNDARIES.md
    ├── OODA_MULTI_SCALE_ARCHITECTURE.md
    ├── COMPANION_INTERACTION_STRATEGY.md
    ├── HEALTH_EVENT_PIPELINE.md
    ├── REQUIREMENTS.MD
    ├── RULES.MD
    ├── SAFETY_COMPLIANCE_AUTHORIZATION_API.md
    ├── SAFETY_RISK_MATRIX.md
    ├── APP_CLOUD_OPS_MINIMAL_LOOP.md
    ├── DEMO_TO_MASS_PRODUCTION_GAPS.md
    ├── ENGINEERING_NPI_BASELINE.md
    ├── HARDWARE_SOFTWARE_SELECTION_MATRIX.md
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
6. `docs/LIFECYCLE_WORKFLOW.md`
7. `docs/OODA_MULTI_SCALE_ARCHITECTURE.md`
8. `docs/DECISION_LOG.md`
9. `docs/MODULE_BOUNDARIES.md`
10. `docs/WORLD_STATE_SCHEMA.md`
11. `docs/DECISION_STATE_MACHINE.md`
12. `docs/SAFETY_COMPLIANCE_AUTHORIZATION_API.md`
13. `docs/HEALTH_EVENT_PIPELINE.md`
14. `docs/COMPANION_INTERACTION_STRATEGY.md`
15. `docs/SAFETY_RISK_MATRIX.md`
16. `docs/APP_CLOUD_OPS_MINIMAL_LOOP.md`
17. `docs/DEMO_TO_MASS_PRODUCTION_GAPS.md`
18. `docs/ENGINEERING_NPI_BASELINE.md`
19. `docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md`
20. `docs/TERMINOLOGY.md`
21. `docs/ARCHITECTURE_RULES_REVIEW.md`

## 下一步建议

- 优先评审并冻结 `KBT-11` 软硬件选型矩阵
- `KBT-11` 当前优先评审“中国大算力端侧芯片专项主线”“端侧 4B / 7B / 8B + FP8 主线评估”“量产主线视觉组合”和“6000 到 8000 元整机 BOM 成本分配”
- 健康事件量化阈值与故障阈值
- 量产预备判定标准
- 多尺度动态 OODA 基线继续向状态机、接口和验证项落地
- 陪伴记忆治理与多角色配置边界细化
- 量产预备技术选型
