# 更新日志

---

文档版本：v1.18
创建日期：2026-03-08
作者：Codex-架构师

文档变更记录：
- v1.18 | 2026-03-23 | Codex-架构师 | 在 2026-03-23 章节追加 Step41 对应的 Agent 增强平面主线吸收、方案下发、术语扩充、决策记录补记与需求输入版本维护。
- v1.17 | 2026-03-23 | Codex-架构师 | 在 2026-03-23 章节追加《开发团队提案》的 AI-native Team 升级维护，并同步根索引和团队规划目录索引。
- v1.16 | 2026-03-23 | Codex-架构师 | 在 2026-03-23 章节追加一代硬件架构收敛决策的主线吸收，补记两芯片硬件基线、`1` 双目 + `2` 单目纯视觉组合、头部多自由度、单麦阵和稳健底盘基线进入总体架构、`PDCP` 与方案下发基线。
- v1.15 | 2026-03-23 | Codex-架构师 | 新增 2026-03-23 章节，记录机器人代际划分框架入仓、架构演进分析引用重构、术语表扩充、README 回归维护以及最新需求输入纳入版本维护。
- v1.14 | 2026-03-22 | Codex-架构师 | 在 2026-03-22 章节追加 Step40 对应的架构演进分析修订，强化“同代际优化”与“代际跃迁”的区分，并将“下一代机器人 = 下一代人机共存家庭生活”的代际定义纳入评审输入。
- v1.13 | 2026-03-22 | Codex-架构师 | 在 2026-03-22 章节追加术语表扩充维护，补记 `OODA`、`ConOps`、`OpsCon`、`家庭元场景`、`PDCP`、`L1/L2/L3`、`VLM/VLN`、`TTFT/TPS` 等仓库高频术语的统一定义。
- v1.12 | 2026-03-22 | Codex-架构师 | 在 2026-03-22 章节追加 Kinbot `ConOps / OpsCon` 基线更新，补记总体架构与 `PDCP` 架构评审包中的系统工程图示增强。
- v1.11 | 2026-03-22 | Codex-架构师 | 在 2026-03-22 章节追加 Step39 对应的 Kinbot 架构演进分析文档、评审目录索引更新和根索引补全记录。
- v1.10 | 2026-03-22 | Codex-架构师 | 在 2026-03-22 章节追加最新需求输入纳入版本维护，以及删除 `input/01_candidate_resume/huangjie_profile.md` 并清理仓库索引的记录。
- v1.9 | 2026-03-22 | Codex-架构师 | 在 2026-03-22 章节追加用户手动修正的 Demo 本体实体架构视图版本维护，补记长焦相机模块归属和三芯片连接关系调整。
- v1.8 | 2026-03-22 | Codex-架构师 | 在 2026-03-22 章节追加用户对 Demo 体系理念 / 技术理念区分的修正，以及本体实体架构图中算力与控制域拆分为三芯片子模块的图示调整。
- v1.7 | 2026-03-22 | Codex-架构师 | 在 2026-03-22 章节追加 Step38 相关的 Demo 架构澄清吸收与主线文档回写记录。
- v1.6 | 2026-03-22 | Codex-架构师 | 新增 2026-03-22 章节，记录验证 Demo 架构还原文档、`K3` 研究文档入仓及相关索引更新。
- v1.5 | 2026-03-21 | Codex-架构师 | 新增仓库级 `AGENTS.md`，用于固定代理协作规则、事实源优先级与版本维护纪律。
- v1.4 | 2026-03-20 | Codex-架构师 | 新增 2026-03-20 章节，记录硬件专家线程的最新内存价格反馈及其对主线架构的吸收。
- v1.3 | 2026-03-17 | Codex-架构师 | 按实际提交日期新增 2026-03-16 与 2026-03-17 章节，并清空“未发布”占位内容。
- v1.2 | 2026-03-17 | Codex-架构师 | 补充文档内简版变更记录，并同步记录 Step36 带来的主线架构收敛更新。
- v1.1 | 2026-03-08 | Codex-架构师 | 文档创建并开始按日期归档全仓关键变更。

---

本文档记录本项目的重要变更。

当前仓库仍处于架构设计阶段，因此本阶段的变更主要集中在需求、架构、技术研判和评审文档的演进上。

