# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-14
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-14 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 为 `Wednesday, 13 May 2026`，合计 `89` 篇 entries；其中 new submissions `40` 篇、cross submissions `10` 篇、replacement submissions `39` 篇。本轮按“最新官方 listing + 当日尚未出现 2026-05-14 新批次说明”处理，采用 3-5 篇强相关论文 + 候选排除表的新口径，收录对 Kinbot 诊断评测、时间安全、物理 AI 服务编排、纯视觉观测鲁棒性和 VLA 行为幻觉治理有明确增量价值的 5 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-14。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期为 `Wednesday, 13 May 2026`，合计 `89` 篇 entries；其中 new submissions `40` 篇、cross submissions `10` 篇、replacement submissions `39` 篇。
3. 当前自然日为 2026-05-14，但官方 Robotics 页面尚未出现以 2026-05-14 为 listing 日期的新批次；本轮因此按“最新官方 listing + 当日未出现新批次说明”形成日更，不把 listing 日期误写成 2026-05-14。
4. 本轮不再固定凑满 `10` 篇；优先筛选 `3-5` 篇真正改变 Kinbot 对导航、记忆、安全、端侧资源或验证治理判断的论文，并保留候选排除表。
5. replacement / cross-list 仅在确实新增 Kinbot 评测项、治理项或端侧资源判断时收录；本轮只将 `Action Hallucination in Generative Vision-Language-Action Models` 作为 replacement 主卡片收录，原因是它提供 VLA 行为幻觉的结构性评测轴。

筛选标准：

1. 是否直接对应 Kinbot 一代或 Phase 5 问题：家庭任务诊断、长期记忆 / 意图推理、纯视觉观测鲁棒性、运行时安全、物理 AI 推理编排、端侧 / 边缘延迟和可审计评测。
2. 是否能映射到 Kinbot 现有模块：`world_state_memory`、`mobility_navigation`、`decision_orchestration`、`safety_compliance_authorization`、`observability_data_governance`、`platform_runtime`、`companion_interaction`。
3. 是否提供可低成本吸收的研究信号：诊断 benchmark、LTLf 时间安全模板、generate-execute 服务调度、数据采集 / 观测设计准则、VLA 行为幻觉 taxonomy。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `ECHO`、`Retrieve-then-Steer` 和若干 VLA 长期记忆论文仍有研究价值，但过去两周已经连续收录 `RoboMemArena`、`MemCompiler`、`Learning to Forget` 等记忆主题；本轮不再把每个记忆结构都写成新的主线信号。
2. `ForceFlow`、`Forecast-GS`、`HeteroGenManip`、`CoRAL`、`IMPACT` 等操作 / 接触 / 抓取论文偏灵巧操作或接触丰富控制，超出 Kinbot 一代移动交互机器人边界。
3. `Overcoming Dynamics-Blindness`、`ACSAC`、`RankQ`、`GuidedVLA` 等 VLA 动作优化论文有模型评测价值，但与 2026-05-13 已收录的异步 VLA 推理、动作 chunk 延迟和残差修正主题重复度较高。
4. LiDAR BEV、UAV、自动驾驶、农业采摘、事件相机手势识别、球形机器人和多旋翼协同等条目不写成 Kinbot 一代纯视觉家庭机器人路线变化。
5. 本轮有价值但不优先进入主卡片的候选统一放入“候选排除表”，避免把低相关或重复主题硬写成主线新增判断。

## 2. 本轮总判断

本轮官方最新 Robotics listing 已从 2026-05-12 更新到 2026-05-13，但真正值得 Kinbot 吸收的不是更多 VLA / WAM 训练技巧，而是更可测的系统治理问题：家庭任务失败应被拆成感知、记忆、意图和长程协调原因；任务成功不等于时间安全；物理 AI 服务系统不能沿用普通 LLM serving 的单轮请求模型；纯视觉路线的鲁棒性首先来自观测设计和数据采集覆盖；VLA 行为幻觉可能来自结构性可行域不匹配，而不只是数据不够。

对 Kinbot 最有价值的结论有 5 个：

