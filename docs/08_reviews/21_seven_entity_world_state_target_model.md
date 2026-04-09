# Kinbot七实体 World State 目标模型

---

文档版本：v1.4
创建日期：2026-04-06
作者：Codex-架构师

文档变更记录：
- v1.4 | 2026-04-09 | Codex-架构师 | 收紧本文角色为 `Phase 3` 评审补充：七实体定义、一级边界、`V1` 最小激活子集与活跃未冻结项统一回到 `05 / 25`，本文只保留收敛理由、迁移顺序与候选说明。
- v1.3 | 2026-04-08 | Codex-架构师 | 吸收 `19/20` 的决策背景与弃选方案摘要到附录 A，并将正文中的候选说明统一收束，保持主干只承载七实体冻结基线。
- v1.2 | 2026-04-07 | Codex-架构师 | 按 `Phase 4.5` 补入 `CareRelationship` 的复合责任主体候选与 `phase` 受控枚举演进路径，保持其为候选补强而非已冻结事实。
- v1.1 | 2026-04-06 | Codex-架构师 | 补入一级边界表、`V1` 最小激活子集细化和迁移顺序，使本文可作为 `Phase 3` 收口依据之一。
- v1.0 | 2026-04-06 | Codex-架构师 | 新增文档，作为 `Phase 3` 中路线 B 的目标模型评审稿，定义面向家庭共居智能体的七实体 `World State` 方向。

---

## 1. 文档定位

本文档承接 `Step 47` 中对 `Phase 3` 的最新要求，但当前角色已收紧为 **`Phase 3` 评审补充**，不再与 [05_world_state_schema.md](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/02_p1_architecture/05_world_state_schema.md) 并列承担七实体事实源角色。

当前统一口径是：

1. 七实体定义、一级边界、`V1` 最小激活子集，以 `05` 为准；
2. 当前活跃未冻结项，以 [25_phase3_to_phase45_closure_and_strategic_input_package.md](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/08_reviews/25_phase3_to_phase45_closure_and_strategic_input_package.md) 与 `05` §13 为准；
3. 本文只保留 `Phase 3` 收口时仍有价值的三类信息：路线 B 为何胜出、`9 -> 7` 的收敛理由、迁移顺序与候选说明。

## 2. 当前正式方向

根据 `Step 47` 的最新更新，当前判断收敛为：

1. 路线 A 只可作为对照和风险说明，不再作为当前主方向；
2. 路线 B 才与已冻结的原则层、总架构和运行时层保持一致；
3. 当前应优先冻结正确的概念模型，再决定 `V1` 运行时只激活其中哪些子集。

## 3. 当前目标模型摘要

当前正式目标模型已经收敛为：

1. `Person`
2. `CareRelationship`
3. `Household`
4. `Place`
5. `Object`
6. `Task`
7. `CareEvent`

其中“这 `7` 类实体分别回答什么问题、一级边界如何切、`V1` 当前激活哪些字段”，已经由 `05` 主文档承担，本文不再重复展开。

## 4. 从 `9` 到 `7` 的收敛规则

### 4.1 `Person <- HealthProfile`

当前判断：

- `HealthProfile` 与 `Person` 是天然 `1:1`；
- 它并不作为一个脱离人的独立本体存在。

因此推荐：

- 将 `HealthProfile` 从一级实体降为 `Person.health_state` 或同级受治理子结构；
- 病历摘要、慢病、过敏、穿戴绑定等仍保留，但不再独立占一个顶层槽位。

### 4.2 `Object <- MedicationAsset`

当前判断：

- 药物在物理世界中本质上是一类特殊物件；
- 它的差异主要在属性，而不是本体层级。

因此推荐：

- 将 `MedicationAsset` 并入 `Object`；
- 用 `object_type=medication` 或等价分类表达其特殊属性；
- 剂量、有效期、仓位、电动仓门策略等保留为对象的专属字段组。

### 4.3 `CareRelationship <- RoleBinding`

当前判断：

- `elder / child / caregiver / visitor` 本质是关系角色；
- `auth_scope / delegated_by / requires_confirmation` 本质是关系中的权限、信任与权力传递。

因此推荐：

- 用 `CareRelationship` 替代 `RoleBinding`；
- `RoleBinding` 只保留为迁移阶段或下游实现中的投影视图，不再作为目标模型中的一级实体。

#### 4.3.1 复合责任主体（候选）

为承接中国分布式家庭中的多方照护现实，`CareRelationship` 当前保留一个候选补强位。详细决策背景、路线对照与弃选原因见附录 A。

### 4.4 `CareEvent <- RiskEvent`

当前判断：

- 风险事件只是照护事件的一种；
- 如果系统只记录风险，不记录陪伴、协同、修复、接力等事件，就无法评估关系与长期价值。

