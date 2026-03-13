# 更新日志

---

文档版本：v1.1
创建日期：2026-03-08
作者：Codex-架构师

---

本文档记录本项目的重要变更。

当前仓库仍处于架构设计阶段，因此本阶段的变更主要集中在需求、架构、技术研判和评审文档的演进上。

格式参考 Keep a Changelog，并按实际提交日期归档。

## [未发布]

- 暂无。

## [2026-03-13]

### 新增

- 新增 [docs/10_team_planning/README.md](docs/10_team_planning/README.md)，用于收纳团队规划与组织设计提案。
- 新增 [docs/10_team_planning/01_development_team_proposal.md](docs/10_team_planning/01_development_team_proposal.md)，用于定义 Kinbot 从 `PDCP` 到量产预备所需的开发团队结构、人数规模和阶段扩编建议。

### 变更

- 在 [README.md](README.md) 中补充 `docs/10_team_planning` 目录索引、仓库结构和推荐阅读顺序。
- 将 `input/` 目录重组接入主线索引，明确区分 `input/00_requirements/` 与 `input/01_candidate_resume/` 两类输入。
- 更新根目录 README、治理文档、研究文档与团队规划文档中的输入路径，统一切换到新的 `input/00_requirements/` 结构。
- 为 [input/00_requirements/README.md](input/00_requirements/README.md) 和 [input/01_candidate_resume/README.md](input/01_candidate_resume/README.md) 新增目录级说明，明确需求输入和候选人简历输入的协作边界。

## [2026-03-11]

### 新增

- 新增 [docs/01_p0_concept/01_early_hardware_parameters_alignment_analysis.md](docs/01_p0_concept/01_early_hardware_parameters_alignment_analysis.md)，用于评估早期硬件参数需求与当前架构方向的一致性。

### 变更

- 将文档库重组为按全生命周期分层的英文目录结构：`docs/00_governance` 到 `docs/09_research`，并恢复英文小写、数字前缀命名。
- 将用户需求事实源统一迁移为 [input/00_user_requirements_input.md](input/00_user_requirements_input.md)，明确 `input/` 目录用于保存用户人工输入。
- 调整根目录结构，仅保留 [README.md](README.md) 与 [CHANGELOG.md](CHANGELOG.md) 作为主要可见文件，并清理 `output/`、`tmp/` 下的产出文件但保留目录。
- 删除各子目录 `CHANGELOG.md`，统一只在根目录维护一份更新日志；同时增强各子目录 `README.md`，加入目录角色说明和文档索引。
- 统一 Codex 创建文档的头信息格式，补充文档版本、创建日期与作者字段，并同步修正文档索引口径。
- 修正一批外部评审文档的作者归属判断，撤回误加的 `Codex-架构师` 头信息，保留原始作者签署方式。

## [2026-03-10]

### 新增

- 新增 [docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md](docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md)，用于承接 `PDCP` 系统架构评审。
- 新增 [docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md](docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md)，用于下发总体方案与模块设计基线。
- 新增 [docs/08_reviews/01_architect_review_and_plan.md](docs/08_reviews/01_architect_review_and_plan.md) 以及两份 Claude 替代提案评审文档，作为外部架构评审输入。

### 变更

- 将项目主线从提前起草的量产准备约束回调到 `P1 / PDCP` 阶段，明确当前阶段是系统架构设计与技术研判。
- 补齐 `PDCP` 双视角总体架构基线：机器人本体实体架构视图 + 运行时功能架构视图，并引入 `Body Capability Contract`。
- 吸收 Claude 外部评审意见，补入双视角一致性检查、一级接口稳定性策略，以及 `D1 / D6 / D7` 三项阻断输入。
- 关闭 `KBT-31`，恢复 `KBT-32` 为主评审项，并把系统架构基线正式注入总体方案下发链路。
- 完成一次全仓文档一致性回归，清理早期总览文档与当前 `PDCP` 基线不一致的问题。

## [2026-03-09]

### 新增

- 新增 [docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md](docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md)，用于滚动管理整机 `BOM` 成本结构与降本路线。
- 新增 [docs/03_p2_feasibility/06_power_budget_and_efficiency_strategy.md](docs/03_p2_feasibility/06_power_budget_and_efficiency_strategy.md)，用于定义整机功耗预算与能效控制策略。
- 新增 [docs/02_p1_architecture/12_human_service_and_telemedicine_boundaries.md](docs/02_p1_architecture/12_human_service_and_telemedicine_boundaries.md)，用于定义后台人工服务与在线问诊协同边界。
- 新增 [docs/02_p1_architecture/13_medication_storage_and_indoor_delivery_requirements.md](docs/02_p1_architecture/13_medication_storage_and_indoor_delivery_requirements.md)，用于定义储药与室内递送要求。
- 新增 [docs/03_p2_feasibility/07_phase1_wearable_compatibility_and_data_fields.md](docs/03_p2_feasibility/07_phase1_wearable_compatibility_and_data_fields.md)，用于定义一期穿戴兼容范围与数据字段。
- 新增 [docs/09_research/02_uwb_phase1_maturity_and_integration_value.md](docs/09_research/02_uwb_phase1_maturity_and_integration_value.md)，用于评估 `UWB` 一期成熟度与接入价值。
- 新增 [docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md](docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md)，用于定义量产预备判定标准。
- 新增 [docs/05_p4_beta_dvt/01_mvp_validation_plan.md](docs/05_p4_beta_dvt/01_mvp_validation_plan.md)，用于定义一代 `MVP` 验证计划。

