# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-12
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-12 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 为 `Monday, 11 May 2026`，合计 `81` 篇 entries；按 2026-05-12 日更口径，筛选前序纪要未收录且与 Kinbot 长期记忆、超长上下文执行、world action model 可靠性、纯视觉导航、社会导航、稀疏拓扑探索、主动视觉、视觉退化鲁棒性、自然语言安全执行和 AI 能力版本治理相关的 10 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-12。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期为 `Monday, 11 May 2026`，合计 `81` 篇 entries；其中 new submissions `34` 篇、cross submissions `13` 篇、replacement submissions `34` 篇。
3. arXiv 官方 `cs.RO/recent` 显示最新日期为 `Mon, 11 May 2026`，该日有 `47` 篇 recent entries；未出现 `Tuesday, 12 May 2026` 的 Robotics 新批次。
4. 本轮按“最新官方 listing + 当日未出现新批次说明”处理：优先覆盖 `2026-05-11` listing 中前序 `2026-04-29` 至 `2026-05-11` Kinbot 每日论文纪要未收录的条目；replacement 仅在其对 Kinbot 一代或 Phase 5 验证治理有明确参考价值时纳入。
5. 关键词与主题包括 `embodied memory`、`cached state representation`、`world action model`、`embodied navigation`、`social robot navigation`、`sparse topological map`、`active vision`、`visual perturbation`、`behavior tree generation`、`capability evolution governance`。

筛选标准：

