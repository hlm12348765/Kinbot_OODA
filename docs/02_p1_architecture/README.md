# P1 产品定义与架构冻结

收纳 PDCP 阶段的系统架构、闭环、接口、状态和功能域核心设计文档。

## 目录角色

用于形成可评审的系统级架构基线，并支撑后续总体方案与模块并行设计。

## 文档索引

- `01_overall_architecture.md`：总体架构。核心主题：系统总体架构、主循环和产品系统边界。
- `02_pdcp_system_architecture_review_package.md`：PDCP系统架构评审包。核心主题：面向 PDCP 节点的系统架构评审包。
- `03_multi_scale_dynamic_ooda_architecture_baseline.md`：多尺度动态OODA架构基线。核心主题：多尺度动态 OODA 架构基线与调度规则。
- `04_module_layers_and_boundaries.md`：模块分层与模块边界。核心主题：一级模块分层、职责边界和端云划分。
- `05_world_state_schema.md`：世界状态结构。核心主题：World State 实体结构、状态面和关系组织。
- `06_decision_state_machine.md`：决策状态机。核心主题：顶层模式、业务状态、异常与故障状态机。
- `07_safety_compliance_authorization_api.md`：安全合规授权接口。核心主题：安全、合规、授权和审批接口面。
- `08_companion_interaction_strategy.md`：陪伴交互策略。核心主题：陪伴交互策略、人设边界与长期记忆治理。
- `09_safety_risk_matrix.md`：安全风险矩阵。核心主题：安全风险域、空间规则、降级与停机矩阵。
- `10_health_event_pipeline_and_escalation.md`：健康事件管线与升级链路。核心主题：健康事件、补采、分级和升级链路。
- `11_app_cloud_ops_minimal_loop.md`：家属应用、云服务与后台运营坐席一代最小闭环。核心主题：家属 App、云服务与后台运营坐席的最小闭环。
- `12_human_service_and_telemedicine_boundaries.md`：后台人工服务与在线问诊协同边界。核心主题：人工服务、在线问诊与第三方履约边界。
- `13_medication_storage_and_indoor_delivery_requirements.md`：储药与室内递送要求。核心主题：储药与室内递送能力包和工程护栏。

## 维护规则

1. 文档内容继续使用中文撰写。
2. 文件名使用英文小写、数字前缀和生命周期目录组织。
3. 目录级变更统一只在根目录 `CHANGELOG.md` 中记录，不再维护子目录 `CHANGELOG.md`。
4. 当目录内新增文档时，需同步回写本 `README.md` 的文档索引。
