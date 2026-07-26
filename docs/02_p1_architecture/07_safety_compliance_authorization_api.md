# 安全合规授权接口

---

文档版本：v1.11
创建日期：2026-03-08
作者：Codex-架构师

文档变更记录：
- v1.11 | 2026-07-25 | Codex-架构师 | 对齐 L1 最终评审：重大许可变化和安全干预先返回当前 TaskWorker，由 TaskWorker 判断是否影响根任务并向 A0 升级；正常情况下不存在 RobotSkillSystem／F1／G3 直接向 A0 发起业务升级的路径。具体事件结构仍由 L2 设计。
- v1.10 | 2026-07-25 | Codex-架构师 | 对齐已选定的当前 L1 架构名称，移除正文中的“方案三”称呼；授权、动作许可和硬安全三层语义不变。
- v1.9 | 2026-07-25 | Codex-架构师 | 补齐候选到实际操作的闭环契约：ActionProposal 增加状态不确定性、允许修正范围、预先允许的等价操作和完成条件；G3 的 PermitDecision 统一为 approved／constrained／substituted／rejected，并以独立 revoked 事件撤销既有许可；实际操作、差异和理由先返回直接提案者，重大变化主动推送契约 Owner，TaskWorker 只依据实际结果更新状态。
- v1.8 | 2026-07-25 | Codex-架构师 | 修正信息操作治理边界：TaskWorker 的内部 Result／Evidence 可提交 O3 或上级 Agent；任何面向用户、App、云、第三方或责任主体的信息操作都必须形成 ActionProposal，经 G3 返回 PermitDecision 后再由 RobotSkill 或受控连接器执行，只有物理动作继续进入 F1。
- v1.7 | 2026-07-25 | Codex-架构师 | 对齐新版方案三：新增主动任务的 `BusinessAuthorization`，并与动作级 `PermitDecision / PermitLease`、F1 的 `SafetyIntervention` 分层；TaskWorker 或 RobotSkill 内部 Agent 作为动作 Owner，经 AP3 校验租约后向 G3 提交候选。
- v1.6 | 2026-07-23 | Codex-架构师 | 对齐 16 号方案三：将逻辑审批接口映射到 G3 的事件驱动 PermitDecision，补充许可范围与期限、否决理由、安全行为类别和双路反馈；明确 F1 独立产生 SafetyIntervention，物理否决不得使用空命令或沿用上一条运动命令。
- v1.5 | 2026-04-21 | Codex-架构师 | 吸收董事长汇报反馈：将人工服务 / 坐席审批语义调整为 `KBT-57` 候选位，未冻结前不进入当前最小审批契约主链。
- v1.4 | 2026-04-09 | Codex-架构师 | 继续压缩当前活跃主线复杂度：明确本文主干只承接 `V1` 最小审批契约，将后续适配位中的人工服务 / 第三方策略下沉为附录说明，并收紧示例体量。
- v1.3 | 2026-04-09 | Codex-架构师 | 按 `V1` 真实复杂度下降口径，将人工服务与第三方平台相关审批语义降为后续适配位的预留字段 / 结果，不再把它们写成当前最小审批契约的默认主路径。
- v1.2 | 2026-04-08 | Codex-架构师 | 同步运行时基线文件重命名，更新与多执行范式基线的引用路径。
- v1.1 | 2026-04-06 | Codex-架构师 | 按家庭共居智能体革新路线对齐本文，明确审批接口是跨执行范式的系统级硬边界；连续流式、事件驱动和人工接力均不得绕过该接口。
- v1.0 | 2026-03-08 | Codex-架构师 | 文档创建。

---

## 1. 文档目的

本文档定义一代机器人的主动业务授权、动作审批和硬安全反馈接口。

这份文档关注的不是某个 HTTP 路由或 RPC 协议，而是系统内部必须稳定下来的审批契约：

1. 哪些主动任务必须先获得 `BusinessAuthorization`
2. 什么动作需要经过 G3 的语义许可
3. 授权和许可分别读取哪些上下文、返回哪些结果
4. G3 与 F1 的修正或干预如何先反馈给当前 TaskWorker，并在影响根任务时逐级升级到 A0
5. 当前 `V1` 最小主链里，哪些结果会触发确认、重新规划、故障保护或审计

在当前 `Phase 2` 口径下，还要再补一条：

6. 不论动作来自离散决策、事件触发、连续策略还是人工接力，都不能绕过这套系统级硬边界

补充边界：