因此推荐：

- 用 `CareEvent` 替代 `RiskEvent`；
- `RiskEvent` 退为 `CareEvent.event_class=risk` 的特例。

## 5. `CareEvent` 与 `Task` 的边界

这是当前最容易再次犯错的地方，必须单独冻结。

### 5.1 基本边界

- `CareEvent`：**已发生 / 被判断已发生**
- `Task`：**待执行 / 正在执行**

`CareEvent` 可以触发 `Task`，但永远不是 `Task`。

### 5.2 当前约束

现有从 `RiskEvent` 继承来的 `recommended_action` 字段容易膨胀成“半个 `Task`”。

因此当前明确约束：

1. `recommended_action` 只允许写**动作类型枚举**，例如 `remind / approach / escalate_family / create_task`；
2. 不允许在该字段中写入执行细节；
3. 任何具体话术、导航目标、超时策略、重试逻辑和执行步骤，都必须落在 `Task` 中。

## 6. `V1` 最小激活方式

路线 B 并不意味着 `V1` 现在就要把所有新能力全部实现出来；当前正式口径仍是：

**模型按 `7` 实体定义正确，`V1` 运行时只激活其中必要子集。**

但“`V1` 当前最小激活哪些字段、哪些能力可延后、哪些内容仍未冻结”，现在已经由 `05` 与 `25` 承担，本文不再重复列子表。

更长周期的受控枚举演进路径仍保留为候选，详细背景与约束见附录 A。

## 7. 当前未冻结的内容

当前活跃未冻结项已转由 `05` §13 与 `25` §6 承接；本文只保留它们在 `Phase 3` 收口时的决策背景，不再重复列活跃 `provisional` 清单。

## 8. 当前建议的推进顺序

1. 先冻结七实体目标模型的一级边界；
2. 再冻结 `CareEvent` 与 `Task` 的边界规则；
3. 再决定 `V1` 最小激活子集；
4. 最后再进入详细字段与迁移设计。

### 8.1 建议的迁移顺序

当前建议采用以下迁移顺序，而不是一次性把所有细节改完：

1. 先在架构文档层冻结 `7` 实体目标模型；
2. 再把 `RoleBinding -> CareRelationship`、`RiskEvent -> CareEvent` 的语义映射写清；
3. 再把 `HealthProfile` 与 `MedicationAsset` 分别下沉为 `Person.health_state` 与 `Object.subtype_payload`；
4. 最后再推进到 proto / 下游接口的兼容与迁移设计。

## 9. 本轮建议用户重点审阅

1. 当前这 `7` 类一级实体是否合理；
2. `Task` 保留、`RiskEvent` 升级为 `CareEvent` 的判断是否成立；
3. `recommended_action` 只保留动作类型枚举的约束是否成立；
4. 是否接受“路线 B 为目标模型，`V1` 只激活子集”的推进方式。

## 10. 附录 A 决策背景与弃选方案摘要

本附录吸收原 `19_world_state_restructuring_decision_frame.md` 与 `20_relationship_and_event_extension_layer_candidate.md` 的核心背景，并补充当前仍保留的少量候选说明。

### A.1 路线 A 的历史背景

路线 A 的出发点，是在不立刻改写 `World State` 主表的前提下，先保留 `9` 类一级实体骨架，通过关系视图与事件视图吸收跨家庭、跨角色、跨事件链路的协同语义。它的优势是迁移成本低，劣势是容易长期保留双重事实源。

### A.2 路线 B 成为当前正式目标方向的原因

随着 `Step 47` 的收口推进，路线 B 的优势变得更明确：

1. 它与原则层和运行时层更一致；
2. 它更适合把 `HealthProfile` 与 `MedicationAsset` 这类天然可合并对象下沉；
3. 它能让 `CareRelationship / CareEvent` 与“家庭共居智能体”的语义更直接对齐；
4. 它允许以“完整模型 + V1 最小激活子集”的方式推进，而不是维持长期过渡态。

### A.3 当时未被路线 A 吸收的内容

原 `20` 号文档中的扩展层方案，最终没有被提升为当前主方向，主要因为它会把旧骨架与新语义长期并存。当前仅保留其作为对照与风险说明的价值，不再作为活跃主线。

### A.4 仍保留的候选说明

1. `CareRelationship` 仍保留复合责任主体候选，用于表达远程子女、保姆、人工坐席等多方共担照护职责的现实；
2. `phase` 的长期演进路径仍保留为候选受控枚举，但 `V1` 仅允许采集 `initial -> familiar` 的观测信号，不参与决策；
3. 以上候选都不改变本文件已冻结的七实体目标模型方向。
