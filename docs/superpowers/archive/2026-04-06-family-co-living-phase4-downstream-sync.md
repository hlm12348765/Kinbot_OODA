# Phase 4: 下游方案与评审包同步 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**已归档说明：** 本计划已被主线架构与治理文档吸收，仅保留历史追溯价值。

**Goal:** 在不新增重大决策门的前提下，将 `Phase 3` 已形成的七实体目标模型、`CareEvent / Task` 边界和 `V1` 最小激活子集同步回 `PDCP` 评审包、模块方案下发基线、原则符合度检查与治理入口，并建立 `Phase 4` 收口确认 issue。

**Architecture:** 以 `docs/02_p1_architecture/05_world_state_schema.md` 为主文档，以 `docs/08_reviews/22_phase3_state_model_closure_package.md` 为阶段输入，不再重新争论路线 A / B。当前阶段属于执行性同步阶段，目标是让下游主线文档和 Linear 承接关系全部跟上七实体目标模型。

**Tech Stack:** Markdown, Mermaid, git, `rg`, `sed`, Linear

---

### Task 1: 同步 `PDCP` 评审包

**Files:**
- Modify: `docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md`

- [x] **Step 1: 将 `World State` 目标方向改写为七实体模型**
- [x] **Step 2: 补入 `CareEvent / Task` 边界作为 `PDCP` 级冻结项**
- [x] **Step 3: 明确 `PDCP` 当前只冻结目标模型与 `V1` 子集，不冻结完整字段与迁移细节**

### Task 2: 同步模块与下发基线

**Files:**
- Modify: `docs/02_p1_architecture/04_module_layers_and_boundaries.md`
- Modify: `docs/02_p1_architecture/06_decision_state_machine.md`
- Modify: `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`

- [x] **Step 1: 让模块边界文档吸收七实体状态平面方向**
- [x] **Step 2: 让状态机文档显式消费 `CareEvent -> Task` 的分层关系**
- [x] **Step 3: 让 `S4 / S5 / S7` 下发要求继承七实体模型和 `KBT-33` 治理要求**

### Task 3: 同步评审与治理入口

**Files:**
- Modify: `docs/08_reviews/02_architecture_principles_alignment_check.md`
- Modify: `docs/02_p1_architecture/README.md`
- Modify: `docs/08_reviews/README.md`
- Modify: `docs/superpowers/README.md`
- Modify: `README.md`
- Modify: `docs/00_governance/03_decision_log.md`
- Modify: `CHANGELOG.md`

- [x] **Step 1: 更新原则符合度检查到七实体模型口径**
- [x] **Step 2: 更新目录索引与当前阶段状态**
- [x] **Step 3: 补记 `Phase 4` 已完成下游同步**

### Task 4: 同步 Linear 承接关系与收口确认

**Files:**
- Linear: `KBT-33`
- Linear: create `Phase 4` closure issue

- [x] **Step 1: 更新 `KBT-33` 以承接七实体模型下的接口治理范围**
- [x] **Step 2: 若 `KBT-51` 已不再需要，关闭它**
- [x] **Step 3: 创建新的 `Phase 4` 收口确认 issue**

