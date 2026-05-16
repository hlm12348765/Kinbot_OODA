# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-09
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-09 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 仍为 `Friday, 8 May 2026`，合计 `68` 篇 entries；按 2026-05-09 日更补录口径，筛选前序纪要未收录且与 Kinbot 纯视觉低算力导航、开放式目标推断、跨模态导航协作、覆盖 / 巡护信息抽取、安全控制、动作 chunk、低延迟动作生成、world model 表征和有限视野主动感知相关的 10 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-09。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 仍显示最新 listing 日期为 `Friday, 8 May 2026`，合计 `68` 篇 entries；其中 new submissions `32` 篇、cross submissions `10` 篇、replacement submissions `26` 篇。
3. arXiv 官方 `cs.RO/recent` 显示 `Fri, 8 May 2026` 下有 `42` 篇 recent entries，未出现 `Saturday, 9 May 2026` 的 Robotics 新批次。
4. 因无 2026-05-09 Robotics 新 listing，本轮按“日更补录”处理：优先从 `2026-05-08` 批次和 replacement 中补入前序 `2026-04-29` 至 `2026-05-08` Kinbot 每日论文纪要未收录的条目。
5. 关键词与主题包括 `visual point-goal navigation`、`goal inference`、`cross-modal navigation`、`coverage`、`patrolling`、`control barrier function`、`reach-avoid`、`adaptive action chunking`、`flow matching`、`robotic world model`、`limited field-of-view`。

筛选标准：

1. 是否对应 Kinbot 一代主线问题：纯视觉、端侧资源约束、家庭巡护、低频复杂决策、用户目标理解、运行时安全和可审计降级。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`decision_orchestration`、`safety_compliance_authorization`、`observability_data_governance`、`companion_interaction`、`platform_runtime`。
3. 是否提供资源消耗、实时性、样本效率、安全约束、长期覆盖、状态不确定性或工程部署信号。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `VLA-GSE`、`CKT-WAM`、`OA-WAM`、`AsyncVLA`、`Stellar VLA`、`TriRelVLA` 等论文对未来 VLA / WAM 工程优化有价值，但多数仍偏操作任务、模型适配或高复杂度泛化；本轮仅保留更贴近 Kinbot 一代端侧可控性的动作 chunk、低延迟生成和 world model 表征选择。
2. `DexSim2Real`、`DexSynRefine`、`TouchDrive`、`Contact-Free Grasp Stability Prediction`、`VISER` 等论文与抓取、触觉或操作仿真强相关；Kinbot 一代当前不把高自由度操作作为主线，因此未优先进入主卡片。
3. `Event-camera VLC`、`roadside LiDAR synthesis`、`GA3T`、`V2X multi-robot coordination` 等依赖事件相机、LiDAR、异构机群或车路协同，不写成 Kinbot 一代传感主线或形态变化。
4. 水下喷射、无人机吊挂、鸟翼 MAV、四足 / humanoid parkour、球形 humanoid 等论文形态偏离家庭服务机器人底盘；仅作为相邻技术观察。

## 2. 本轮总判断

本轮无新的 Robotics 官方批次，因此价值不在“抢最新编号”，而在补齐昨日新批次中与 Kinbot 一代更贴近、但没有进入主卡片的工程信号。最值得保留的是 4 类：低计算纯视觉导航、对话中的开放目标推断、覆盖 / 巡护的环境信息抽取、安全控制的可行域扩大，以及生成式动作模型在端侧运行时的自适应执行。

对 Kinbot 最有价值的结论有 6 个：