- 本文主干优先回答当前 `V1` 最小审批契约；
- `KBT-57` 中的人工服务 / 坐席候选，以及后续适配位中的第三方平台调用与转接链，统一下沉到文末附录说明，不再与主干混写成当前默认主路径。
- 本文当前继续保留为单文件，是因为动作分类、审批上下文、结果语义、原因码与最小示例必须保持在同一份安全契约事实源中，避免再次拆出并列的审批边界入口。
- 在 [16_recursive_agentic_robot_system_architecture.md](16_recursive_agentic_robot_system_architecture.md) 的当前 L1 架构中，主动业务授权、动作许可和硬安全分属三层：A0 为机器人主动发起且可能产生外部影响的任务签发 `BusinessAuthorization`；TaskWorker 或 RobotSkill 内部 Agent 提交 `ActionProposal`，AP3 先校验契约 Owner、WorkerLease、隔离令牌与执行器范围，G3 再按需返回 `PermitDecision / PermitLease`；F1 独立返回 `SafetyIntervention`。重大许可变化和安全干预先由当前 TaskWorker 判断任务影响，只有影响根任务、跨业务优先级或用户承诺时才向 A0 升级。用户明确请求已由根任务契约授权，不重复申请 `BusinessAuthorization`。

## 2. 当前设计前提

本版本基于以下已确认条件：

- 项目主节点是 2026 年 12 月 31 日达到量产预备状态
- 项目从 2026 年 1 月 1 日起算，前两个月已做需求收集与 Demo 概念验证
- 当前已有真实自研机器人样机，可用于验证部分行为闭环
- 目标系统是机器人本体；穿戴、智能家居、手机 App、后台云服务属于伴生系统
- 已授权行为需要做到完全自主
- 高风险异常默认先联动家属，并保留社区 / 物业 / 120 路线接口
- 需求侧曾明确提出后台人工服务与客服运营坐席首线角色；董事长反馈后该能力由 `KBT-57` 承接是否联动立项，未冻结前不写入当前最小审批契约的主链成立前提
- 一期紧急用药仍限定在“提醒 / 递送 / 确认 / 告知”边界
- 机器人直接入网拨号只做架构预留
- 第三方平台必须严格审核；机器人负责准确传递信息和保留审计链，交付由平台负责
- 储物仓必须具备防夹手、电动开关和开关状态记录能力
- `KBT-7` 已正式冻结为“分层状态机管理顶层模式，行为树管理叶子执行”
- `KBT-7` 已显式冻结 7 类高风险异常与 7 类关键安全故障

## 3. 接口目标

接口必须同时解决 4 个问题：

1. `安全`
说明：动作会不会伤人、撞物、引发误药、误报或其他风险。

2. `合规`
说明：动作是否满足隐私、医疗、通信、第三方服务接入和本地策略限制。

3. `授权`
说明：发起者、受影响人和执行主体之间是否满足授权与角色边界。

4. `可审计`
说明：每次批准、约束、等价替代、拒绝、撤销和转接都能回放原因链。

## 4. 设计原则

1. 所有高风险动作统一走一套审批接口，不能各模块自定义旁路。
2. 接口返回的是标准化决策结果，不直接替代执行模块。
3. 接口必须能表达“批准”“约束”“选择预先允许的等价操作”“拒绝”“撤销”，并把“待确认”“转人工”和“故障保护”表达为下一步要求。
4. 接口必须支持多角色冲突仲裁。
5. 接口必须显式表达第三方责任边界。
6. 接口必须在离线时保留本地最小可用能力。
7. 接口是跨执行范式的硬边界，不因 `Orient + Decide` 融合、局部端到端化或事件驱动而失效。
8. `BusinessAuthorization` 只回答“机器人是否可以主动开始这项业务任务”；`PermitDecision` 回答“当前信息操作或物理动作候选是否可以执行”；`SafetyIntervention` 记录“F1 实际采取了什么物理安全动作”。三者不能合并。
9. Result／Evidence 是系统内部结果，不等于对外输出。查询、消息、服务调用、责任交接以及向用户呈现结果都属于信息操作，必须形成 `ActionProposal` 并经过 G3；许可后由 RobotSkill 或受控连接器执行，不进入 F1。
10. `ActionProposal` 必须区分状态估计的不确定性与下层允许修正的范围。前者描述“系统知道得有多准”，后者描述“G3、Skill 和 F1 可以改多少”。
11. G3 不能任意把一个候选改成另一个业务行动。它只能批准、在允许范围内收紧参数、从候选预先列出的等价操作中选择替代、拒绝或撤销。
12. `PermitDecision` 必须返回许可后的实际操作、候选与实际操作的差异和原因。直接提案者必须收到；影响完成判据或下一步前提时，契约 Owner 必须收到主动通知。
13. TaskWorker 不能把候选当作已经发生的事实，只能依据实际操作、实际结果、状态和证据更新任务状态。