1. 是否对应 Kinbot 一代或 Phase 5 关注问题：纯视觉、家庭场景长期运行、端侧资源约束、低频复杂决策、运行时安全、用户目标理解、长期交互、验证闭环和可审计降级。
2. 是否能映射到 Kinbot 现有模块：`decision_orchestration`、`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`observability_data_governance`、`platform_runtime`、`companion_interaction`。
3. 是否提供可低成本吸收的研究信号：状态条件记忆、KV cache 复用、行动-状态一致性、BEV 先验、社会导航数据、多鱼眼纯视觉稀疏拓扑、主动凝视评测、视觉退化适配、行为树验证门和能力升级回滚。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `Weather-Robust Scene Semantics with Vision-Aligned 4D Radar`、`Dr-BA`、事件相机 SLAM 和车路协同相关条目具备鲁棒感知或定位价值，但依赖雷达、事件相机、V2X 或车路基础设施，不写成 Kinbot 一代纯视觉路线变化。
2. `AT-VLA`、`BioProVLA-Agent`、`Hydra-DP3`、`MolmoAct2`、`NoiseGate` 等偏操作、触觉、实验室自动化、扩展 VLA 或 diffusion policy 的条目保留观察；其方法价值较高，但本轮不扩大 Kinbot 一代移动服务和无灵巧操作边界。
3. `HumanNet` 的百万小时人类视频数据对人-物交互和长期行为理解有价值，但数据规模、隐私、标注治理和训练成本远超当前 Phase 5 研究输入粒度，本轮仅列入后续数据策略观察。
4. `123D`、自动驾驶 3D 目标检测、车辆轨迹预测和车道场景理解类论文偏道路交通，不进入家庭机器人场景主卡片。
5. UAV、农场、垂直农业、无人机蜂群、空域安全与多机器人调度类条目只在其提供纯视觉低资源抽象或安全执行结构时纳入；不把空中机器人形态写入 Kinbot 产品主线。

## 2. 本轮总判断

本轮官方 Robotics 最新批次已经更新到 `2026-05-11`，相比前几日补录主要偏 VLA / WAM / 操作研究，本轮更值得 Kinbot 吸收的是“长期运行系统工程”信号：记忆不能静态注入，超长上下文要靠 cache 和异步状态调和，WAM 不能只看未来画面像不像，还要看行动和状态是否一致，纯视觉导航要把全局先验、稀疏拓扑和视觉退化鲁棒性拆成可测指标，语言执行必须通过行为树、白名单和 parser acceptance 形成安全门，AI 能力升级需要把接口、策略、行为和恢复能力作为发布前检查项。

对 Kinbot 最有价值的结论有 7 个：

1. **长期记忆应是状态条件编译，而不是一次性检索注入**：家庭机器人连续执行时，当前任务状态、房间状态、用户状态会不断变化，记忆必须按执行状态动态裁剪。
2. **超长上下文可作为后台 / 边缘协同研究方向，但不是一代端侧默认链路**：`235B` 模型、`120K` token 和 on-prem GPU 说明 CSR 更适合后续服务闭环或 KBT-57 战略分支评估。
3. **WAM 评测要补“行动-状态一致性”**：视觉真实不等于决策可靠，Kinbot 后续若评估 WAM / VLA，应加入 rollout consistency、静态背景塌缩和 value-free selection 指标。
4. **纯视觉导航可以吸收外部先验，但必须有定位对齐和漂移控制**：BEV / 图像生成模型可作为全局先验，稀疏拓扑图可降低内存与算力，但都不能替代实机安全闭环。
5. **社会导航数据必须覆盖人的主观感受**：家庭共处不是只避障，近距离会车、速度变化、用户舒适度和文化差异都应进入 HRI 评测。
6. **视觉退化适配应服务下游任务，而不是追求像素级复原**：ACO-MoE 的信息瓶颈思想提示 Kinbot 评测雨雾、压缩、噪声、反光和暗光时，应看任务表现和前景语义稳定性。
7. **能力升级治理值得直接进入验证清单**：AI 组件版本变化不应直接替换，应经过 sandbox、shadow、gated activation、online monitoring 和 rollback。

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 MemCompiler、CSR、WAM consistency、PathPainter、Bi3、稀疏拓扑图、TAVIS、ACO-MoE、CommandSwarm 和能力治理框架全部接入主线运行时，会过复杂”。建议只吸收 6 个轻量动作：记忆编译评价字段、超长上下文延迟指标、WAM 行动-状态一致性指标、纯视觉导航先验 / 稀疏拓扑离线评测、视觉退化任务鲁棒性评测、AI 能力升级四类兼容性检查。其余模型和数据集继续停留在研究区，不回写主线。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | MemCompiler: Compile, Don't Inject -- State-Conditioned Memory for Embodied Agents | 吸收“状态条件记忆编译”作为长期记忆评测和 agent memory 裁剪原则。 |
| A- | Governed Capability Evolution: Lifecycle-Time Compatibility Checking and Rollback for AI-Component-Based Systems, with Embodied Agents as Case Study | 直接转译为 Phase 5 的 AI 能力升级检查清单，但不写成已实施事实。 |
| A- | CSR: Infinite-Horizon Real-Time Policies with Massive Cached State Representations | 作为后台 / 边缘协同和超长上下文 TTFT 评测输入，不进入一代端侧默认链路。 |
| B+ | Is the Future Compatible? Diagnosing Dynamic Consistency in World Action Models | 为 WAM / VLA 增加行动-状态一致性和静态背景塌缩诊断。 |
| B+ | Agent-Centric Observation Adaptation for Robust Visual Control under Dynamic Perturbations | 用于纯视觉鲁棒性评测，重点吸收任务相关信息瓶颈而非像素复原。 |
| B+ | Bi3: A Biplatform, Bicultural, Biperson Dataset for Social Robot Navigation | 用于家庭共处和近距离社会导航 benchmark 设计参考。 |
| B+ | PathPainter: Transferring the Generalization Ability of Image Generation Models to Embodied Navigation | 作为 BEV / 图像生成先验辅助导航研究输入，需严控安全边界。 |
| B | Palm-sized Omnidirectional Vision-Based UAV Exploration with Sparse Topological Map Guidance | 吸收低资源稀疏拓扑探索思想，不吸收 UAV 形态。 |
| B | TAVIS: A Benchmark for Egocentric Active Vision and Anticipatory Gaze in Imitation Learning | 用于头部主动视觉、凝视提前量和移动观测策略评测参考。 |
| B | CommandSwarm: Safety-Aware Natural Language-to-Behavior-Tree Generation for Robotic Swarms | 借鉴自然语言到行为树的安全过滤、白名单和 parser gate。 |

## 3. 论文卡片

### 3.1 MemCompiler: Compile, Don't Inject -- State-Conditioned Memory for Embodied Agents

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.07594](https://arxiv.org/abs/2605.07594) |
| 本轮 listing 口径 | 2026-05-11 new submission，日更收录 |
| 分类 | `cs.AI`, `cs.RO` |
| 方法关键词 | embodied memory, state-conditioned memory compilation, soft memory, latency reduction |

摘要要点转述：

论文指出，许多具身 agent 记忆系统在 episode 开始时一次性注入检索结果，这种 `AMMI` 方式会随着任务执行状态变化而失配，甚至拖累轻量 executor。`MemCompiler` 将记忆使用改为状态条件编译：模型先读取结构化 `Brief State`，再选择和编译与当前执行状态相关的记忆，并通过文本通道和 latent `Soft-Mem` 通道传递给 executor。实验覆盖 `AlfWorld`、`EmbodiedBench` 和 `ScienceWorld`，在开源 backbone 上相对无记忆基线最高提升 `129%`，同时每步延迟降低 `60%`。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory` 中“长期家庭记忆如何随当前任务动态裁剪”的问题。
2. 对应 `decision_orchestration`：执行中不应把所有历史上下文灌给决策器，而应按当前状态编译出可执行提示。
3. 对应陪伴和巡护的跨日连续任务：用户习惯、物品位置、房间变化和最近异常需要被动态选择，而不是静态拼接。

