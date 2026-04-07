# Kinbot Phase 3 状态模型与数据模型决策收口包

---

文档版本：v1.1
创建日期：2026-04-06
作者：Codex-架构师

文档变更记录：
- v1.1 | 2026-04-07 | Codex-架构师 | 按 `Phase 4.5` 补入 `Self` 视图位占位说明，明确其只服务长期演化，不进入 `V1` 已冻结实体集。
- v1.0 | 2026-04-06 | Codex-架构师 | 新增文档，作为 `Phase 3` 收口包，用于汇总本阶段的正式判断、冻结项、未冻结项与用户审阅要点。

---

## 1. 文档定位

本文档用于作为 `Phase 3` 的单一收口审阅入口。

它回答：

1. `Phase 3` 到底完成了什么；
2. 哪些内容已经形成正式阶段结论；
3. 哪些内容仍保持 `provisional`；
4. 用户在本轮收口时真正需要确认什么。

## 2. 本阶段已完成的核心动作

1. 已明确路线 B 升为 `Phase 3` 的正式主方向。
2. 已明确路线 A 降为对照路线与风险说明材料。
3. 已形成七实体 `World State` 目标模型：
   - `Person`
   - `CareRelationship`
   - `Household`
   - `Place`
   - `Object`
   - `Task`
   - `CareEvent`
4. 已明确旧 `9` 实体到目标模型的映射方向：
   - `HealthProfile -> Person.health_state`
   - `MedicationAsset -> Object`
   - `RoleBinding -> CareRelationship`
   - `RiskEvent -> CareEvent`
5. 已冻结 `CareEvent / Task` 的边界规则：
   - `CareEvent` 只回答“已发生 / 被判断已发生”
   - `Task` 只回答“待执行 / 正在执行”
   - `CareEvent.recommended_action` 只保留动作类型枚举，不承载执行细节
6. 已给出 `V1` 最小激活子集。
7. 已给出从当前骨架到目标模型的建议迁移顺序。

## 3. 本阶段对应文档

主文档：

1. `docs/02_p1_architecture/05_world_state_schema.md`

评审支撑文档：

1. `docs/08_reviews/19_world_state_restructuring_decision_frame.md`
2. `docs/08_reviews/20_relationship_and_event_extension_layer_candidate.md`
3. `docs/08_reviews/21_seven_entity_world_state_target_model.md`

## 4. 当前已冻结的阶段结论

以下内容当前可视为 `Phase 3` 的正式阶段结论：

1. 路线 B 为当前正式目标方向。
2. 七实体目标模型方向成立。
3. 路线 A 不再作为主方向。
4. `Task` 保留，`RiskEvent` 升级为 `CareEvent`。
5. `recommended_action` 只允许保留动作类型枚举。

## 5. 当前仍未冻结的内容

以下内容仍保持 `provisional`，不应伪装成已冻结事实：

1. 七实体各自的完整字段表。
2. `CareRelationship` 是否需要连续型关系质量维度。
3. `CareEvent` 的最终事件族全集。
4. proto 与下游接口的具体 breaking change 策略。

### 5.1 `Self` 视图位说明（候选）

在 `Phase 4.5` 中，允许追加一个长期演化所需的候选占位：

- `Self` 视图位

它回答的不是外部照护事实，而是：

1. 机器人如何理解自己的状态
2. 机器人如何记录自身近期表现与失误
3. 长期演化范式如何拥有“主语”

当前约束：

- `Self` 不是正式实体；
- 不进入 `V1` 已冻结实体集；
- 只作为长期演化与生成补强的占位说明存在。

## 6. 当前阶段判断

如果按 `18` 号文档对 `Phase 3` 的定义来看，当前阶段已经从：

- “是否要改”

推进到：

- “改成什么”
- “`V1` 先激活什么”
- “下一步如何迁移”

因此，当前可将 `Phase 3` 判定为：

**实质完成，允许进入阶段收口确认。**

## 7. 本轮建议用户重点确认

1. 是否接受将 `Phase 3` 判定为“实质完成，允许收口”。
2. 是否接受路线 B 作为当前正式目标方向。
3. 是否接受七实体目标模型与旧 `9` 实体的映射方式。
4. 是否接受 `CareEvent / Task` 的边界规则。
5. 是否接受当前把完整字段与迁移细节继续留给下一阶段，而不在本轮伪装成已冻结。

## 8. 下一阶段入口

若本轮收口通过，下一步进入：

**Phase 4：下游方案与评审包同步**

重点将是：

1. 把七实体目标模型映射回 `PDCP` 评审包与模块方案下发基线；
2. 明确 `KBT-32 / KBT-33` 的承接关系；
3. 准备 proto / 下游接口迁移策略。
