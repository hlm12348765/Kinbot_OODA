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
- 更新 [docs/WORKFLOW.md](docs/WORKFLOW.md)，补充本地工作流与 Linear 项目同步的协作规则。
- 更新 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，将 Linear 协作同步记录为正式决策，并关闭相应协作机制悬而未决项。
- 更新 [docs/ARCHITECTURE_RULES_REVIEW.md](docs/ARCHITECTURE_RULES_REVIEW.md)，将遗留的“世界模型”表述统一为“世界状态”口径。
- 更新 [README.md](README.md) 和 [docs/WORKFLOW.md](docs/WORKFLOW.md)，将项目节奏从单点 MVP 推进调整为“2026-12-31 量产预备 + 2027 年 1 月验证窗口”。
- 更新 [README.md](README.md)、[docs/WORLD_STATE_SCHEMA.md](docs/WORLD_STATE_SCHEMA.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，同步“项目从 2026-01-01 起算、前两个月用于需求和 Demo 验证”的时间线以及既有样机基础。
- 更新 [README.md](README.md)、[docs/WORKFLOW.md](docs/WORKFLOW.md) 和 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，明确后续问题澄清按“健康管理、陪伴交互、安全保障”三条主线并行推进，并记录与 VLN 技术评估线程的协作要求以及每层实体数控制要求。

## [2026-03-07]

### 新增

- 新增 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)，首次给出面向家庭室内场景的移动交互机器人 OODA 总体架构，明确感知、认知、决策、执行分层，以及世界模型、安全门控和端云协同等核心设计方向。