1. **低算力视觉导航仍有路线价值**：仿生点目标导航提示，家庭机器人不应默认把所有导航问题都推给大型 VLN / VLA。
2. **用户目标不是一次性解析出来的**：开放式对话中的目标分布、候选目标和不确定性表达，应进入陪伴交互与任务接单前置判断。
3. **家庭巡护需要长期信息抽取**：环境结构、覆盖收益和 stochastic reachability 可以作为低频巡护策略的上层信号，而不是高频控制环。
4. **安全控制要减少过度保守**：CBF / MPC / reach-avoid 的新方法给了更大可行域，但产品侧仍应把它们放在安全壳和离线验证层。
5. **动作生成的实时性比模型规模更关键**：自适应 chunk 和单步 flow matching 都说明，生成式策略若进入机器人运行时，必须先回答延迟、重规划和保守停止问题。
6. **world model 的评估不能只看画面像不像**：语义 latent、下游策略表现和表征质量比单纯重建指标更接近机器人实际价值。

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把跨模态多智能体、开放目标推断、BOIL、CBF-MPC、AQC、A2A 和 world model 全部产品化，会明显过复杂”。建议仅吸收 5 个轻量动作：低算力视觉导航对照基线、目标不确定性字段、巡护覆盖收益指标、安全可行域离线测试、动作 chunk / world model 的执行可信度评估。跨模态导航、VLA/WAM 和移动抓取继续留在研究区。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | An Efficient Insect-inspired Approach for Visual Point-goal Navigation | 作为纯视觉低算力导航对照基线，验证小模型 / 规则 + 记忆路线是否足以覆盖家庭短程点目标导航。 |
| A | Flexible Agent Alignment with Goal Inference from Open-Ended Dialog | 纳入 `companion_interaction` 研究输入，补充用户目标分布、候选目标和不确定性表达。 |
| A- | Cross-Modal Navigation with Multi-Agent Reinforcement Learning | 作为运行时“轻量专门 agent 协作”的研究输入；不改变 Kinbot 一代纯视觉主线。 |
| A- | BOIL: Learning Environment Personalized Information | 纳入家庭巡护 / 覆盖策略研究，评估环境结构信息对长期巡护路线的价值。 |
| A- | Maximal Controlled Invariant-MPC | 用于 Phase 5 安全控制可行域和保守性评测，不直接进入产品控制器。 |
| A- | Approximation-Free Control Barrier Functions for Prescribed-Time Reach-Avoid of Unknown Systems | 作为未知动力学 / 动态障碍下 reach-avoid 安全壳研究输入。 |
| B+ | Adaptive Q-Chunking for Offline-to-Online Reinforcement Learning | 用于未来 VLA / WAM 动作片段执行策略，当前只吸收“状态相关 chunk 长度”原则。 |
| B+ | Action-to-Action Flow Matching | 作为低延迟生成式动作策略候选，重点关注单步推理和视觉扰动鲁棒性。 |
| B+ | Reconstruction or Semantics? What Makes a Latent Space Useful for Robotic World Models | 用于 world model 评测口径：不能只看重建，要看策略相关语义。 |
| B | Visibility-Aware Mobile Grasping in Dynamic Environments | 作为有限视野主动感知 / 行为树故障恢复研究输入，一代不吸收移动抓取能力本身。 |

## 3. 论文卡片

### 3.1 An Efficient Insect-inspired Approach for Visual Point-goal Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2601.16806](https://arxiv.org/abs/2601.16806) |
| 本轮 listing 口径 | 2026-05-08 replacement，日更补录 |
| 分类 | `cs.AI`, `cs.RO` |
| 方法关键词 | visual point-goal navigation, insect-inspired model, associative learning, path integration, low compute |

摘要要点转述：

论文提出一种仿昆虫的视觉点目标导航模型，把与联想学习和路径积分相关的昆虫脑结构抽象成导航机制，并映射到 Habitat point-goal navigation 任务。作者强调，该模型在许多情况下能达到接近近期强模型的表现，但计算成本低很多；在更真实的模拟环境中也表现出对扰动的鲁棒性。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 家庭短程导航、回桩、巡护点位到达和房间内局部移动。
2. 对应 `mobility_navigation`：不是所有点目标导航都需要大模型或大规模 VLN。
3. 对应 `platform_runtime`：一代 `12GB RAM + 32GB Flash` 下，需要保留低成本导航基线。

资源消耗与部署信号：

