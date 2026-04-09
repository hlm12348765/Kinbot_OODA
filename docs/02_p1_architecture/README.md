# P1 产品定义与架构冻结

---

文档版本：v1.9
创建日期：2026-03-11
作者：Codex-架构师

---

文档变更记录：
- v1.9 | 2026-04-09 | Codex-架构师 | 同步 `V1` 真实复杂度下降后的目录口径：将 `11` 改写为当前 `App + 最小云` 主链，将 `12` 改写为后续适配位边界文档。
- v1.8 | 2026-04-09 | Codex-架构师 | 继续压缩 `P1` 入口复杂度，明确 `01` 是唯一总图文档、`03` 是唯一运行时语法文档、`06` 是唯一离散决策状态机文档，并补记 `P2-01` 为默认开发入口。
- v1.7 | 2026-04-08 | Codex-架构师 | 重命名 `03` 为多尺度执行范式运行时基线，收紧 `14` 为背景/决策来路锚点，并明确 `01`、`02`、`03` 的角色边界。
- v1.6 | 2026-04-06 | Codex-架构师 | 补记 `Phase 4` 已完成下游同步：`PDCP` 评审包、模块边界与状态机已开始承接七实体目标模型。
- v1.5 | 2026-04-06 | Codex-架构师 | 补记 `Phase 3` 已进入收口确认前状态：`05` 已升级为七实体目标模型主文档。
- v1.4 | 2026-04-06 | Codex-架构师 | 补记 `PDCP` 评审包已对齐 `Phase 2`：总架构上抬为家庭共居智能体，运行时改为多执行范式，`OODA` 退到离散决策范式。
- v1.3 | 2026-04-06 | Codex-架构师 | 补记 `Phase 2` 已继续下推到陪伴、安全、健康、伴生系统、人工服务与递送边界文档，统一其对多执行范式和审批硬边界的口径。
- v1.2 | 2026-04-06 | Codex-架构师 | 补记 `Phase 2` 的主线重组，更新《总体架构》与《03》索引描述，使其与家庭共居智能体总图和多执行范式口径保持一致。
- v1.1 | 2026-04-06 | Codex-架构师 | 新增《家庭共居智能体架构范式》索引，并将《03》索引描述更新为“多执行范式基线”口径。
- v1.0 | 2026-03-11 | Codex-架构师 | 文档创建。

---

整理 `PDCP` 阶段的系统架构、接口、状态和功能域核心设计文档。

## 目录角色

用于形成可评审的系统级架构基线，并支撑后续总体方案与模块并行设计。

当前默认阅读方式是：

1. 先读 `01` 理解产品系统边界和双视角总图；
2. 再读 `03 / 05 / 06 / 07` 理解运行时、状态平面、状态机和安全边界；
3. 如需进入开发承接，继续读取 `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`。

## 文档索引

- `01_overall_architecture.md`：总体架构事实源。核心主题：唯一总图文档，负责产品系统边界、双视角总图、部署边界、一级接口与一级约束。
- `02_pdcp_system_architecture_review_package.md`：`PDCP` 系统架构评审包。核心主题：面向 `PDCP` 节点的系统架构评审包，只承接评审问题、冻结项和模块下发结论，不再重复解释总架构。
- `03_execution_paradigms_runtime_baseline.md`：多尺度执行范式基线。核心主题：唯一运行时语法文档，说明 `4` 类执行范式、`R1-R4`、协调输入、切换规则和范式边界。
- `04_module_layers_and_boundaries.md`：模块分层与模块边界。核心主题：一级模块分层、职责边界和端云划分。
- `05_world_state_schema.md`：世界状态结构。核心主题：七实体 `World State` 主文档，定义目标实体结构、`V1` 最小激活子集与 `CareEvent / Task` 边界。
- `06_decision_state_machine.md`：决策状态机。核心主题：唯一离散决策状态机文档，说明顶层状态、业务主状态、约束子状态、转移规则与中断源。
- `07_safety_compliance_authorization_api.md`：安全合规授权接口。核心主题：安全、合规、授权和审批接口说明。
- `08_companion_interaction_strategy.md`：陪伴交互策略。核心主题：陪伴交互策略、人设边界、长期记忆治理，以及与多执行范式的协同关系。
- `09_safety_risk_matrix.md`：安全风险矩阵。核心主题：安全风险域、空间规则、降级与停机矩阵，以及风险到多执行范式与安全硬边界的映射。
- `10_health_event_pipeline_and_escalation.md`：健康事件管线与升级链路。核心主题：健康事件、补采、分级、升级链路与跨执行范式业务管线边界。
- `11_app_cloud_ops_minimal_loop.md`：家属 App 与最小云一代最小闭环。核心主题：当前 `V1` 的 `App + 最小云` 最小闭环、远程确认、记忆治理与最小审计边界。
- `12_human_service_and_telemedicine_boundaries.md`：后台人工服务、在线问诊与第三方履约后续适配边界。核心主题：后续适配位中的人工服务、在线问诊与第三方履约边界，以及它们如何受控接入当前主线。
- `13_medication_storage_and_indoor_delivery_requirements.md`：储药与室内递送要求。核心主题：储药与室内递送能力包、工程护栏与离散业务执行边界。
- `14_family_co_living_agent_paradigm.md`：家庭共居智能体架构范式。核心主题：作为 `Phase 2` 背景/决策来路锚点，记录新总图、三轴框架与历史 `provisional` 来路，不再作为并列主入口。

## 建议阅读顺序

1. `01_overall_architecture.md`
2. `03_execution_paradigms_runtime_baseline.md`
3. `05_world_state_schema.md`
4. `06_decision_state_machine.md`
5. `07_safety_compliance_authorization_api.md`
6. `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`

## 维护规则

1. 文档内容继续使用中文撰写。
2. 文件名使用英文小写、数字前缀和生命周期目录组织。
3. 目录级变更统一只在根目录 `CHANGELOG.md` 中记录。
4. 当目录内新增文档时，需同步回写本 `README.md` 的文档索引。
