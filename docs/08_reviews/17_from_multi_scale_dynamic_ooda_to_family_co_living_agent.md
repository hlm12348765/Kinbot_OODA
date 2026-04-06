# 范式跃迁：从“多尺度 OODA 机器人”到“家庭共居智能体”

---

文档版本：v1.1
创建日期：2026-03-11
作者：Claude-架构师

文档变更记录：
- v1.1 | 2026-04-06 | Codex-架构师 | 修正从 Claude 复制导致的整篇行级反引号包裹问题，统一为正式 Markdown 结构，并保持原革新计划语义不变。
- v1.0 | 2026-03-11 | Claude-架构师 | 文档创建。

---

## Context

Kinbot 架构仓库积累了 `80` 份 markdown 文档、`92` 次提交。当前以“多尺度 OODA”为唯一架构组织原则。识别到两个结构性张力：

1. **OODA 是离散环**，无法自然容纳 `VLA / 端到端` 模型的连续感知-动作流。
2. **OODA 以信息流为中心**，无法表达“照护关系”这个跨越所有时间尺度的产品核心价值。

用户提出全新架构母命题和 `7` 条顶层原则，要求执行范式跃迁。同时将 `World State` 从 `9` 实体重组为 `7` 实体。

---

## 新架构母命题

> Kinbot 不是以单次任务成功率为中心的家庭服务机器人，而是面向中国分布式家庭，通过具身在场维持家庭生活连续性、承接照护责任、保护成员主体性，并在长期共居中形成可信关系的**家庭共居智能体**。

## 新 7 条顶层架构原则

1. 生活连续性优先于局部任务最优
2. 具身在场是核心价值
3. 关系是长期结果，不是预设功能
4. 主体性与尊严不可让渡
5. 家庭必须被建模为多角色责任网络
6. 低打扰共居能力必须作为顶层能力建模
7. 系统采用“分层约束 + 局部融合”的运行时原则

## World State 重组：9 → 7

| 新实体 | 来源 | 合并理由 |
| --- | --- | --- |
| **Person** | Person + HealthProfile | 健康是人的内在属性 |
| **CareRelationship** | 替代 RoleBinding | 角色是关系的一个维度 |
| **Household** | 不变 | — |
| **Place** | 不变 | — |
| **Object** | Object + MedicationAsset | 药物是类型化物件 |
| **Task** | 不变 | — |
| **CareEvent** | 替代 RiskEvent | 从“风险事件”扩展为“照护事件” |

---

## 执行计划

### Wave 1：新范式定义（新建 2 个文档）

#### 1.1 新建 `docs/02_p1_architecture/14_family_co_living_agent_paradigm.md`

**新范式定义文档**，作为整个跃迁的锚点文档。

内容结构：

- §1 文档目的：替代 `OODA` 作为架构组织原则
- §2 架构母命题：完整定义“家庭共居智能体”
- §3 七条顶层架构原则：逐条展开，附具体约束
- §4 三轴架构框架：
  - 照护关系轴（WHY）：为什么做这件事
  - 执行范式轴（HOW）：怎么做，离散决策 / 连续流式 / 事件驱动 / 长周期演化
  - 能力域轴（WHAT）：做什么，`9` 个一级模块
- §5 执行范式详解：
  - 离散决策范式（原 `OODA R1-R4` 全部保留作为此范式内容）
  - 连续流式范式（`VLA / 端到端`，一代接口预留）
  - 事件驱动范式（跨尺度照护事件）
  - 长周期演化范式（关系阶段迁移、习惯学习）
- §6 执行范式协调器（Execution Paradigm Coordinator）：
  - 继承原 `OODA Scale Scheduler` 的 `6` 类调度输入和 `7` 条切换规则
  - 新增对连续流和事件驱动的调度能力
- §7 与原 `OODA` 基线的继承关系：显式说明保留了什么、升级了什么、新增了什么
- §8 与已有两份外部提案的关系

#### 1.2 新建 `docs/02_p1_architecture/15_care_relationship_and_event_model.md`

**照护关系与照护事件模型**。

内容结构：

- §1 文档目的
- §2 `CareRelationship` 实体完整定义：
  - 吸收原 `RoleBinding` 的全部字段
  - 新增：关系阶段（`initial → familiar → trusted → deep`）
  - 新增：照护质量 `6` 维度（`trust, comfort, restraint, continuity, explainability, recoverability`）
  - 新增：交互节奏偏好、照护记忆索引
