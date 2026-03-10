# 更新日志

本文档记录本项目的重要变更。

当前仓库仍处于架构设计阶段，因此本阶段的变更主要集中在需求、架构和评审文档的演进上。

格式参考 Keep a Changelog。

## [未发布]

### 新增

- 新增 [README.md](README.md)，补充项目定位、当前阶段、仓库结构和文档索引，方便快速理解仓库内容。
- 新增 [docs/VLN_ROLE_AND_PLAN.md](docs/VLN_ROLE_AND_PLAN.md)，用于分析 VLN 在 Kinbot OODA 架构中的角色、梳理 2025 到 2026 年最新 VLN/VLA 技术趋势，并给出面向量产预备的技术规划建议。
- 新增 [docs/ARCHITECTURE_RULES_REVIEW.md](docs/ARCHITECTURE_RULES_REVIEW.md)，用于检查当前 OODA 总体架构与 [docs/RULES.MD](docs/RULES.MD) 中架构原则的一致性。
- 新增 [docs/WORKFLOW.md](docs/WORKFLOW.md)，用于定义从总体架构推进到软硬件落地的工作流和阶段产物。
- 新增 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，用于记录已确认事实、架构决策、开放问题和后续澄清问题。
- 新增 [docs/MODULE_BOUNDARIES.md](docs/MODULE_BOUNDARIES.md)，用于定义系统模块分层、职责边界和端云分配。
- 新增 [docs/WORLD_STATE_SCHEMA.md](docs/WORLD_STATE_SCHEMA.md)，用于定义统一运行时世界状态及其核心实体结构。
- 新增 [docs/DECISION_STATE_MACHINE.md](docs/DECISION_STATE_MACHINE.md)，用于定义系统顶层运行状态、业务主状态、约束子状态和关键跳转规则。
- 新增 [docs/SAFETY_COMPLIANCE_AUTHORIZATION_API.md](docs/SAFETY_COMPLIANCE_AUTHORIZATION_API.md)，用于定义高风险动作审批、确认、降级、人工转接和审计的统一接口契约。
- 新增 [docs/COMPANION_INTERACTION_STRATEGY.md](docs/COMPANION_INTERACTION_STRATEGY.md)，用于定义一代陪伴交互的人设边界、主动发起规则、长期记忆和多角色共享策略。
- 新增 [docs/SAFETY_RISK_MATRIX.md](docs/SAFETY_RISK_MATRIX.md)，用于定义一代安全风险域、空间规则和降级策略矩阵。
- 新增 [docs/APP_CLOUD_OPS_MINIMAL_LOOP.md](docs/APP_CLOUD_OPS_MINIMAL_LOOP.md)，用于定义一代家属 App、云服务与后台运营坐席的最小闭环、接口分工和失败回退策略。
- 新增 [docs/HEALTH_EVENT_PIPELINE.md](docs/HEALTH_EVENT_PIPELINE.md)，用于定义一代健康事件的信号来源、补采逻辑、风险分级、升级链路和降级约束。
- 新增 [docs/LIFECYCLE_WORKFLOW.md](docs/LIFECYCLE_WORKFLOW.md)，用于定义从需求形成到上市运营与下一代回灌的全生命周期工作流、阶段门和 Linear 映射。
- 新增 [docs/OODA_MULTI_SCALE_ARCHITECTURE.md](docs/OODA_MULTI_SCALE_ARCHITECTURE.md)，用于提出面向 AGI 与具身智能时代的多尺度动态 OODA 设想。
- 新增 [docs/DEMO_TO_MASS_PRODUCTION_GAPS.md](docs/DEMO_TO_MASS_PRODUCTION_GAPS.md)，用于定义当前样机 Demo 到量产预备状态的能力缺口、阻断项和默认优先级。
- 新增 [docs/ENGINEERING_NPI_BASELINE.md](docs/ENGINEERING_NPI_BASELINE.md)，用于定义 `P2` 阶段的工程化与 `NPI` 准备基线、`G2` 技术路线门和 Alpha / EVT 前置冻结项。
- 新增 [docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md](docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md)，用于定义一代软硬件选型矩阵、主线 / 备线 / 观察线和 `G2` 前置验证项。
- 新增 [docs/TERMINOLOGY.md](docs/TERMINOLOGY.md)，用于统一项目术语，避免概念漂移。

### 调整

