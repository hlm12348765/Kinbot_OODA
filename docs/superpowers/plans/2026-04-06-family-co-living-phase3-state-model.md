# Phase 3: 状态模型与数据模型决策 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在不越权提前冻结 `World State 9 -> 7` 的前提下，正式启动 `Phase 3`，把状态模型与数据模型重组从“含混讨论”收敛为可审阅、可比较、可决策的主线评审框架。

**Architecture:** 以 `docs/08_reviews/18_family_co_living_architecture_diff_and_convergence_plan.md` 作为 `Phase 3` 的边界约束，以 `docs/02_p1_architecture/05_world_state_schema.md` 作为当前稳定骨架。先建立独立评审框架，对比“保留 `9` 类骨架 + 关系 / 事件扩展层”与“直接 `9 -> 7` 重组”两条路线，再决定是否进入主表改写。

**Tech Stack:** Markdown, Mermaid, git, `rg`, `sed`, Linear

---

### Task 1: 建立 Phase 3 评审框架文档

**Files:**
- Create: `docs/08_reviews/19_world_state_restructuring_decision_frame.md`

- [ ] **Step 1: 明确 Phase 3 的正式问题陈述与当前不该越过的冻结边界**
- [ ] **Step 2: 对比“`9` 骨架 + 关系 / 事件扩展层”与“直接 `9 -> 7`”两条候选路线**
- [ ] **Step 3: 写清判断维度、触发条件、验证口径和推荐起步路线**
- [ ] **Step 4: 给出用户 / Linear 审阅时只需确认的最小问题集**

### Task 2: 回写 `World State` 主线文档的承接关系

**Files:**
- Modify: `docs/02_p1_architecture/05_world_state_schema.md`

- [ ] **Step 1: 明确当前 `9` 类骨架仍是正式稳定基线**
- [ ] **Step 2: 增加 `Phase 3` 决策承接说明，指向新的评审框架**
- [ ] **Step 3: 明确在 `Phase 3` 审阅完成前，主表不得提前重写为 `9 -> 7`**

### Task 3: 同步工作文档与索引

**Files:**
- Modify: `docs/superpowers/README.md`
- Modify: `docs/08_reviews/README.md`
- Modify: `README.md`

- [ ] **Step 1: 补入 Phase 3 实施计划索引**
- [ ] **Step 2: 补入新的 Phase 3 评审框架索引**
- [ ] **Step 3: 更新根入口中的当前分支状态说明**

### Task 4: 回写治理记录与协作入口

**Files:**
- Modify: `docs/00_governance/03_decision_log.md`
- Modify: `CHANGELOG.md`

- [ ] **Step 1: 补记 `KBT-49` 已作为 Phase 2 实际收口确认 issue 建立**
- [ ] **Step 2: 补记 Phase 3 已启动，但当前只进入状态模型 / 数据模型决策准备**
- [ ] **Step 3: 明确当前推荐优先审“扩展层”路线，`9 -> 7` 继续保持 `provisional`**
