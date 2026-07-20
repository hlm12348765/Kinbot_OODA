# P1 产品定义与架构冻结

---

文档版本：v1.14
创建日期：2026-03-11
作者：Codex-架构师

文档变更记录：
- v1.14 | 2026-07-17 | Codex-架构师 | 根据读者测试校正 `16` 的状态为 L1 首要评审入口：递归方向已确认，九实体拓扑及收敛 / 层级护栏仍为候选，并补充单文件暂留理由。
- v1.13 | 2026-07-17 | Codex-架构师 | 新增《Kinbot递归式 Agentic Robot System 架构》并切换为当前 L1 系统级概念架构首要入口；旧总体架构、运行时与九模块文档转为迁移参考。
- v1.12 | 2026-07-13 | Codex-架构师 | 强化《找物 Agentic System Architecture》入口说明，明确交互事件环与运动执行环持续耦合，以及交互 / 编排 / 运动团队分工和事件契约。
- v1.11 | 2026-07-13 | Codex-架构师 | 新增《找物 Agentic System Architecture》入口，承接需求到目标、渐进自治、对象 belief、任务编排、接口契约、失败治理与 Phase 5 指标候选。
- v1.10 | 2026-04-21 | Codex-架构师 | 同步 `KBT-57` 董事长反馈后的服务 / 坐席联动立项候选口径，更新 `11 / 12` 的索引说明。
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

1. 先读 `16` 理解已经确认的递归式 Agentic 方向，以及进入评审的 L1 总图、Agent Cell 元模型、实体关系和涌现；
2. 再读 `05 / 06 / 07` 理解状态对象、离散业务状态机和安全审批语义；
3. `01 / 03 / 04 / 14` 作为迁移来路与详细约束参考；仅对 `16` 已确认的递归原则，以 `16` 为准，精确拓扑冲突继续由 `KBT-59` 保持开放，禁止提前下发实现；
4. 如需进入开发承接，继续读取 `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`，但其工作包仍待按 `16` 迁移。

## 文档索引

- `01_overall_architecture.md`：上一轮总体架构与双视角参考。核心主题：产品系统边界、部署边界、一级接口与硬约束；旧软件组织方式已被递归方向覆盖，新的精确拓扑仍由 `KBT-59` 评审。
- `02_pdcp_system_architecture_review_package.md`：`PDCP` 系统架构评审包。核心主题：面向 `PDCP` 节点的系统架构评审包，只承接评审问题、冻结项和模块下发结论，不再重复解释总架构。
- `03_execution_paradigms_runtime_baseline.md`：多尺度执行范式参考。核心主题：说明 `4` 类执行范式、`R1-R4`、协调输入和范式边界；新主线中这些范式由各递归 Agent 按时间尺度组合使用。
- `04_module_layers_and_boundaries.md`：旧九模块责任与迁移参考。核心主题：旧一级模块职责、端云划分及其向 `A1-A8` 的映射来源。
- `05_world_state_schema.md`：世界状态结构。核心主题：七实体 `World State` 主文档，定义目标实体结构、`V1` 最小激活子集与 `CareEvent / Task` 边界。
- `06_decision_state_machine.md`：决策状态机。核心主题：唯一离散决策状态机文档，说明顶层状态、业务主状态、约束子状态、转移规则与中断源。
- `07_safety_compliance_authorization_api.md`：安全合规授权接口。核心主题：安全、合规、授权和审批接口说明。
- `08_companion_interaction_strategy.md`：陪伴交互策略。核心主题：陪伴交互策略、人设边界、长期记忆治理，以及与多执行范式的协同关系。
- `09_safety_risk_matrix.md`：安全风险矩阵。核心主题：安全风险域、空间规则、降级与停机矩阵，以及风险到多执行范式与安全硬边界的映射。
- `10_health_event_pipeline_and_escalation.md`：健康事件管线与升级链路。核心主题：健康事件、补采、分级、升级链路与跨执行范式业务管线边界。
- `11_app_cloud_ops_minimal_loop.md`：家属 App 与最小云一代最小闭环。核心主题：当前 `V1` 的 `App + 最小云` 最小闭环、远程确认、记忆治理与最小审计边界，以及 `KBT-57` 对后台服务 / 坐席候选位的约束。
- `12_human_service_and_telemedicine_boundaries.md`：后台人工服务、在线问诊与第三方履约边界。核心主题：`KBT-57` 中的后台服务 / 坐席联动立项候选、非隐私结构化数据回流边界，以及在线问诊与第三方履约如何受控接入当前主线。
- `13_medication_storage_and_indoor_delivery_requirements.md`：储药与室内递送要求。核心主题：储药与室内递送能力包、工程护栏与离散业务执行边界。
- `14_family_co_living_agent_paradigm.md`：家庭共居智能体架构范式。核心主题：作为 `Phase 2` 背景/决策来路锚点，记录新总图、三轴框架与历史 `provisional` 来路，不再作为并列主入口。
- `15_agentic_object_finding_system_architecture.md`：找物功能级 Agentic System Architecture。核心主题：方案无关地定义需求到目标推导、交互—运动双环耦合、团队责任边界、记忆先行的渐进自治、对象位置 belief、任务内 `Plan-Approve-Execute-Observe-Verify-Commit`、跨团队事件契约、失败治理与验证指标候选；当前由 `KBT-58` 承接评审。
- `16_recursive_agentic_robot_system_architecture.md`：当前 L1 递归式 Agentic Robot System 首要评审入口，由 `KBT-59` 承接。核心主题：左侧信息空间、中央超级 Agent、右侧物理空间；递归责任域原则已确认，`F1 + A1-A8`、收敛与层级护栏仍为候选。为保证“系统—实体—关系—涌现—阶段门”在本轮整体评审，暂保留为超过 600 行的单文件；评审后拆分接口和验证附录。

## 建议阅读顺序

1. `16_recursive_agentic_robot_system_architecture.md`
2. `05_world_state_schema.md`
3. `07_safety_compliance_authorization_api.md`
4. `06_decision_state_machine.md`
5. `01_overall_architecture.md`、`03_execution_paradigms_runtime_baseline.md`、`04_module_layers_and_boundaries.md`（需要迁移背景和详细约束时）
6. `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`（当前开发承接，待迁移）
7. `15_agentic_object_finding_system_architecture.md`（进入找物功能级评审时）

## 维护规则

1. 文档内容继续使用中文撰写。
2. 文件名使用英文小写、数字前缀和生命周期目录组织。
3. 目录级变更统一只在根目录 `CHANGELOG.md` 中记录。
4. 当目录内新增文档时，需同步回写本 `README.md` 的文档索引。
