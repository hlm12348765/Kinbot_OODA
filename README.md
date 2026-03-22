# 项目说明

---

文档版本：v1.1
创建日期：2026-03-08
作者：Codex-架构师

文档变更记录：
- v1.1 | 2026-03-22 | Codex-架构师 | 补充验证 Demo 系统架构还原文档索引，并同步最近新增的研究文档索引与推荐阅读顺序。
- v1.0 | 2026-03-08 | Codex-架构师 | 文档创建。

---

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

- 每轮开始前先检查 `input/00_requirements/00_user_requirements_input.md` 顶部”对 Codex 的要求”是否有更新
- 若 [CLAUDE.md](CLAUDE.md) 或 [docs/08_reviews/01_architect_review_and_plan.md](docs/08_reviews/01_architect_review_and_plan.md) 有新增内容，也作为外部架构评审输入纳入本轮处理
- 关键需求、澄清和决策沉淀在仓库文档
- 阶段性待办和 issue 同步到 Linear，形成持续协作
- 本地文档和 Linear 协作条目统一用中文维护
- 当前 Linear 项目为 `Kinbot OODA 架构到量产预备`
- 涉及 VLN 路线和前瞻技术判断时，与专门的 VLN 技术评估线程通过独立 issue 交叉协作，其专项文档现已纳入主线版本控制
- `input/00_requirements/00_user_requirements_input.md` 由用户独占维护，其他文档由我持续推进
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

