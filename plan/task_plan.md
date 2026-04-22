# Task Plan: 治理复杂度复盘与 Provisional 清账

## Goal
将复杂度治理从一次性收口推进为可持续规则，完成评审稿归档口径澄清、活跃 provisional 的 Linear 承接方案、首轮 guardrails 草案与当前 issue 清账建议。

## Phases
- [x] Phase 1: Plan and setup
- [ ] Phase 2: Research and audits
- [ ] Phase 3: Governance execution
- [ ] Phase 4: Review and deliver

## Key Questions
1. `26_architecture_complexity_marking.md` 应如何归档，且不破坏 `08_reviews` 当前活跃入口规则？
2. 当前仓库中的活跃 provisional / orphan 到底有哪些，哪些需要 Linear issue 承接？
3. 当前 Linear 项目中有哪些 issue 已过时、重复、缺 owner 或应关闭？
4. 最小 guardrails 应写到哪里，哪些阈值适合作为预警而不是僵硬 KPI？

## Decisions Made
- 使用 `plan/task_plan.md` 作为本轮治理执行计划文件，遵循仓库 `plan/` 目录约定。
- 活跃 provisional 的主承接载体优先使用 Linear，而不是新增全仓 Markdown 大表。
- archive 中旧路径默认保留原貌，只补索引说明，不批量重写正文。

## Errors Encountered
- `plan/` 目录初始不存在，已创建。

## Status
**Currently in Phase 2** - 正在并行审计归档口径、provisional/orphan 现状与 Linear issue 清账范围。