- §3 `CareEvent` 实体完整定义：
  - 事件类别：`risk / health / relationship / milestone`
  - 保留原 `RiskEvent` 的 `A1-A7` 风险类型
  - 新增：`relationship_impact`（此事件对 `6` 维度的影响方向）
- §4 照护关系阶段迁移规则
- §5 `CareEvent` 处理管线（跨尺度照护事件如何触发协调响应）
- §6 与 `DecisionContextSnapshot` 的集成

---

### Wave 2：核心架构文档重写（4 个文档）

#### 2.1 重写 `docs/00_governance/05_system_architecture_principles.md`

**完全替换**为 Kinbot 专属的架构原则体系。

当前内容是通用系统工程教科书原则（涌现、整体、聚焦等 `22` 条）。替换为：

- §1 架构母命题
- §2 七条顶层架构原则（逐条完整展开）
- §3 从原则到架构决策的映射规则
- 保留原有通用原则中仍然适用的作为附录引用

#### 2.2 重写 `docs/02_p1_architecture/01_overall_architecture.md`

**最关键的修改**，作为总体架构入口文档。

修改点：

- §2 冻结边界：新增“架构范式从 `OODA` 中心升级为家庭共居智能体”
- §4.2 运行时功能架构视图：
  - 移除 `subgraph OODA[多尺度 OODA 运行时]` 和 `O1-O4` 分层
  - 替换为三轴架构框架图（照护关系轴 / 执行范式轴 / 能力域轴）
  - `9` 个模块保留不动，但外层组织框架变化
- §5 多尺度 `OODA` 基线：重命名为“多尺度执行范式基线”
  - `R1-R4` 作为“离散决策范式”的内容引用
  - 指向新文档 `14_` 获取完整定义
- §7 四条一级业务闭环：重述为“照护关系的四个面向”
  - 健康闭环 → 健康照护面
  - 陪伴闭环 → 日常陪伴面
  - 安全闭环 → 安全守护面
  - 服务闭环 → 家庭服务面
- §10 与专题文档的关系：更新引用列表，加入 `14_` 和 `15_`
- §11 结论：更新为新范式表述

#### 2.3 重写 `docs/02_p1_architecture/03_multi_scale_dynamic_ooda_architecture_baseline.md`

**OODA 耦合最重的文档**，重构为“多尺度执行范式基线”。

文件重命名为：`03_multi_scale_execution_paradigm_baseline.md`（或保留原文件名但改标题）

修改点：

- 标题：多尺度动态 `OODA` 架构基线 → 多尺度执行范式基线
- §1 文档目的：从“是否继续用 `OODA`”改为“多种执行范式如何在三轴框架下共存”
- §2 为什么经典 `OODA` 不够：保留 `4` 个问题诊断（它们是范式无关的），但结论从“升级 `OODA`”改为“引入多执行范式”
- §3 正式基线：`6` 条基线重写，`OODA` 从“主方法论”降为“离散决策范式”
- §4 四类子环：`R1-R4` 全部保留，但明确标注为“离散决策范式内的四类执行环”
- §5 单轮时间与空间尺度：保留，移入“离散决策范式”子章节
- §6 动态调度机制：`OODA Scale Scheduler` → 执行范式协调器，保留 `6` 类输入
- §7 七条切换规则：保留，标注为“离散决策范式内的切换规则”
- §8 对 `OODA` 四层的改写：保留内容，重新定位为“离散决策范式的四阶段定义”
- 新增 §9：连续流式执行范式（`VLA / 端到端`，一代为接口预留）
- 新增 §10：事件驱动执行范式（跨尺度照护事件）
- 新增 §11：长周期演化执行范式

#### 2.4 重写 `docs/02_p1_architecture/05_world_state_schema.md`

**World State `9 → 7` 实体重组**。

修改点：