格式参考 Keep a Changelog，并按实际提交日期归档。

## [未发布]

暂无。

## [2026-03-23]

### 新增

- 新增 [docs/08_reviews/11_robot_generation_classification_framework.md](docs/08_reviews/11_robot_generation_classification_framework.md)，用于独立定义机器人代际发展的驱动因素、`OODA` 主环与 `Predict / Learn` 跨环能力关系，以及同代际优化、代际跃迁、信息服务与物理服务之间的边界。

### 变更

- 更新 [docs/08_reviews/10_kinbot_architecture_evolution_analysis.md](docs/08_reviews/10_kinbot_architecture_evolution_analysis.md)，将代际定义与判断口径统一引用《机器人代际划分框架》，并明确 `Kinbot` 一代已不再属于纯信息服务机器人，而是在向初级物理服务代迈进。
- 更新 [docs/00_governance/04_glossary.md](docs/00_governance/04_glossary.md)，补充 `Predict`、`Learn`、`同代际优化`、`代际跃迁`、`信息服务` 与 `物理服务` 等术语定义。
- 更新 [docs/08_reviews/README.md](docs/08_reviews/README.md) 与 [README.md](README.md)，补充《机器人代际划分框架》索引，并同步修正仓库总览中 `OODA` 主环 / 跨环能力口径与团队规模目标。
- 将 [input/00_requirements/00_user_requirements_input.md](input/00_requirements/00_user_requirements_input.md) 的最新用户修改纳入本轮版本维护。
- 更新 [docs/08_reviews/10_kinbot_architecture_evolution_analysis.md](docs/08_reviews/10_kinbot_architecture_evolution_analysis.md)，补充从验证 Demo 到一代 `PDCP` 的五个关键架构收敛决策，明确功能分层保留、硬件表层收敛、传感器删减、头部主动观察强化和声学 / 底盘基线收敛。
- 更新 [docs/02_p1_architecture/01_overall_architecture.md](docs/02_p1_architecture/01_overall_architecture.md) 与 [docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md](docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md)，将一代硬件关键基线收敛为“主控 `SoC` + 实时控制 `MCU`”、`1` 组双目 + `2` 个单目、单麦阵头部优先、头部多自由度和稳健底盘基线，并新增基于系统架构原则的正反面影响分析。
- 更新 [docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md](docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md)，将上述硬件收敛决策继续下发到 `S1-S7`。
- 更新 [docs/00_governance/03_decision_log.md](docs/00_governance/03_decision_log.md)，补记一代两芯片硬件基线、视觉主线进一步收窄、头部主动观察、单麦阵和底盘设计基线等正式决策。
- 更新 [docs/10_team_planning/01_development_team_proposal.md](docs/10_team_planning/01_development_team_proposal.md)，将团队提案升级为 `AI-native Team` 提案，明确“持续产出产品定义、技术突破和商业闭环”是当前组织建设的生死线，并将团队编制口径收敛到 `60-80` 人的人类团队加 AI 协作层模式。
- 更新 [docs/10_team_planning/README.md](docs/10_team_planning/README.md) 与 [README.md](README.md)，同步团队规划目录与根索引中的文档主题描述。
- 更新 [docs/02_p1_architecture/01_overall_architecture.md](docs/02_p1_architecture/01_overall_architecture.md) 与 [docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md](docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md)，将 Step41 正式收敛为“一代 Agent 增强平面”，明确长期记忆、技能化能力组织、连接器抽象与受控任务编排进入一代主线，但不新增一级模块，也不把“自主创造新技能”写成一代正式承诺。
- 更新 [docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md](docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md)，将一代 Agent 增强平面继续下发到 `S1-S7`，要求 `S3 / S4 / S5 / S6 / S7` 显式回答长期记忆、技能化、连接器与受控任务编排的落地边界。
- 更新 [docs/08_reviews/10_kinbot_architecture_evolution_analysis.md](docs/08_reviews/10_kinbot_architecture_evolution_analysis.md)，将 Agent 增强平面纳入一代期内的同代际优化路径，并明确“自主创造新技能”更适合保留在研究线与后续代际跃迁方向中。
- 更新 [docs/00_governance/03_decision_log.md](docs/00_governance/03_decision_log.md) 与 [docs/00_governance/04_glossary.md](docs/00_governance/04_glossary.md)，补记 Agent 增强平面相关正式事实、架构判断和统一术语。
- 将 [input/00_requirements/00_user_requirements_input.md](input/00_requirements/00_user_requirements_input.md) 的 Step41 最新用户修改纳入本轮版本维护。

