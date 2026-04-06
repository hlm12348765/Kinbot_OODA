# Phase 1: Kinbot家庭共居智能体原则层重写 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将 `docs/00_governance/05_system_architecture_principles.md` 从通用系统工程原则集重写为 Kinbot 专属原则层，并同步维护与本轮革新收敛相关的版本记录。

**Architecture:** 先以 `docs/08_reviews/18_family_co_living_architecture_diff_and_convergence_plan.md` 为执行边界，提炼可正式冻结的母命题与顶层原则，再重写 `05_system_architecture_principles.md` 主体内容，并把现有通用系统工程原则下沉为附录或对照检查表。最后同步更新索引、决策记录与更新日志，确保本轮变更仍明确停留在 `Phase 1`，不提前冻结 `World State 9 -> 7` 等仍属 `provisional` 的判断。

**Tech Stack:** Markdown, Mermaid, git, `rg`, `sed`

---

### Task 1: 固定 Phase 1 的执行边界与原则来源

**Files:**
- Modify: `docs/00_governance/05_system_architecture_principles.md`
- Reference: `docs/08_reviews/16_family_co_living_intelligence_architecture_innovation_notes.md`
- Reference: `docs/08_reviews/17_from_multi_scale_dynamic_ooda_to_family_co_living_agent.md`
- Reference: `docs/08_reviews/18_family_co_living_architecture_diff_and_convergence_plan.md`
- Reference: `input/00_requirements/00_user_requirements_input.md`

- [ ] **Step 1: 重新核对可冻结与不可冻结项**

Run: `sed -n '1,260p' docs/08_reviews/18_family_co_living_architecture_diff_and_convergence_plan.md`
Expected: 能明确看到 `Phase 1` 只冻结母命题、顶层原则、`OODA` 运行时定位与影响边界，不冻结 `World State 9 -> 7`。

- [ ] **Step 2: 列出 `05` 新版必须承载的核心内容**

Run: `rg -n "新架构母命题|顶层架构原则|OODA|生活连续性|主体性|多角色责任网络|低打扰共居" docs/08_reviews/16_family_co_living_intelligence_architecture_innovation_notes.md docs/08_reviews/18_family_co_living_architecture_diff_and_convergence_plan.md`
Expected: 能提取出新版 `05` 的原则主体来源。

- [ ] **Step 3: 确认当前 `05` 中需要保留为附录的通用原则**

Run: `sed -n '1,260p' docs/00_governance/05_system_architecture_principles.md`
Expected: 能识别哪些原则应保留为附录，如问题陈述、分解、复杂度、进化、健壮性。

### Task 2: 重写 `05_system_architecture_principles.md`

**Files:**
- Modify: `docs/00_governance/05_system_architecture_principles.md`

- [ ] **Step 1: 写出新版文档头部与结构骨架**

Write sections:
- 文档定位
- 适用边界
- Kinbot 架构母命题
- `7` 条顶层架构原则
- 原则到架构决策的映射规则
- 对当前主线的影响边界
- 附录：继承保留的通用系统工程原则

- [ ] **Step 2: 写出新版原则主体**

Include:
- “家庭共居智能体”母命题
- `生活连续性优先于局部任务最优`
- `具身在场是核心价值`
- `关系是长期结果，不是预设功能`
- `主体性与尊严不可让渡`
- `家庭必须被建模为多角色责任网络`
- `低打扰共居能力必须作为顶层能力建模`
- `系统采用分层约束 + 局部融合的运行时原则`

- [ ] **Step 3: 显式写出运行时边界**

Must state:
- `OODA` 不再承担总架构角色
- `OODA` 退到运行时层
- 允许 `Orient + Decide` 融合
- 允许局部端到端化
- 安全、授权、恢复、审计边界不能被绕开

- [ ] **Step 4: 将旧通用原则下沉为附录**

Retain only principles still useful to Kinbot:
- 系统问题陈述
- 分解与复杂度控制
- 架构决策排序
- 产品进化
- 健壮性 / 适应性

- [ ] **Step 5: 核对新版文档没有越权冻结后续事项**

Run: `rg -n "9 -> 7|CareRelationship|CareEvent|正式实体" docs/00_governance/05_system_architecture_principles.md`
Expected: 如果出现，也只能作为后续候选方向或边界说明，不能写成已冻结事实。

### Task 3: 同步版本维护并完成一致性核对

**Files:**
- Modify: `docs/08_reviews/README.md`
- Modify: `README.md`
- Modify: `docs/00_governance/03_decision_log.md`
- Modify: `CHANGELOG.md`

- [ ] **Step 1: 更新需要说明本轮 Phase 1 动作的版本记录**

Update:
- `docs/00_governance/05_system_architecture_principles.md`
- `docs/00_governance/03_decision_log.md`
- `CHANGELOG.md`

- [ ] **Step 2: 如有必要，刷新目录索引描述**

Run: `rg -n "05_system_architecture_principles|系统架构原则" README.md docs/08_reviews/README.md`
Expected: 根索引与评审索引中的描述不与新版原则层冲突。

- [ ] **Step 3: 做最终一致性检查**

Run: `git diff -- docs/00_governance/05_system_architecture_principles.md docs/00_governance/03_decision_log.md README.md docs/08_reviews/README.md CHANGELOG.md`
Expected: 变更集中在 `Phase 1` 原则层重写与版本维护，不包含 `World State` 重组或其他越界修改。

- [ ] **Step 4: 确认工作区状态**

Run: `git status --short`
Expected: 只新增本轮计划文档和相关原则层维护变更，未把 `tmp/`、`.superpowers/` 等本地辅助目录混入正式提交范围。