### 变更

- 连续收口 `KBT-8 / KBT-11 / KBT-29 / KBT-30 / KBT-13 / KBT-10 / KBT-15 / KBT-14 / KBT-16`，将核心状态、技术路线与评审门逐步冻结。
- 将整机约束从单纯 `BOM` 扩展为 `BOM / 售价 / 功耗 / 高端产品感知` 的联合约束体系。
- 明确暂停时必须给出具体审阅需求，避免协作停顿点模糊。
- 将后置里程碑的逆向约束型文档从主评审位回调，恢复未清账前置里程碑的优先顺序。
- 将 `VLN` 专项文档纳入主线版本控制，并作为正式技术输入继续服务于主架构线程。

## [2026-03-08]

### 新增

- 新增治理基线文档：
  - [docs/00_governance/01_workflow.md](docs/00_governance/01_workflow.md)
  - [docs/00_governance/02_lifecycle_workflow_and_gates.md](docs/00_governance/02_lifecycle_workflow_and_gates.md)
  - [docs/00_governance/03_decision_log.md](docs/00_governance/03_decision_log.md)
  - [docs/00_governance/04_glossary.md](docs/00_governance/04_glossary.md)
  - [docs/00_governance/05_system_architecture_principles.md](docs/00_governance/05_system_architecture_principles.md)
- 新增核心架构文档：
  - [docs/02_p1_architecture/03_multi_scale_dynamic_ooda_architecture_baseline.md](docs/02_p1_architecture/03_multi_scale_dynamic_ooda_architecture_baseline.md)
  - [docs/02_p1_architecture/04_module_layers_and_boundaries.md](docs/02_p1_architecture/04_module_layers_and_boundaries.md)
  - [docs/02_p1_architecture/05_world_state_schema.md](docs/02_p1_architecture/05_world_state_schema.md)
  - [docs/02_p1_architecture/06_decision_state_machine.md](docs/02_p1_architecture/06_decision_state_machine.md)
  - [docs/02_p1_architecture/07_safety_compliance_authorization_api.md](docs/02_p1_architecture/07_safety_compliance_authorization_api.md)
  - [docs/02_p1_architecture/08_companion_interaction_strategy.md](docs/02_p1_architecture/08_companion_interaction_strategy.md)
  - [docs/02_p1_architecture/09_safety_risk_matrix.md](docs/02_p1_architecture/09_safety_risk_matrix.md)
  - [docs/02_p1_architecture/10_health_event_pipeline_and_escalation.md](docs/02_p1_architecture/10_health_event_pipeline_and_escalation.md)
  - [docs/02_p1_architecture/11_app_cloud_ops_minimal_loop.md](docs/02_p1_architecture/11_app_cloud_ops_minimal_loop.md)
- 新增可行性与工程化前置文档：
  - [docs/03_p2_feasibility/02_demo_to_mass_production_gaps.md](docs/03_p2_feasibility/02_demo_to_mass_production_gaps.md)
  - [docs/03_p2_feasibility/03_engineering_npi_baseline.md](docs/03_p2_feasibility/03_engineering_npi_baseline.md)
  - [docs/03_p2_feasibility/04_hardware_software_selection_matrix.md](docs/03_p2_feasibility/04_hardware_software_selection_matrix.md)
- 新增 [docs/09_research/01_vln_role_analysis_and_technical_plan.md](docs/09_research/01_vln_role_analysis_and_technical_plan.md)，用于承接 `VLN` 技术规划与研究输入。

### 变更

- 启动 Codex 架构线程，完成第一轮模块边界、世界状态、决策状态机和安全审批接口的架构冻结。
- 将 OODA 从固定单环升级为多尺度、并发、可中断、可动态调度的正式方法论。
- 将问题澄清从单线健康追问扩展为“健康管理 / 陪伴交互 / 安全保障”三条主线并行推进。
- 将生命周期管理明确为参考 `IPD` 的阶段门模式，并同步建立 Linear 里程碑与 issue 映射。
- 根据用户多轮澄清结果，连续吸收产品目标、健康边界、自主边界、穿戴路线、人工服务、储物仓、UWB 候选路线、样机现状和量产预备目标等关键输入。

## [2026-03-07]

### 新增

- 新增 [docs/02_p1_architecture/01_overall_architecture.md](docs/02_p1_architecture/01_overall_architecture.md)，首次给出面向家庭室内场景的移动交互机器人 OODA 总体架构，明确感知、认知、决策、执行分层，以及世界状态、安全门控和端云协同等核心设计方向。