- `input/00_requirements/00_user_requirements_input.md`：用户需求输入。核心主题：产品需求、边界、阶段性澄清与对 Codex 的要求。
- `input/01_candidate_resume/README.md`：候选人简历输入。核心主题：候选人简历资料、评估使用边界与团队规划基线的衔接方式。
- `docs/00_governance/01_workflow.md`：推进工作流。核心主题：当前主线推进工作流、跨线程规范和评审顺序。
- `docs/00_governance/02_lifecycle_workflow_and_gates.md`：全生命周期工作流与阶段门。核心主题：全生命周期阶段门、里程碑和 IPD 对应关系。
- `docs/00_governance/03_decision_log.md`：决策记录。核心主题：事实、判断、决策、开放问题和审阅结论沉淀。
- `docs/00_governance/04_glossary.md`：术语表。核心主题：术语定义与命名边界。
- `docs/00_governance/05_system_architecture_principles.md`：系统架构原则。核心主题：系统架构原则、分解约束和设计准则。
- `CLAUDE.md`：Claude协作说明。核心主题：Claude 模型工作说明与外部评审协作约定。
- `docs/01_p0_concept/01_early_hardware_parameters_alignment_analysis.md`：早期硬件参数需求与新架构一致性分析。核心主题：早期硬件参数与当前架构方向的一致性、保守项与激进项分析。
- `docs/01_p0_concept/02_hardware_parameter_requirements_fit_assessment.md`：硬件参数需求匹配性评估。核心主题：早期硬件参数需求的适配性、问题点与修正方向。
- `docs/01_p0_concept/03_kinbot_product_system_technology_business_evaluation.md`：Kinbot产品、体系、技术与商业理念四轴评估提案。核心主题：当前 Kinbot 的理念组合判断、商业成功概率推断与后续产品规划建议。
- `docs/01_p0_concept/04_demo_validation_system_architecture_reconstruction_and_product_inheritance_assessment.md`：验证 Demo 系统架构还原与产品继承评估。核心主题：从验证平台参数反推 Demo 系统架构，并分析其对 Kinbot 产品架构的可继承项与必须抛弃项。
- `docs/02_p1_architecture/01_overall_architecture.md`：总体架构。核心主题：系统总体架构、主循环和产品系统边界。
- `docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md`：PDCP系统架构评审包。核心主题：面向 PDCP 节点的系统架构评审包。
- `docs/02_p1_architecture/03_multi_scale_dynamic_ooda_architecture_baseline.md`：多尺度动态OODA架构基线。核心主题：多尺度动态 OODA 架构基线与调度规则。
- `docs/02_p1_architecture/04_module_layers_and_boundaries.md`：模块分层与模块边界。核心主题：一级模块分层、职责边界和端云划分。
- `docs/02_p1_architecture/05_world_state_schema.md`：世界状态结构。核心主题：World State 实体结构、状态面和关系组织。
- `docs/02_p1_architecture/06_decision_state_machine.md`：决策状态机。核心主题：顶层模式、业务状态、异常与故障状态机。
- `docs/02_p1_architecture/07_safety_compliance_authorization_api.md`：安全合规授权接口。核心主题：安全、合规、授权和审批接口面。
- `docs/02_p1_architecture/08_companion_interaction_strategy.md`：陪伴交互策略。核心主题：陪伴交互策略、人设边界与长期记忆治理。
- `docs/02_p1_architecture/09_safety_risk_matrix.md`：安全风险矩阵。核心主题：安全风险域、空间规则、降级与停机矩阵。
- `docs/02_p1_architecture/10_health_event_pipeline_and_escalation.md`：健康事件管线与升级链路。核心主题：健康事件、补采、分级和升级链路。
- `docs/02_p1_architecture/11_app_cloud_ops_minimal_loop.md`：家属应用、云服务与后台运营坐席一代最小闭环。核心主题：家属 App、云服务与后台运营坐席的最小闭环。
- `docs/02_p1_architecture/12_human_service_and_telemedicine_boundaries.md`：后台人工服务与在线问诊协同边界。核心主题：人工服务、在线问诊与第三方履约边界。
- `docs/02_p1_architecture/13_medication_storage_and_indoor_delivery_requirements.md`：储药与室内递送要求。核心主题：储药与室内递送能力包和工程护栏。
- `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`：总体方案与模块方案下发基线。核心主题：总体方案工作包与模块方案下发基线。
- `docs/03_p2_feasibility/02_demo_to_mass_production_gaps.md`：样机到量产预备能力缺口。核心主题：样机到量产预备的能力缺口与阻断项。
- `docs/03_p2_feasibility/03_engineering_npi_baseline.md`：工程化与NPI准备基线。核心主题：工程化、NPI 和 Alpha/EVT 前置冻结项。
- `docs/03_p2_feasibility/04_hardware_software_selection_matrix.md`：软硬件选型矩阵。核心主题：软硬件选型矩阵、算力需求与主备观察线。
- `docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md`：成本结构与技术降本路径。核心主题：成本结构、降本路径与高端产品感检查。
- `docs/03_p2_feasibility/06_power_budget_and_efficiency_strategy.md`：整机功耗预算与能效控制策略。核心主题：功耗预算、能效控制与工作区间基线。
- `docs/03_p2_feasibility/07_phase1_wearable_compatibility_and_data_fields.md`：一期穿戴设备兼容范围与数据字段。核心主题：一期穿戴兼容范围、接入模式和字段定义。
- `docs/03_p2_feasibility/08_Kinbot_nighttime_closed_loop_plan.md`：家庭机器人夜间稳态定位与任务闭环方案。核心主题：纯视觉路线下夜间不开灯场景的定位稳态、任务闭环、隐私策略与服务闭环设计。
- `docs/05_p4_beta_dvt/01_mvp_validation_plan.md`：量产预备与MVP验证计划。核心主题：MVP 范围、验证域、试点框架与放行规则。
- `docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md`：量产预备判定标准。核心主题：量产预备判定域、通过条件和阶段门定义。
- `docs/06_p5_launch_readiness/02_production_introduction_launch_and_delivery_closure.md`：量产导入、发布准备与交付闭环。核心主题：量产导入、发布准备与交付闭环设计。
- `docs/08_reviews/01_architect_review_and_plan.md`：架构师综合评审与计划。核心主题：Claude 架构评审意见与关键路径建议。
- `docs/08_reviews/02_architecture_principles_alignment_check.md`：架构原则符合度检查。核心主题：总体架构与架构原则的符合度检查。
- `docs/09_research/01_vln_role_analysis_and_technical_plan.md`：VLN角色分析与技术规划。核心主题：VLN 在 Kinbot 中的角色分析、路线判断和技术规划。
- `docs/09_research/02_uwb_phase1_maturity_and_integration_value.md`：UWB一期技术成熟度与接入价值评估。核心主题：UWB 一期成熟度、样品验证门和接入价值评估。
- `docs/09_research/04_spacemit_k3_chip_assessment_for_embodied_ai.md`：进迭时空 K3 芯片信息整合与具身智能适配评估。核心主题：K3 芯片事实整合、端侧大模型推理能力、具身智能机器人应用优劣势与 Kinbot 适配判断。
- `docs/10_team_planning/01_development_team_proposal.md`：开发团队提案。核心主题：基于当前架构与总体方案，反推出量产预备前所需的团队结构、人数规模和阶段扩编建议。

## 仓库结构

