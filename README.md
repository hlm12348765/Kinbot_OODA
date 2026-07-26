# 项目说明

---

文档版本：v1.55
创建日期：2026-03-08
作者：Codex-架构师

文档变更记录：
- v1.55 | 2026-07-26 | Codex-架构师 | 用户通过递归式 Agentic Robot System 的 L1 最终评审并冻结当前基线；`KBT-59` 完成评审，`KBT-58` 和 `KBT-60` 不再受其前置阻断，后续分别承接找物功能映射和 P2 `S1-S7` 重映射。
- v1.54 | 2026-07-26 | Codex-架构师 | 补齐当前 L1 的持续感知与共享状态更新关系：RobotSkillSystem 执行语义感知，O3 维护共享状态；16 号文档增加 L0 过程／操作数到 L1 的逐项映射，并把关系拓扑扩展为七类闭环。
- v1.53 | 2026-07-25 | Codex-架构师 | 当前 L1 架构进入最终评审：固定 TaskWorker 向 A0 逐级升级的正常路径，展开四个基础业务 Agent 的受控直接协调，补入 AP3 冷启动原则和四个收口反例；具体状态机、协议、阈值与算法转入 L2。
- v1.52 | 2026-07-25 | Codex-架构师 | 确认“基础业务 Agent + TaskWorker + RobotSkill”为当前 L1 架构路线；主文档不再使用“方案三”名称，两套未采用方案迁入历史记录，精确拓扑仍待验证冻结。
- v1.51 | 2026-07-25 | Codex-架构师 | 补齐 `KBT-59` 方案三的候选—许可—实际操作—结果反馈闭环：限制 G3 替换权，以完成判据和下一步前提判断主动推送，并将架构关系归纳为六类闭环；方案仍保持 provisional。
- v1.50 | 2026-07-25 | Codex-架构师 | 重构 `KBT-59` 方案三：四个基础业务对应长期 AgentCell，具体任务由临时 TaskWorker 承担，基础能力通过 RobotSkill 复用；补齐共享上下文、主动授权、运行机制和单点失效验证，继续保持 provisional。
- v1.49 | 2026-07-23 | Codex-架构师 | 将 `KBT-59` 从 L1 三案并列推进到方案三优先候选：以任务契约唯一 Owner 划分 Agent Cell，方案一、方案二保留为对照；方案三仍待场景、故障、时延、资源和组织验证后冻结。
- v1.48 | 2026-07-22 | Codex-架构师 | 拉齐广义 Agent 与独立 Agent Cell 的定义边界，并将 `KBT-59` 的 L1 精确拓扑评审扩展为三案：显式领域子 Agent、集中式主业务 Agent、混合分层自治。
- v1.47 | 2026-07-21 | Codex-架构师 | 将 L1 精确拓扑评审改为两案并列：方案一采用 A0 与常驻专业 Agent，方案二采用单一常驻 A0、非 Agent 能力系统和按需临时子 Agent；两案继续由 `KBT-59` 承接，等待用户选择。
- v1.46 | 2026-07-20 | Codex-架构师 | 优化 L1 Agent 候选设计：由八个并列软件 Agent 收敛为 A0 主 Agent、A1-A3 专业 Agent、A4 独立安全与授权 Agent，以及 AP1/F1 两个非 Agent 平台；明确主业务规划归属和技能下沉原则。
- v1.45 | 2026-07-17 | Codex-架构师 | 根据递归 Agentic 架构读者测试与架构审查，校正迁移状态：递归方向已经确认，`F1 + A1-A8`、四个收敛机制、确定性叶子分类和三层在线护栏仍是首要评审入口中的候选基线，尚未冻结。
- v1.44 | 2026-07-17 | Codex-架构师 | 新增 `docs/02_p1_architecture/16_recursive_agentic_robot_system_architecture.md` 并切换为当前 L1 系统级概念架构首要入口，完成从“九模块 + Agent 增强平面”到“超级 Agent + 八个递归运行时 Agent + 确定性具身平台”的主线迁移。
- v1.43 | 2026-07-13 | Codex-架构师 | 强化找物架构入口，明确找物是交互事件环与运动执行环围绕单一任务状态持续耦合的过程，并补充交互 / 编排 / 运动团队边界。
- v1.42 | 2026-07-13 | Codex-架构师 | 新增 `docs/02_p1_architecture/15_agentic_object_finding_system_architecture.md` 作为找物功能级 Agentic System Architecture 评审入口，承接渐进自治、对象 belief、任务编排、接口和 Phase 5 验证边界。
- v1.41 | 2026-06-27 | Codex-架构师 | 新增 `docs/03_p2_feasibility/10_v1_onboard_medicine_box_decision_draft.md` 作为 `V1` 机载药箱决策稿入口，收敛无手臂最小闭环、开合方式、取放检测、视觉 / 传感器分工、防夹异常策略与 Phase 5 回写边界。
- v1.40 | 2026-05-23 | Codex-架构师 | 新增 `docs/08_reviews/27_kinbot_cost_anchor_and_bom_scenarios_for_emt.md` 作为 EMT 成本锚定、技术降本路径与双 BOM 情景汇报入口。
- v1.39 | 2026-04-21 | Codex-架构师 | 吸收董事长汇报反馈入口：新增 `KBT-57` 作为后台服务 / 人工坐席联动立项与成本定价商业口径拆解承接项，并明确其不覆盖当前已冻结主线基线。
- v1.38 | 2026-04-09 | Codex-架构师 | 修正根入口的表面复杂度与真实复杂度错位：将 `07_safety_compliance_authorization_api.md` 拉回当前有效入口与建议阅读顺序，明确其与 `01 / 03 / 05` 一起构成开发前置事实源。
- v1.37 | 2026-04-09 | Codex-架构师 | 继续压缩主线复杂度：明确 `01 / 03 / 06` 的单一职责，补记 `P2-01` 为唯一开发入口，并同步刷新根入口阅读顺序与目录说明。
- v1.36 | 2026-04-08 | Codex-架构师 | 收缩根入口为“当前视图 + 当前有效入口 + 阶段门入口 + 历史资料指针”，同步吸收 `08_reviews` 归档收敛、`superpowers` active-only 和 `03` 运行时基线重命名后的主线索引。
- v1.35 | 2026-04-08 | Codex-架构师 | 澄清 `Phase 5` 当前只完成架构侧验证规划与治理预留，不把未发生的实机 / 市场闭环写成已完成，并补记后续收口追踪 issue `KBT-55`。
- v1.34 | 2026-04-08 | Codex-架构师 | 推进 `Phase 5` 到双泳道执行与门控层：补入战略证据包结构、责任分工与 `G5` 对第 `8` 类证据包的门控规则。
- v1.33 | 2026-04-08 | Codex-架构师 | 吸收输入中对 `KBT-54` 的正式接受，确认 `Phase 4.5` 已完成收口并将当前主线推进到 `Phase 5`。
- v1.32 | 2026-04-07 | Claude-架构师 | `Phase 4.5` 增量补强：14 号 §10.1 追加 `FleetView` 候选字段子表、22 号追加 §5.2 家庭节律观测视图、23 号追加 §9 机群能力接入点清单；统一在 `KBT-54` 收口路径下承接，不修改任何已冻结基线。