1. 论文明确强调“多数量级更低”的计算成本，是本轮最贴近 Kinbot 端侧资源约束的信号之一。
2. 方法更像低算力导航基线或局部导航辅助，不替代语义级任务理解。
3. 若进入 Kinbot 评测，应优先在家庭平面图、视觉扰动、遮挡和低光场景中做对照。

优势：

1. 贴合纯视觉和端侧约束，不依赖昂贵主动传感。
2. 适合作为大模型导航方案的 sanity baseline。
3. 可帮助识别哪些家庭导航问题根本不需要高复杂度模型。

劣势与风险：

1. 点目标导航与自然语言目标导航不同，不能覆盖“找杯子”“去老人常坐的位置”等语义任务。
2. 仿真结果仍需迁移到 Kinbot 的真实家庭底盘、相机视角和光照条件。
3. 过度依赖低级导航可能削弱语义记忆和用户意图理解。

推荐理由：

建议作为本轮 A 级输入。Kinbot 可建立 `low_compute_visual_nav_baseline`，在 VLN / NFM 方案过重时提供工程对照。

### 3.2 Flexible Agent Alignment with Goal Inference from Open-Ended Dialog

| 项目 | 内容 |
| --- | --- |
| arXiv | [2508.15119](https://arxiv.org/abs/2508.15119) |
| 本轮 listing 口径 | 2026-05-08 replacement，日更补录，前版本题名为 `Open-Universe Assistance Games` |
| 分类 | `cs.AI`, `cs.CL`, `cs.LG`, `cs.RO` |
| 方法关键词 | assistance games, open-ended dialog, goal inference, uncertainty-aware preference, household robotics |

摘要要点转述：

论文把 LLM-based assistant / embodied agent 的目标理解形式化为开放宇宙协助博弈：用户目标不是预先固定的，而是在多轮对话中逐步表达、修正和收敛。作者提出 `GOOD` 方法，从对话中抽取自然语言目标候选，并通过模拟用户进行概率推断，得到可解释且带不确定性的目标分布。实验覆盖文本购物、AI2-THOR 家庭机器人和代码任务，结果显示显式目标跟踪优于无目标跟踪基线。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 陪伴交互中的“用户真正想要什么”，尤其是老人、家属和照护者目标不一致时。
2. 对应 `decision_orchestration`：任务接单前应有目标候选、置信度和澄清策略。
3. 对应 `companion_interaction`：长期陪伴不能把每次对话当成孤立命令。

资源消耗与部署信号：

1. 方法依赖 LLM 进行候选目标抽取和模拟推断，不适合高频常驻。
2. 可作为低频任务澄清、复杂请求确认或家属远程配置时的云 / 端协同能力。
3. 目标分布本身可压缩为结构化状态，不需要长期保存原始对话全文。

优势：

1. 把“目标不确定”显式建模，避免机器人过早假装理解。
2. 适合家庭服务中偏好变化、上下文变化和多轮对话场景。
3. 与 Kinbot 的授权、澄清和任务拒绝机制兼容。

劣势与风险：

1. 论文实验多为模拟或文本环境，真实家庭中的情绪、语气和隐含约束更复杂。
2. LLM-simulated user 不能替代真实用户研究。
3. 若长期积累偏好，需要严格隐私、可删除和家庭成员权限设计。

推荐理由：

建议作为 A 级输入。Kinbot 可先引入轻量字段：`goal_hypotheses`、`goal_confidence`、`clarification_needed`，不新增复杂人格系统。

### 3.3 Cross-Modal Navigation with Multi-Agent Reinforcement Learning

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06595](https://arxiv.org/abs/2605.06595) |
| 本轮 listing 口径 | 2026-05-08 new submission，日更补录 |
| 分类 | `cs.RO`, `cs.AI`, `cs.LG`, `cs.MA` |
| 方法关键词 | cross-modal navigation, MARL, modality-specialized agents, visual-acoustic navigation |

摘要要点转述：

论文研究跨模态导航中的协作问题。作者认为，多模态数据难以高质量对齐，单体模型会扩大策略空间并增加训练难度；因此提出 `CRONA`，用多个轻量、模态专门化 agent 协作，配合控制相关辅助 belief 和集中式多模态 critic。视觉-声学导航实验显示，多 agent 方法相比单 agent 基线在性能和效率上更好；短程显著线索下有限模态即可，复杂大环境则需要更丰富感知和更大模型容量。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 对“不同感知线索如何协作”的运行时架构判断。
2. 对应 `mobility_navigation` 和 `world_state_memory`：视觉主线之外的非主传感信号若存在，应作为辅助 belief，不应直接膨胀主策略。
3. 对应复杂度治理：轻量专门 agent 可能比一个巨大融合模型更可控。

资源消耗与部署信号：

1. 多 agent 并行执行可能提升模块化，但也会增加调度、同步和日志复杂度。
2. 论文涉及视觉-声学导航；Kinbot 一代仍不应因此改变“纯视觉传感主线”。
3. 可把其思想降级为多路置信度融合和辅助线索仲裁，而非引入完整 MARL 运行时。

优势：

1. 对多模态协作给出模块化路线，避免单体模型过大。
2. 强调不同环境尺度需要不同模态和容量，贴合 Kinbot 分级能力策略。
3. 可启发端侧并行轻量专家的运行时组织方式。

劣势与风险：

1. MARL 训练和验证成本高，不适合直接进入一代产品主循环。
2. 视觉-声学设定可能诱导传感边界漂移。
3. 多 agent 决策一致性、责任归属和失败解释需要额外治理。

推荐理由：

建议作为 A- 级研究输入。Kinbot 可吸收“轻量专门模块 + 中央仲裁”的架构启发，但不把跨模态 MARL 写成一代主线。

### 3.4 BOIL: Learning Environment Personalized Information

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.17137](https://arxiv.org/abs/2604.17137) |
| 本轮 listing 口径 | 2026-05-08 replacement，日更补录 |
| 分类 | `cs.LG`, `cs.RO` |
| 方法关键词 | environment information, PageRank, common information maximization, coverage, patrolling, stochastic reachability |

摘要要点转述：

论文提出 `BOIL`，用于从复杂环境结构中抽取对长期行为有价值的信息。方法结合 PageRank 与 common information maximization，生成可指导覆盖、巡逻和随机可达性的策略分布。作者强调，该过程可在多 agent 或信息有限环境中提炼长期行为线索，并在复杂环境实验中优于启发式方法。

解决 Kinbot 的什么问题：

1. 对应家庭安全巡护：哪些区域更关键、哪些路径更有信息价值、哪些点位应高频观察。
2. 对应 `world_state_memory`：环境结构不是静态地图，还包含长期行为和覆盖价值。
3. 对应 `observability_data_governance`：巡护策略应能解释“为什么今天多看厨房 / 门口”。

资源消耗与部署信号：

1. BOIL 更适合离线或低频更新，不适合高频运动控制。
2. 对 Kinbot 可映射为家庭图上的节点重要度、覆盖收益和巡护优先级。
3. 家庭地图规模小，若实现得当，资源压力应低于大模型路径规划。

优势：

1. 直接对接 coverage、patrolling 和 stochastic reachability，贴合家庭巡护。
2. 可解释性强于黑盒策略：节点重要度和信息收益能进入日志。
3. 适合与 Phase 5 巡护验证指标结合。

劣势与风险：

1. 论文偏方法层，缺少 Kinbot 家庭场景的真实用户价值验证。
2. 如果只按图结构排序，可能忽略老人作息、宠物、临时障碍和隐私区域。
3. 多 agent 背景不应迁移为 Kinbot 必须机群化。

推荐理由：

建议作为 A- 级输入。Kinbot 可先把 BOIL 思路转成 `coverage_value` 和 `patrol_information_gain`，不新增复杂多 agent 体系。

### 3.5 Maximal Controlled Invariant-MPC: Enhancing Feasibility and Reducing Conservatism through Terminal CBF Constraint in Safety-Critical Control

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.05575](https://arxiv.org/abs/2605.05575) |
| 本轮 listing 口径 | 2026-05-08 cross submission，日更补录 |
| 分类 | `eess.SY`, `cs.RO`, `math.OC` |
| 方法关键词 | MPC, CBF, terminal constraint, controlled invariant set, safety-critical control |

摘要要点转述：

论文研究安全关键控制中 CBF 约束过于保守的问题。作者提出一种把 CBF 作为终端约束的 MPC 形式，并证明随着预测时域增加，可以改善可行性和可达状态空间。其构造性证明还可用于 warm-start 非线性优化，降低计算时间。非完整系统仿真显示，不可行点减少约 `1.7x` 到 `2.7x`，可达状态空间扩大。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 底盘慢行、避障、接近老人 / 家具和进入狭窄区域时的安全边界。
2. 对应 `safety_compliance_authorization`：安全约束不能过度保守到产品不可用。
3. 对应 Phase 5：需要比较不同安全壳对可行路径、停机率和用户体验的影响。

资源消耗与部署信号：

1. 非线性 MPC + CBF 对端侧实时计算有要求，需结合底盘控制周期评估。
2. warm-start 可降低计算负担，但仍应先作为仿真 / 离线评测方法。
3. 家庭低速移动场景可能比高速系统更容易试点，但必须保留硬安全兜底。

优势：

1. 直接针对安全控制“太保守”的产品痛点。
2. 可行域和不可行点减少是可量化评测指标。
3. 适合生成 Phase 5 安全控制对照实验。

劣势与风险：

1. 论文仿真系统较简单，真实家庭中的人、宠物、软障碍和传感误差更复杂。
2. 若错误调参，扩大可行域可能带来安全余量下降。
3. 不能替代上层任务授权和低层紧急停止。

推荐理由：

建议作为 A- 级验证输入。Kinbot 可在仿真中比较 `conservative_stop_rate`、`reachable_safe_area` 和 `near_obstacle_success_rate`，暂不回写产品控制器。

### 3.6 Approximation-Free Control Barrier Functions for Prescribed-Time Reach-Avoid of Unknown Systems

| 项目 | 内容 |
| --- | --- |
| arXiv | [2511.23022](https://arxiv.org/abs/2511.23022) |
| 本轮 listing 口径 | 2026-05-08 replacement，日更补录 |
| 分类 | `eess.SY`, `cs.RO`, `math.OC` |
| 方法关键词 | control barrier function, prescribed-time reach-avoid, unknown dynamics, moving obstacles, virtual confinement zone |

摘要要点转述：

论文研究未知非线性系统在动态障碍环境中的 prescribed-time reach-avoid 控制。作者不要求在线模型学习、未知量边界估计或离线预计算，而是在简单虚拟系统上解 CBF-QP，生成满足时间变化障碍 / 目标集合的安全参考，再用 approximation-free feedback law 将真实系统限制在虚拟参考附近的 confinement zone 中。仿真显示可以在动态障碍下实现实时安全和规定时间内到达目标。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 家庭中动态障碍、人突然进入路线、老人移动和宠物穿行。
2. 对应 `mobility_navigation`：目标到达不能只看路径规划，还要保证时限和动态安全。
3. 对应 `safety_compliance_authorization`：未知动力学或模型误差下仍需保守安全壳。

资源消耗与部署信号：

1. 论文强调不需要在线模型学习和离线预计算，有利于实时部署想象空间。
2. 仍依赖 CBF-QP 和反馈律实现，需要底盘控制接口与视觉障碍估计稳定。
3. 对 Kinbot 更适合先作为动态障碍仿真评测基线。

优势：

1. 关注未知系统和移动障碍，比静态安全约束更贴近家庭。
2. prescribed-time reach-avoid 适合紧急响应和限时任务。
3. 可与现有安全停机策略形成对照。

劣势与风险：

1. 仿真验证不足以证明家庭实机安全。
2. 视觉障碍检测不稳定时，控制层再强也会基于错误输入。
3. 规定时间到达不能凌驾于老人安全、舒适距离和授权边界之上。

推荐理由：

建议作为 A- 级安全研究输入。Kinbot 可将其转化为 Phase 5 的 `dynamic_reach_avoid` 场景，不直接改变一代导航栈。

### 3.7 Adaptive Q-Chunking for Offline-to-Online Reinforcement Learning

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.05544](https://arxiv.org/abs/2605.05544) |
| 本轮 listing 口径 | 2026-05-08 cross submission，日更补录 |
| 分类 | `cs.LG`, `cs.RO` |
| 方法关键词 | adaptive action chunking, offline-to-online RL, horizon selection, VLA action sequence |

摘要要点转述：

论文指出，offline-to-online RL 中的 action chunking 虽能降低多步 off-policy bias 并提升时间一致性，但固定 chunk 长度不适合所有状态：接触事件附近需要短 chunk 保持反应能力，自由空间运动则可用长 chunk 改善 credit assignment。作者提出 `AQC`，用相对每个 horizon baseline 的 advantage 和 discount normalization 来选择 chunk 长度，避免 naive critic 比较总是偏向短 chunk。实验覆盖 OGBench、Robomimic，并可增强预测动作序列的大规模 VLA 模型。

解决 Kinbot 的什么问题：

1. 对应未来 VLA / WAM 或生成式策略输出多步动作片段时，执行多久再重规划的问题。
2. 对应 `decision_orchestration`：低风险自由移动可长 chunk，高风险近人 / 近障碍必须短 chunk。
3. 对应 `safety_compliance_authorization`：动作片段长度本身应受状态风险约束。

资源消耗与部署信号：

1. 需要训练多个 horizon 或具备多 horizon critic，端侧直接部署成本不低。
2. 对 Kinbot 当前一代，可先吸收状态相关 action horizon 原则，而非引入完整 RL 方案。
3. 适合在仿真或离线日志上评估 `chunk_length_by_risk`。

优势：

1. 把动作片段长度从固定超参变成状态相关决策。
2. 与安全停机、重规划和高风险区域慢行策略兼容。
3. 对未来 VLA 动作序列有明确工程价值。

劣势与风险：

1. 主要实验仍偏操作 / RL benchmark，导航和陪伴场景需重做验证。
2. 多 horizon 估值可能增加训练和调参复杂度。
3. 若 risk signal 不准，长 chunk 会放大错误执行。

推荐理由：

建议作为 B+ 输入。Kinbot 当前吸收原则即可：`action_horizon` 应随风险、置信度和人机距离动态收缩。

### 3.8 Action-to-Action Flow Matching

| 项目 | 内容 |
| --- | --- |
| arXiv | [2602.07322](https://arxiv.org/abs/2602.07322) |
| 本轮 listing 口径 | 2026-05-08 replacement，日更补录 |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | flow matching, diffusion policy, action generation, low latency, visual perturbation robustness |

摘要要点转述：

论文针对 diffusion policy 需要从随机高斯噪声多步去噪、导致实时控制延迟高的问题，提出 `Action-to-Action flow matching`。方法不从无信息噪声开始，而是利用历史本体动作序列，将其编码到高维 latent 中作为动作生成起点，从而绕过昂贵迭代去噪，并保留物理动态和时间连续性。实验显示其训练效率、推理速度、泛化和视觉扰动鲁棒性较好，甚至可在单步推理中生成高质量动作。

解决 Kinbot 的什么问题：

1. 对应未来生成式低层策略的端侧延迟问题。
2. 对应 `platform_runtime`：若生成式模型进入机器人运行时，推理步数和响应延迟必须可控。
3. 对应 `mobility_navigation` / 未来操作能力：连续动作不能每一步都等待重型扩散采样。

资源消耗与部署信号：

1. 单步或少步推理对端侧资源更友好。
2. 方法依赖历史动作序列和策略训练，不是即插即用模块。
3. 对 Kinbot 当前一代更适合作为未来策略模型候选，不进入冻结主线。

优势：

1. 直接解决 diffusion policy 的高延迟痛点。
2. 利用历史动作连续性，符合机器人真实运动过程。
3. 对视觉扰动鲁棒性有提示价值。

劣势与风险：

1. 论文仍偏操作策略，Kinbot 一代导航和陪伴任务不能直接复用。
2. 少步推理并不自动等于安全，需要外部安全壳和可信度检测。
3. 历史动作若已经偏离目标，可能把错误连续性带入下一步。

推荐理由：

建议作为 B+ 级研究输入。Kinbot 应记录为“低延迟生成式动作策略候选”，不影响当前纯视觉导航主线。

### 3.9 Reconstruction or Semantics? What Makes a Latent Space Useful for Robotic World Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06388](https://arxiv.org/abs/2605.06388) |
| 本轮 listing 口径 | 2026-05-08 cross submission，日更补录 |
| 分类 | `cs.CV`, `cs.LG`, `cs.RO` |
| 方法关键词 | robotic world model, latent diffusion, semantic latent, policy evaluation, representation quality |

摘要要点转述：

论文研究 action-conditioned video diffusion world model 中应选什么 latent space。作者比较 6 类重建型和语义型 encoder，并提出用视觉保真、规划 / 下游策略表现、latent 表征质量三条轴评估 world model。结论是，画面重建好不代表机器人策略有用；VAE / Cosmos 等重建型 encoder 像素指标强，但 V-JEPA 2.1、Web-DINO、SigLIP 2 等语义型 encoder 在策略相关表现和表征质量上更好。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 如果未来用 world model 做离线评测或失败复盘，不能只看生成画面是否逼真。
2. 对应 `world_state_memory`：语义可用性比像素级重建更接近家庭机器人任务价值。
3. 对应 `decision_orchestration`：模型预测要能服务行动选择，而不是只服务可视化。

资源消耗与部署信号：

1. 论文显示可在高维 semantic representation 中训练 world model，但具体端侧成本仍需评估。
2. 对 Kinbot 当前更适合离线模型选择和评测口径，不适合作为一代常驻模块。
3. 语义 encoder 可作为脱敏特征存储候选，但需要隐私和可解释边界。

优势：

1. 明确拆开“画面真实”和“策略有用”两个指标。
2. 对 world model 选型给出可操作评测轴。
3. 支持 Kinbot 将语义记忆优先于原始图像长期保存。

劣势与风险：

1. BridgeV2 和操作任务不等于 Kinbot 家庭导航 / 巡护。
2. 语义 encoder 的偏差会影响长期记忆和规划。
3. 若引入 world model 评测轴过多，会增加研究治理复杂度。

推荐理由：

建议作为 B+ 输入。Kinbot 可把 world model 研究评价改为 `visual_fidelity + policy_relevance + representation_quality`，不以视频像真作为唯一标准。

### 3.10 Visibility-Aware Mobile Grasping in Dynamic Environments

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.02487](https://arxiv.org/abs/2605.02487) |
| 本轮 listing 口径 | 2026-05-08 replacement，日更补录 |
| 分类 | `cs.RO` |
| 方法关键词 | mobile grasping, limited field-of-view, active perception, behavior tree, dynamic unknown environment |

摘要要点转述：

论文研究动态未知环境中的移动抓取，核心难点是机器人视野有限，必须在“多看以降低不确定性”和“移动身体推进任务”之间权衡。作者提出统一系统：低层是带速度感知主动感知的全身规划器，用于安全穿越动态环境；高层是基于行为树的层级规划器，用于生成探索子目标和处理运行时失败。实验覆盖 `400` 个随机仿真场景，并在 Fetch 移动操作平台上部署，在未知静态和动态环境中分别达到 `68.8%` 与 `58.0%` 成功率，相比基线提升 `22.8%` 与 `18.0%`。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 纯视觉有限视野下的“先看清再动”与“边动边观察”权衡。
2. 对应 `mobility_navigation`：未知动态障碍与视野限制不能被路径规划解耦处理。
3. 对应未来操作或近距离服务能力：行为树式故障恢复可复用，但抓取能力本身不是一代主线。

资源消耗与部署信号：

1. 全身规划 + 移动抓取对计算、机械自由度和感知要求较高。
2. Kinbot 一代可只吸收有限视野主动感知和行为树失败恢复思想。
3. `400` 仿真场景和 Fetch 实机结果提供了评测规模参考。

优势：

1. 明确把视野约束纳入运动 / 任务规划，而不是事后补救。
2. 行为树高层结构便于解释失败恢复路径。
3. 动态未知环境更接近真实家庭，而非静态实验台。

劣势与风险：

1. 移动抓取超出 Kinbot 一代当前能力边界。
2. 成功率仍有限，尤其动态环境只有 `58.0%`。
3. 全身规划不适合直接映射到低自由度家庭底盘。

推荐理由：

建议作为 B 级输入。Kinbot 可吸收 `visibility_before_motion` 和 `runtime_failure_subgoal` 两个原则，不吸收移动抓取系统本身。

## 4. 对 Kinbot 的落地 / 文档建议

本轮不建议回写主线架构基线或 `03_decision_log.md`，因为论文结论仍属于研究输入，没有形成经用户确认的稳定产品 / 架构判断。

建议后续低成本吸收以下动作：

1. 在 Phase 5 导航评测中加入 `low_compute_visual_nav_baseline`，避免 VLN / NFM 方案缺少轻量对照。
2. 在交互任务状态中增加 `goal_hypotheses`、`goal_confidence`、`clarification_needed` 候选字段。
3. 在家庭巡护指标中试算 `coverage_value`、`patrol_information_gain`、`dynamic_reach_avoid_success`。
4. 对未来 VLA / WAM 研究统一要求报告 `action_horizon_by_risk`、`inference_steps`、`prediction_observation_consistency`。
5. 对 world model 研究统一采用 `visual_fidelity + policy_relevance + representation_quality` 三轴评估，不以视频像真作为唯一指标。

## 5. 本轮未进入主线的原因

1. 本轮是 2026-05-09 日更补录，官方最新 Robotics listing 仍为 2026-05-08；没有新增事实足以改变 Kinbot 主线基线。
2. 多数论文提供的是研究候选、验证指标或未来能力储备，不构成硬件、传感、形态、BOM 或阶段门变化。
3. 涉及跨模态 MARL、VLA / WAM、移动抓取、主动感知和 CBF-MPC 的内容若直接产品化，会显著增加运行时复杂度、验证负担和安全责任面。
4. 当前主线仍保持：一代纯视觉、端侧敏感数据处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[Robotics new listings for Friday, 8 May 2026](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent` 官方 listing：[Robotics recent listings](https://arxiv.org/list/cs.RO/recent)
3. [An Efficient Insect-inspired Approach for Visual Point-goal Navigation](https://arxiv.org/abs/2601.16806)
4. [Flexible Agent Alignment with Goal Inference from Open-Ended Dialog](https://arxiv.org/abs/2508.15119)
5. [Cross-Modal Navigation with Multi-Agent Reinforcement Learning](https://arxiv.org/abs/2605.06595)
6. [BOIL: Learning Environment Personalized Information](https://arxiv.org/abs/2604.17137)
7. [Maximal Controlled Invariant-MPC](https://arxiv.org/abs/2605.05575)
8. [Approximation-Free Control Barrier Functions for Prescribed-Time Reach-Avoid of Unknown Systems](https://arxiv.org/abs/2511.23022)
9. [Adaptive Q-Chunking for Offline-to-Online Reinforcement Learning](https://arxiv.org/abs/2605.05544)
10. [Action-to-Action Flow Matching](https://arxiv.org/abs/2602.07322)
11. [Reconstruction or Semantics? What Makes a Latent Space Useful for Robotic World Models](https://arxiv.org/abs/2605.06388)
12. [Visibility-Aware Mobile Grasping in Dynamic Environments](https://arxiv.org/abs/2605.02487)