### 4.1 接口与状态机的关系

当前一代架构里，这个审批接口位于 `decision_orchestration` 与执行模块之间，并直接消费 `KBT-7` 已冻结的状态机输出。

约束关系先固定如下：

1. `A1` 到 `A7` 高风险异常是审批上下文的一部分，会影响审批强度、确认对象和是否转人工。
2. `F1` 到 `F7` 关键安全故障不是普通审批条件，而是硬中断条件；一旦命中，接口需要直接返回“进入故障保护”结果。
3. 业务状态机决定“当前准备做什么”，审批接口决定“当前是否允许、允许执行什么、是否需要确认、转接或进入故障保护”。

### 4.2 接口与多执行范式的关系

当前 `Phase 2` 下，这个接口的正式定位是：

1. 在离散决策范式中，它是 `decision_orchestration -> 执行模块` 之间的强制前置门。
2. 在事件驱动范式中，它是“事件触发后的动作编排”进入执行前的统一审查门。
3. 在连续流式范式中，局部端到端策略可以缩短认知和决策路径，但不能绕过该接口定义的安全、合规和授权边界。
4. 在长周期演化范式中，它不直接决定长期学习内容，但会决定长期策略是否可转化为即时可执行动作。
5. 有效 `PermitLease` 允许领域快环在批准范围内持续运行；候选越界、许可到期或风险条件变化时重新触发审批。F1 始终在独立实时周期检查物理信号，不等待本接口。

### 4.3 候选、许可、执行和反馈

SysML v2 `SequenceView`：

![候选操作、许可、实际执行与状态更新时序视图](16_sysmlv2_effective_operation_feedback_sequence_view.svg)

这张图表达运行时闭环，不是网络接口拓扑。信息操作在 G3 许可后由 RobotSkill 或受控连接器执行；物理动作继续进入 F1。两条路径都必须把实际操作和实际结果返回任务 Owner。

## 5. 适用范围

### 5.1 当前 `V1` 最小审批契约

以下动作属于当前主干，必须进入该接口：

1. 机器人移动到人
2. 开关储物仓
3. 送药、提醒服药、记录服药确认
4. 家属提醒、社区 / 物业通知、120 路线预留动作
5. 高风险主动打断与主动靠近
6. 敏感数据外发

补充说明：

- 这些动作无论来自业务状态机、事件引擎、连续策略适配层还是人工坐席，都必须进入同一审批接口。

### 5.2 后续适配位

以下动作继续保留为后续适配位，不写成当前 `V1` 最小闭环的成立前提：

1. 问诊转接、人工服务接入、第三方平台调用
2. 外部下单，如买药、配送、外卖

以下动作通常不需要单独走高风险审批，但仍需受本地策略限制：

1. 低风险对话回复
2. 普通屏幕展示
3. 非敏感本地状态刷新
4. 被动唤醒与基础 ASR / TTS

## 6. 角色与责任边界

### 6.1 角色

接口至少要支持以下主体：

- `elder`：老人本人
- `child`：子女
- `caregiver`：保姆或照护者
- `visitor`：访客
- `robot_system`：机器人自主触发
- `ops_seat`：后续适配位中的后台客服运营坐席
- `third_party_platform`：后续适配位中的互联网医院、药店、配送、内容平台等

### 6.2 责任边界

建议固定以下边界：

1. 机器人系统负责：
- 感知与判断链的本地安全
- 准确传递用户信息与上下文
- 授权校验
- 审计与记录
- 本地动作执行安全

2. 第三方平台负责：
- 平台侧服务交付
- 平台业务过程中的专业责任
- 药品、外卖、内容等服务的履约

3. 客服运营坐席负责：
- 首线人工接入
- 人工确认和转接
- 必要时把请求转给医生平台或其他外部主体

## 7. 动作分类

建议把待审批动作统一表达为 `ActionProposal`，并至少分成以下类别：

| 动作类型 | 示例 |
| --- | --- |
| `navigate_to_person` | 主动靠近老人、到人提醒 |
| `open_compartment` | 打开储物仓递药 |
| `deliver_medication` | 送药到人 |
| `confirm_medication_taken` | 记录用户已服药 |
| `notify_family` | 通知家属 |
| `connect_manual_service` | 后续适配位：接入客服运营坐席 |
| `transfer_manual_service` | 后续适配位：将人工服务转给第三方 |
| `invoke_third_party_service` | 后续适配位：互联网医院、药店、配送平台 |
| `share_sensitive_data` | 外发健康、身份或病历信息 |
| `interrupt_user` | 主动打断用户 |
| `request_measurement` | 发起问诊式补采或测量请求 |

