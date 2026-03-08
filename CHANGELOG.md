# 更新日志

本文档记录本项目的重要变更。

当前仓库仍处于架构设计阶段，因此本阶段的变更主要集中在需求、架构和评审文档的演进上。

格式参考 Keep a Changelog。

## [未发布]

### 新增

- 新增 [README.md](README.md)，补充项目定位、当前阶段、仓库结构和文档索引，方便快速理解仓库内容。
- 新增 [docs/ARCHITECTURE_RULES_REVIEW.md](docs/ARCHITECTURE_RULES_REVIEW.md)，用于检查当前 OODA 总体架构与 [docs/RULES.MD](docs/RULES.MD) 中架构原则的一致性。
- 新增 [docs/WORKFLOW.md](docs/WORKFLOW.md)，用于定义从总体架构推进到软硬件落地的工作流和阶段产物。
- 新增 [docs/DECISION_LOG.md](docs/DECISION_LOG.md)，用于记录已确认事实、架构决策、开放问题和后续澄清问题。
- 新增 [docs/MODULE_BOUNDARIES.md](docs/MODULE_BOUNDARIES.md)，用于定义系统模块分层、职责边界和端云分配。
- 新增 [docs/WORLD_STATE_SCHEMA.md](docs/WORLD_STATE_SCHEMA.md)，用于定义统一运行时世界状态及其核心实体结构。
- 新增 [docs/TERMINOLOGY.md](docs/TERMINOLOGY.md)，用于统一项目术语，避免概念漂移。

### 调整

- 更新 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)，降低对单一机器人中间件方案的过早绑定，将“机器人中间件”定义为能力类别，而不是预先锁定某个具体实现。
- 更新 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)，补充“稳定接口面建议”，明确后续系统演进时应优先保持稳定的关键边界。
- 更新 [README.md](README.md)，同步新增文档索引，并将当前认知中枢术语从宽泛的“World Model”收敛为更准确的“World State”。
- 更新架构细化文档，吸收 [docs/REQUIREMENTS.MD](docs/REQUIREMENTS.MD) 中 `Step 2` 至 `Step4` 的澄清结果，包括健康优先级、穿戴优先路线、紧急用药边界、多角色权限和硬件获取策略。

## [2026-03-07]

### 新增

- 新增 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)，首次给出面向家庭室内场景的移动交互机器人 OODA 总体架构，明确感知、认知、决策、执行分层，以及世界模型、安全门控和端云协同等核心设计方向。
