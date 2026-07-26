package KinbotArchitectureViewDefinitions {

    private import StandardViewDefinitions::*;

    view def <tfrv> '系统顶层功能需求视图' specializes GeneralView {
        doc /*
         * 展示问题状态、顶层系统转换、目标状态，以及安全、合规、授权、
         * 资源和低打扰要求。该视图用于表达 L0 需求与功能，不承担 L1 分解。
         */
    }

    view def <oaf> 'OODA跨空间行动流视图' specializes ActionFlowView {
        doc /*
         * 展示 Observe、Orient、Decide、Act、Feedback 的 action usage，
         * I1 到 I2、I3 的语义路径，以及实时 I1 到物理执行和硬安全的快速路径。
         */
    }

    view def <l1iv> 'L1主Agent与专业Agent互连视图' specializes InterconnectionView {
        doc /*
         * 方案一历史对照：展示 A0、A1-A4、AP1、F1 与信息空间、物理空间的关系。
         * 不作为当前 L1 正式拓扑。
         */
    }

    view def <l1siv> 'L1单一常驻主Agent互连视图' specializes InterconnectionView {
        doc /*
         * 方案二历史对照：展示 A0、O1、ST1、AP1、G1、F1 和临时子 Agent。
         * 不作为当前 L1 正式拓扑。
         */
    }

    view def <l1hiv> 'L1混合分层互连视图' specializes InterconnectionView {
        doc /*
         * 保留当前架构早期纵向分层表示，仅用于追溯视图演进，不嵌入正式正文。
         * 当前 L1 语义以 <l1bdasiv> 为准。
         */
    }

    view def <l1bdasiv> 'L1基础业务Agent与Skill跨空间互连视图' specializes InterconnectionView {
        doc /*
         * 以三栏结构展示信息空间、Kinbot 和物理空间。
         * L1 主结构包含 A0 : AgentCell、businessAgents : AgentCell [4]、
         * O3 : SharedContextService、robotSkills : RobotSkillSystem、
         * AP3 : AgentRuntimePlatform、G3 : GovernanceSystem 和
         * F1 : MechatronicSafetyPlatform 七类实体。
         * TaskWorker [0..*] 是 AP3 动态管理的 AgentCell，不增加固定 L1 类型。
         * 连接区分根契约、BusinessAuthorization、TaskContract、WorkerIntent、
         * StateRef、MemoryRef、EvidenceRef、SkillRequest、ActionProposal、
         * PermitDecision、EffectiveOperation、SkillOutcome、
         * ExecutionDeviation、PermitLease、SafetyIntervention、实时 I1 和实际动作。
         * 数字输入和物理传感数据先形成 I1；RobotSkillSystem 执行 I-P1，
         * 把 I1 解释为 I2/Evidence 后送入 O3。O3 执行 I-P2 维护 I3，
         * 不运行感知模型，也不允许 P1/I1 直接成为共享事实。显式意图 I2
         * 同时送入 O3 和 A0，用于证据保存、上下文更新和根契约建立。
         * TaskWorker 的 Result 与 Evidence 只提交 O3；外部信息操作与物理动作
         * 都由 RobotSkill 形成 ActionProposal 并经过 G3。获准的信息操作回到
         * RobotSkill 执行，只有获准的物理动作继续进入 F1。G3 的裁决先返回
         * 直接提案者，重大变化主动推送 TaskWorker；实际结果再由 RobotSkill
         * 返回 TaskWorker 并写入 O3。只有 TaskWorker 判断影响根任务时才向
         * A0 发出 RootImpactEvent；正常情况下不存在 RobotSkillSystem 到 A0
         * 的直接业务升级关系。
         */
    }

    view def <acgv> 'AgentCell统一定义视图' specializes GeneralView {
        doc /*
         * 展示 AgentCell 复用 Physical Agent 七元组和统一递归接口。
         * AgentRoleKind 是责任分类属性；A0、四个基础业务 Agent、Skill 内部
         * Agent 和 Control 内部 Agent 是带不同 roleKind 的 AgentCell 用法。
         * 只有 TaskWorker 因有界任务、终止和回收约束显式 specializes AgentCell。
         * RobotSkill 和控制／安全子系统可以包含相应角色的 AgentCell 实现。
         */
    }

    view def <bdagv> '基础业务Agent网格视图' specializes GridView {
        doc /*
         * 展示 HealthAndCare、CompanionshipAndRelationship、HomeSafety 和
         * EnvironmentAndObjects 四个 BusinessDomainKind，以及每个长期 AgentCell
         * 的责任、典型 TaskWorker 和 AccountableOwner。
         */
    }

    view def <baciiv> '基础业务Agent协调互连视图' specializes InterconnectionView {
        doc /*
         * 展开 HealthAndCare、CompanionshipAndRelationship、HomeSafety 和
         * EnvironmentAndObjects 四个基础业务 Agent 的 CoordinationPort。
         * 业务语义经 CoordinationGraph 直接到达对方；协调发起方或当前子契约
         * Owner 判断是否升级 A0。AP3 只负责通道、登记、投递、审计与取消传播，
         * O3 提供受控引用，CoordinationGraph 只记录关系；二者都不发起业务升级。
         * A0 的 RootDecision 只返回受影响实体。
         */
    }

    view def <patsv> '主动任务授权时序视图' specializes SequenceView {
        doc /*
         * 展示基础业务 Agent 静默规划、InitiativeProposal、A0 的批准、收紧、
         * 暂缓和拒绝，BusinessAuthorization、WorkerIntent、AP3 创建或复用
         * TaskWorker，以及 RobotSkill、G3、F1 的实时执行链。
         * 预定义紧急契约可绕过 A0 即时批准，但不得绕过 AP3、G3 和 F1。
         */
    }

    view def <eofsv> '实际操作反馈时序视图' specializes SequenceView {
        doc /*
         * 展示 TaskWorker 通过 SkillRequest 给出任务级修正范围，RobotSkill
         * 形成信息或物理 ActionProposal，G3 返回 PermitDecision 与
         * EffectiveOperation；直接提案者必收，重大变化经 AP3 主动推送
         * TaskWorker。信息操作由 RobotSkill 或受控连接器执行，物理动作继续
         * 进入 F1；两条路径均以 SkillOutcome、ExecutionDeviation、
         * SharedState 和 Evidence 更新 TaskWorker，不以候选动作更新现实。
         */
    }

    view def <riesv> '根任务影响升级时序视图' specializes SequenceView {
        doc /*
         * 展示 G3、F1 和 RobotSkill 的许可、重大变化、安全干预与实际结果
         * 先返回 TaskWorker。TaskWorker 判断当前任务能否继续在原契约内履行：
         * 可以则局部恢复；不可以或无法确认时挂起新的外部影响并直接向 A0
         * 发出 RootImpactEvent。A0 的 RootDecision 再直接按范围返回受影响实体。
         * AP3 只提供投递、重试、审计和运行保障，不是业务消息的因果中介。
         */
    }

    view def <twstv> 'TaskWorker生命周期视图' specializes StateTransitionView {
        doc /*
         * 作为 L2 候选视图，展开 TaskWorker 的申请与接纳、执行或挂起、
         * 完成或失败、释放等阶段，并区分 Agent 的业务策略与 AP3 的运行机制。
         * 具体状态名称、转换条件和事件结构不属于 L1 冻结内容。
         */
    }

    view def <spfgv> '单点失效与阻断边界视图' specializes GridView {
        doc /*
         * 展示 A0、O3、AP3、G3、RobotSkill 运行时、共享模型、
         * CoordinationGraph、F1 和共同部署的最致命反例、故障传播、
         * 阻断边界与通过信号。
         */
    }

    view def <e2eesv> '端到端紧急场景时序视图' specializes SequenceView {
        doc /*
         * 展示聊天、日程创建与找物任务并发运行后，Find Items TaskWorker
         * 如何经 RobotSkill、G3 和 F1 驱动实际移动，并可能与用户分处不同房间。
         * 近场语音与姿态、低置信远场声音、App 和穿戴求救输入均经
         * RobotSkillSystem 形成带来源、置信度和新鲜度的 I2/Evidence，由 O3
         * 维护用户和机器人的位置与状态。健康与照护 Agent 激活预定义紧急契约，
         * 旧找物导航被撤销并由 F1 安全停车，Emergency Care TaskWorker 再完成
         * 到人、递药、外部联系、持续观察与责任交接。明确呼救 I2 是用户意图输入，
         * 不是 RobotSkillSystem 直接向 A0 发起的业务升级；预定义紧急契约仍不能
         * 绕过 AP3、G3 和 F1。
         */
    }

    view def <clclafv> '当前L1架构七类闭环行动流视图' specializes ActionFlowView {
        doc /*
         * 以七条泳道展示 Agent Cell 局部闭环、任务与契约履约闭环、
         * 信息操作闭环、物理任务闭环、F1 硬安全闭环，以及运行与治理闭环。
         * 第七类是持续感知与共享状态更新闭环，显式承接 P-P1、I-P1 和 I-P2：
         * 观察策略或请求进入 RobotSkillSystem，P1/P-P1/I1 由 RobotSkillSystem
         * 处理为 I2/Evidence，O3 再维护 I3，消费方据此调整后续观察。
         * AP3 在主因果链外保障感知运行实例与资源，不解释或重新生成观察事件。
         * 七类表示稳定关系拓扑而非固定运行实例；每个 AgentCell 实例均有
         * 自己的局部闭环。任务与契约履约包含 TaskWorker、基础业务协调和
         * 根任务影响升级三个子环；运行与治理包含许可撤销、Worker 生命周期和
         * 资源调度子环。
         */
    }

    view def <acaf> 'AgentCell递归执行行动流视图' specializes ActionFlowView {
        doc /*
         * 保留旧版递归执行行动流，用于补充展示完成、重试、降级和请求上级处理；
         * AgentCell 的当前统一定义以 <acgv> 为准。
         */
    }

    view def <capsv> '主Agent与专业Agent行动许可时序视图' specializes SequenceView {
        doc /*
         * 保留历史方案一的行动许可时序作为对照，不作为当前 L1 主动授权语义。
         * 当前 L1 时序以 <patsv> 为准。
         */
    }
}