## 8. 风险等级

建议统一使用 4 级风险：

| 等级 | 含义 | 例子 |
| --- | --- | --- |
| `low` | 低风险，可在授权下自动执行 | 低侵入提醒 |
| `medium` | 中风险，可自动执行但要记录原因 | 到人提醒、普通数据共享 |
| `high` | 高风险，需要更严格审批或确认 | 打开储物仓、送药、家属上报 |
| `critical` | 极高风险，默认走人工确认或升级 | 高风险异常联动、敏感外部服务、越权指令 |

## 9. 核心对象

### 9.1 `ActionProposal`

定义：

- 一次待审批动作的标准化表达

建议字段：

| 字段 | 类型 | 说明 |
| --- | --- | --- |
| `proposal_id` | string | 唯一 ID |
| `action_type` | enum | 动作类型 |
| `effect_domain` | enum | `information`／`physical`；决定许可后由 RobotSkill 直接执行，还是继续进入 F1 |
| `origin_paradigm` | enum | `discrete` / `continuous` / `event_driven` / `long_cycle` |
| `initiator_role` | enum | 谁发起 |
| `target_person_id` | string | 作用对象 |
| `executor` | enum | 机器人、App、云服务、第三方平台 |
| `risk_level` | enum | 风险等级 |
| `payload` | object | 期望执行的操作与参数 |
| `state_uncertainty` | object | 候选所依据状态的误差、不确定性和新鲜度 |
| `adjustment_envelope` | object | G3、Skill 或 F1 可以在不改变目标和操作类型的前提下修正的参数范围 |
| `allowed_equivalent_operations` | object[] | TaskWorker 预先允许 G3 选择的等价操作；为空时 G3 不得替换 |
| `completion_predicate` | object | 当前操作怎样才算完成 |
| `next_step_preconditions` | object | 下一步成立所依赖的位置、对象、时限、结果等条件 |
| `non_adjustable_constraints` | object | 不得改变的目标、对象、权限、数据用途和业务约束 |
| `context_snapshot_ref` | string | 决策快照引用 |
| `requested_at` | string | 发起时间 |
| `task_contract_ref` | string | 当前 TaskWorker 或 Skill 执行子契约引用 |
| `business_authorization_ref` | string | 主动任务的 `BusinessAuthorization` 引用；用户明确请求可为空 |
| `worker_lease_ref` | string | AP3 签发的有效 WorkerLease 引用 |
| `proposal_originator_ref` | string | 直接提出候选的 RobotSkill 或内部 Agent；必须接收 PermitDecision |
| `contract_owner_ref` | string | 当前任务契约的唯一 Owner；重大变化必须主动推送 |
| `idempotency_key` | string | 防止同一外部操作重复执行 |

### 9.2 `BusinessAuthorization`

定义：

- A0 对基础业务 Agent 的主动任务提案所作的业务级授权。它允许基础业务 Agent 形成任务契约并向 AP3 提交 `WorkerIntent`，但不直接许可任何具体信息操作或物理动作。

建议字段：

| 字段 | 类型 | 说明 |
| --- | --- | --- |
| `business_authorization_id` | string | 唯一 ID |
| `initiative_proposal_id` | string | 对应主动提案 |
| `business_domain` | enum | `HealthAndCare` / `CompanionshipAndRelationship` / `HomeSafety` / `EnvironmentAndObjects` |
| `result` | enum | `approved` / `constrained` / `deferred` / `denied` |
| `scope` | object | 允许的目标、受影响对象、外部影响、数据用途和地域范围 |
| `constraints` | object | 时间、预算、打扰、风险和资源限制 |
| `valid_until` | string | 到期时间 |
| `recheck_conditions` | object[] | 暂缓后重新评估的条件 |
| `root_contract_ref` | string | 根任务或系统长期承诺引用 |
| `state_refs` | string[] | 裁定使用的 SharedState 引用 |
| `memory_refs` | string[] | 裁定使用的 SharedMemory 引用 |
| `evidence_refs` | string[] | 裁定使用的 Evidence 引用 |
| `audit_ref` | string | 审计引用 |

规则：

1. `approved / constrained` 才允许创建或复用 TaskWorker。
2. `deferred / denied` 不创建 TaskWorker，不产生用户可见或物理外部输出。
3. 用户明确请求由根任务契约直接授权，不重复签发本对象。
4. 预定义紧急契约可以绕过 A0 即时批准，但必须固定触发条件、权限上限、有效期和停止条件，且不能绕过 AP3、G3 和 F1。

### 9.3 `PolicyContext`

定义：

- 审批时读取的策略上下文