- §4 一级实体：从 `9` 个改为 `7` 个
- §4.1 实体关系图：重绘（`CareRelationship` 替代 `RoleBinding`，`CareEvent` 替代 `RiskEvent`，`HealthProfile` 合入 `Person`，`MedicationAsset` 合入 `Object`）
- §5.1 `Person`：吸收原 §5.6 `HealthProfile` 全部字段为 `health` 子对象
- §5.2 `CareRelationship`：替代原 §5.2 `RoleBinding`，新增关系阶段、质量维度、节奏偏好
- §5.3 `Household`：不变
- §5.4 `Place`：不变
- §5.5 `Object`：吸收原 §5.7 `MedicationAsset` 为 `category=medication` 的类型化扩展
- §5.6 `Task`：不变
- §5.7 `CareEvent`：替代原 §5.9 `RiskEvent`，扩展 `event_class`
- 删除原 §5.6 `HealthProfile`（合入 `Person`）
- 删除原 §5.7 `MedicationAsset`（合入 `Object`）
- 删除原 §5.2 `RoleBinding`（替换为 `CareRelationship`）
- 删除原 §5.9 `RiskEvent`（替换为 `CareEvent`）
- §6 关键关系：更新为 `7` 实体间的关系
- §7 `DecisionContextSnapshot`：新增 `care_relationship_state` 和 `care_context` 字段
- §8 事件类型：更新为 `CareEvent` 分类体系
- §11 最小 JSON：更新示例

---

### Wave 3：关联文档更新（6 个文档）

#### 3.1 更新 `docs/02_p1_architecture/06_decision_state_machine.md`

修改 `4` 处：

- §2 设计前提：`R1-R4` 引用改为“离散决策范式的四类执行环”
- §3.1 顶层控制结构选择：`OODA Scale Scheduler` → 执行范式协调器
- §3.2 顶层控制结构图：重绘，将 `OODA Scale Scheduler` 替换为执行范式协调器
- §5 业务主状态：移除 `R2 / R3 / R4` 映射注释

#### 3.2 更新 `docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md`

修改 `3` 处：

- §2 评审边界：第 `3` 条从“多尺度 `OODA`”改为“多尺度执行范式”
- §5.4 运行时功能架构视图：重绘 Mermaid 图，移除 `OODA` 分层，采用三轴框架
- §5.5 核心结论：从“`OODA` 为主方法论”改为“家庭共居智能体范式 + 多执行范式”

#### 3.3 更新 `docs/02_p1_architecture/04_module_layers_and_boundaries.md`

修改 `1` 处：

- §7 一级模块主调用关系：更新描述语言，从 `OODA` 阶段描述改为执行范式描述

#### 3.4 更新 `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`

修改 `2` 处：

- §3 运行时主线：从“多尺度 `OODA`”改为“家庭共居智能体 + 多尺度执行范式”
- §4.4 `S4` 工作包：从“`OODA Scale Scheduler` 落地”改为“执行范式协调器落地”

#### 3.5 更新 `docs/03_p2_feasibility/08_post_freeze_coding_work_plan.md`

修改处：

- Protobuf 实体引用：`RoleBinding` → `CareRelationship`，`RiskEvent` → `CareEvent`
- 模块 README 模板中的 `OODA` 引用

#### 3.6 更新 `docs/08_reviews/02_architecture_principles_alignment_check.md`

修改：

- 对齐新 `7` 条原则重新检查（或标注原检查基于旧原则，附新版检查）

---

### Wave 4：元数据与治理文档更新（4 个文档）

#### 4.1 更新 `CLAUDE.md`

修改处：

- §项目概述：更新为家庭共居智能体定位
- “`OODA` 主循环”章节：替换为新范式描述
- “核心架构要素”：更新 `World State` 实体描述、`OODA Scale Scheduler` → 执行范式协调器
- 术语约定：新增“家庭共居智能体”“CareRelationship”“CareEvent”“执行范式协调器”
- 文档结构：更新引用列表，加入新文档

#### 4.2 更新 `docs/00_governance/04_glossary.md`

新增术语：

- 家庭共居智能体
- 照护关系（CareRelationship）
- 照护事件（CareEvent）
- 执行范式协调器（Execution Paradigm Coordinator）
- 生活连续性
- 具身在场

更新术语：

- `OODA`：从“主循环”改为“离散决策范式的执行方法”

#### 4.3 更新 `docs/00_governance/03_decision_log.md`

新增决策条目：

- 架构范式从“多尺度 `OODA`”升级为“家庭共居智能体”
- `World State` 从 `9` 实体重组为 `7` 实体
- `OODA` 从唯一方法论降级为离散决策范式之一

#### 4.4 更新 `CHANGELOG.md`

新增变更条目记录本次范式跃迁。

---

### Wave 5：不改动的文档（确认清单）

以下文档**不需要修改**（`OODA` 引用仅为轻度命名引用，或为历史归档文档）：