## [2026-03-22]

### 新增

- 新增 [docs/01_p0_concept/04_demo_validation_system_architecture_reconstruction_and_product_inheritance_assessment.md](docs/01_p0_concept/04_demo_validation_system_architecture_reconstruction_and_product_inheritance_assessment.md)，用于从验证平台参数表还原 Demo 系统架构，并评估其对 Kinbot 产品架构的继承与淘汰关系。
- 新增 [input/00_requirements/03_kinbot_parameters_id_e.csv](input/00_requirements/03_kinbot_parameters_id_e.csv)，用于记录验证 Demo 的整机、传感器、交互、底盘与电气参数配置。

### 变更

- 更新 [docs/01_p0_concept/README.md](docs/01_p0_concept/README.md) 与 [README.md](README.md)，补充验证 Demo 架构还原文档索引，并同步最近新增的 `K3` 研究文档索引与推荐阅读顺序。
- 更新 [input/00_requirements/README.md](input/00_requirements/README.md)，补充验证 Demo 参数输入文件索引。
- 更新 [docs/01_p0_concept/04_demo_validation_system_architecture_reconstruction_and_product_inheritance_assessment.md](docs/01_p0_concept/04_demo_validation_system_architecture_reconstruction_and_product_inheritance_assessment.md)，吸收 `Step38` 对三芯片职责、8 个独立视觉模组、双麦阵成因、真实电池与散热配置及整机重量修正的澄清。
- 更新 [docs/01_p0_concept/04_demo_validation_system_architecture_reconstruction_and_product_inheritance_assessment.md](docs/01_p0_concept/04_demo_validation_system_architecture_reconstruction_and_product_inheritance_assessment.md)，按用户审阅意见修正验证 Demo 的“体系理念激进、技术方案不算激进”评价口径，并重画本体实体架构图，将算力与控制域拆分为 `RK3576 / S100Pro / AT32F457VET7` 三个子模块及其归属连接。
- 更新 [docs/01_p0_concept/04_demo_validation_system_architecture_reconstruction_and_product_inheritance_assessment.md](docs/01_p0_concept/04_demo_validation_system_architecture_reconstruction_and_product_inheritance_assessment.md)，吸收用户手动调整的本体实体架构视图，修正长焦相机在实体域中的归属，并细化头部、躯干、底盘、电源热域与三芯片子模块之间的连接关系。
- 更新 [docs/02_p1_architecture/01_overall_architecture.md](docs/02_p1_architecture/01_overall_architecture.md)、[docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md](docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md) 与 [docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md](docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md)，将验证 Demo 的高位主观测经验、三芯片职责分层、头部声学反向约束与验证平台器件淘汰边界回写到主线架构和 `S1-S7` 下发基线。
- 更新 [docs/00_governance/03_decision_log.md](docs/00_governance/03_decision_log.md)，补记验证 Demo 的正式事实和主线吸收结论。
- 将 [input/00_requirements/00_user_requirements_input.md](input/00_requirements/00_user_requirements_input.md) 的最新用户修改纳入本轮版本维护。
- 删除 [input/01_candidate_resume/huangjie_profile.md](input/01_candidate_resume/huangjie_profile.md)，并同步更新 [input/01_candidate_resume/README.md](input/01_candidate_resume/README.md) 与 [README.md](README.md) 中的目录索引。
- 新增 [docs/08_reviews/10_kinbot_architecture_evolution_analysis.md](docs/08_reviews/10_kinbot_architecture_evolution_analysis.md)，按 `Step39` 从验证 Demo、当前 `PDCP` 主线、一代期内演进到二代与终局方向，对 Kinbot 架构做四阶段演进分析，并补入与 2026 年具身智能前沿进展的关联判断。
- 更新 [docs/08_reviews/README.md](docs/08_reviews/README.md) 与 [README.md](README.md)，同步新增评审文档索引，并补全根索引中原本缺失的 `08_reviews` 目录条目。
- 更新 [docs/02_p1_architecture/01_overall_architecture.md](docs/02_p1_architecture/01_overall_architecture.md) 与 [docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md](docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md)，补入面向家庭元场景的 `ConOps / OpsCon` 基线，新增任务线程图、运行节点图和运行模式图，以系统工程视角补强 `PDCP` 阶段的架构表达。
- 更新 [docs/00_governance/04_glossary.md](docs/00_governance/04_glossary.md)，补充 `OODA`、`R1-R4`、`OODA Scale Scheduler`、`ConOps`、`OpsCon`、`家庭元场景`、`PDCP`、`Body Capability Contract`、`L1 / L2 / L3`、真值参考链、`VLM / VLN`、`TTFT / TPS`、`MVP / EVT / NPI` 等仓库高频术语定义。
- 更新 [docs/08_reviews/10_kinbot_architecture_evolution_analysis.md](docs/08_reviews/10_kinbot_architecture_evolution_analysis.md)，吸收 Step40，显式区分一代期内的“同代际优化”和二代方向上的“代际跃迁”，并将“定义下一代机器人就是定义下一代人机共存家庭生活”的代际口径纳入架构演进分析。

