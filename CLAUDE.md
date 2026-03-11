# Claude 协作说明

本文档用于说明 Claude Code 在本仓库中的协作方式和当前架构基线。

## 项目概述

本仓库对应的 Kinbot OODA 项目，是面向家庭室内场景的智能移动交互机器人系统设计项目。当前处于架构设计阶段（PDCP），目标在 2026-12-31 达到量产预备状态。

## 协作规则

### 每轮开始前必做

1. **检查 `REQUIREMENTS.MD` 顶部"对 Codex 的要求"** 是否有更新
2. **检查 `CLAUDE.md` 或 `docs/08_reviews/01_architect_review_and_plan.md`** 是否有新增内容，作为外部架构评审输入纳入本轮处理
3. 所有文档和 Linear 协作条目统一用**中文**维护

### 文档维护权限

- `REQUIREMENTS.MD` 由用户独占维护，**不得修改**
- 其他文档由 Claude 持续推进和维护

### 信息不足时的处理

当信息不足但推进不能停时，先形成"**架构师设想包**"，再提交审核。不要停滞等待。

### 产品定位检查

每一阶段都要检查系统各实体元素的组合，判断整机与服务是否仍然呈现"**聪明、温暖、精致**"的高端产品感，并能支撑 **20000 到 30000 元**售价区间。

## 核心架构原则

### OODA 主循环

系统以 OODA（Observe、Orient、Decide、Act）为主循环，已冻结为"**多尺度、并发、可中断、可动态调度**"的正式基线。

### 双视角基线

系统架构在 PDCP 节点采用"**双视角基线**"：
- 产品实体架构视图（机器人本体作为软硬一体产品实体显式纳入）
- 运行时功能架构视图

### 核心架构要素

- **World State**：统一的运行时结构化状态，作为认知中枢
- **安全/合规/授权**：作为动作前置门控
- **高频安全闭环**：保证运动安全
- **端云协同**：扩展知识和服务能力
- **R4 关系与服务环**：已进入一代正式架构层
- **OODA Scale Scheduler**：已提升为一级架构能力

### 架构分解规则

每一层级的实体个数控制在 **7±2 个**（即 5～9 个）。

## 项目管理

### 时间线

- 项目时间线按 2026-01-01 起算
- 目标 2026-03-31 完成产品定义与架构冻结
- 目标 2026-12-31 达到量产预备状态
- 2027-01 作为 MVP 验证与验收窗口

### 方法论

- 全生命周期管理参考 **IPD（集成产品开发）**流程
- 在每一个阶段完成计划转阶段时必须显性地提交审查
- 当前主优先级：PDCP 系统架构评审与总体方案下发

### 协作工具

- 阶段性待办和 issue 同步到 **Linear**
- 当前 Linear 项目：`Kinbot OODA 架构到量产预备`
- 涉及 VLN 路线和前瞻技术判断时，与专门的 VLN 技术评估线程通过独立 issue 交叉协作

## 文档结构

### 核心文档（推荐阅读顺序）

1. `REQUIREMENTS.MD` - 产品需求、边界和工程约束（用户独占维护）
2. `docs/00_governance/05_system_architecture_principles.md` - 系统架构设计原则
3. `docs/02_p1_architecture/01_overall_architecture.md` - 机器人 OODA 总体架构
4. `docs/09_research/01_vln_role_analysis_and_technical_plan.md` - VLN 在 OODA 中的角色分析与规划
5. `docs/00_governance/01_workflow.md` - 从架构到落地的推进工作流
6. `docs/00_governance/02_lifecycle_workflow_and_gates.md` - 全生命周期工作流与阶段门
7. `docs/02_p1_architecture/03_multi_scale_dynamic_ooda_architecture_baseline.md` - 多尺度动态 OODA 架构基线

### 架构设计文档

- `docs/02_p1_architecture/04_module_layers_and_boundaries.md` - 模块分层与模块边界
- `docs/02_p1_architecture/05_world_state_schema.md` - 世界状态与核心实体结构
- `docs/02_p1_architecture/06_decision_state_machine.md` - 系统决策状态机
- `docs/02_p1_architecture/07_safety_compliance_authorization_api.md` - 安全/合规/授权接口

### 功能域文档