---

面向家庭室内场景的智能移动交互机器人系统设计项目。递归式 Agentic Robot System 的 L1 架构已于 2026-07-26 通过评审并冻结：Kinbot 是跨信息空间与物理空间的超级 Agent；所有 Agent 复用同一 Physical Agent 七元组。当前 L1 以四个长期基础业务 Agent、临时 TaskWorker 和可复用 RobotSkill 组织责任，O3、AP3、G3 和 F1 分别提供共享上下文、运行机制、语义治理和物理硬安全。RobotSkillSystem 执行持续语义感知并向 O3 提交 `I2/Evidence`，O3 维护 `I3`；全部 L0 过程和操作数已逐项映射到 L1 实体、七类闭环和时间尺度。重大业务变化必须先由 TaskWorker 判断，只有影响根任务时才升级 A0；基础业务 Agent 可以受控直连，AP3 不解释业务优先级。未采用方案只保留在历史记录中。

## 当前状态

- 当前主优先级仍是 `P1 / PDCP`，仓库主体产出仍为需求、架构、总体方案与治理文档。
- 主线已完成 `Phase 1-4.5` 的架构整理，并正式进入 `Phase 5：验证口径与治理闭环`。
- `Phase 5` 当前只完成架构侧验证规划、双泳道门控和证据结构预留，尚未进入真实实机 / 市场闭环。
- 董事长反馈已作为 `KBT-57` 战略假设承接：后台服务 / 人工坐席可能与机器人本体联动立项，非隐私结构化数据可评估受控回流，`10000` 元 BOM、`29999` 元定价、首批 `10000` 台和租售并行需要业务拆解；当前不覆盖既有冻结基线。
- `P1` 当前事实源顺序为：原则层 -> 已冻结的递归式 Agentic L1 架构 -> 状态 / 安全接口 / 专题层 -> 待迁移的 `P2` 下发基线。
- `KBT-59` 已完成 L1 评审；`KBT-58` 和 `KBT-60` 不再受其前置阻断，分别承接找物功能向当前 L1 的映射，以及 P2 `S1-S7` 的责任、接口、验证和资源重映射。
- `docs/08_reviews/` 当前只保留少量活跃评审入口；历史评审稿与旧阶段整理稿已迁入 `archive/`。
- `docs/superpowers/` 当前采用 active-only 策略；已被主线吸收的工作文档已迁入 `docs/superpowers/archive/`。