建议字段：

| 字段 | 类型 | 说明 |
| --- | --- | --- |
| `authorization_state` | object | 当前授权 |
| `role_bindings` | object[] | 当前角色绑定 |
| `risk_events` | object[] | 当前风险事件 |
| `state_machine_context` | object | 当前顶层状态、业务主状态与约束子状态 |
| `active_anomaly_classes` | string[] | 当前命中的 `A1` 到 `A7` 异常类 |
| `active_fault_classes` | string[] | 当前命中的 `F1` 到 `F7` 关键安全故障类 |
| `network_state` | object | 网络状态 |
| `home_mode` | enum | 白天、夜间、异常中等 |
| `medication_context` | object | 药品、仓门、禁忌和时效 |
| `service_link_context` | object[] | 后续适配位中的外部服务准入与责任边界 |
| `manual_service_state` | object | 后续适配位中的客服运营坐席接入状态 |

### 9.4 `PermitDecision`

定义：

- G3 对一次 `ActionProposal` 返回的标准结果。它描述许可后的实际操作，不代替执行结果。

建议字段：

| 字段 | 类型 | 说明 |
| --- | --- | --- |
| `decision_id` | string | 唯一 ID |
| `proposal_id` | string | 对应动作 |
| `disposition` | enum | `approved` / `constrained` / `substituted` / `rejected` |
| `effective_operation` | object | `approved／constrained／substituted` 时必须给出实际操作；`rejected` 时标为 `NotExecuted` |
| `operation_delta` | object | 候选与实际操作之间的参数、路径、对象、数据范围或时限差异 |
| `reason_codes` | string[] | 原因码 |
| `materiality` | enum | `minor` / `material`；决定是否主动推送契约 Owner |
| `requires_owner_notification` | boolean | 是否必须立即通知任务契约 Owner |
| `required_next_step` | enum | `execute` / `confirm` / `transfer_reserved` / `stop` / `safe_hold` / `replan` / `enter_fault_protection` |
| `constraints` | object | 实际执行仍需遵守的限速、限时、可共享字段等约束 |
| `permit_scope` | object | 允许的动作类别、参数范围、空间、对象和数据用途 |
| `valid_until` | string | `PermitLease` 到期时间 |
| `revocation_epoch` | integer | 撤销版本；低于当前版本的许可立即失效 |
| `safe_fallback_class` | enum | 物理动作被拒绝或撤销后的减速、制动、保持、释放、停机等安全行为类别 |
| `retryable` | boolean | 当前理由是否允许修正后重试 |
| `alternative_actions` | object[] | 仅供 TaskWorker 重新规划的建议，不等于 G3 已许可的新行动 |
| `evidence_refs` | string[] | 支撑本次裁决的状态与证据引用 |
| `state_transition_hint` | object | 建议进入的顶层或业务状态 |
| `confirmation_targets` | object[] | 需要谁确认 |
| `manual_transfer_target` | string | 需要转给谁 |
| `audit_ref` | string | 审计引用 |

规则：

1. `approved` 的 `effective_operation` 与候选相同。
2. `constrained` 只能在 `adjustment_envelope` 内收紧参数，不得改变目标、对象或操作类型。
3. `substituted` 只能从 `allowed_equivalent_operations` 中选择；没有预先允许的等价操作时只能 `rejected`。
4. `confirmation_required`、`manual_service_required` 和 `fault_protection_required` 不再与许可结果并列，改由 `required_next_step` 表达。
5. 直接提案者必须收到完整 `PermitDecision`。`substituted`、`rejected` 以及任何影响完成判据、下一步前提、外部影响、权限、预算、时限或任务终态的 `constrained` 都属于 `material`，必须主动推送契约 Owner。

### 9.5 `PermitRevocation`

定义：

- 使已经签发的 `PermitDecision／PermitLease` 失效的独立生命周期事件。`revoked` 不是一次新候选的初始裁决。

建议字段：

| 字段 | 类型 | 说明 |
| --- | --- | --- |
| `revocation_id` | string | 唯一 ID |
| `decision_id` | string | 被撤销的许可决定 |
| `permit_lease_ref` | string | 被撤销的许可租约 |
| `revocation_epoch` | integer | 新撤销版本 |
| `effective_at` | string | 生效时间 |
| `required_next_step` | enum | `stop` / `safe_hold` / `cancel` / `enter_fault_protection` |
| `reason_codes` | string[] | 撤销原因 |
| `audit_ref` | string | 审计引用 |

`PermitRevocation` 必须立即推送直接执行者和契约 Owner。物理操作由 F1 落实明确的停止或安全保持，不能把撤销解释为空命令，也不能继续沿用旧命令。