```text
.
├── README.md
├── CHANGELOG.md
├── CLAUDE.md
├── docs
│   ├── 00_governance
│   │   ├── README.md
│   │   ├── 01_workflow.md
│   │   ├── 02_lifecycle_workflow_and_gates.md
│   │   ├── 03_decision_log.md
│   │   ├── 04_glossary.md
│   │   └── 05_system_architecture_principles.md
│   ├── 01_p0_concept
│   │   ├── README.md
│   │   ├── 01_early_hardware_parameters_alignment_analysis.md
│   │   ├── 02_hardware_parameter_requirements_fit_assessment.md
│   │   ├── 03_kinbot_product_system_technology_business_evaluation.md
│   │   └── 04_demo_validation_system_architecture_reconstruction_and_product_inheritance_assessment.md
│   ├── 02_p1_architecture
│   │   ├── README.md
│   │   └── ...
│   ├── 03_p2_feasibility
│   │   ├── README.md
│   │   └── ...
│   ├── 04_p3_alpha_evt
│   │   └── README.md
│   ├── 05_p4_beta_dvt
│   │   ├── README.md
│   │   └── 01_mvp_validation_plan.md
│   ├── 06_p5_launch_readiness
│   │   ├── README.md
│   │   └── ...
│   ├── 07_p6_operations
│   │   └── README.md
│   ├── 08_reviews
│   │   ├── README.md
│   │   └── ...
│   ├── 09_research
│   │   ├── README.md
│   │   └── ...
│   └── 10_team_planning
│       ├── README.md
│       └── 01_development_team_proposal.md
├── input
│   ├── README.md
│   ├── 00_requirements
│   │   ├── README.md
│   │   ├── 00_user_requirements_input.md
│   │   ├── 01_kinbot_prd_v0_2_hardware_parameters.csv
│   │   ├── 02_kinbot_prd_v0_3_hardware_parameters.csv
│   │   └── 03_kinbot_parameters_id_e.csv
│   └── 01_candidate_resume
│       ├── README.md
│       └── huangjie_profile.md
├── output
└── tmp
```

## 推荐阅读顺序

1. `input/00_requirements/00_user_requirements_input.md`
2. `docs/00_governance/05_system_architecture_principles.md`
3. `docs/01_p0_concept/03_kinbot_product_system_technology_business_evaluation.md`
4. `docs/01_p0_concept/04_demo_validation_system_architecture_reconstruction_and_product_inheritance_assessment.md`
5. `docs/02_p1_architecture/01_overall_architecture.md`
6. `docs/09_research/01_vln_role_analysis_and_technical_plan.md`
7. `docs/00_governance/01_workflow.md`
8. `docs/00_governance/02_lifecycle_workflow_and_gates.md`
9. `docs/02_p1_architecture/03_multi_scale_dynamic_ooda_architecture_baseline.md`
10. `docs/00_governance/03_decision_log.md`
11. `docs/02_p1_architecture/04_module_layers_and_boundaries.md`
12. `docs/02_p1_architecture/05_world_state_schema.md`
13. `docs/02_p1_architecture/06_decision_state_machine.md`
14. `docs/02_p1_architecture/07_safety_compliance_authorization_api.md`
15. `docs/02_p1_architecture/10_health_event_pipeline_and_escalation.md`
16. `docs/02_p1_architecture/08_companion_interaction_strategy.md`
17. `docs/02_p1_architecture/09_safety_risk_matrix.md`
18. `docs/02_p1_architecture/11_app_cloud_ops_minimal_loop.md`
19. `docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md`
20. `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`
21. `docs/02_p1_architecture/12_human_service_and_telemedicine_boundaries.md`
22. `docs/02_p1_architecture/13_medication_storage_and_indoor_delivery_requirements.md`
23. `docs/03_p2_feasibility/07_phase1_wearable_compatibility_and_data_fields.md`
24. `docs/09_research/02_uwb_phase1_maturity_and_integration_value.md`
25. `docs/09_research/04_spacemit_k3_chip_assessment_for_embodied_ai.md`
26. `docs/03_p2_feasibility/02_demo_to_mass_production_gaps.md`
27. `docs/03_p2_feasibility/03_engineering_npi_baseline.md`
28. `docs/03_p2_feasibility/04_hardware_software_selection_matrix.md`
29. `docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md`
30. `docs/03_p2_feasibility/06_power_budget_and_efficiency_strategy.md`
31. `docs/03_p2_feasibility/08_Kinbot_nighttime_closed_loop_plan.md`
32. `docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md`
33. `docs/05_p4_beta_dvt/01_mvp_validation_plan.md`
34. `docs/06_p5_launch_readiness/02_production_introduction_launch_and_delivery_closure.md`
35. `docs/00_governance/04_glossary.md`
36. `docs/08_reviews/02_architecture_principles_alignment_check.md`
37. `docs/10_team_planning/01_development_team_proposal.md`

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