1. **评测要从总成功率转向模块诊断**：`PRISM` 提醒 Kinbot 的家庭任务评估应拆出 perception、memory、planning 和 implicit intent，而不是只记录单个 success rate。
2. **安全要评价时间过程，不只看终态**：`SafeManip` 说明成功完成任务仍可能在过程中违反安全属性，适合转化为 Kinbot 送药、靠近、巡护和异常上报的时间安全模板。
3. **物理 AI serving 要显式建模 generate-execute loop**：`Kairos` 把多轮推理、动作 chunk 和执行阶段纳入调度，适合 Kinbot 后台 / 边缘服务评审，但不能削弱离线安全闭环。
4. **纯视觉鲁棒性需要观测与数据协议**：`SEVO` 的核心启发不是立刻增加主动照明硬件，而是把相机覆盖、背景变化、光照、遮挡和干扰物写进采集与验证计划。
5. **VLA 行为幻觉需要结构性治理**：`Action Hallucination` 将 VLA 失败拆成 topological、precision 和 horizon barriers，提示 Kinbot 不应把端到端 VLA 放进高频安全闭环。

周度综合判断：

| 主题 | 本周状态 | 后续动作 |
| --- | --- | --- |
| 泛 VLA 操作策略、动作 chunk、异步推理 | 已接近饱和 | 只在出现新的安全证明、端侧资源指标或家庭导航实机证据时继续主卡片收录。 |
| 长期记忆结构与 memory benchmark | 已有足够输入 | 从“继续收论文”转向整理 Kinbot 长期记忆评测字段：keyframe、staleness、wrong-memory rollback、跨日对象一致性。 |
| 安全 / 合规 / 形式化规格 | 值得进入专题跟踪 | 将 `SafeManip`、`ReasonSTL`、`NEXUS` 合并成 Phase 5 时间安全与动作前约束评测专题。 |
| 物理 AI serving 与端侧 / 边缘资源 | 值得进入专题跟踪 | 将 `Kairos`、`ORICF` 和异步 VLA 推理统一成延迟、能耗、断网降级和隐私边界评审口径。 |
| 纯视觉观测鲁棒性与数据采集 | 值得进入专题跟踪 | 将 `SEVO` 和前序视觉退化 / 主动视觉论文转成数据采集覆盖矩阵，不作为新增传感器决策。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把本轮所有 VLA、serving、benchmark、LTLf 和观测增强方案都直接并入主线，会过复杂”。建议只吸收 4 个轻量动作：Phase 5 评测拆因字段、时间安全模板、物理 AI 推理链路指标、纯视觉数据采集覆盖矩阵。`Action Hallucination` 只作为 VLA 治理警示，不引入新模型层级。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | PRISM: Planning and Reasoning with Intent in Simulated Embodied Environments | 转成 Kinbot 家庭任务诊断 benchmark 的能力分层与 probe 设计参考。 |
| A | SafeManip: A Property-Driven Benchmark for Temporal Safety Evaluation in Robotic Manipulation | 抽象为 Kinbot 时间安全模板，不因 manipulation 场景而忽略其评测思想。 |
| A- | Kairos: A Scalable Serving System for Physical AI | 进入平台运行时 / 后台服务评审，重点看 generate-execute loop、延迟和 fleet scaling。 |
| B+ | SEVO: Semantic-Enhanced Virtual Observation for Robust VLA Manipulation via Active Illumination and Data-Centric Collection | 吸收数据采集和观测设计原则，不直接升级为硬件主线。 |
| B+ | Action Hallucination in Generative Vision-Language-Action Models | 作为 replacement 收录，用于 VLA 可靠性治理和评测轴设计。 |

## 3. 论文卡片