## 当前有效入口

1. [input/00_requirements/00_user_requirements_input.md](input/00_requirements/00_user_requirements_input.md)：用户需求与审阅事实源。
2. [docs/00_governance/05_system_architecture_principles.md](docs/00_governance/05_system_architecture_principles.md)：原则层事实源。
3. [docs/02_p1_architecture/16_recursive_agentic_robot_system_architecture.md](docs/02_p1_architecture/16_recursive_agentic_robot_system_architecture.md)：已冻结的 L1 系统级概念架构；“基础业务 Agent + TaskWorker + RobotSkill”路线、L0—L1 映射、七类闭环、实体、责任、主要关系和不变量已经确认，状态机、协议、字段、阈值和算法转入 L2。未采用的候选方案及其否决依据见[历史记录](docs/02_p1_architecture/16_recursive_agentic_robot_system_architecture_history.md)。
4. [docs/02_p1_architecture/05_world_state_schema.md](docs/02_p1_architecture/05_world_state_schema.md)：七实体 `World State` 主文档。
5. [docs/02_p1_architecture/07_safety_compliance_authorization_api.md](docs/02_p1_architecture/07_safety_compliance_authorization_api.md)：安全、合规、授权边界主文档。
6. [docs/02_p1_architecture/06_decision_state_machine.md](docs/02_p1_architecture/06_decision_state_machine.md)：离散决策业务面的状态机主文档。
7. [docs/02_p1_architecture/01_overall_architecture.md](docs/02_p1_architecture/01_overall_architecture.md)：上一轮双视角总图、部署和硬约束参考；冲突时以 `16` 为准。
8. [docs/02_p1_architecture/03_execution_paradigms_runtime_baseline.md](docs/02_p1_architecture/03_execution_paradigms_runtime_baseline.md)：多时间尺度执行范式参考。
9. [docs/02_p1_architecture/15_agentic_object_finding_system_architecture.md](docs/02_p1_architecture/15_agentic_object_finding_system_architecture.md)：找物功能级评审稿，待按新架构重新映射。
10. [docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md](docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md)：当前开发入口，承接既有 `S1-S7` 工作包下发，待当前 L1 精确拓扑通过冻结评审后重新映射。
11. [docs/03_p2_feasibility/10_v1_onboard_medicine_box_decision_draft.md](docs/03_p2_feasibility/10_v1_onboard_medicine_box_decision_draft.md)：`V1` 机载药箱决策稿。
12. [docs/08_reviews/README.md](docs/08_reviews/README.md)：活跃评审入口。
13. [docs/05_p4_beta_dvt/01_mvp_validation_plan.md](docs/05_p4_beta_dvt/01_mvp_validation_plan.md)：`Phase 5` 工程 / 战略双泳道验证入口。
14. [docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md](docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md)：`G5` 门控与第 `8` 类战略证据包标准。
15. `KBT-57`：董事长反馈后的服务 / 坐席联动立项、非隐私数据回流、成本定价和首批商业模式拆解承接项。

## 当前阶段门入口

- `Phase 5` 的活跃战略输入，请先看：
  - [docs/08_reviews/25_phase3_to_phase45_closure_and_strategic_input_package.md](docs/08_reviews/25_phase3_to_phase45_closure_and_strategic_input_package.md)
  - [docs/08_reviews/24_kbt52_strategic_ambition_gap_review.md](docs/08_reviews/24_kbt52_strategic_ambition_gap_review.md)
  - [docs/08_reviews/26_kinbot_technical_positioning_competition_and_strategic_choices_for_emt.md](docs/08_reviews/26_kinbot_technical_positioning_competition_and_strategic_choices_for_emt.md)
  - [docs/08_reviews/27_kinbot_cost_anchor_and_bom_scenarios_for_emt.md](docs/08_reviews/27_kinbot_cost_anchor_and_bom_scenarios_for_emt.md)
