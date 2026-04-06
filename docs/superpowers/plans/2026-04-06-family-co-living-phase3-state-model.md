# Phase 3: 状态模型与数据模型决策 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 吸收 `Step 47` 第 `7/8` 条更新，把 `Phase 3` 从“路线比较”推进到“七实体目标模型主文档 + `V1` 最小激活子集 + 阶段收口确认”。

**Architecture:** 以 `docs/08_reviews/18_family_co_living_architecture_diff_and_convergence_plan.md` 作为边界母文档，以 `Step 47` 第 `7/8` 条作为最新用户冻结输入。路线 B 已升为正式主方向，因此本阶段的重点不再是 A/B 对比，而是把七实体目标模型、`CareEvent / Task` 边界、`V1` 最小激活子集和迁移顺序写成可审的阶段产物。

**Tech Stack:** Markdown, Mermaid, git, `rg`, `sed`, Linear

---

### Task 1: 收敛七实体目标模型

**Files:**
- Modify: `docs/02_p1_architecture/05_world_state_schema.md`
- Modify: `docs/08_reviews/21_seven_entity_world_state_target_model.md`

- [x] **Step 1: 将 `05` 从 `9` 实体比较基线升级为 `7` 实体目标模型主文档**
- [x] **Step 2: 明确 `Person / CareRelationship / Household / Place / Object / Task / CareEvent` 的一级边界**
- [x] **Step 3: 冻结 `CareEvent / Task` 边界规则**
- [x] **Step 4: 明确旧 `9` 实体到 `7` 目标模型的映射关系**

### Task 2: 定义 `V1` 最小激活子集与迁移顺序

**Files:**
- Modify: `docs/08_reviews/21_seven_entity_world_state_target_model.md`
- Create: `docs/08_reviews/22_phase3_state_model_closure_package.md`

- [x] **Step 1: 明确 `V1` 只激活七实体中的哪些子集**
- [x] **Step 2: 写清哪些能力暂以枚举 / 受治理子结构表达，不做连续复杂模型**
- [x] **Step 3: 写清从当前骨架到目标模型的迁移顺序**
- [x] **Step 4: 形成 Phase 3 收口包**

### Task 3: 同步工作文档与索引

**Files:**
- Modify: `docs/superpowers/README.md`
- Modify: `docs/08_reviews/README.md`
- Modify: `README.md`

- [x] **Step 1: 更新 Phase 3 实施计划内容与完成状态**
- [x] **Step 2: 补入 Phase 3 收口包索引**
- [x] **Step 3: 更新根入口与 `P1` 目录对 Phase 3 当前状态的说明**

### Task 4: 回写治理记录与协作入口

**Files:**
- Modify: `docs/00_governance/03_decision_log.md`
- Modify: `CHANGELOG.md`

- [x] **Step 1: 补记路线 B 已作为 Phase 3 正式主方向进入主文档**
- [x] **Step 2: 补记 Phase 3 已形成可收口阶段产物**
- [x] **Step 3: 创建新的 Phase 3 收口确认 issue**