- 更新 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)，降低对单一机器人中间件方案的过早绑定，将“机器人中间件”定义为能力类别，而不是预先锁定某个具体实现。
- 更新 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)，补充“稳定接口面建议”，明确后续系统演进时应优先保持稳定的关键边界。
- 更新 [README.md](README.md)，同步新增文档索引，并将当前认知中枢术语从宽泛的“World Model”收敛为更准确的“World State”。
- 更新 [README.md](README.md)，补充 VLN 专项分析文档索引和推荐阅读顺序。
- 更新架构细化文档，吸收 [docs/REQUIREMENTS.MD](docs/REQUIREMENTS.MD) 中 `Step 2` 至 `Step4` 的澄清结果，包括健康优先级、穿戴优先路线、紧急用药边界、多角色权限和硬件获取策略。
- 更新架构细化文档，继续吸收 `Step5` 的澄清结果，包括穿戴设备套餐策略、平台接入路线、储物仓与递送能力、120 接口挂载方式和 OCR 复核策略。
- 更新架构细化文档，吸收“对 Codex 的要求”和 `Step6` 的澄清结果，包括量产预备目标、团队规模、中文化协作要求、后台人工服务、UWB 候选路线、储物仓机构边界和人工复核执行方式。
- 更新架构细化文档，继续吸收 `Step7` 的澄清结果，包括项目起始时间、既有样机基础、穿戴实时数据限制、客服运营坐席作为人工服务首线、UWB 候选价值排序、第三方责任边界、储物仓能力分级和量产预备定义。
- 更新架构细化文档，吸收 `Step8` 的澄清结果，包括生命体征数据新鲜度、客服运营坐席的转接时效、样机 Demo 能力基线、第三方平台白名单准入、小批量试点规模和“穿戴受限时更多依赖问诊”的兜底策略。
- 更新架构细化文档，吸收 `Step9` 的澄清结果，包括陪伴默认人设、主动交互边界、长期记忆范围、安全优先级、第一版降级方向，以及样机保留与重构方向。
- 更新 [docs/WORKFLOW.md](docs/WORKFLOW.md)，补充本地工作流与 Linear 项目同步的协作规则。
- 更新 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，将 Linear 协作同步记录为正式决策，并关闭相应协作机制悬而未决项。
- 更新 [docs/ARCHITECTURE_RULES_REVIEW.md](docs/ARCHITECTURE_RULES_REVIEW.md)，将遗留的“世界模型”表述统一为“世界状态”口径。
- 更新 [README.md](README.md) 和 [docs/WORKFLOW.md](docs/WORKFLOW.md)，将项目节奏从单点 MVP 推进调整为“2026-12-31 量产预备 + 2027 年 1 月验证窗口”。
- 更新 [README.md](README.md)、[docs/WORLD_STATE_SCHEMA.md](docs/WORLD_STATE_SCHEMA.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，同步“项目从 2026-01-01 起算、前两个月用于需求和 Demo 验证”的时间线以及既有样机基础。
- 更新 [README.md](README.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，明确后续问题澄清按“健康管理、陪伴交互、安全保障”三条主线并行推进，并记录与 VLN 技术评估线程的协作要求以及每层实体数控制要求。
- 更新 [README.md](README.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，明确 `docs/REQUIREMENTS.MD` 由用户独占维护，Codex 只读取并推进其他文档。
- 更新 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，吸收 [docs/VLN_ROLE_AND_PLAN.md](docs/VLN_ROLE_AND_PLAN.md) 的关键结论，将 VLN 边界收敛为“语义导航策略层”，而不是底盘级安全控制层。
- 更新 [README.md](README.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，明确 VLN 技术规划由独立 issue 和独立线程维护，当前线程不更新 [docs/VLN_ROLE_AND_PLAN.md](docs/VLN_ROLE_AND_PLAN.md)。
- 更新架构细化文档，吸收 `Step10` 的澄清结果，包括长期记忆可治理、老人 / 子女配置权限、卫生间和入户门空间边界、陌生人闯入 / 夜间离床 / 门窗未关的自动动作边界，以及故障恢复和硬停底线。
- 更新 [README.md](README.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，将当前推进重点从“健康事件管线待产出”推进到“量化阈值、远控边界和 Demo 到量产能力缺口”。
- 更新 [README.md](README.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，把工作流扩展到全生命周期视角，并加入“架构师设想包”这一先设想再评审的推进机制。
- 更新 [docs/LIFECYCLE_WORKFLOW.md](docs/LIFECYCLE_WORKFLOW.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，吸收新的 IPD 要求，并将“产品定义与架构冻结”目标收敛到 `2026-03-31`。
- 更新 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) 和 [README.md](README.md)，把 OODA 从固定单环升级为“多尺度、可动态调度”的默认方法论。
- 更新 [docs/OODA_MULTI_SCALE_ARCHITECTURE.md](docs/OODA_MULTI_SCALE_ARCHITECTURE.md)、[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)、[docs/DECISION_STATE_MACHINE.md](docs/DECISION_STATE_MACHINE.md)、[docs/SAFETY_RISK_MATRIX.md](docs/SAFETY_RISK_MATRIX.md)、[docs/COMPANION_INTERACTION_STRATEGY.md](docs/COMPANION_INTERACTION_STRATEGY.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md)、[README.md](README.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，吸收 `KBT-28` 审阅结论，将 `R1` 到 `R4`、`R4` 正式入架构、`Orient` 升级以及 `OODA Scale Scheduler` 一级能力同步为正式基线。
- 更新 [README.md](README.md)、[docs/LIFECYCLE_WORKFLOW.md](docs/LIFECYCLE_WORKFLOW.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，并新增 [docs/DEMO_TO_MASS_PRODUCTION_GAPS.md](docs/DEMO_TO_MASS_PRODUCTION_GAPS.md)，将 `KBT-18` 收敛为 7 个能力缺口域、3 类阻断项和一份默认优先级排序。
- 更新 [docs/DEMO_TO_MASS_PRODUCTION_GAPS.md](docs/DEMO_TO_MASS_PRODUCTION_GAPS.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md)、[README.md](README.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/LIFECYCLE_WORKFLOW.md](docs/LIFECYCLE_WORKFLOW.md)，吸收 `Step13` 对 `KBT-18` 的审阅意见，补入 `D6` 作为阻断项的理由，并把“储物仓能力保留但机构重构”“整机外观形态重构”写入工程化主线。
- 更新 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)、[docs/ENGINEERING_NPI_BASELINE.md](docs/ENGINEERING_NPI_BASELINE.md)、[README.md](README.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/LIFECYCLE_WORKFLOW.md](docs/LIFECYCLE_WORKFLOW.md)，吸收 `Step14` 对 `KBT-18` 和 `KBT-24` 的审阅结果，正式冻结 `D6` 阻断项和 `KBT-24` 基线，并新增 [docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md](docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md) 启动 `KBT-11`。
- 更新 [docs/MODULE_BOUNDARIES.md](docs/MODULE_BOUNDARIES.md)、[docs/WORLD_STATE_SCHEMA.md](docs/WORLD_STATE_SCHEMA.md)、[docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md](docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md)、[docs/LIFECYCLE_WORKFLOW.md](docs/LIFECYCLE_WORKFLOW.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step15` 与 `Step16` 的审阅结果：将一级模块从 `10` 压缩到 `9`、把世界状态一级实体压回 `9`、把 `KBT-11` 改为中国芯主线，并加入“前置评审清账”机制。
- 更新 [docs/MODULE_BOUNDARIES.md](docs/MODULE_BOUNDARIES.md)、[docs/WORLD_STATE_SCHEMA.md](docs/WORLD_STATE_SCHEMA.md)、[docs/DEMO_TO_MASS_PRODUCTION_GAPS.md](docs/DEMO_TO_MASS_PRODUCTION_GAPS.md)、[docs/ENGINEERING_NPI_BASELINE.md](docs/ENGINEERING_NPI_BASELINE.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `KBT-6` 评审通过和“重视图示表达”的新要求，为已通过且存在明确结构分解的文档补充直观架构图，并把 `KBT-7` 提升为当前优先评审入口。
- 更新 [docs/DECISION_STATE_MACHINE.md](docs/DECISION_STATE_MACHINE.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step17` 对 `KBT-7` 的审阅意见，明确一代顶层采用“分层状态机管理模式 + 行为树管理叶子执行”的控制结构提案，并显式补入高风险异常与关键安全故障的一级枚举。
- 更新 [docs/DECISION_STATE_MACHINE.md](docs/DECISION_STATE_MACHINE.md)、[docs/SAFETY_COMPLIANCE_AUTHORIZATION_API.md](docs/SAFETY_COMPLIANCE_AUTHORIZATION_API.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step18` 对 `KBT-7` 的补充审阅意见，正式关闭 `KBT-7`，并把 `KBT-8` 当前评审焦点收敛到故障保护返回结果、`A1-A7 / F1-F7` 审批上下文映射和原因码骨架。
- 更新 [docs/SAFETY_COMPLIANCE_AUTHORIZATION_API.md](docs/SAFETY_COMPLIANCE_AUTHORIZATION_API.md)、[docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md](docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step19` 对 `KBT-8` 的审阅意见，正式关闭 `KBT-8`，并将当前主线切回 `KBT-11` 软硬件选型矩阵，同时为选型矩阵补充主线 / 备线 / 观察线图示。
- 更新 [docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md](docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step20` 对 `KBT-11` 的审阅意见，把端侧算力主线改成“中国大算力端侧芯片专项评估”，将 `RK` 相关路线下调为工程 / 成本 / 简化备线，并补入 `6000 到 8000 元` 整机 `BOM` 的 7 个成本桶约束。
- 新增 [docs/COST_STRUCTURE_AND_TECH_DOWNPATH.md](docs/COST_STRUCTURE_AND_TECH_DOWNPATH.md)，并更新 [docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md](docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md)、[docs/LIFECYCLE_WORKFLOW.md](docs/LIFECYCLE_WORKFLOW.md) 和 [README.md](README.md)，吸收 `Step21` 对 `KBT-11` 的第二轮审阅意见，把整机 BOM 进一步细化为滚动成本基线、降本主战场、控涨项和关键技术路径。
- 更新 [docs/COST_STRUCTURE_AND_TECH_DOWNPATH.md](docs/COST_STRUCTURE_AND_TECH_DOWNPATH.md)、[docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md](docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step22` 对 `KBT-29` 的审阅意见，把 `C5` 调整为“工作区间未冻结”状态，并显式加入 `C4` 低传感路线向 `C1 / C2 / C5` 的成本转移约束。
- 更新 [docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，并在 Linear 中新增 `KBT-30`，把整机功耗预算、能效控制和 `C5` 工作基线冻结从 `KBT-29` 中拆出为独立后续议题。
- 更新 [docs/COST_STRUCTURE_AND_TECH_DOWNPATH.md](docs/COST_STRUCTURE_AND_TECH_DOWNPATH.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md)、[README.md](README.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/LIFECYCLE_WORKFLOW.md](docs/LIFECYCLE_WORKFLOW.md)，吸收 `Step23` 对 `KBT-29` 的第二轮审阅意见，正式关闭 `KBT-29`，并把“聪明、温暖、精致且能支撑 `20000 到 30000 元` 售价区间”的高端产品感检查提升为跨阶段护栏。
- 新增 [docs/POWER_BUDGET_AND_EFFICIENCY_STRATEGY.md](docs/POWER_BUDGET_AND_EFFICIENCY_STRATEGY.md)，并更新 [docs/COST_STRUCTURE_AND_TECH_DOWNPATH.md](docs/COST_STRUCTURE_AND_TECH_DOWNPATH.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md)、[README.md](README.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/LIFECYCLE_WORKFLOW.md](docs/LIFECYCLE_WORKFLOW.md)，吸收 `Step24` 对 `KBT-30` 的审阅意见，把整机售价监控区间收敛为 `20000 到 30000 元`，把 `C5` 工作基线收敛为四类工况，并把历史滞留的评审 issue 纳入一次工作流清账。
- 更新 [docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，把“暂停时必须给出明确审阅需求”固化为正式协作规则，避免后续出现模糊的停顿提示。
- 更新 [docs/POWER_BUDGET_AND_EFFICIENCY_STRATEGY.md](docs/POWER_BUDGET_AND_EFFICIENCY_STRATEGY.md)、[docs/COST_STRUCTURE_AND_TECH_DOWNPATH.md](docs/COST_STRUCTURE_AND_TECH_DOWNPATH.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，吸收 `Step25` 对 `KBT-30` 的审阅意见，调整四类工况的代表性时间占比，并将高端产品感知检查表收敛为“聪明感 / 舒适感 / 精致感 / 轻盈感 / 可信感 / 支持感”。
- 新增 [docs/MASS_PRODUCTION_READINESS_CRITERIA.md](docs/MASS_PRODUCTION_READINESS_CRITERIA.md)，并更新 [README.md](README.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，启动 `KBT-16` 的第一版量产预备判定标准提案。
- 更新 [docs/WORKFLOW.md](docs/WORKFLOW.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，澄清“后置里程碑约束型文档提前起草”不等于真正越过前置里程碑，并把当前主优先级回调到 `KBT-13 / KBT-10 / KBT-15 / KBT-14` 这组尚未清账的前置项。
- 新增 [docs/HUMAN_SERVICE_AND_TELEMEDICINE_BOUNDARIES.md](docs/HUMAN_SERVICE_AND_TELEMEDICINE_BOUNDARIES.md)，并更新 [docs/WORKFLOW.md](docs/WORKFLOW.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，启动 `KBT-13` 的正式提案，把一代人工服务、在线问诊、第三方履约与公共应急之间的角色边界、接入链路、媒体策略和审计要求收敛为可评审基线。
- 更新 [README.md](README.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，吸收“`VLN` 线程已完成，可加入版本控制”的新口径，允许当前线程把 [docs/VLN_ROLE_AND_PLAN.md](docs/VLN_ROLE_AND_PLAN.md) 作为正式技术输入继续纳入版本历史。
- 更新 [docs/HUMAN_SERVICE_AND_TELEMEDICINE_BOUNDARIES.md](docs/HUMAN_SERVICE_AND_TELEMEDICINE_BOUNDARIES.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，吸收 `Step26` 对 `KBT-13` 的审阅意见，把客服运营坐席的服务经济性约束写成显式风险，并澄清“医疗专业主体接单结果”是结构化受理状态，而不是首轮专业回复。
- 新增 [docs/MEDICATION_STORAGE_AND_INDOOR_DELIVERY_REQUIREMENTS.md](docs/MEDICATION_STORAGE_AND_INDOOR_DELIVERY_REQUIREMENTS.md)，并更新 [README.md](README.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，启动 `KBT-10` 的正式提案，把储药与室内递送要求收敛为 `R1` 到 `R7` 七个能力包、一条端到端主链和一组工程护栏。
- 更新 [docs/MEDICATION_STORAGE_AND_INDOOR_DELIVERY_REQUIREMENTS.md](docs/MEDICATION_STORAGE_AND_INDOOR_DELIVERY_REQUIREMENTS.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step27` 对 `KBT-10` 的审阅意见，正式关闭 `KBT-10`，并把“仓门卡滞审计”改写为“仓门异常事件记录与回溯”。
- 新增 [docs/WEARABLE_COMPATIBILITY_AND_DATA_FIELDS.md](docs/WEARABLE_COMPATIBILITY_AND_DATA_FIELDS.md)，并更新 [docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，启动 `KBT-15` 的正式提案，把一期穿戴设备兼容范围、接入模式、新鲜度约束和首版数据字段收敛为可评审基线。
- 更新 [docs/WEARABLE_COMPATIBILITY_AND_DATA_FIELDS.md](docs/WEARABLE_COMPATIBILITY_AND_DATA_FIELDS.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step27` 对 `KBT-15` 的审阅意见，正式关闭 `KBT-15`，并把 `UWB` 继续固定在观察线地位。
- 新增 [docs/UWB_MATURITY_AND_INTEGRATION_VALUE.md](docs/UWB_MATURITY_AND_INTEGRATION_VALUE.md)，并更新 [docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，启动 `KBT-14` 的正式提案，把 `UWB` 的一代角色、成熟度判断、样品验证门和接入价值边界收敛为可评审基线。
- 更新 [docs/VLN_ROLE_AND_PLAN.md](docs/VLN_ROLE_AND_PLAN.md)，补充纯视觉路线在 OODA 下的技术判断、多相机共享视觉底座、`4` 相机和 `5` 相机推荐布局，以及其与 `semantic_navigation_policy / social_mobility_policy / classical local planner` 分层协同的关系。
- 更新 [docs/UWB_MATURITY_AND_INTEGRATION_VALUE.md](docs/UWB_MATURITY_AND_INTEGRATION_VALUE.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step28` 对 `KBT-14` 的审阅意见，正式关闭 `KBT-14`，并恢复 `KBT-16` 为当前主评审项。
- 更新 [docs/MASS_PRODUCTION_READINESS_CRITERIA.md](docs/MASS_PRODUCTION_READINESS_CRITERIA.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step30` 对 `KBT-16` 的审阅意见，正式关闭 `KBT-16`，并把 `功耗` 与 `BOM / 售价` 同级的理由写实为“直接影响续航、发热、噪声、充电与长期体验”。
- 新增 [docs/MVP_VALIDATION_PLAN.md](docs/MVP_VALIDATION_PLAN.md)，并更新 [docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，启动 `KBT-12` 的正式提案，把一代 `MVP` 范围划分、`100 台 / 100 户 / 1 个月` 试点框架与 `P / W / B` 放行规则收敛为可评审基线。
- 更新 [docs/MVP_VALIDATION_PLAN.md](docs/MVP_VALIDATION_PLAN.md)、[docs/HEALTH_EVENT_PIPELINE.md](docs/HEALTH_EVENT_PIPELINE.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step31` 对 `KBT-12` 的审阅意见，正式关闭 `KBT-12`，并把睡眠监测提升为 `必须有`、找物能力提升为 `应该有`。
- 新增 [docs/PRODUCTION_INTRO_LAUNCH_AND_DELIVERY_CLOSURE.md](docs/PRODUCTION_INTRO_LAUNCH_AND_DELIVERY_CLOSURE.md)，并更新 [docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，启动 `KBT-25` 的正式提案，把量产导入、发布准备与交付闭环收敛为 `7` 个闭环域、`3` 种状态定义和一组默认阻断项。
- 新增 [docs/PDCP_SYSTEM_ARCHITECTURE_REVIEW_PACKAGE.md](docs/PDCP_SYSTEM_ARCHITECTURE_REVIEW_PACKAGE.md) 和 [docs/OVERALL_SOLUTION_AND_MODULE_DESIGN_BASELINE.md](docs/OVERALL_SOLUTION_AND_MODULE_DESIGN_BASELINE.md)，把当前主线纠正回 `P1 / PDCP` 阶段，形成完整系统架构评审包与模块方案下发基线。
- 更新 [docs/WORKFLOW.md](docs/WORKFLOW.md)、[docs/LIFECYCLE_WORKFLOW.md](docs/LIFECYCLE_WORKFLOW.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收“当前仍处于系统架构设计与技术研判阶段”的新要求，并将 `KBT-25` 退回远期约束输入，不再作为当前主评审线。
- 更新 [docs/PDCP_SYSTEM_ARCHITECTURE_REVIEW_PACKAGE.md](docs/PDCP_SYSTEM_ARCHITECTURE_REVIEW_PACKAGE.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md)、[docs/LIFECYCLE_WORKFLOW.md](docs/LIFECYCLE_WORKFLOW.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 `Step32` 对 `KBT-31` 的审阅意见，把 `PDCP` 总体架构升级为“本体实体架构视图 + 运行时功能架构视图”的双视角基线，并补入 `Body Capability Contract` 作为一级接口面的一部分，同时将 `KBT-32` 明确顺延到 `KBT-31` 关闭之后。
- 新增 [docs/ARCHITECT_REVIEW_AND_PLAN.md](docs/ARCHITECT_REVIEW_AND_PLAN.md)，并更新 [docs/PDCP_SYSTEM_ARCHITECTURE_REVIEW_PACKAGE.md](docs/PDCP_SYSTEM_ARCHITECTURE_REVIEW_PACKAGE.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md)、[docs/DECISION_LOG.md](docs/DECISION_LOG.md) 和 [README.md](README.md)，吸收 Claude 协作线程的外部架构评审输入，把“双视角一致性检查机制”“一级接口稳定性策略”和 `D1 / D6 / D7` 三项阻断输入纳入 `KBT-31` 第二轮评审基线。
- 更新 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md)、[docs/OVERALL_SOLUTION_AND_MODULE_DESIGN_BASELINE.md](docs/OVERALL_SOLUTION_AND_MODULE_DESIGN_BASELINE.md) 和 [README.md](README.md)，吸收 `Step33` 对 `KBT-31` 的第三轮审阅意见，正式关闭 `KBT-31`，并把 `KBT-32` 恢复为当前主评审项，同时把双视角治理要求与 `D1 / D6 / D7` 三项阻断输入显式注入总体方案下发基线。

## [2026-03-07]

### 新增

- 新增 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)，首次给出面向家庭室内场景的移动交互机器人 OODA 总体架构，明确感知、认知、决策、执行分层，以及世界模型、安全门控和端云协同等核心设计方向。