### 9.6 `SkillOutcome / ExecutionDeviation`

定义：

- RobotSkill 或 F1 对实际执行结果和候选—实际偏差的结构化反馈。

建议字段：

| 字段 | 类型 | 说明 |
| --- | --- | --- |
| `execution_id` | string | 本次实际执行 ID |
| `decision_id` | string | 对应 PermitDecision |
| `actual_operation` | object | 实际采取的操作 |
| `actual_outcome` | object | 实际结果、终止状态和外部响应 |
| `execution_deviation` | object | 相对 `effective_operation` 的偏差 |
| `completion_predicate_met` | boolean | 是否满足完成判据 |
| `next_step_preconditions_met` | boolean | 是否仍满足下一步前提 |
| `evidence_refs` | string[] | 实际结果证据 |
| `terminal_status` | enum | `completed` / `failed` / `canceled` / `timed_out` / `intervened` |

细微修正可以随周期性 `SkillOutcome` 合并返回；只要影响完成判据或下一步前提，就必须主动产生 `ExecutionDeviation`。`proposal_id → decision_id → execution_id` 必须可追溯。

### 9.7 `ConfirmationRequest`

定义：

- 当动作必须额外确认时，下发给 App、用户或人工坐席的确认请求

建议字段：

| 字段 | 类型 | 说明 |
| --- | --- | --- |
| `confirmation_id` | string | 唯一 ID |
| `decision_id` | string | 对应审批结果 |
| `required_roles` | string[] | 必须确认的角色 |
| `timeout_ms` | integer | 超时时间 |
| `fallback_policy` | object | 超时后处理策略 |

## 10. 统一审批接口

建议逻辑接口固定为：

### `evaluate_action(proposal, policy_context) -> permit_decision`

输入：

- `ActionProposal`
- `PolicyContext`

输出：

- `PermitDecision`

审批流程建议顺序：

1. 校验动作类型是否合法
2. 校验当前是否存在 `F1` 到 `F7` 关键安全故障
3. 校验角色与授权
4. 校验当前风险状态、`A1` 到 `A7` 异常类以及夜间 / 离线限制
5. 校验第三方平台准入状态
6. 校验是否触发冲突仲裁
7. 按候选允许范围生成 `approved／constrained／substituted／rejected`
8. 填入 `effective_operation`、差异、理由、影响程度和下一步要求
9. 先返回直接提案者；重大变化主动推送契约 Owner
10. 写入审计记录

既有许可还需要两个配套接口：

- `revoke_permit(decision_id, reason) -> PermitRevocation`
- `report_operation_outcome(decision_id, outcome) -> SkillOutcome`

## 11. 决策结果语义

### 11.1 `approved`

实际操作与候选相同。执行模块仍需遵守许可范围和期限，并回传实际结果。

### 11.2 `constrained`

目标、对象和操作类型不变，只在 `adjustment_envelope` 内收紧参数，例如降低速度、缩小数据字段、提前十厘米停车或缩短许可期限。影响完成判据或下一步前提时按重大变化主动推送 Owner；否则可以随 `SkillOutcome` 合并返回。

### 11.3 `substituted`

实际操作从 `allowed_equivalent_operations` 中选择，例如同一提醒契约预先允许“屏幕显示”替代“TTS 播报”。G3 不能把“自动买药”临时改成“提醒家属”，除非 TaskWorker 已把后者列为等价操作；否则应拒绝并把它作为重新规划建议。`substituted` 一律主动推送契约 Owner。

### 11.4 `rejected`

本次候选不能执行，`effective_operation` 标为 `NotExecuted`。如果系统还需要停止先前已经获许可的操作，必须另行签发 `PermitRevocation`；不能把“拒绝新候选”和“撤销旧许可”混成同一个结果。TaskWorker 收到拒绝后不得继续等待本次候选的完成事件。

典型原因包括越权、夜间静默限制、第三方未准入、敏感数据超范围、药物禁忌和对象不匹配。G3 可以提供替代建议，但建议必须重新进入 TaskWorker 的规划与候选流程。

### 11.5 `revoked`

撤销作用于已经生效的许可，不与一次新候选的初始裁决混用。它立即使旧 `PermitLease` 失效，并主动通知直接执行者和契约 Owner。旧执行实例必须被撤销版本或隔离令牌拒绝。

### 11.6 下一步要求

`confirmation_required`、`manual_service_required` 和 `fault_protection_required` 改为 `required_next_step`：

- `confirm`：等待指定角色确认后重新评价原候选。
- `transfer_reserved`：后续适配位启用时交给人工或第三方接力。
- `enter_fault_protection`：命中关键安全故障，立即进入故障保护。