## [2026-03-21]

### 新增

- 新增 [AGENTS.md](AGENTS.md)，用于固定仓库级代理协作规则、事实源优先级、编辑边界、架构推进纪律、Linear 协作规则与 Git 维护要求。
- 新增 [docs/09_research/04_spacemit_k3_chip_assessment_for_embodied_ai.md](docs/09_research/04_spacemit_k3_chip_assessment_for_embodied_ai.md)，用于整合进迭时空 `K3` 芯片的已确认事实、模型支持口径、具身智能机器人适配性与端侧大模型推理优劣势判断。

### 变更

- 更新 [docs/09_research/README.md](docs/09_research/README.md) 与 [README.md](README.md)，补充 `K3` 研究文档索引与推荐阅读路径。

## [2026-03-20]

### 变更

- 更新 [docs/03_p2_feasibility/04_hardware_software_selection_matrix.md](docs/03_p2_feasibility/04_hardware_software_selection_matrix.md) 与 [docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md](docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md)，吸收硬件专家线程基于最新内存与存储价格的评估反馈，补入 `C1` 子桶拆分以及 `8GB / 12GB / 16GB+` 内存路线判断。
- 更新 [docs/02_p1_architecture/01_overall_architecture.md](docs/02_p1_architecture/01_overall_architecture.md) 与 [docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md](docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md)，将一代默认量产内存线、边界验证线与未来 `Pro SKU` 分层正式纳入架构基线。
- 更新 [docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md](docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md)，把默认量产内存线与前瞻验证线继续下发到 `S1-S7`。
- 更新 [docs/00_governance/03_decision_log.md](docs/00_governance/03_decision_log.md)，补记内存价格工作口径、`C1` 主矛盾变化以及默认量产内存线冻结结论。
- 删除 [docs/10_team_planning/02_candidate_role_assessment.md](docs/10_team_planning/02_candidate_role_assessment.md)，保留团队规划目录只承载主基线提案，不再在当前主线维护候选人角色评估文档。

## [2026-03-17]

### 变更