- `docs/02_p1_architecture/10_health_event_pipeline_and_escalation.md` - 健康事件管线、补采逻辑与升级链路
- `docs/02_p1_architecture/08_companion_interaction_strategy.md` - 陪伴交互策略、人设边界与长期记忆规则
- `docs/02_p1_architecture/09_safety_risk_matrix.md` - 一代安全风险域、降级策略与空间规则
- `docs/02_p1_architecture/11_app_cloud_ops_minimal_loop.md` - 家属 App、云服务与后台运营坐席的一代最小闭环
- `docs/02_p1_architecture/13_medication_storage_and_indoor_delivery_requirements.md` - 储药与室内递送的能力包、主链边界、角色权限与工程护栏
- `docs/02_p1_architecture/12_human_service_and_telemedicine_boundaries.md` - 后台人工服务、在线问诊、第三方履约与公共应急之间的角色边界、接入链路与审计要求

### 评审与基线文档

- `docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md` - 面向 IPD/PDCP 节点的完整系统架构评审包
- `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md` - PDCP 通过后用于各模块展开架构与总体方案设计的下发基线
- `docs/08_reviews/02_architecture_principles_alignment_check.md` - 总体架构与架构原则的符合度检查
- `docs/08_reviews/01_architect_review_and_plan.md` - 外部架构评审意见与关键路径建议

### 工程化文档

- `docs/03_p2_feasibility/02_demo_to_mass_production_gaps.md` - 当前样机 Demo 到量产预备状态的能力缺口
- `docs/03_p2_feasibility/03_engineering_npi_baseline.md` - 工程化与 NPI 准备基线
- `docs/03_p2_feasibility/04_hardware_software_selection_matrix.md` - 一代软硬件选型矩阵
- `docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md` - 整机 BOM 滚动成本基线与降本主战场
- `docs/03_p2_feasibility/06_power_budget_and_efficiency_strategy.md` - 整机功耗预算与能效控制策略
- `docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md` - 2026-12-31 量产预备判定标准
- `docs/05_p4_beta_dvt/01_mvp_validation_plan.md` - 量产预备与 2027-01 MVP 验证窗口
- `docs/06_p5_launch_readiness/02_production_introduction_launch_and_delivery_closure.md` - 量产导入、发布准备与交付闭环
- `docs/03_p2_feasibility/07_phase1_wearable_compatibility_and_data_fields.md` - 一期穿戴设备兼容范围、接入模式、新鲜度约束与首版数据字段
- `docs/09_research/02_uwb_phase1_maturity_and_integration_value.md` - UWB 一期技术成熟度、样品验证门与接入价值边界

### 其他文档

- `docs/00_governance/03_decision_log.md` - 已确认决策、开放问题与后续问题清单
- `docs/00_governance/04_glossary.md` - 项目术语表
- `docs/08_reviews/04_second_round_document_consistency_audit.md` - 文档一致性与严谨度审查报告
- `CHANGELOG.md` - 变更日志

## 文档编写规范

### 图示要求

对存在明确结构分解的架构文档，**优先配套直观图示**。重视架构图，文档中多用直观的图示。

### 文档引用

文档允许通过 `#[[file:<relative_file_name>]]` 引用其他文件（如 OpenAPI spec、GraphQL spec）。

## 术语约定

- **World State**：统一的运行时结构化状态
- **World Model**：如后续引入，专指用于预测或仿真未来环境和任务动态的模型
- **PDCP**：Product Definition & Concept Phase（产品定义与概念阶段）
- **IPD**：Integrated Product Development（集成产品开发）
- **NPI**：New Product Introduction（新产品导入）
- **OODA**：Observe、Orient、Decide、Act
- **VLN**：Vision-and-Language Navigation
- **VLM**：Vision-Language Model

## 当前工作重点

- 当前主优先级：PDCP 系统架构评审与总体方案下发
- KBT-31 已完成收口，PDCP 系统架构评审包已形成正式基线
- 当前主评审项是 KBT-32：总体方案与模块方案下发基线
- 当前问题澄清按"健康管理、陪伴交互、安全保障"三条主线并行推进

## 团队与资源

- 当前团队约 25-30 人，周期内预计扩展到 100 人以上
- 周期内预算约 8000 万 - 1 亿人民币
- 整机物料成本目标：6000-8000 元人民币

## 已有基础

- 所有讨论中的核心功能已经在真实自研机器人样机上做过粗放 Demo
- 具备较强的消费电子产研经验，覆盖平板类和 IoT 类产品
- 具备 VLM、VLN 能力，与行业 SOTA 差距约不到一年