### 3.1 PRISM: Planning and Reasoning with Intent in Simulated Embodied Environments

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.11534](https://arxiv.org/abs/2605.11534) |
| 本轮 listing 口径 | 2026-05-13 new submission，日更收录 |
| 分类 | `cs.RO` |
| 方法关键词 | embodied benchmark, household tasks, intent reasoning, perception-memory-planning probes |

摘要要点转述：

论文指出，LLM / VLM 具身智能体在家庭任务中失败时，单一 success rate 无法解释失败来自对象识别、子目标遗忘、意图理解还是动作排序。`PRISM` 在 5 个照片级多房间公寓中构造 300 个经人工验证的任务，并按 Basic Ability、Reasoning Ability、Long-horizon Ability 分层；同时提供 agent-agnostic 可执行动作 API，可对 LLM、VLM、符号 planner、RL policy 或混合系统做端到端评估。论文还设计可选的 perception、memory 和 planning probes，用于做组件级诊断。实验显示，显式空间 grounding 在 oracle perception 下不是主要瓶颈，implicit intent resolution 对所有模型都明显困难；轻量模型在长程任务中成功率可降到 `20.0%`，且 token 消耗更高，说明其可能是在补偿性过度推理，而非真正规划。

解决 Kinbot 的什么问题：

1. 对应 `decision_orchestration` 与 `world_state_memory` 中“家庭任务失败如何归因”的问题。
2. 对应老人看护 / 健康管理任务：用户说“帮我看看药是不是该吃了”时，失败可能来自意图、空间、记忆或步骤协调，不应只记一条失败日志。
3. 对应 Phase 5 验证：应把 perception、memory、planning 和 implicit intent 拆成可替换 probe，而不是只看一次端到端成功率。

资源消耗与部署信号：

1. benchmark 思想可离线吸收，不要求端侧新增模型。
2. 轻量模型 token 消耗高的结论提醒 Kinbot：本地小模型未必天然省资源，必须测任务级 token / latency / recovery 成本。
3. 适合做仿真和回放评估，不直接替代实机家庭试点。

优势：

1. 家庭多房间任务与 Kinbot 场景高度贴近。
2. 将失败诊断从“是否成功”推进到“哪个能力模块失效”。
3. 支持多类 agent 接入，有利于 Kinbot 比较规则、VLM、LLM 和混合策略。

劣势与风险：

1. 仍是模拟环境，真实家庭中的老人行为、弱光、遮挡和隐私限制需要再验证。
2. probe 设计如果过细，会增加 Phase 5 测试矩阵复杂度。
3. 不能把 benchmark 分层直接等同于产品架构分层。

推荐理由：

建议作为 A 级输入。Kinbot 应优先吸收其诊断式评测框架，补入 Phase 5 家庭任务失败归因字段。

### 3.2 SafeManip: A Property-Driven Benchmark for Temporal Safety Evaluation in Robotic Manipulation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.12386](https://arxiv.org/abs/2605.12386) |
| 本轮 listing 口径 | 2026-05-13 new submission，日更收录 |
| 分类 | `cs.RO` |
| 方法关键词 | temporal safety, LTLf monitors, safe success, property-driven benchmark |

摘要要点转述：

论文批评当前机器人评估过度依赖 task success，而任务完成并不保证执行过程安全。例如机器人可能在污染后触碰清洁区域，或在物体尚未进入容器前提前释放。`SafeManip` 用 Linear Temporal Logic over finite traces 表达可复用的时间安全模板，将执行轨迹映射为符号谓词序列，并用 LTLf monitor 评估安全属性。其属性集覆盖碰撞 / 接触、抓取稳定、释放稳定、交叉污染、动作启动、机制恢复、物体包容和区域访问等 8 类安全类别。作者在 50 个 RoboCasa365 家庭任务和 6 个 VLA policy 上实验，发现更高任务成功率并不可靠地转化为更安全执行，复杂长程任务暴露更多安全违反。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization` 中“行为过程是否符合安全规则”的问题。
2. 对应送药、靠近老人、夜间巡护、异常上报等任务：终点完成不等于过程中没有打扰、碰撞、越权或错误升级。
3. 对应 Phase 5 验证：需要 `safe_success_rate`，不能只记录 `task_success_rate`。

资源消耗与部署信号：

1. LTLf monitor 可作为离线评测和低频运行时检查，成本低于大模型评判。
2. 需要把连续传感日志抽象成稳定谓词，前期工程成本在日志 schema 和谓词定义。
3. 论文场景偏 manipulation，Kinbot 需要把模板迁移到移动、交互、权限和健康异常流程。

优势：

1. 直接补足“成功但不安全”的评测盲区。
2. 时间逻辑模板可复用，适合沉淀成 Phase 5 验证资产。
3. 与前序 `ReasonSTL`、`NEXUS` 可以形成自然语言规则、硬约束和监控评测闭环。

劣势与风险：

1. 将家庭照护规则形式化需要产品、法务、医疗和安全多方审阅。
2. 谓词抽取错误会导致误报或漏报。
3. 过度形式化会拖慢试点节奏，应先覆盖高风险任务。

推荐理由：

建议作为 A 级输入。Kinbot 应把“任务成功”和“安全成功”分开，并优先建立送药、靠近、打断、巡护和异常上报的时间安全模板。

### 3.3 Kairos: A Scalable Serving System for Physical AI

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.11381](https://arxiv.org/abs/2605.11381) |
| 本轮 listing 口径 | 2026-05-13 new submission，日更收录 |
| 分类 | `cs.RO`, `cs.DC` |
| 方法关键词 | physical AI serving, generate-execute loop, multi-robot scheduling, action chunk latency |

摘要要点转述：

论文认为 Physical AI 的推理形态与普通数字 AI 不同：机器人任务包含多轮推理和动作执行，每轮推理会生成一段 action chunk，并且推理与执行异步交织。传统 LLM / 数字 AI serving 系统主要服务单轮请求，无法充分利用或约束执行阶段。`Kairos` 将 generate-execute loop 作为一等公民，面向多机器人 fleet 调度模型推理与执行。实验显示，在多种 physical AI 模型和机器人上，相比现有数字 AI serving 实践，`Kairos` 可降低平均端到端任务延迟 `31.8%` 到 `66.5%`，且收益随机器人规模扩大。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime` 与 KBT-57 后台服务 / 人工坐席联动假设：机器人不是普通 App client，服务端必须理解执行阶段。
2. 对应端侧 / 边缘协同：大模型任务不能只看首 token latency，还要看 action chunk、可打断性、执行窗口和断网降级。
3. 对应多台试点机器人：fleet 级资源调度会影响服务延迟、成本和故障隔离。

资源消耗与部署信号：

1. 后台 / 边缘 serving 可降低单机算力压力，但会引入网络依赖和隐私边界。
2. generate-execute 调度需要机器人上报执行状态、动作 chunk 进度和安全阻断信号。
3. 一代 Kinbot 仍必须保证导航避障、跌倒异常检测和基础交互的离线安全闭环。

优势：

1. 把 Physical AI 的推理-执行循环与普通 LLM serving 区分开，方向正确。
2. 提供端到端任务延迟和 fleet scaling 指标，适合平台运行时评审。
3. 可与 2026-05-13 收录的 `ORICF` 形成“本体推理编排 + fleet serving”的上下游视图。

劣势与风险：

1. 论文偏系统服务，不直接解决机器人安全策略。
2. 若过早引入复杂 fleet serving，会让当前 Phase 5 验证面膨胀。
3. 数据回流必须满足 Kinbot 原始敏感数据端侧处理原则。

推荐理由：

建议作为 A- 级输入。Kinbot 可吸收其服务指标和 generate-execute 视角，但不因此把后台服务升级为已确认主线事实。

### 3.4 SEVO: Semantic-Enhanced Virtual Observation for Robust VLA Manipulation via Active Illumination and Data-Centric Collection

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.11114](https://arxiv.org/abs/2605.11114) |
| 本轮 listing 口径 | 2026-05-13 new submission，日更收录 |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | observation design, data-centric robustness, RGB stream transformation, semantic overlay |

摘要要点转述：

论文关注低成本硬件上的 VLA / imitation learning policy 从训练环境迁移到新环境时显著退化的问题。`SEVO` 不改策略结构，而是改造原始 RGB 观测：使用覆盖工作空间的 body-fixed cameras、主动红光照明物理归一化外观，并叠加实时 YOLO segmentation 形成背景无关的语义提示。作者强调，系统化改变光照、背景和干扰物的数据采集协议，是提升泛化最重要的因素。透明水瓶抓取实验显示，完整 pipeline 在训练环境和新环境之间的成功率退化明显小于未使用 SEVO 的策略。

解决 Kinbot 的什么问题：

1. 对应纯视觉路线下“家庭环境变化如何不让模型崩掉”的问题。
2. 对应头部 / 机身相机覆盖与数据采集：应把光照、背景、遮挡、透明 / 反光物体和干扰物纳入验证矩阵。
3. 对应端侧资源：与盲目放大模型相比，观测设计和采集覆盖可能更便宜。

资源消耗与部署信号：

1. 语义 overlay 需要实时检测 / 分割，增加端侧算力；可先离线评估。
2. 主动红光照明是硬件与工业设计问题，不能直接写成 Kinbot 新传感器主线。
3. 数据采集协议可低成本吸收，适合进入 Phase 5 试点样本设计。

优势：

1. 明确指出泛化问题不一定靠模型 scaling 解决。
2. 对低成本机器人和真实家庭物体有直接启发。
3. 与 Kinbot 纯视觉路线兼容度较高，但需要谨慎处理照明硬件。

劣势与风险：

1. 论文任务仍是 manipulation，不是移动导航或老人照护。
2. 主动照明可能影响用户体验、外观和隐私感知。
3. YOLO overlay 若错误，会把错误语义稳定注入策略。

推荐理由：

建议作为 B+ 级输入。Kinbot 应吸收数据采集与观测鲁棒性原则，不把主动照明或语义 overlay 直接升级为冻结方案。

### 3.5 Action Hallucination in Generative Vision-Language-Action Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2602.06339](https://arxiv.org/abs/2602.06339) |
| 本轮 listing 口径 | 2026-05-13 replacement submission，日更收录；收录原因是新增 Kinbot VLA 行为幻觉治理 / 评测轴，不作为当日新论文处理 |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | action hallucination, generative VLA, structural mismatch, topological-precision-horizon barriers |

摘要要点转述：

论文分析生成式 VLA / Robot Foundation Model 是否真正解决了具身动作生成问题。作者将 action hallucination 定义为违反物理可行性约束的动作生成，并进一步讨论其如何扩展为 plan-level failure。论文聚焦 latent-variable generative policies，指出幻觉可能来自可行机器人行为空间与常见模型结构之间的结构性不匹配，并拆出 topological、precision 和 horizon 三类 barrier。这些 barrier 会带来不可避免的取舍，解释了许多经验性 VLA 失败现象，同时提示可靠性和可信性改进不能只靠更大模型或更多数据。

解决 Kinbot 的什么问题：

1. 对应未来 VLA / WAM 原型是否能进入 Kinbot 运行时边界的问题。
2. 对应安全决策：生成式动作策略可能在看似合理的任务中输出物理不可行或长程不一致动作。
3. 对应 Phase 5 验证：需要将 topology、precision、horizon 作为行为幻觉评测轴。

资源消耗与部署信号：

1. 论文主要是理论与机制分析，不增加端侧部署成本。
2. 对 Kinbot 的直接价值是减少盲目押注端到端 VLA，强化前置评测和动作前约束。
3. 若未来引入 VLA，只能处在低频任务层或建议层，高频安全闭环仍需传统控制 / 规则 / monitor。

优势：

1. 将 VLA 失败从“模型偶尔犯错”提升为结构性限制讨论。
2. 给出可转化为评测轴的三类 barrier。
3. 与 Kinbot 的安全 > 合规 > 用户指令优先级兼容。

劣势与风险：

1. 属于 replacement，不是本轮全新论文。
2. 理论分析本身不提供可直接部署的修复方案。
3. 若解释过度，可能导致团队低估 VLA 在低风险任务层的价值。

推荐理由：

建议作为 B+ 级治理输入。Kinbot 可将其用于 VLA 原型准入和失败复盘，不改变一代默认运行时架构。

## 4. 候选排除表

| 候选论文 / 主题 | 条目类型 | 未收录原因 |
| --- | --- | --- |
| ECHO: Continuous Hierarchical Memory for Vision-Language-Action Models | new | 与前序长期记忆主题高度相关，但偏 manipulation VLA 记忆结构；本轮已判断记忆主题阶段性饱和，先保留观察。 |
| Retrieve-then-Steer: Online Success Memory for Test-Time Adaptation of Generative VLAs | replacement | 对“成功经验复用”有价值，但仍偏操作策略 test-time adaptation；replacement 未提供足以改变 Kinbot 记忆主线的新治理项。 |
| Overcoming Dynamics-Blindness: Training-Free Pace-and-Path Correction for VLA Models | new | 与前日异步 VLA 推理、动作 chunk 延迟和残差修正主题重复；保留为 VLA 动态评测候选。 |
| Offline Policy Evaluation for Manipulation Policies via Discounted Liveness Formulation | new | liveness 表述有评测价值，但场景偏 manipulation policy OPE；本轮优先收录更直接的 `SafeManip` 时间安全。 |
| AgentChord: Proactive Failure Recovery via Pre-compiled Task Graphs | new | failure recovery 思路有价值，但具体机制偏 manipulation 和任务图预编译；可后续并入异常恢复专题，不进入今天主卡片。 |
| EvoNav: Evaluating and Evolving Reward Design for Navigation Tasks via LLMs | new | 导航 reward 设计有研究价值，但训练 / 奖励工程重，不直接改变一代纯视觉导航验证口径。 |
| ForceFlow / Forecast-GS / HeteroGenManip / CoRAL / IMPACT | new 或 replacement | 偏接触、抓取、灵巧操作或 manipulation 轨迹优化，超出 Kinbot 一代无灵巧操作边界。 |
| ACSAC / RankQ / GuidedVLA / Behavioral Mode Discovery | cross-list 或 new | 主要是 VLA / RL fine-tuning 方法；未新增 Kinbot 安全、资源或家庭场景评测判断。 |
| TriBand-BEV / EgoEV-HandPose / UAV inspection / autonomous driving 条目 | cross-list 或 replacement | 依赖 LiDAR、事件相机、UAV 或自动驾驶场景，不写成 Kinbot 一代纯视觉家庭机器人路线变化。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 暂不回写 `docs/00_governance/03_decision_log.md`：本轮论文仍属于研究输入，没有形成经用户确认的新产品 / 架构冻结判断。
2. 建议后续在 `docs/05_p4_beta_dvt/01_mvp_validation_plan.md` 或其验证补充中增加研究待评估项：任务失败归因字段、`safe_success_rate`、时间安全模板、VLA 行为幻觉评测轴。
3. 建议将 `Kairos` 与 `ORICF` 合并纳入平台运行时专题评审，形成 robot-side latency、edge latency、generate-execute loop、断网降级和隐私边界字段。
4. 建议将 `SEVO` 吸收为纯视觉数据采集覆盖矩阵：光照、背景、遮挡、透明 / 反光物体、干扰物、相机覆盖和用户活动状态。
5. 建议本周不再继续扩大泛 VLA 操作论文主卡片数量，下一轮优先看是否出现“家庭移动导航实机、老人照护安全、端侧资源实测或可审计治理”类新增证据。

## 6. 本轮未进入主线的原因

1. 本轮论文均为 arXiv 研究输入，未经过 Kinbot 实机验证、供应链评估、用户体验评审或阶段门审查。
2. 多数方法依赖 VLA / 大模型 / 形式化评测 / fleet serving / simulation benchmark，不应直接扩大一代端侧运行时复杂度。
3. 本轮建议动作均可作为评测字段、专题研究或 checklist 吸收，不需要改变当前纯视觉、端侧敏感数据处理、`12GB RAM + 32GB Flash` 和 `5000 到 6000 元` BOM 冻结基线。

## 7. 来源

1. arXiv `cs.RO/new`：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent`：<https://arxiv.org/list/cs.RO/recent>
3. PRISM：<https://arxiv.org/abs/2605.11534>
4. SafeManip：<https://arxiv.org/abs/2605.12386>
5. Kairos：<https://arxiv.org/abs/2605.11381>
6. SEVO：<https://arxiv.org/abs/2605.11114>
7. Action Hallucination：<https://arxiv.org/abs/2602.06339>
