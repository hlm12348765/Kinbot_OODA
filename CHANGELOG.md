# 更新日志

本文档记录本项目的重要变更。

当前仓库仍处于架构设计阶段，因此本阶段的变更主要集中在需求、架构和评审文档的演进上。

格式参考 Keep a Changelog。

## [未发布]

### 新增

- 新增 [README.md](README.md)，补充项目定位、当前阶段、仓库结构和文档索引，方便快速理解仓库内容。
- 新增 [docs/ARCHITECTURE_RULES_REVIEW.md](docs/ARCHITECTURE_RULES_REVIEW.md)，用于检查当前 OODA 总体架构与 [docs/RULES.MD](docs/RULES.MD) 中架构原则的一致性。

### 调整

- 更新 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)，降低对单一机器人中间件方案的过早绑定，将“机器人中间件”定义为能力类别，而不是预先锁定某个具体实现。
- 更新 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)，补充“稳定接口面建议”，明确后续系统演进时应优先保持稳定的关键边界。

## [2026-03-07]

### 新增

- 新增 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)，首次给出面向家庭室内场景的移动交互机器人 OODA 总体架构，明确感知、认知、决策、执行分层，以及世界模型、安全门控和端云协同等核心设计方向。
