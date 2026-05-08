# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-08
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-08 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 页面与 arXiv 论文详情页，确认本轮官方最新 Robotics listing 为 `Friday, 8 May 2026`，合计 `68` 篇 entries；筛选与 Kinbot 资源约束规划、巡护运行时监控、模糊指令导航澄清、部分可观测目标导航、可见性保持、主动社会规范判断、VLN 漂移修正、分布偏移不确定性、world action model 自适应执行和长期自主性相关的 10 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-08。

检索范围：

1. arXiv 官方 `cs.RO/new` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期为 `Friday, 8 May 2026`，合计 `68` 篇 entries；其中 new submissions `32` 篇、cross submissions `10` 篇、replacement submissions `26` 篇。
3. 优先覆盖本轮新出现且前序 `2026-04-29` 至 `2026-05-07` Kinbot 每日论文纪要未收录的条目；少量 replacement 只在其与 Kinbot 主线高度相关时纳入。
4. 关键词与主题包括 `resource-constrained planning`、`runtime monitoring`、`persistent surveillance`、`goal-oriented navigation`、`ambiguous user queries`、`visibility-aware tracking`、`active intelligence`、`world action model`、`uncertainty calibration`、`memory-augmented navigation`。

筛选标准：

1. 是否对应 Kinbot 一代主线问题：纯视觉 / 端侧感知、家庭巡护、低频复杂决策、资源约束、长期自主性、运行时安全和可解释交互。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`decision_orchestration`、`safety_compliance_authorization`、`observability_data_governance`、`companion_interaction`、`platform_runtime`。
3. 是否提供资源消耗、延迟、成功率、数据规模、校准、可行性、监控或工程部署信号。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `DexSim2Real`、`DexSynRefine`、`OA-WAM`、`TriRelVLA`、`MARVL`、`TouchDrive` 等论文对操作和未来带臂能力有价值，但更偏高自由度 dexterous manipulation；不作为 Kinbot 一代主线输入。
2. `Event-camera VLC`、`roadside LiDAR dataset synthesis`、`multi-robot V2X`、`GA3T` 等论文依赖事件相机、LiDAR、车路协同或异构机群；本轮只保留为相邻技术观察，不写成 Kinbot 一代传感或形态变化。
3. 软体机器人、水下脉冲喷射、无人机吊挂、四足 / humanoid 动态运动控制等论文，与 Kinbot 当前家庭服务机器人形态偏离较大，未进入主卡片。
4. `VLA-GSE` 和若干 world action model 论文提示未来端侧适配方向，但本轮优先收录更贴近 Kinbot 当前一代验证闭环的执行可信度、资源约束和导航澄清主题。

## 2. 本轮总判断

本轮 `cs.RO` 新批次对 Kinbot 最有价值的信号不是“更大的模型”，而是“真实家庭任务如何在不确定、资源有限、用户指令含糊、视觉只看见局部的情况下仍可被验证和降级”。这与 Kinbot 当前 Phase 5 的双泳道验证口径相吻合：一代产品需要先把巡护、导航、交互澄清、安全停止和日志证据做扎实，而不是把 world model、VLA 和长期自主性直接推成端侧常驻主循环。

对 Kinbot 最有价值的结论有 6 个：

