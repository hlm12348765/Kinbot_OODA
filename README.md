# 项目说明

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

- 每轮开始前先检查 `REQUIREMENTS.MD` 顶部”对 Codex 的要求”是否有更新
- 若根目录 `CLAUDE.MD` 或 `docs/08_reviews/01_architect_review_and_plan.md` 有新增内容，也作为外部架构评审输入纳入本轮处理
- 关键需求、澄清和决策沉淀在仓库文档
- 阶段性待办和 issue 同步到 Linear，形成持续协作
- 本地文档和 Linear 协作条目统一用中文维护
- 当前 Linear 项目为 `Kinbot OODA 架构到量产预备`
- 涉及 VLN 路线和前瞻技术判断时，与专门的 VLN 技术评估线程通过独立 issue 交叉协作，其专项文档现已纳入主线版本控制
- `REQUIREMENTS.MD` 由用户独占维护，其他文档由我持续推进
- 当信息不足但推进不能停时，先形成“架构师设想包”，再提交审核
- 全生命周期管理参考 IPD，当前争取在 `2026-03-31` 完成产品定义与架构冻结
- 对存在明确结构分解的架构文档，优先配套直观图示
- 每一阶段都要检查系统各实体元素的组合，判断整机与服务是否仍然呈现“聪明、温暖、精致”的高端产品感，并能支撑 `20000 到 30000 元` 售价区间

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

- 系统架构在 `PDCP` 节点采用“双视角基线”：产品实体架构视图 + 运行时功能架构视图
- 机器人本体作为软硬一体产品实体被显式纳入架构，而不是只作为软件运行载体隐含存在
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

- `REQUIREMENTS.MD`：产品需求、边界和工程约束
- `docs/00_governance/05_system_architecture_principles.md`：系统架构设计原则
- `docs/02_p1_architecture/01_overall_architecture.md`：机器人 OODA 总体架构
- `docs/09_research/01_vln_role_analysis_and_technical_plan.md`：VLN 在 OODA 中的角色分析、最新技术趋势与规划建议，现已纳入主线版本控制并作为正式技术输入
- `docs/02_p1_architecture/12_human_service_and_telemedicine_boundaries.md`：后台人工服务、在线问诊、第三方履约与公共应急之间的角色边界、接入链路与审计要求
- `docs/08_reviews/02_architecture_principles_alignment_check.md`：总体架构与架构原则的符合度检查
- `docs/00_governance/01_workflow.md`：从架构到落地的推进工作流
- `docs/00_governance/02_lifecycle_workflow_and_gates.md`：从需求形成到上市运营与下一代回灌的全生命周期工作流与阶段门
- `docs/02_p1_architecture/03_multi_scale_dynamic_ooda_architecture_baseline.md`：面向 AGI 与具身智能时代的多尺度动态 OODA 架构基线
- `docs/08_reviews/01_architect_review_and_plan.md`：Claude 协作线程给出的外部架构评审意见与关键路径建议
- `docs/00_governance/03_decision_log.md`：已确认决策、开放问题与后续问题清单
- `docs/02_p1_architecture/04_module_layers_and_boundaries.md`：模块分层与模块边界
- `docs/02_p1_architecture/05_world_state_schema.md`：世界状态与核心实体结构
- `docs/02_p1_architecture/06_decision_state_machine.md`：系统决策状态机
- `docs/02_p1_architecture/07_safety_compliance_authorization_api.md`：安全 / 合规 / 授权接口
- `docs/02_p1_architecture/10_health_event_pipeline_and_escalation.md`：健康事件管线、补采逻辑与升级链路
- `docs/02_p1_architecture/08_companion_interaction_strategy.md`：陪伴交互策略、人设边界与长期记忆规则
- `docs/02_p1_architecture/09_safety_risk_matrix.md`：一代安全风险域、降级策略与空间规则
- `docs/02_p1_architecture/11_app_cloud_ops_minimal_loop.md`：家属 App、云服务与后台运营坐席的一代最小闭环
- `docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md`：面向 `IPD / PDCP` 节点的完整系统架构评审包
- `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`：`PDCP` 通过后用于各模块展开架构与总体方案设计的下发基线
- `docs/02_p1_architecture/13_medication_storage_and_indoor_delivery_requirements.md`：储药与室内递送的能力包、主链边界、角色权限与工程护栏
- `docs/03_p2_feasibility/07_phase1_wearable_compatibility_and_data_fields.md`：一期穿戴设备兼容范围、接入模式、新鲜度约束与首版数据字段
- `docs/09_research/02_uwb_phase1_maturity_and_integration_value.md`：`UWB` 一期技术成熟度、样品验证门与接入价值边界
- `docs/03_p2_feasibility/02_demo_to_mass_production_gaps.md`：当前样机 Demo 到量产预备状态的能力缺口、阻断项和优先级排序
- `docs/03_p2_feasibility/03_engineering_npi_baseline.md`：工程化与 NPI 准备基线、`G2` 技术路线门和 Alpha / EVT 前置冻结项
- `docs/03_p2_feasibility/04_hardware_software_selection_matrix.md`：一代软硬件选型矩阵、`TTFT / TPS` 驱动的端侧算力需求定义、主线 / 备线 / 观察线划分与 `G2` 前置验证项
- `docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md`：整机 BOM 滚动成本基线、降本主战场、控涨项与关键技术路径
- `docs/03_p2_feasibility/06_power_budget_and_efficiency_strategy.md`：整机功耗预算、`C5` 四类工况基线、能效控制策略与阶段门检查项
- `docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md`：`2026-12-31` 量产预备判定标准、`G5` 判定域与通过条件
- `docs/05_p4_beta_dvt/01_mvp_validation_plan.md`：量产预备与 `2027-01 MVP` 验证窗口之间的能力范围、试点框架与放行规则
- `docs/06_p5_launch_readiness/02_production_introduction_launch_and_delivery_closure.md`：量产导入、发布准备与交付闭环的状态定义、工作包、阻断项与责任面
- `docs/00_governance/04_glossary.md`：项目术语表