- `Phase 5` 的执行与门控，请看：
  - [docs/05_p4_beta_dvt/01_mvp_validation_plan.md](docs/05_p4_beta_dvt/01_mvp_validation_plan.md)
  - [docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md](docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md)
- 当前真实实机 / 市场闭环尚未发生，后续真实验证与阶段确认由 `KBT-55` 承接。

## 建议阅读顺序

1. [input/00_requirements/00_user_requirements_input.md](input/00_requirements/00_user_requirements_input.md)
2. [docs/00_governance/05_system_architecture_principles.md](docs/00_governance/05_system_architecture_principles.md)
3. [docs/02_p1_architecture/16_recursive_agentic_robot_system_architecture.md](docs/02_p1_architecture/16_recursive_agentic_robot_system_architecture.md)
4. [docs/02_p1_architecture/05_world_state_schema.md](docs/02_p1_architecture/05_world_state_schema.md)
5. [docs/02_p1_architecture/07_safety_compliance_authorization_api.md](docs/02_p1_architecture/07_safety_compliance_authorization_api.md)
6. [docs/02_p1_architecture/06_decision_state_machine.md](docs/02_p1_architecture/06_decision_state_machine.md)
7. [docs/02_p1_architecture/01_overall_architecture.md](docs/02_p1_architecture/01_overall_architecture.md) -> [docs/02_p1_architecture/03_execution_paradigms_runtime_baseline.md](docs/02_p1_architecture/03_execution_paradigms_runtime_baseline.md)（迁移参考）
8. [docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md](docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md)（待迁移）
9. [docs/02_p1_architecture/15_agentic_object_finding_system_architecture.md](docs/02_p1_architecture/15_agentic_object_finding_system_architecture.md)（评审中）
10. [docs/03_p2_feasibility/10_v1_onboard_medicine_box_decision_draft.md](docs/03_p2_feasibility/10_v1_onboard_medicine_box_decision_draft.md)
11. [docs/08_reviews/README.md](docs/08_reviews/README.md)
12. [docs/05_p4_beta_dvt/01_mvp_validation_plan.md](docs/05_p4_beta_dvt/01_mvp_validation_plan.md)
13. [docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md](docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md)
14. [docs/00_governance/03_decision_log.md](docs/00_governance/03_decision_log.md)
15. [docs/00_governance/01_workflow.md](docs/00_governance/01_workflow.md)

## 历史资料与工作文档

- [docs/08_reviews/archive/README.md](docs/08_reviews/archive/README.md)：历史评审、旧阶段整理稿与革新决策链归档入口。
- [docs/02_p1_architecture/14_family_co_living_agent_paradigm.md](docs/02_p1_architecture/14_family_co_living_agent_paradigm.md)：`Phase 2` 的背景 / 决策来路锚点。
- [docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md](docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md)：`PDCP` 阶段评审包，不再作为并列总架构入口。
- [docs/superpowers/README.md](docs/superpowers/README.md)：当前仍活跃的 `superpowers` 工作文档入口。
- [docs/superpowers/archive/README.md](docs/superpowers/archive/README.md)：已吸收工作文档归档入口。
- [docs/09_research/README.md](docs/09_research/README.md)：仍未进入主线冻结面的研究与前瞻专题。

## 目录导览

- `input/`：用户输入与原始资料。
- `docs/00_governance/`：工作流、决策记录、原则与治理规则。
- `docs/02_p1_architecture/`：系统架构主线、运行时、状态与接口说明。
- `docs/03_p2_feasibility/`：总体方案、选型、功耗、成本与专项可行性。
- `docs/05_p4_beta_dvt/`：验证计划与试点框架。
- `docs/06_p5_launch_readiness/`：量产预备门控、发布准备与交付闭环。
- `docs/08_reviews/`：活跃评审入口与历史归档。
- `docs/09_research/`：前瞻研究、专项技术评估与论文向输入。
- `docs/10_team_planning/`：团队规划、招聘基线与面试体系。
- `docs/superpowers/`：工作文档入口；默认 active-only，历史工作稿进入 `archive/`。