1. **资源约束必须进入任务规划本身**：家庭巡护、电量、时间窗、计算预算和安全 buffer 不能只做执行后检查，应作为任务可行性综合约束。
2. **巡护任务需要黑盒运行时监控**：即使底层 autonomy stack 是黑盒，也可以用区域不确定性和离线不变集做在线监控，形成 Phase 5 可审计证据。
3. **自然语言导航要主动澄清，而不是假装听懂**：当“去那个杯子旁边”这类实例指令含糊时，机器人应构造候选池并问最短二元问题。
4. **未观测区域的语义补全只能作为候选假设**：扩散式 BEV / label map 可帮助找目标，但不能跳过置信度、失败恢复和用户确认。
5. **world action model 的关键不是一次想得更远，而是知道什么时候该停止相信想象**：预测与现实偏离时应提前重规划。
6. **主动性必须受社会规范和空间 grounding 约束**：陪伴型主动行为要先过“该不该做、是否被允许、是否需要授权”的判断。

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把资源规划、运行时监控、语义补全、世界模型和主动人格都直接加成端侧常驻模块，就会过复杂”。建议只吸收 4 类轻量动作：任务级资源预算、巡护运行时监控指标、实例导航澄清策略、world model / VLA 执行前后的可信度过滤。长期人格、自主目标生成和高自由度操作继续留在研究区。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | Resource-Constrained Robotic Planning in the face of Mixed Uncertainty | 纳入 `decision_orchestration` 和 Phase 5 任务可行性评估，重点看资源耗尽前的拒绝 / 降级策略。 |
| A | Monitoring autonomous persistent surveillance missions using invariance | 纳入家庭巡护验证设计，补强黑盒 autonomy stack 的运行时监控和日志证据。 |
| A | Proactive Instance Navigation with Comparative Judgment for Ambiguous User Queries | 纳入 `companion_interaction` 与 `mobility_navigation`，形成模糊地点 / 物体指令的最小澄清策略。 |
| A- | Plug-and-Play Label Map Diffusion for Universal Goal-Oriented Navigation | 作为纯视觉目标导航的未观测区域语义补全研究输入，运行时必须带置信度与回退。 |
| A- | Track A*: Fast Visibility-Aware Trajectory Planning for Active Target Tracking | 用于老人看护 / 巡护中“保持可见性”的离线评测轨迹和场景生成。 |
| A- | RobotEQ | 用于主动陪伴行为的社会规范判断基准，避免主动智能越权。 |
| B+ | Mitigating Error Accumulation in Continuous Navigation via Memory-Augmented Kalman Filtering | 纳入 VLN / NFM 专题观察，用历史锚点修正连续导航漂移。 |
| B+ | Query2Uncertainty | 作为分布偏移下感知置信度校准参考，不直接引入 LiDAR 主线。 |
| B+ | When to Trust Imagination | 用于 world action model / VLA 执行可信度过滤，暂不进入一代常驻闭环。 |
| B | PEPA | 作为长期自主性和陪伴人格研究输入，一代只吸收目标生成前的治理问题，不吸收人格驱动行动。 |

## 3. 论文卡片