## 仓库结构

```text
.
├── README.md
├── CHANGELOG.md
├── CLAUDE.md
├── REQUIREMENTS.MD
├── input
│   ├── README.md
│   ├── CHANGELOG.md
│   └── 01_kinbot_prd_v0_2_hardware_parameters.csv
└── docs
    ├── 00_governance
    │   ├── README.md
    │   ├── CHANGELOG.md
    │   ├── 01_workflow.md
    │   ├── 02_lifecycle_workflow_and_gates.md
    │   ├── 03_decision_log.md
    │   ├── 04_glossary.md
    │   └── 05_system_architecture_principles.md
    ├── 01_p0_concept
    │   ├── README.md
    │   ├── CHANGELOG.md
    │   ├── 01_early_hardware_parameters_alignment_analysis.md
    │   └── 02_hardware_parameter_requirements_fit_assessment.md
    ├── 02_p1_architecture
    │   ├── README.md
    │   ├── CHANGELOG.md
    │   └── ...
    ├── 03_p2_feasibility
    │   ├── README.md
    │   ├── CHANGELOG.md
    │   └── ...
    ├── 04_p3_alpha_evt
    │   ├── README.md
    │   └── CHANGELOG.md
    ├── 05_p4_beta_dvt
    │   ├── README.md
    │   ├── CHANGELOG.md
    │   └── 01_mvp_validation_plan.md
    ├── 06_p5_launch_readiness
    │   ├── README.md
    │   ├── CHANGELOG.md
    │   └── ...
    ├── 07_p6_operations
    │   ├── README.md
    │   └── CHANGELOG.md
    ├── 08_reviews
    │   ├── README.md
    │   ├── CHANGELOG.md
    │   └── ...
    └── 09_research
        ├── README.md
        ├── CHANGELOG.md
        └── ...
```

## 推荐阅读顺序

1. `REQUIREMENTS.MD`
2. `docs/00_governance/05_system_architecture_principles.md`
3. `docs/02_p1_architecture/01_overall_architecture.md`
4. `docs/09_research/01_vln_role_analysis_and_technical_plan.md`
5. `docs/00_governance/01_workflow.md`
6. `docs/00_governance/02_lifecycle_workflow_and_gates.md`
7. `docs/02_p1_architecture/03_multi_scale_dynamic_ooda_architecture_baseline.md`
8. `docs/00_governance/03_decision_log.md`
9. `docs/02_p1_architecture/04_module_layers_and_boundaries.md`
10. `docs/02_p1_architecture/05_world_state_schema.md`
11. `docs/02_p1_architecture/06_decision_state_machine.md`
12. `docs/02_p1_architecture/07_safety_compliance_authorization_api.md`
13. `docs/02_p1_architecture/10_health_event_pipeline_and_escalation.md`
14. `docs/02_p1_architecture/08_companion_interaction_strategy.md`
15. `docs/02_p1_architecture/09_safety_risk_matrix.md`
16. `docs/02_p1_architecture/11_app_cloud_ops_minimal_loop.md`
17. `docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md`
18. `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`
19. `docs/02_p1_architecture/12_human_service_and_telemedicine_boundaries.md`
20. `docs/02_p1_architecture/13_medication_storage_and_indoor_delivery_requirements.md`
21. `docs/03_p2_feasibility/07_phase1_wearable_compatibility_and_data_fields.md`
22. `docs/09_research/02_uwb_phase1_maturity_and_integration_value.md`
23. `docs/03_p2_feasibility/02_demo_to_mass_production_gaps.md`
24. `docs/03_p2_feasibility/03_engineering_npi_baseline.md`
25. `docs/03_p2_feasibility/04_hardware_software_selection_matrix.md`
26. `docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md`
27. `docs/03_p2_feasibility/06_power_budget_and_efficiency_strategy.md`
28. `docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md`
29. `docs/05_p4_beta_dvt/01_mvp_validation_plan.md`
30. `docs/06_p5_launch_readiness/02_production_introduction_launch_and_delivery_closure.md`
31. `docs/00_governance/04_glossary.md`
32. `docs/08_reviews/02_architecture_principles_alignment_check.md`

## 下一步建议

- 当前主优先级已纠正回 `P1 / PDCP` 系统架构评审与总体方案下发
- `KBT-13` 已完成本轮收口
- `KBT-10` 已完成本轮收口
- `KBT-15` 已完成本轮收口
- `KBT-14` 已完成本轮收口
- `KBT-16` 已完成本轮收口
- `KBT-31` 已完成当前轮次收口，`PDCP` 系统架构评审包已形成正式基线
- 当前正在评审 `KBT-32` 总体方案与模块方案下发基线
- `KBT-33` 继续作为子 issue 保留，用于细化双视角一致性与接口稳定性策略
- 健康事件量化阈值与故障阈值
- 睡眠监测与找物能力的执行阈值
- 多尺度动态 OODA 基线继续向状态机、接口和验证项落地
- 陪伴记忆治理与多角色配置边界细化
- 模块级架构与接口草案评审顺序