- 在 [docs/02_p1_architecture/01_overall_architecture.md](docs/02_p1_architecture/01_overall_architecture.md) 中补入“三线吸收法”、算力调度器一级化、世界状态按时间尺度分层演进、分层免疫式安全和关系质量评价框架。
- 在 [docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md](docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md) 中补入需求侧硬约束总表，并将上述吸收项升级为 `PDCP` 后续总体方案阶段的显式输入。
- 在 [docs/00_governance/03_decision_log.md](docs/00_governance/03_decision_log.md) 中同步记录这轮对 Claude 提案和 `PDCP` 需求侧约束提案的正式吸收结论。
- 在 [docs/02_p1_architecture/01_overall_architecture.md](docs/02_p1_architecture/01_overall_architecture.md) 与 [docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md](docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md) 中补入一代纯视觉传感器架构提案，正式冻结“双目 + 单目 `3 到 5` 个相机 + 自研深度估计 + 多目几何融合”为量产主线，并将深度相机 / 激光雷达改写为研发对比基线与真值参考链路。
- 在 [docs/00_governance/03_decision_log.md](docs/00_governance/03_decision_log.md) 中补记纯视觉主线进入架构基线，以及其对 `C1 / C5`、自动标定、低照鲁棒性和夜间闭环验证的压力转移。
- 在 [docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md](docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md) 中把需求侧硬约束、纯视觉主线、关系质量评价和分层免疫式安全真正下发到 `S1-S7`，并补齐各工作包的新增交付任务。
- 将 [docs/08_reviews/09_pdcp_requirement_constraints_and_blockers_proposal.md](docs/08_reviews/09_pdcp_requirement_constraints_and_blockers_proposal.md) 的当前修订版本纳入分支维护。
- 根据 `Step36` 更新 [docs/02_p1_architecture/01_overall_architecture.md](docs/02_p1_architecture/01_overall_architecture.md)、[docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md](docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md) 和 [docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md](docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md)，将一代收敛策略调整为“核心闭环强、服务闭环轻、技术突破集中”，并正式引入三级能力模式。
- 更新 [docs/03_p2_feasibility/04_hardware_software_selection_matrix.md](docs/03_p2_feasibility/04_hardware_software_selection_matrix.md) 与 [docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md](docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md)，将整机 `BOM` 目标下修为 `5000 到 6000 元`，并明确纯视觉不过线时优先调整产品节奏而非回退主动传感主线。
- 更新 [docs/02_p1_architecture/11_app_cloud_ops_minimal_loop.md](docs/02_p1_architecture/11_app_cloud_ops_minimal_loop.md) 与 [docs/02_p1_architecture/12_human_service_and_telemedicine_boundaries.md](docs/02_p1_architecture/12_human_service_and_telemedicine_boundaries.md)，将伴生系统和人工服务收敛为“最小可交付 + 可收缩覆盖”的服务架构。
- 为本轮涉及的主线文档补充头部简版变更记录，统一版本号、更新日期、更新人与主要更新内容。
- 在 [docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md](docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md) 中补充澄清：当前 `PDCP` 已形成方案基线需作为整机 `BOM` 基线输入，并新增 `PDCP` 通过后的 `BOM` 回传与一致性复核要求。
- 删除 [docs/10_team_planning/02_candidate_role_assessment.md](docs/10_team_planning/02_candidate_role_assessment.md)，保留团队规划目录只承载主基线提案，不再在当前主线维护候选人角色评估文档。

## [2026-03-16]

### 新增

- 新增 [docs/08_reviews/09_pdcp_requirement_constraints_and_blockers_proposal.md](docs/08_reviews/09_pdcp_requirement_constraints_and_blockers_proposal.md)，用于汇总 PDCP 评审准备中的需求侧约束、阻断问题与老板沟通提案。

### 变更

- 在 [docs/08_reviews/README.md](docs/08_reviews/README.md) 中补充上述评审提案文档索引。

## [2026-03-15]

### 新增

- 新增 [docs/01_p0_concept/03_kinbot_product_system_technology_business_evaluation.md](docs/01_p0_concept/03_kinbot_product_system_technology_business_evaluation.md)，用于以四轴框架评估当前 Kinbot 的产品、体系、技术与商业理念组合，并给出商业成功概率推断和后续产品规划建议。
- 新增 [docs/03_p2_feasibility/08_Kinbot_nighttime_closed_loop_plan.md](docs/03_p2_feasibility/08_Kinbot_nighttime_closed_loop_plan.md)，用于专项定义 Kinbot 在纯视觉路线下如何闭环解决家庭夜间不开灯场景中的定位、任务执行、隐私保护与服务诊断问题。

### 变更

- 在 [docs/01_p0_concept/README.md](docs/01_p0_concept/README.md) 中补充四轴评估提案文档索引。
- 在 [README.md](README.md) 中补充四轴评估提案文档索引，并将其加入推荐阅读顺序。
- 在 [docs/03_p2_feasibility/README.md](docs/03_p2_feasibility/README.md) 和 [README.md](README.md) 中补充夜间闭环专项方案的文档索引。

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