资源消耗与部署信号：

1. 论文重点降低每步记忆使用延迟，适合 Kinbot 的端侧资源约束方向。
2. `Soft-Mem` 与 learned compiler 仍需要模型训练和运行时集成，短期适合离线评测，不应直接进入量产链路。
3. 可先把 `state-conditioned_memory_hit_rate`、`memory_compile_latency` 和 `executor_degradation_without_retrieval` 作为评测指标。

优势：

1. 明确反对静态长上下文堆叠，符合 Kinbot 降复杂度方向。
2. 将当前执行状态作为记忆裁剪入口，便于审计“为什么调取这段记忆”。
3. 同时关注效果和延迟，贴近端侧 agent 运行约束。

劣势与风险：

1. benchmark 仍偏软件环境和指令任务，家庭真实噪声、隐私边界和多用户长期记忆需要另测。
2. memory compiler 选错记忆时可能形成稳定误导，需要置信度、澄清和撤销机制。
3. `Soft-Mem` 通道可解释性弱于文本摘要，需要额外治理。

推荐理由：

建议作为 A 级输入。Kinbot 可在长期记忆方案中吸收“状态条件记忆编译”原则，先落为评测字段和原型实验，不改变当前一代主线。

### 3.2 CSR: Infinite-Horizon Real-Time Policies with Massive Cached State Representations

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.07325](https://arxiv.org/abs/2605.07325) |
| 本轮 listing 口径 | 2026-05-11 new submission，日更收录 |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | cached state representation, KV-cache reuse, asynchronous state reconciliation, TTFT |

摘要要点转述：

论文针对机器人连续运行时大模型处理超长状态历史的 `TTFT` 延迟问题，提出 `Cached State Representation`。作者认为实时性能需要前缀稳定、增量扩展和异步状态调和；系统通过最大化 KV-cache 复用降低重算，并用 `ASR` 在并行资源上处理状态记忆淘汰，避免延迟尖峰。物理机器人通过无线连接到本地 GPU server，在 `235B` 参数模型和 `120K` token 上将延迟从 `14.67s` 降到 `0.56s`，并在 embodied benchmark 上保持接近 RAG 的延迟和更高 recall。

解决 Kinbot 的什么问题：

1. 对应后台服务 / 边缘协同下“机器人状态历史如何持续喂给大模型而不失控”的问题。
2. 对应 `platform_runtime` 与 `observability_data_governance`：超长上下文需要明确缓存策略、淘汰策略和状态一致性。
3. 对应 KBT-57 战略分支中可能出现的后台服务 / 人工坐席联动，但不覆盖当前端侧默认链路。

资源消耗与部署信号：

1. `235B` 模型和 on-prem GPU server 明显超出 Kinbot 一代端侧 `12GB RAM + 32GB Flash` 默认线。
2. 核心可吸收点不是模型规模，而是 `TTFT`、KV-cache reuse、异步淘汰和延迟尖峰控制指标。
3. 适合放入后台 / 边缘协同研究或战略证据包，不适合作为量产端侧功能承诺。

优势：

1. 直接命中连续具身 agent 的超长状态历史问题。
2. 给出清晰的实时性能结构条件，而不是只做工程缓存优化。
3. 提供 `TTFT`、recall 和 eviction cycles 等可测试指标。

劣势与风险：

1. 对网络、服务器和模型服务稳定性依赖高，家庭机器人不能把安全闭环押在该链路上。
2. 状态缓存越长，隐私、数据最小化和用户授权压力越大。
3. 若被误写成一代默认能力，会显著增加系统复杂度和 BOM / 服务成本。

推荐理由：

建议作为 A- 级输入。Kinbot 可将其用于“后台 / 边缘协同的超长上下文延迟评估”，并明确标注为后续战略分支研究，不回写当前冻结基线。

### 3.3 Is the Future Compatible? Diagnosing Dynamic Consistency in World Action Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.07514](https://arxiv.org/abs/2605.07514) |
| 本轮 listing 口径 | 2026-05-11 new submission，日更收录 |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | world action model, action-state consistency, imagined rollout, value-free planning |

摘要要点转述：

论文指出，WAM 通过想象未来观测和动作支持决策，但现有评测常关注未来画面是否合理，忽略了“预测动作是否真的能导致预测状态转移”。作者将 `action-state consistency` 定义为 WAM 可靠性的缺失维度，并在多类 joint-prediction 和 inverse-dynamics 模型上验证该指标能区分成功和失败 rollout。论文还指出静态背景塌缩会让失败轨迹看起来一致，因此需要同时诊断低动态假象。基于一致性，作者提出无需价值模型的 test-time consensus selection，在 `RoboCasa` 和 `RoboTwin 2.0` 上提升成功率。

解决 Kinbot 的什么问题：

1. 对应未来 WAM / VLA 用于家庭任务规划时“想象结果是否能被动作真实实现”的问题。
2. 对应 `safety_compliance_authorization`：不能只让模型生成看似合理的未来，还要验证动作和状态变化是否匹配。
3. 对应纯视觉家庭场景中的静态背景误导：房间不动不代表任务完成。

资源消耗与部署信号：

1. 该论文提供的是诊断指标和 test-time selection 信号，部署成本低于训练完整新模型。
2. 仍需运行多候选 rollout，若在线执行会增加推理成本；更适合离线评测或低频复杂任务。
3. 可先转成 `action_state_consistency_score` 和 `background_collapse_alert` 两类离线指标。

优势：

1. 把 WAM 评测从“视觉像真”推进到“决策相关可靠性”。
2. 不依赖 reward model，适合早期缺真实价值函数的机器人系统。
3. 可与 Kinbot 的可审计执行链和失败复盘结合。

劣势与风险：

1. 主要在操作 benchmark 上验证，家庭移动、巡护和健康交互需要再定义状态变量。
2. 多 rollout 选择可能引入延迟，不适合实时避障控制。
3. 静态背景塌缩说明单一 consistency 指标不可单独作为安全门。

推荐理由：

建议作为 B+ 级输入。Kinbot 后续评估任何 WAM / VLA 原型时，应把行动-状态一致性列为固定检查项。

### 3.4 PathPainter: Transferring the Generalization Ability of Image Generation Models to Embodied Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.07496](https://arxiv.org/abs/2605.07496) |
| 本轮 listing 口径 | 2026-05-11 new submission，日更收录 |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | BEV prior, image generation model, traversability mask, cross-view localization |

摘要要点转述：

论文尝试把图像生成模型的世界理解能力迁移到具身导航。系统利用 BEV 图像作为全局先验，由图像生成模型解析自然语言意图、识别目标目的地并生成可通行区域 mask；执行时通过 cross-view localization 将机器人里程计与 BEV 地图对齐，缓解长期漂移。实验包括 benchmark 和 UAV 实机验证，使用常规局部规划器完成了 `160` 米户外长距离导航任务。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 中“如何用视觉 / 语义先验提升长程导航”的问题。
2. 对应家庭内用户自然语言目标，如“去餐桌旁边”“到药箱附近”，需要把语言目标映射到空间先验。
3. 对应纯视觉路线下的漂移控制：BEV 先验必须通过 cross-view 对齐才能进入执行。

资源消耗与部署信号：

1. 图像生成模型和 BEV 先验生成不适合高频端侧实时链路，更适合离线建图、低频规划或后台辅助。
2. 执行层仍依赖常规局部规划器，这是可吸收的系统分层信号。
3. Kinbot 需要验证家庭 BEV 来源、隐私边界、地图更新频率和错配时降级策略。

优势：

1. 将 foundation model 用于全局先验，而不是直接接管控制。
2. cross-view localization 明确处理先验与机器人本体状态对齐。
3. 与 Kinbot “低频复杂决策 + 高频安全控制分层”一致。

劣势与风险：

1. UAV 户外验证不能直接代表家庭轮式机器人。
2. BEV 先验错误会导致全局路径误导，必须有本地避障和安全门。
3. 图像生成模型可能幻觉可通行区域，不适合作为唯一事实源。

推荐理由：

建议作为 B+ 级输入。Kinbot 可吸收“全局语义先验只辅助低频规划，本地控制仍保守闭环”的架构原则。

### 3.5 Bi3: A Biplatform, Bicultural, Biperson Dataset for Social Robot Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06863](https://arxiv.org/abs/2605.06863) |
| 本轮 listing 口径 | 2026-05-11 new submission，日更收录 |
| 分类 | `cs.RO` |
| 方法关键词 | social robot navigation, human motion, close encounters, user impressions |

摘要要点转述：

论文发布 `Bi3` 数据集，用于研究机器人在人群和近距离互动中的社会导航。数据来自美国和法国两个站点、`74` 名参与者、两种机器人平台和五类导航算法，包含 `10.5` 小时人和机器人的 ground-truth 运动轨迹、RGB 视频和用户对机器人表现的主观反馈。作者强调，与传统导航数据相比，该数据集更关注两个人与一个机器人在受限空间中的近距离遭遇、互动密度、人类速度变化和文化差异。

解决 Kinbot 的什么问题：

1. 对应家庭共处场景中机器人穿行、等待、绕行和避让时如何不打扰人的问题。
2. 对应 `companion_interaction` 和 `mobility_navigation` 的交叉：导航行为会影响用户感受，不只是几何避障。
3. 对应老人看护和陪伴交互中的近距离移动礼仪。

资源消耗与部署信号：

1. 数据集规模适中，适合离线评测和人因指标设计，不构成端侧推理负担。
2. RGB 视频和运动轨迹可用于训练或 benchmark，但家庭隐私场景需重新制定采集授权。
3. 主观反馈字段对产品评测价值高，可低成本转化为试点问卷指标。

优势：

1. 把社会导航从几何安全扩展到用户舒适度和文化差异。
2. 同时包含多平台、多算法和人类主观评价，便于做对比评测。
3. 与 Kinbot “聪明、温暖、精致”的高端产品感直接相关。

劣势与风险：

1. 受限实验空间和两人互动仍不足以覆盖真实家庭长期共处。
2. RGB 数据涉及隐私，不能简单照搬采集方法。
3. 数据集不直接解决导航策略部署，只提供评测和训练素材。

推荐理由：

建议作为 B+ 级输入。Kinbot 可在试点验证中增加 `near_encounter_comfort`、`yielding_quality`、`human_speed_impact` 和 `subjective_social_acceptance` 指标。

### 3.6 Palm-sized Omnidirectional Vision-Based UAV Exploration with Sparse Topological Map Guidance

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.07275](https://arxiv.org/abs/2605.07275) |
| 本轮 listing 口径 | 2026-05-11 new submission，日更收录 |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | omnidirectional vision, sparse topological map, frontier exploration, low SWaP |

摘要要点转述：

论文面向小型 UAV 的低资源探索，指出传统 frontier 方法依赖密集占用图或高分辨点云，内存和计算开销高；微型平台也难以使用 LiDAR。作者采用多鱼眼相机获得全向视野并估计深度，将 frontier 表示成稀疏拓扑节点而非显式边界，不维护全局点云或 dense occupancy grid。全局规划直接在稀疏图上进行，并在 `11 cm` 轴距、`400 g` 的 palm-sized vision-based UAV 上完成仿真和真实实验。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 纯视觉、低资源条件下如何做空间探索和未知区域管理。
2. 对应 `world_state_memory`：家庭环境不一定需要持续维护高密度全局地图，稀疏拓扑节点可能足够支持任务。
3. 对应夜间或弱纹理场景中，深度估计不稳时如何仍保留可探索候选区域。

资源消耗与部署信号：

1. 稀疏拓扑图对内存和计算友好，是核心可吸收点。
2. 多鱼眼和 UAV 形态不直接适配 Kinbot 当前头部 / 躯干视觉布局。
3. 深度估计误差仍会影响拓扑节点质量，需本地安全边界兜底。

优势：

1. 明确以低 SWaP 为约束，和 Kinbot 端侧资源意识一致。
2. 抽象 frontier 为拓扑节点，降低地图维护成本。
3. 不依赖 LiDAR，符合一代纯视觉方向。

劣势与风险：

1. UAV 动力学、视角和安全边界与家庭轮式底盘差异大。
2. 多鱼眼硬件配置与 Kinbot 当前视觉方案不一致。
3. 稀疏拓扑可能漏掉狭窄障碍或地面细节，不能替代局部安全感知。

推荐理由：

建议作为 B 级输入。Kinbot 可吸收 `sparse_topology_exploration` 指标和低内存地图思想，不改变产品形态或传感配置。

### 3.7 TAVIS: A Benchmark for Egocentric Active Vision and Anticipatory Gaze in Imitation Learning

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.07943](https://arxiv.org/abs/2605.07943) |
| 本轮 listing 口径 | 2026-05-11 new submission，日更收录 |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | active vision, anticipatory gaze, imitation learning, gaze-action lead time |

摘要要点转述：

论文提出 `TAVIS`，用于评测主动视觉和预测性凝视在模仿学习中的作用。基准包含 `TAVIS-Head` 和 `TAVIS-Hands` 两组任务，在两个 humanoid torso embodiment 上运行，并提供 headcam-vs-fixedcam 对照、`GALT` 凝视-动作提前量指标和程序化 ID/OOD 划分。基线结果显示，主动视觉整体有帮助，但收益取决于任务；多任务策略在分布偏移下下降明显；单纯模仿也能学出类似人类 teleoperator 的 anticipatory gaze。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 头部主视觉如何主动转向、提前看目标和减少盲区的问题。
2. 对应“紧凑轻量头部 + 躯干内容屏”主线下，头部运动是否真正带来任务收益的评测。
3. 对应陪伴交互中的视线行为：看向用户、看向目标、提前看路径，都会影响产品感。

资源消耗与部署信号：

1. IsaacLab、humanoid torso 和 `2200` episodes 属于离线 benchmark，不是端侧部署方案。
2. `GALT` 指标可低成本转成 Kinbot 主动观测评测，不必引入完整 benchmark。
3. 主动视觉会增加头部电机控制、机械寿命和用户感受约束，需要与当前结构方案共同评审。

优势：

1. 提供 headcam 与 fixedcam 的成对对照，适合判断头部主动视觉是否值得。
2. `GALT` 将视觉提前量量化，便于产品和算法共同讨论。
3. 明确多任务策略在 OOD 下易退化，提醒 Kinbot 不要过早承诺泛化。

劣势与风险：

1. 操作任务和 humanoid 形态不等同于 Kinbot 家庭移动场景。
2. 主动凝视若设计不当，会产生打扰感或不自然产品体验。
3. 需要结构、控制、交互和视觉算法联合评估，不能单看模型收益。

推荐理由：

建议作为 B 级输入。Kinbot 可用 `gaze_action_lead_time`、`active_view_benefit_delta` 和 `user_perceived_naturalness` 评估头部主动视觉价值。

### 3.8 Agent-Centric Observation Adaptation for Robust Visual Control under Dynamic Perturbations

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.24661](https://arxiv.org/abs/2604.24661) |
| 本轮 listing 口径 | 2026-05-11 replacement，日更收录 |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | visual degradation, observation adapter, information bottleneck, foreground mask, MoE |

摘要要点转述：

论文研究视觉控制在动态扰动下的鲁棒性，包括天气、传感噪声、压缩伪影和背景干扰。作者指出，传统图像复原常追求像素级 fidelity，但可能把腐蚀类型等任务无关信息编码进 latent，污染下游控制。论文提出 `VDCS` benchmark 和 `ACO-MoE` 观测适配器：冻结 plug-and-play 模块结合 restoration experts 与前景 mask 分支，离线用合成渲染退化数据预训练，推理时只需 corrupted RGB。实验显示在多种控制 benchmark 上可恢复 `95.3%` 的 clean-input performance，并能泛化到未见扰动。

解决 Kinbot 的什么问题：

1. 对应纯视觉主线下雨雾、暗光、压缩、反光、脏镜头和背景干扰导致感知不稳定的问题。
2. 对应 `observability_data_governance`：应评估下游任务鲁棒性，而不是只看图像复原质量。
3. 对应 `mobility_navigation` 和 `companion_interaction`：前景人物、障碍和目标物稳定性比背景像素复原更重要。

资源消耗与部署信号：

1. 插件式 adapter 有部署吸引力，但 MoE routing 和多专家仍需端侧延迟、显存和功耗测试。
2. 合成退化预训练可降低真实数据采集成本，但 Kinbot 需构造家庭退化场景。
3. 当前评测偏控制 benchmark，实际家庭巡护和人识别还需任务级验证。

优势：

1. 明确从像素复原转向任务相关信息保真，契合端侧资源约束。
2. 不需要推理时知道退化类型，有利于真实环境不确定性。
3. 可作为纯视觉鲁棒性 benchmark 的一部分。

劣势与风险：

1. 前景 mask 错误会放大漏检或误检。
2. synthetic-to-real 退化差距可能导致家庭真实表现不稳定。
3. MoE 复杂度需要严控，不能成为新的主链路负担。

推荐理由：

建议作为 B+ 级输入。Kinbot 可吸收 `task_relevant_visual_robustness` 和 `foreground_stability_under_degradation` 指标，不直接引入完整 ACO-MoE。

### 3.9 CommandSwarm: Safety-Aware Natural Language-to-Behavior-Tree Generation for Robotic Swarms

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.07764](https://arxiv.org/abs/2605.07764) |
| 本轮 listing 口径 | 2026-05-11 new submission，日更收录 |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | natural language interface, behavior tree, safety filter, parser validation, quantized LLM |

摘要要点转述：

论文面向非专家通过自然语言控制机器人群的场景，提出从语音或文本命令生成 XML behavior tree 的安全管线。系统包含多语翻译、命令级安全过滤、受约束 prompting、LoRA 适配 LLM 和针对可执行 primitive 白名单的 deterministic parser validation。作者评测 `11` 个 `6.7B` 到 `14B` 开源模型，均使用 `4-bit` 量化；LoRA 适配 `Falcon3-Instruct-10B` 后，parser accepted syntactic validity 从 `0%` 提升到 `72%`。论文强调生成质量不足以保证自治部署，安全过滤和 parser gate 仍是必要执行门。

解决 Kinbot 的什么问题：

1. 对应用户自然语言指令如何转成可执行任务结构，同时避免非法动作和格式错误的问题。
2. 对应 `safety_compliance_authorization`：执行前必须经过白名单、语法校验和安全过滤。
3. 对应家属 App / 机器人交互中的多语、口语化和模糊命令处理。

资源消耗与部署信号：

1. `6.7B` 到 `14B`、`4-bit` 量化模型仍需评估是否适配 Kinbot 端侧默认资源线。
2. 行为树、parser 和白名单本身是轻量工程结构，可先吸收。
3. swarm 控制不是 Kinbot 一代主线，但语言到可验证执行结构的思想可迁移到单机任务。

优势：

1. 将 LLM 输出放进确定性 parser 和 primitive 白名单，降低幻觉执行风险。
2. 把 BLEU / ROUGE 与 parser acceptance 分开评估，避免只看语言相似度。
3. 兼顾多语输入和量化模型，贴近日常用户命令入口。

劣势与风险：

1. swarm 任务与家庭单机任务不同，行为树 primitive 需要重新定义。
2. parser acceptance 仍不等于行为安全，必须结合场景状态和权限。
3. `72%` 合法率说明生成链路还不能无人工兜底。

推荐理由：

建议作为 B 级输入。Kinbot 可吸收“自然语言 -> 受限任务结构 -> parser gate -> 权限 / 安全检查 -> 执行”的链路，不吸收 swarm 形态。

### 3.10 Governed Capability Evolution: Lifecycle-Time Compatibility Checking and Rollback for AI-Component-Based Systems, with Embodied Agents as Case Study

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.08059](https://arxiv.org/abs/2604.08059) |
| 本轮 listing 口径 | 2026-05-11 replacement，日更收录 |
| 分类 | `cs.SE`, `cs.RO` |
| 方法关键词 | AI component lifecycle, compatibility check, shadow deployment, gated activation, rollback |

摘要要点转述：

论文把 AI 组件能力升级视为生命周期治理问题：当一个能力模块升级到新版本，系统必须判断是否可安全激活、在什么部署条件下激活、如何监控以及何时回滚。作者认为 canary、blue-green、feature flags 和 MLOps 不能完全覆盖具身 agent，因为具身运行时是有状态、受策略约束且可能驱动物理动作的系统。论文提出 staged upgrade framework，包含 interface、policy、behavioral、recovery 四类兼容性检查，并按 candidate validation、sandbox evaluation、shadow deployment、gated activation、online monitoring 和 rollback 推进。PyBullet / ROS 2 原型在 6 轮升级和 15 个随机种子上显示，naive upgrade 后期 unsafe activation 到 `60%`，治理式升级保持可比成功率且 unsafe activation 为 `0`，shadow deployment 发现了 sandbox 看不到的 `40%` regression，rollback 在漂移场景中成功率为 `79.8%`。

解决 Kinbot 的什么问题：

1. 对应 Phase 5 以后 AI 能力、感知模型、任务策略和安全规则升级时的发布治理。
2. 对应 `platform_runtime` 和 `safety_compliance_authorization`：能力升级不能只靠离线指标，必须验证接口、策略、行为和恢复。
3. 对应实机试点和量产导入：shadow、gated activation 和 rollback 应成为试点证据包的一部分。

资源消耗与部署信号：

1. 治理框架主要增加测试、部署和监控流程成本，不直接增加端侧运行模型负担。
2. shadow deployment 需要并行评估资源和日志治理，可能影响试点平台建设。
3. rollback 需要能力版本、配置、状态迁移和策略回退机制提前设计。

优势：

1. 直接针对有状态、物理执行、策略约束的 embodied agent。
2. 四类兼容性检查清晰，可转化为 Kinbot 发布前 checklist。
3. 强调 shadow deployment 可发现 sandbox 不可见回归，贴合家庭机器人真实部署风险。

劣势与风险：

1. PyBullet / ROS 2 原型不等同于 Kinbot 实机量产流程。
2. 治理流程如果过重，会拖慢模型迭代，需要按风险分级。
3. rollback 成功率未达 `100%`，关键安全能力仍需硬门槛和人工兜底。

推荐理由：

建议作为 A- 级输入。Kinbot 可把四类兼容性检查和 staged upgrade 流程加入 Phase 5 后续验证治理候选清单，但本轮不写成已实施事实。

## 4. 对 Kinbot 的落地 / 文档建议

本轮建议只做研究目录留存，不回写 `docs/00_governance/03_decision_log.md` 或主线架构文档。原因是这些论文提供的是方法启发、评测指标和验证治理候选项，尚未形成用户确认的稳定产品 / 架构判断。

可在后续专题中考虑的轻量动作：

1. 在长期记忆原型评测中加入 `state-conditioned_memory_compilation`、`memory_compile_latency`、`memory_misalignment_rate`。
2. 在后台 / 边缘协同研究中加入 `TTFT`、`KV-cache reuse`、`state eviction spike` 和隐私最小化检查。
3. 在 WAM / VLA 原型评测中加入 `action_state_consistency`、`background_collapse_alert` 和多候选 rollout 选择成本。
4. 在纯视觉导航验证中加入 `BEV_prior_alignment`、`sparse_topology_memory_cost`、`visual_degradation_task_success`。
5. 在社会导航试点中加入近距离会车、用户速度变化、主观舒适度和文化差异指标。
6. 在 Phase 5 后续治理讨论中，把 AI 能力升级检查分成 interface、policy、behavioral、recovery 四类，并保留 shadow / rollback 作为候选门控动作。

本轮未进入主线的原因：

1. 不改变一代纯视觉传感主线；雷达、事件相机、V2X 和 UAV 形态均未纳入默认产品链路。
2. 不改变 `12GB RAM + 32GB Flash` 默认量产资源线；CSR 等超大模型能力只作为后台 / 边缘协同研究输入。
3. 不新增灵巧操作、实验室自动化或多机器人群控能力为一代默认能力。
4. 不把论文 benchmark 结果写成 Kinbot 已验证事实；所有指标均需后续本地数据、仿真或实机试点验证。

## 5. 来源

1. arXiv 官方 `cs.RO/new` listing：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv 官方 `cs.RO/recent` listing：[https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
3. `MemCompiler`：[https://arxiv.org/abs/2605.07594](https://arxiv.org/abs/2605.07594)
4. `CSR`：[https://arxiv.org/abs/2605.07325](https://arxiv.org/abs/2605.07325)
5. `Is the Future Compatible?`：[https://arxiv.org/abs/2605.07514](https://arxiv.org/abs/2605.07514)
6. `PathPainter`：[https://arxiv.org/abs/2605.07496](https://arxiv.org/abs/2605.07496)
7. `Bi3`：[https://arxiv.org/abs/2605.06863](https://arxiv.org/abs/2605.06863)
8. `Palm-sized Omnidirectional Vision-Based UAV Exploration`：[https://arxiv.org/abs/2605.07275](https://arxiv.org/abs/2605.07275)
9. `TAVIS`：[https://arxiv.org/abs/2605.07943](https://arxiv.org/abs/2605.07943)
10. `Agent-Centric Observation Adaptation`：[https://arxiv.org/abs/2604.24661](https://arxiv.org/abs/2604.24661)
11. `CommandSwarm`：[https://arxiv.org/abs/2605.07764](https://arxiv.org/abs/2605.07764)
12. `Governed Capability Evolution`：[https://arxiv.org/abs/2604.08059](https://arxiv.org/abs/2604.08059)