- `input/00_requirements/00_user_requirements_input.md`：用户独占，禁止修改
- `docs/02_p1_architecture/07_safety_compliance_authorization_api.md`：门控逻辑范式无关
- `docs/02_p1_architecture/08_companion_interaction_strategy.md`：功能域，仅轻度引用 `R4`
- `docs/02_p1_architecture/09_safety_risk_matrix.md`：安全域，范式无关
- `docs/02_p1_architecture/10_health_event_pipeline_and_escalation.md`：健康管线，范式无关
- `docs/02_p1_architecture/11_app_cloud_ops_minimal_loop.md`：伴生系统，范式无关
- `docs/02_p1_architecture/12_human_service_and_telemedicine_boundaries.md`：服务边界
- `docs/02_p1_architecture/13_medication_storage_and_indoor_delivery_requirements.md`：储药递送
- `docs/03_p2_feasibility/02_demo_to_mass_production_gaps.md`：工程缺口分析
- `docs/03_p2_feasibility/03_engineering_npi_baseline.md`：`NPI` 基线
- `docs/03_p2_feasibility/04_hardware_software_selection_matrix.md`：选型矩阵
- `docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md`：`BOM` 与降本
- `docs/03_p2_feasibility/06_power_budget_and_efficiency_strategy.md`：功耗
- `docs/03_p2_feasibility/07_phase1_wearable_compatibility_and_data_fields.md`：穿戴兼容
- `docs/05_p4_beta_dvt/01_mvp_validation_plan.md`：`MVP` 验证
- `docs/06_p5_launch_readiness/`：量产准备
- `docs/08_reviews/01_architect_review_and_plan.md`：外部评审（只读参考）
- `docs/08_reviews/05_two_claude_proposals_review_and_next_steps.md`：历史归档
- `docs/08_reviews/06_two_alternative_architecture_proposals_comparison.md`：历史归档
- `docs/08_reviews/07_architecture_restatement_and_alternative_proposal.md`：历史归档
- `docs/08_reviews/08_relation_centered_architecture_proposal.md`：历史归档
- `docs/09_research/`：研究文档

---

## 执行顺序与依赖

```text
Wave 1（锚点，无依赖）
├── 1.1 新建 14_family_co_living_agent_paradigm.md
└── 1.2 新建 15_care_relationship_and_event_model.md

Wave 2（依赖 Wave 1 的定义）
├── 2.1 重写 05_system_architecture_principles.md
├── 2.2 重写 01_overall_architecture.md
├── 2.3 重写 03_multi_scale_...baseline.md
└── 2.4 重写 05_world_state_schema.md

Wave 3（依赖 Wave 2 的新术语和实体）
├── 3.1 更新 06_decision_state_machine.md
├── 3.2 更新 02_pdcp_...review_package.md
├── 3.3 更新 04_module_layers_and_boundaries.md
├── 3.4 更新 01_overall_solution_...baseline.md
├── 3.5 更新 08_post_freeze_coding_work_plan.md
└── 3.6 更新 02_architecture_principles_alignment_check.md

Wave 4（依赖全部完成）
├── 4.1 更新 CLAUDE.md
├── 4.2 更新 04_glossary.md
├── 4.3 更新 03_decision_log.md
└── 4.4 更新 CHANGELOG.md
```

## 关键原则

1. **OODA 不删除，降级**：所有 `R1-R4` 定义、`7` 条切换规则、`6` 类调度输入原文保留，但从“系统唯一方法论”降为“离散决策范式的内部规则”。
2. **实体不是加法，是重组**：`CareRelationship` 替代 `RoleBinding`（同一概念槽位），`CareEvent` 替代 `RiskEvent`（同一概念槽位），`Person` 吸收 `HealthProfile`，`Object` 吸收 `MedicationAsset`，净减少 `2` 个实体。
3. **模块不动**：`9` 个一级模块定义和边界全部保留。
4. **历史文档不改**：`reviews/05-08` 作为历史归档保留原样。
5. **中文维护**：所有文档内容中文。

## 验证方法

1. 全文 `grep OODA`：在非历史归档文档中，`OODA` 应仅出现在“离散决策范式”语境下。
2. 全文 `grep RoleBinding|HealthProfile|MedicationAsset|RiskEvent`：在非历史归档文档中不应再出现。
3. 检查 `World State` 实体计数是否等于 `7`。
4. 检查每份修改文档的内部交叉引用一致性。
5. 检查 `CLAUDE.md` 的文档索引是否包含新文档。

## 预计产出

- 新建文档：`2` 个
- 修改文档：`14` 个
- 不变文档：约 `64` 个
- 总修改量：约 `16` 个文档