### 3.1 Resource-Constrained Robotic Planning in the face of Mixed Uncertainty

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.05797](https://arxiv.org/abs/2605.05797) |
| 本轮 listing 口径 | 2026-05-08 new submission |
| 分类 | `cs.RO`, `cs.FL` |
| 方法关键词 | resource-constrained planning, mixed uncertainty, CMDPST, LTLf, state-space pruning |

摘要要点转述：

论文研究机器人在混合不确定性下完成任务且不耗尽资源的规划问题。作者把系统建模为带集合值转移的消耗型 MDP，用同一个框架表达非确定性动作、可量化噪声、不可量化未知和资源消耗；任务目标用有限轨迹线性时序逻辑表达。求解目标是在不耗尽资源的前提下最大化任务满足概率，并给出直接展开与基于状态空间剪枝的优化求解方法。实验使用仓储运输网络验证方案有效性。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 家庭巡护、老人看护和健康提醒中的电量、时间窗、算力、网络可用性和安全 buffer 约束。
2. 对应 `decision_orchestration`：任务是否可接、是否需要降级、是否应先回桩，不能只靠规则散落在执行链后段。
3. 对应 `safety_compliance_authorization`：资源耗尽本身就是安全风险，尤其是夜间巡护、紧急响应和长程导航。

资源消耗与部署信号：

1. 论文给出状态空间剪枝以降低求解负担，但仍属于规划 / 合成层方法，不适合高频在线重算。
2. 对 Kinbot 更适合用于低频任务接单前的可行性检查和 Phase 5 离线场景评估。
3. 资源建模可以先从电量、任务预计时长、地图置信度、温控 / 算力占用四类最小字段开始。

优势：

1. 把资源约束与任务逻辑统一建模，避免任务计划和资源治理脱节。
2. 同时处理可量化和不可量化不确定性，比只做概率规划更贴近家庭真实环境。
3. 适合支撑“拒绝执行 / 请求澄清 / 降级执行”的可解释理由。

劣势与风险：

1. 形式化建模成本较高，需要先定义 Kinbot 自有任务模板和资源字段。
2. 仓储网络与家庭场景不同，家庭中的人类行为和临时障碍更难穷举。
3. 若直接把 LTLf / MDP 暴露到产品规则层，会增加维护复杂度。

推荐理由：

建议作为本轮 A 级输入。Kinbot 最小吸收动作是建立 `task_resource_budget` 字段：电量下限、预计时长、可重试次数、地图置信度、安全停止条件和回桩触发条件。

### 3.2 Monitoring autonomous persistent surveillance missions using invariance

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06062](https://arxiv.org/abs/2605.06062) |
| 本轮 listing 口径 | 2026-05-08 new submission，ICRA 2026 accepted |
| 分类 | `cs.RO`, `eess.SY` |
| 方法关键词 | persistent surveillance, runtime monitoring, invariance, black-box autonomy, compositional monitor |

摘要要点转述：

论文研究自主机器人执行持续巡护任务时的运行时监控问题，并假设底层 autonomy stack 可以是黑盒。作者把环境划分成有限区域，每个区域有一个不确定性状态：被观测后下降，未观测时上升；闭环系统被建模为状态依赖的 hybrid system，并用离线计算的不变集构造监控器。为解决大空间不变集难求的问题，论文提出按区域分解的组合式监控器，在线检查各低维不变集的合取条件，并在真实机器人迷宫巡护案例中展示可用性。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 家庭安全巡护：不仅要“走过一圈”，还要证明关键区域在时间窗内被充分观测。
2. 对应 `observability_data_governance`：将巡护过程转为可审计的区域不确定性曲线和异常触发记录。
3. 对应 Phase 5：即使导航 / 感知模块尚未完全白盒，也能先建立独立监控证据。

资源消耗与部署信号：

1. 重计算在离线不变集构造阶段，在线只需检查低维区域条件，适合轻量运行时监控。
2. 需要维护区域划分、观测衰减 / 增长模型和巡护任务阈值。
3. 对 Kinbot 可先用于试点家庭地图中的客厅、厨房、门口、卧室门口等少量关键区域。

优势：

1. 与黑盒 autonomy stack 兼容，便于在现有导航链路外加一层监控。
2. 监控指标直接对应“是否长期漏看某区域”，贴合巡护任务价值。
3. 组合式方法有利于从小户型试点逐步扩展。

劣势与风险：

1. 区域划分和不确定性增长模型需要结合家庭场景重新标定。
2. 只能证明监控指标，不等于证明所有安全风险。
3. 如果区域粒度过细，会增加地图维护和日志存储压力。

推荐理由：

建议纳入 Phase 5 家庭巡护验证。Kinbot 可把它转成 `coverage_uncertainty` 指标，记录每个关键区域的最后观测时间、当前不确定性、超阈值告警和恢复动作。

### 3.3 Proactive Instance Navigation with Comparative Judgment for Ambiguous User Queries

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06223](https://arxiv.org/abs/2605.06223) |
| 本轮 listing 口径 | 2026-05-08 cross submission |
| 分类 | `cs.AI`, `cs.RO` |
| 方法关键词 | instance navigation, ambiguous user query, comparative judgment, binary clarification |

摘要要点转述：

论文面向自然语言实例导航中的模糊目标问题。用户往往不会给出完整描述，而现有方法容易在第一个可能目标处停止，或询问无法有效区分候选的开放问题。作者提出 `ProCompNav` 两阶段框架：先构造候选目标池，再通过比较判断选择能最大化区分候选的属性值对，每轮问一个是 / 否问题并批量剔除不一致候选。实验显示，该方法在 `CoIN-Bench` 和 `TextNav` 上提升成功率，同时显著减少用户回答长度。

解决 Kinbot 的什么问题：

1. 对应家庭自然语言导航：“去沙发旁边那个充电器”“把这个放到老人常用的桌子旁”等指令常含糊。
2. 对应 `companion_interaction`：高端产品感不是一直追问，而是问最短、最有区分度的问题。
3. 对应 `mobility_navigation`：目标不唯一时不能直接执行，必须先澄清或给出候选。

资源消耗与部署信号：

1. 主要资源消耗来自候选池构造、属性抽取和视觉 / 语言比较判断。
2. 可以先在低频交互中调用，不必加入高频导航控制环。
3. 二元问题策略可端侧缓存常见家具 / 物体属性，降低大模型调用频率。

优势：

1. 把开放式追问变成候选池上的区分问题，用户负担更低。
2. 与 Kinbot 任务状态机兼容：目标未确认前保持 `pending_clarification`。
3. 适合家庭中多个相似物体和相似地点的实例级导航。

劣势与风险：

1. 需要候选池质量足够好；漏掉真实目标时再聪明的澄清也无效。
2. 对视觉属性和空间关系 grounding 要求高。
3. 如果所有含糊指令都进入多轮澄清，会牺牲自然感，需要设置置信度阈值。

推荐理由：

建议作为本轮 A 级输入。Kinbot 可先固化一个最小策略：当目标候选超过 `1` 个且置信度差距不足时，只问一个能最大区分候选的二元问题；超过两轮仍不确定则请求用户指出或取消任务。

### 3.4 Plug-and-Play Label Map Diffusion for Universal Goal-Oriented Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.05960](https://arxiv.org/abs/2605.05960) |
| 本轮 listing 口径 | 2026-05-08 new submission，ICML 2026 extended version |
| 分类 | `cs.RO` |
| 方法关键词 | goal-oriented navigation, label map diffusion, BEV map completion, partially observed environment |

摘要要点转述：

论文面向目标导向导航中的未探索环境问题。现有地图式方法常依赖完整地图或自车中心语义图，容易出现未观测区域语义不一致。作者提出 `PLMD`，用扩散模型补全 BEV 地图中的障碍和语义标签，把障碍结构先验纳入语义去噪过程，从而在部分观测环境中推断目标可能位置。论文称该方法可作为 plug-and-play 模块接入既有语义地图导航策略，并在三个目标导航任务上取得较好表现。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 纯视觉家庭导航中“目标可能在未看见区域”的候选推断。
2. 对应 `world_state_memory`：未观测区域不应只有空值，也可保留概率式语义假设。
3. 对应 `mobility_navigation`：当用户要求找某物时，机器人需要选择下一步探索区域。

资源消耗与部署信号：

1. 扩散式地图补全通常不轻，端侧运行需评估延迟、模型大小和调用频率。
2. 更适合低频目标搜索或离线地图补全，不应成为实时避障依赖。
3. 与 Kinbot `12GB RAM + 32GB Flash` 量产线兼容性未知，需要小模型或云端受控研究验证。

优势：

1. 直接面向部分可观测导航，契合家庭场景。
2. plug-and-play 形态便于与既有导航策略解耦。
3. 能把未知区域变成可排序探索假设，而不是盲目随机探索。

劣势与风险：

1. 补全结果是“想象地图”，不能当成真实障碍或真实目标位置。
2. 家庭物体布局高度个性化，跨家庭泛化需要验证。
3. 若置信度显示不清，会让用户误以为机器人“知道”未看见区域。

推荐理由：

建议作为 A- 级研究输入。Kinbot 可先把语义补全限定为 `exploration_hint`，只影响下一步观察点选择，不直接授权穿越、碰撞边界或安全判断。

### 3.5 Track A*: Fast Visibility-Aware Trajectory Planning for Active Target Tracking

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.05338](https://arxiv.org/abs/2605.05338) |
| 本轮 listing 口径 | 2026-05-08 new submission |
| 分类 | `cs.RO` |
| 方法关键词 | visibility-aware planning, active target tracking, 4D grid, beam pruning, offline reference trajectory |

摘要要点转述：

论文提出 `Track A*`，用于生成主动目标跟踪的离线参考轨迹和可重复评测基准。方法在四维时空网格上搜索可见性保持轨迹，并结合跨时间障碍距离缓存、分层 beam pruning 和多射线可见性评估。作者承认方法牺牲严格最优性换取可扩展性；在 `1000` 个 CARLA 压力场景中，使用 `32` 个 workers 完成全部收敛，并在对照实验中将平均规划时间降低 `23.0x`、最坏时间降低 `11.8x`，同时保持接近基线的可见性。

解决 Kinbot 的什么问题：

1. 对应老人看护与家庭巡护中“保持关键对象可见”的路径规划问题。
2. 对应 Phase 5 场景生成：需要可重复的离线轨迹来评估在线跟踪 / 巡护策略。
3. 对应 `mobility_navigation` 与 `observability_data_governance`：路径质量不仅是短，还包括可见性连续性。

资源消耗与部署信号：

1. `1000` 场景、`32` workers 和 `45s` 的结果说明其定位偏离线批处理或评测轨迹生成。
2. 不适合直接进入 Kinbot 端侧高频规划器。
3. 多射线可见性评估思想可迁移为轻量在线指标，例如目标丢失时间、遮挡比例和重获目标次数。

优势：

1. 明确优化可见性，而不是只做几何最短路。
2. 工程优化细节清楚，适合做离线基准生成。
3. 可帮助 Kinbot 设计“看护对象被遮挡时如何移动”的测试集。

劣势与风险：

1. 基于 CARLA 和主动目标跟踪，不等同于家庭老人看护。
2. 计算资源较大，不符合一代端侧常驻要求。
3. 离线轨迹如果过度优化可见性，可能牺牲用户空间舒适度。

推荐理由：

建议作为 A- 级评测输入。Kinbot 最小吸收动作是把 `visibility_continuity` 加入巡护 / 看护验证指标，而不是把完整 `Track A*` 放进产品运行时。

### 3.6 RobotEQ: Transitioning from Passive Intelligence to Active Intelligence in Embodied AI

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06234](https://arxiv.org/abs/2605.06234) |
| 本轮 listing 口径 | 2026-05-08 new submission |
| 分类 | `cs.RO`, `cs.HC` |
| 方法关键词 | active intelligence, social norms, embodied benchmark, egocentric images, RAG |

摘要要点转述：

论文提出 `RobotEQ`，关注机器人从被动响应指令走向主动行为时，是否理解哪些动作允许、哪些动作不应做。作者构造 `RobotEQ-Data`，包含 `1900` 张第一视角图像、`10` 类具身场景、`56` 个子类、`5353` 个动作判断问题和 `1286` 个空间 grounding 问题，并建立 benchmark 评估现有模型。实验显示，当前模型在可靠主动智能上仍不足，尤其是空间 grounding；引入外部社会规范知识库的 RAG 通常有帮助。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 陪伴交互中的主动提醒、主动巡护、主动关怀和主动安全建议。
2. 对应 `safety_compliance_authorization`：主动行为必须先判断是否被允许、是否越界、是否需要用户授权。
3. 对应 `companion_interaction`：高端产品感要求“温暖但不冒犯”，主动性不能变成打扰或越权。

资源消耗与部署信号：

1. 数据集和 benchmark 主要用于评测，不直接增加端侧负担。
2. RAG 引入外部规范知识库，需要端侧缓存、隐私边界和失败回退设计。
3. 空间 grounding 仍是短板，不能只靠语言规范判断。

优势：

1. 直接切中家庭机器人主动行为的合规与社会规范问题。
2. 第一视角图像更接近机器人端侧感知视角。
3. 数据结构可转化为 Kinbot 自有“主动行为允许 / 禁止 / 需确认”题库。

劣势与风险：

1. benchmark 不等于产品安全证书，仍需结合家庭文化和用户偏好。
2. 社会规范有地域、家庭和个体差异。
3. 如果过早引入人格化主动目标，会增加系统边界和责任归属复杂度。

推荐理由：

建议纳入主动陪伴行为评测。Kinbot 一代只吸收动作审批思想：任何主动行为先归类为 `allowed`、`ask_first`、`forbidden` 或 `emergency_override`，不把主动人格作为冻结主线。

### 3.7 Mitigating Error Accumulation in Continuous Navigation via Memory-Augmented Kalman Filtering

| 项目 | 内容 |
| --- | --- |
| arXiv | [2602.11183](https://arxiv.org/abs/2602.11183) |
| 本轮 listing 口径 | 2026-05-08 replacement，ICML 2026 camera ready |
| 分类 | `cs.RO`, `cs.CV`, `eess.SY` |
| 方法关键词 | VLN, state drift, recursive Bayesian estimation, memory-augmented Kalman filtering, historical anchors |

摘要要点转述：

论文研究连续导航中的状态漂移。作者指出，许多 VLN 模型按 dead-reckoning 方式逐步预测下一个 waypoint，再串成完整轨迹；这种逐步更新会让内部 belief 与客观坐标逐渐偏离。论文提出 `NeuroKalman`，把连续预测改写为递归贝叶斯状态估计：一条路径根据运动动态给出先验预测，另一条路径从历史观察中做似然校正。作者把注意力检索与测量似然的 KDE 联系起来，使系统可以利用历史锚点修正 latent 表示，且无需梯度更新。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 纯视觉导航中长程移动、回到常用区域和跨房间巡护时的累计定位误差。
2. 对应 `world_state_memory`：历史观测不只是日志，也可以成为状态校正锚点。
3. 对应 `mobility_navigation`：VLN / NFM 若走长程任务，必须处理漂移而不是只靠下一步语言推理。

资源消耗与部署信号：

1. 方法强调无需在线梯度更新，有利于端侧推理边界。
2. 需要维护历史锚点、检索索引和状态估计模块，内存与检索延迟需实测。
3. 实验场景是 UAV / TravelUAV，不等于家庭底盘，但漂移问题高度可迁移。

优势：

1. 把学习式 VLN 与经典状态估计结合，工程思路稳健。
2. 历史锚点校正适合家庭中重复出现的门口、走廊、沙发、厨房台面等地点。
3. 与 Kinbot 长期记忆和地图置信度治理方向一致。

劣势与风险：

1. 数据集和平台与 Kinbot 家庭底盘不同，需要重新验证。
2. 历史锚点若过时，会引入错误校正。
3. 需要隐私边界，不能把原始家庭图像长期无约束保存。

推荐理由：

建议作为 VLN / NFM 专题输入。Kinbot 可先探索 `memory_anchor` 的轻量版本：保存脱敏视觉特征、位置置信度和更新时间，而不是保存原始敏感图像。

### 3.8 Query2Uncertainty: Robust Uncertainty Quantification and Calibration for 3D Object Detection under Distribution Shift

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.05328](https://arxiv.org/abs/2605.05328) |
| 本轮 listing 口径 | 2026-05-08 cross submission，CVPR 2026 accepted |
| 分类 | `cs.CV`, `cs.RO` |
| 方法关键词 | uncertainty calibration, 3D object detection, distribution shift, query density, DETR-style detector |

摘要要点转述：

论文研究分布偏移下 3D 目标检测的不确定性估计。作者指出，现代检测器在分布内经过后处理校准后表现较好，但进入分布偏移场景时仍会校准失效。论文提出密度感知校准方法，将后处理校准器与 DETR 式 3D 检测器的 latent object query 特征密度结合；这些 query 同时包含位置和类别信息，适合做密度估计，从而联合校准分类与 bbox 回归不确定性。实验覆盖多视角相机和 LiDAR 检测器，在分布内和分布偏移场景都优于标准后处理方法。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 家庭视觉感知在低光、反光、遮挡、新家具、儿童玩具和杂物堆积下的置信度漂移。
2. 对应 `safety_compliance_authorization`：感知置信度低时应触发慢行、停机、澄清或重新观察。
3. 对应 `observability_data_governance`：分布偏移指标可进入试点日志，帮助判断失败是否来自感知域外。

资源消耗与部署信号：

1. 方法依赖 query 特征密度估计，运行时开销取决于检测器和密度估计实现。
2. 论文包含多视角相机路径，对 Kinbot 纯视觉方向有参考；LiDAR 结果不能解释为传感主线变化。
3. 可优先用于离线校准与测试集分析，再评估是否需要端侧轻量置信度修正。

优势：

1. 针对分布偏移而非只做分布内校准，贴近家庭长尾场景。
2. 同时校准类别和位置不确定性，比单一分类置信度更有用。
3. 与 Kinbot 的安全降级策略天然衔接。

劣势与风险：

1. 3D 检测任务和 Kinbot 当前纯视觉语义 / 占用估计并不完全等价。
2. 需要访问 detector latent query，若供应商模型封闭会增加集成难度。
3. 校准只改善风险表达，不直接提升底层检测能力。

推荐理由：

建议作为 B+ 输入。Kinbot 可先在 Phase 5 感知评测中加入 `calibration_under_shift`，检查低光、逆光、遮挡和陌生物体下的置信度是否诚实。

### 3.9 When to Trust Imagination: Adaptive Action Execution for World Action Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06222](https://arxiv.org/abs/2605.06222) |
| 本轮 listing 口径 | 2026-05-08 new submission |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | world action model, future-reality verification, adaptive action chunk, causal attention |

摘要要点转述：

论文研究 world action model 执行时“应相信预测多久”的问题。当前 WAM 往往每次推理后固定执行若干预测动作，无法判断预测未来与真实物理展开是否仍一致。作者把自适应执行建模为未来-现实验证问题，提出轻量验证器 `FFDC`，联合预测动作、预测视觉动态、真实观察和语言指令，估计剩余 action rollout 是否还可信。实验显示，该方法可减少 WAM 前向次数和执行时间，同时在 RoboTwin 和真实实验中提升成功率。

解决 Kinbot 的什么问题：

1. 对应未来 VLA / WAM 给出长动作片段时的可信度过滤。
2. 对应 `decision_orchestration`：低频大模型计划不能固定执行到底，必须随现实偏差提前重规划。
3. 对应 `safety_compliance_authorization`：预测与现实不一致时应收缩动作 chunk、停下或请求人类确认。

资源消耗与部署信号：

1. 论文称验证器轻量，并报告减少 `69.10%` WAM forward passes、减少 `34.02%` 执行时间。
2. 这些数字来自特定 benchmark 和操作任务，不能直接外推到 Kinbot 家庭导航。
3. 对 Kinbot 一代更适合作为“动作建议可信度过滤”的研究输入，而非引入常驻 WAM。

优势：

1. 问题定义很关键：不是模型想得越久越好，而是需要知道何时不再相信预测。
2. 自适应 action chunk 与实时安全链路兼容。
3. 可迁移到导航子目标、低频交互动作和未来操作能力。

劣势与风险：

1. 仍基于 world action model 和操作任务，距离 Kinbot 一代纯视觉导航主线有距离。
2. 验证器本身也可能误判，需要安全保守策略兜底。
3. 若同时引入 WAM、验证器和重规划，会显著增加运行时复杂度。

推荐理由：

建议作为 B+ 输入。Kinbot 当前不引入 WAM 常驻闭环，但应吸收原则：任何模型生成的多步动作片段都必须有 `prediction_observation_consistency` 检查。

### 3.10 PEPA: a Persistently Autonomous Embodied Agent with Personalities

| 项目 | 内容 |
| --- | --- |
| arXiv | [2603.00117](https://arxiv.org/abs/2603.00117) |
| 本轮 listing 口径 | 2026-05-08 replacement，前序纪要未收录 |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | persistent autonomy, personality-driven goals, episodic memory, daily self-reflection, three-layer cognitive architecture |

摘要要点转述：

论文讨论长期自主 embodied agent 如何摆脱完全依赖外部任务脚本的问题。作者提出 `PEPA`，用 personality traits 作为内部组织原则，让 agent 自主生成目标并维持行为演进。架构分为三层：高层系统根据人格、情景记忆和每日反思生成目标；中层把目标转成可执行计划；底层在传感运动交互中执行并记录经验。论文在多层办公楼中的四足机器人上验证了多个 personality prototype 下的长期行为稳定性，包括自主权衡用户请求和内生动机。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 未来长期陪伴中的主动目标生成、日常节律理解和持续自主性。
2. 对应 `companion_interaction`：机器人不能只做一次性问答，也要理解家庭长期偏好和日程。
3. 对应 `world_state_memory`：情景记忆和反思机制提示了长期行为组织方式。

资源消耗与部署信号：

1. 需要长期记忆、目标生成、计划、执行和日志循环，系统复杂度显著高于一代最小闭环。
2. 实机是四足办公楼环境，不等于 Kinbot 家庭服务底盘。
3. 若引入“人格驱动目标”，必须同步引入授权、可解释、用户覆盖和安全停止机制。

优势：

1. 提供长期自主 agent 的完整认知架构样例。
2. 将记忆、反思、目标和执行闭环连接起来，适合作为未来平台能力参考。
3. 直接触及陪伴机器人从被动工具到主动伙伴的核心问题。

劣势与风险：

1. 容易诱导产品过早引入复杂人格与自主目标，超出一代冻结范围。
2. 主动目标与用户授权、隐私和家庭边界可能冲突。
3. 论文展示的长期稳定性不等于家庭场景下的可接受性和商业价值。

推荐理由：

建议仅作为 B 级研究输入。一代 Kinbot 不吸收 personality-driven autonomy；可吸收的是治理问题：任何长期主动目标都必须绑定用户偏好、可撤销授权、日志解释和紧急停止。

## 4. 对 Kinbot 的落地 / 文档建议

本轮不建议回写主线架构基线或 `03_decision_log.md`，因为论文结论仍属于研究输入，没有形成经用户确认的稳定产品 / 架构判断。

建议后续在研究或 Phase 5 计划中低成本吸收以下动作：

1. 在 Phase 5 任务日志中新增 `resource_budget`、`coverage_uncertainty`、`target_ambiguity`、`visibility_continuity`、`calibration_under_shift`、`prediction_observation_consistency` 等候选指标。
2. 在 `VLN / NFM` 专题中观察 `memory_anchor` 对长程导航漂移的修正价值，但不得因此放松纯视觉不过线优先延迟节奏的主线。
3. 在主动陪伴行为设计中建立 `allowed / ask_first / forbidden / emergency_override` 四类动作审批口径，避免主动智能越权。
4. 将 world model / WAM 继续限定为离线验证、失败复盘和未来能力储备，不进入一代端侧常驻决策依赖。

## 5. 本轮未进入主线的原因

1. 本轮论文主要提供验证方法、评测指标和研究候选，不构成 Kinbot 一代硬件、传感、形态或 BOM 决策变化。
2. 涉及 world action model、VLA、长期人格、自主目标生成和扩散地图补全的内容，若直接产品化会增加运行时复杂度和安全责任面。
3. 当前主线仍保持：一代纯视觉、端侧敏感数据处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[Robotics new listings for Friday, 8 May 2026](https://arxiv.org/list/cs.RO/new)
2. [Resource-Constrained Robotic Planning in the face of Mixed Uncertainty](https://arxiv.org/abs/2605.05797)
3. [Monitoring autonomous persistent surveillance missions using invariance](https://arxiv.org/abs/2605.06062)
4. [Proactive Instance Navigation with Comparative Judgment for Ambiguous User Queries](https://arxiv.org/abs/2605.06223)
5. [Plug-and-Play Label Map Diffusion for Universal Goal-Oriented Navigation](https://arxiv.org/abs/2605.05960)
6. [Track A*: Fast Visibility-Aware Trajectory Planning for Active Target Tracking](https://arxiv.org/abs/2605.05338)
7. [RobotEQ: Transitioning from Passive Intelligence to Active Intelligence in Embodied AI](https://arxiv.org/abs/2605.06234)
8. [Mitigating Error Accumulation in Continuous Navigation via Memory-Augmented Kalman Filtering](https://arxiv.org/abs/2602.11183)
9. [Query2Uncertainty: Robust Uncertainty Quantification and Calibration for 3D Object Detection under Distribution Shift](https://arxiv.org/abs/2605.05328)
10. [When to Trust Imagination: Adaptive Action Execution for World Action Models](https://arxiv.org/abs/2605.06222)
11. [PEPA: a Persistently Autonomous Embodied Agent with Personalities](https://arxiv.org/abs/2603.00117)
