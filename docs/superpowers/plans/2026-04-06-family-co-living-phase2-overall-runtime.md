# Phase 2: 家庭共居智能体总图与运行时重组 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在不提前冻结 `World State 9 -> 7` 的前提下，完成 `Phase 2` 的三项核心动作：新建家庭共居智能体顶层锚点文档，重写总体架构口径，重写多尺度动态 `OODA` 基线为多执行范式基线表达。

**Architecture:** 以 `05_system_architecture_principles.md` 作为已确认的原则层，以 `18_family_co_living_architecture_diff_and_convergence_plan.md` 作为执行边界，先建立 `14_family_co_living_agent_paradigm.md` 作为顶层桥接文档，再同步重构 `01_overall_architecture.md` 与 `03_multi_scale_dynamic_ooda_architecture_baseline.md`。本阶段只重写总图与运行时语法，不进入数据模型主表重组。

**Tech Stack:** Markdown, Mermaid, git, `rg`, `sed`

---

### Task 1: 建立 Phase 2 顶层锚点文档

**Files:**
- Create: `docs/02_p1_architecture/14_family_co_living_agent_paradigm.md`
- Modify: `docs/02_p1_architecture/README.md`

- [ ] **Step 1: 提炼锚点文档的最小稳定结构**
- [ ] **Step 2: 写入母命题、三轴框架与多执行范式定义**
- [ ] **Step 3: 明确当前仍属 `provisional` 的边界，尤其是 `World State 9 -> 7` 与长期模型稳定分解**
- [ ] **Step 4: 更新 `docs/02_p1_architecture/README.md` 索引**

### Task 2: 重写总体架构文档的总图口径

**Files:**
- Modify: `docs/02_p1_architecture/01_overall_architecture.md`

- [ ] **Step 1: 更新冻结边界，明确架构范式已从 `OODA` 总中心上抬到家庭共居智能体原则层**
- [ ] **Step 2: 将 `4.2` 运行时功能架构视图改为“照护关系轴 / 执行范式轴 / 能力域轴”的三轴表达，同时保留 `9` 个一级模块**
- [ ] **Step 3: 将 `5` 节改写为多执行范式基线表达，明确 `OODA` 退到离散决策范式**
- [ ] **Step 4: 将 `7` 节改成“一级业务闭环与照护面映射”，不提前冻结最终命名**
- [ ] **Step 5: 更新专题文档引用与当前结论**

### Task 3: 重写 `03` 的运行时基线定位

**Files:**
- Modify: `docs/02_p1_architecture/03_multi_scale_dynamic_ooda_architecture_baseline.md`

- [ ] **Step 1: 改标题与文档目的，明确本文件当前以“多执行范式基线”为实质内容**
- [ ] **Step 2: 保留“为什么经典 `OODA` 不够”的问题诊断**
- [ ] **Step 3: 重写正式基线，加入离散决策 / 连续流式 / 事件驱动 / 长周期演化四类执行范式**
- [ ] **Step 4: 保留 `R1-R4`、调度输入与切换规则，但明确其属于离散决策范式内部结构**
- [ ] **Step 5: 显式写入 `Orient + Decide` 融合与局部端到端化的允许边界**

### Task 4: 版本维护与一致性核对

**Files:**
- Modify: `README.md`
- Modify: `docs/00_governance/03_decision_log.md`
- Modify: `CHANGELOG.md`
- Modify: `docs/superpowers/README.md`

- [ ] **Step 1: 回写新文档与文档定位变化**
- [ ] **Step 2: 补记 `Step 47` 对原则层提案的确认，以及 `Phase 2` 已启动的事实**
- [ ] **Step 3: 确认本轮未越过数据模型冻结边界**
- [ ] **Step 4: 核对目录索引、根索引和变更日志保持一致**