这样可以同时表达“原候选被拒绝”和“下一步需要确认”，避免把许可结果与流程要求混为一个枚举。

F1 因碰撞、失稳、防夹、过流、过温或急停采取实时干预时，另行产生 `SafetyIntervention`，记录实际动作、偏差、原因码、实时证据和复位条件。它先反馈直接执行者；影响任务完成或下一步前提时再主动推送 TaskWorker。只有 TaskWorker 判断当前任务无法继续在原契约内履行，并且影响根任务、跨业务优先级或用户承诺时，才向 A0 升级。

### 11.7 主动推送边界

是否主动推送不使用“偏了多少厘米”这一种固定阈值，而使用候选自带的完成判据和下一步前提：

| 接收者 | 必须主动推送的情况 | 可合并返回的情况 |
| --- | --- | --- |
| 直接提案者 | 每个 `PermitDecision`、`PermitRevocation` | 无 |
| TaskWorker／契约 Owner | `substituted`、`rejected`、`revoked`；或任何影响完成判据、下一步前提、外部影响、权限、预算、时限、任务终态的约束或执行偏差 | 不影响上述条件的细微修正 |
| A0 | TaskWorker 判断当前任务已无法在原契约内履行，并且影响根任务、跨业务优先级、用户承诺或对外解释 | 纯局部执行修正；TaskWorker仍可在当前契约内恢复 |

G3 判断许可变化是否足以影响当前任务，RobotSkill／F1 判断执行偏差是否足以影响当前任务；TaskWorker 判断是否进一步影响根任务。AP3 负责可靠投递、幂等、记录和重试，不解释业务影响。正常情况下不存在 G3、F1 或 RobotSkillSystem 直接向 A0 发起业务升级的路径。

## 12. 特殊策略

### 12.1 穿戴数据策略

基于当前已知限制，一期不能默认依赖“任意品牌手表都能持续实时广播心率”。

因此审批侧必须支持：

1. `broadcast`
说明：设备广播模式可用时，允许使用较新鲜数据。

2. `sdk_bound`
说明：已完成合作和 SDK 接入时，允许按平台能力读取。

3. `questionnaire_driven`
说明：当实时链路不可得时，通过问诊、用户手动测量或 BLE 外设补采数据。

当数据新鲜度不足时：

- 不能把低新鲜度心率当作强自动决策依据
- 应优先触发补采、复核或家属远程确认；人工服务 / 坐席是否前置进入主链由 `KBT-57` 决定

### 12.2 储物仓策略

储物仓相关动作必须额外校验：

- 仓门是否空闲
- 防夹手状态
- 是否允许电动开关
- 当前目标药品或物品是否匹配
- 是否需要交接确认

能力优先级：

1. `必须有`
- 防夹手
- 电动开关
- 开关仓状态记录

2. `应该有`
- 储物记录
- 交接确认

3. `可以有`
- 防误取
- 防错拿

### 12.3（附录）后续适配位中的第三方平台策略

当后续适配位被激活时，第三方服务调用前至少仍需校验：

1. 平台是否已审核准入
2. 当前动作是否在平台责任范围内
3. 当前外发数据是否满足最小必要原则
4. 是否存在人工转接要求

机器人侧责任仍固定为：

1. 确保传递信息准确
2. 保留审计链
3. 不把平台责任误记为机器人已完成

## 13. 原因码建议

建议固定一组可审计原因码，并按 5 组管理：

- `AUTH_SCOPE_MISSING`
- `ROLE_CONFLICT_CONFIRMATION_REQUIRED`
- `NIGHT_SILENT_RESTRICTION`
- `OFFLINE_EXTERNAL_CALL_BLOCKED`
- `SENSITIVE_DATA_SCOPE_EXCEEDED`
- `SERVICE_LINK_NOT_QUALIFIED`
- `MEDICATION_CONTRAINDICATION`
- `COMPARTMENT_SAFETY_LOCKED`
- `MANUAL_SERVICE_REQUIRED`
- `THIRD_PARTY_RESPONSIBILITY_ONLY`
- `ANOMALY_A1_ACTIVE` 到 `ANOMALY_A7_ACTIVE`
- `FAULT_F1_ACTIVE` 到 `FAULT_F7_ACTIVE`

说明：

- `ANOMALY_*` 原因码用于表达高风险异常上下文已生效。
- `FAULT_*` 原因码用于表达关键安全故障已生效，并通常伴随 `required_next_step = enter_fault_protection`。

## 14. 示例

### 14.1 到人提醒

```json
{
  "proposal_id": "p_001",
  "action_type": "navigate_to_person",
  "effect_domain": "physical",
  "initiator_role": "robot_system",
  "target_person_id": "elder_001",
  "executor": "robot",
  "risk_level": "medium",
  "payload": {
    "purpose": "medication_reminder",
    "target_pose": "pose_near_elder"
  },
  "state_uncertainty": {
    "target_pose_error_m": 0.12
  },
  "adjustment_envelope": {
    "stop_distance_m": [0.8, 1.2],
    "max_speed_mps": 0.4
  },
  "allowed_equivalent_operations": [],
  "completion_predicate": {
    "within_distance_m": 1.2
  },
  "next_step_preconditions": {
    "person_visible": true
  },
  "proposal_originator_ref": "NavigationSkill/session_42",
  "contract_owner_ref": "MedicationReminderTaskWorker/17"
}
```

可能返回：

```json
{
  "decision_id": "d_001",
  "proposal_id": "p_001",
  "disposition": "constrained",
  "effective_operation": {
    "target_pose": "pose_near_elder",
    "stop_distance_m": 1.0,
    "max_speed_mps": 0.3
  },
  "operation_delta": {
    "max_speed_mps": -0.1
  },
  "reason_codes": [
    "INDOOR_APPROACH_MARGIN_APPLIED"
  ],
  "materiality": "minor",
  "requires_owner_notification": false,
  "required_next_step": "execute",
  "constraints": {
    "speed_limit": "indoor_safe",
    "must_announce_before_approach": true
  },
  "audit_ref": "audit_001"
}
```

### 14.2 打开储物仓递药

```json
{
  "proposal_id": "p_002",
  "action_type": "open_compartment",
  "effect_domain": "physical",
  "initiator_role": "robot_system",
  "target_person_id": "elder_001",
  "executor": "robot",
  "risk_level": "high",
  "payload": {
    "compartment_id": "bin_01",
    "medication_id": "med_001"
  },
  "state_uncertainty": {
    "door_state": "closed",
    "confidence": 0.99
  },
  "adjustment_envelope": {
    "open_angle_deg": [75, 90]
  },
  "allowed_equivalent_operations": [],
  "completion_predicate": {
    "door_state": "open"
  },
  "next_step_preconditions": {
    "robot_stationary": true,
    "anti_pinch_clear": true
  },
  "proposal_originator_ref": "CompartmentSkill/session_8",
  "contract_owner_ref": "MedicationDeliveryTaskWorker/3"
}
```

可能返回：

```json
{
  "decision_id": "d_002",
  "proposal_id": "p_002",
  "disposition": "approved",
  "effective_operation": {
    "action_type": "open_compartment",
    "compartment_id": "bin_01",
    "open_angle_deg": 90
  },
  "operation_delta": {},
  "reason_codes": [],
  "materiality": "minor",
  "requires_owner_notification": false,
  "required_next_step": "execute",
  "constraints": {
    "anti_pinch_required": true,
    "handoff_confirmation_required": true
  },
  "audit_ref": "audit_002"
}
```

### 14.3（附录）后续适配位示例说明

后续适配位中的自动外部下单与高风险异常转人工，当前只保留以下结果语义，不再在本文主干中展开完整示例：

1. 外部下单默认返回 `disposition = rejected` 与 `required_next_step = confirm`，并显式标注第三方责任边界。
2. 高风险异常转人工默认返回 `disposition = rejected` 与 `required_next_step = transfer_reserved`，并显式标注转接目标与审计链。

### 14.5 关键安全故障触发故障保护

```json
{
  "decision_id": "d_005",
  "proposal_id": "p_005",
  "disposition": "rejected",
  "effective_operation": "NotExecuted",
  "operation_delta": {
    "reason": "active_safety_fault"
  },
  "reason_codes": [
    "FAULT_F1_ACTIVE"
  ],
  "materiality": "material",
  "requires_owner_notification": true,
  "required_next_step": "enter_fault_protection",
  "state_transition_hint": {
    "top_state": "故障保护"
  },
  "audit_ref": "audit_005"
}
```

## 15. 与其他文档的关系

该接口文档与以下文档强关联：

1. [世界状态结构](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/02_p1_architecture/05_world_state_schema.md)
2. [决策状态机](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/02_p1_architecture/06_decision_state_machine.md)
3. [模块分层与模块边界](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/02_p1_architecture/04_module_layers_and_boundaries.md)
4. [多尺度执行范式基线](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/02_p1_architecture/03_execution_paradigms_runtime_baseline.md)

## 16. 下一步建议

基于本文件，下一份文档建议直接写：

1. 健康事件管线与升级链路
2. 量产预备判定标准
3. Demo 到量产架构的能力缺口清单
