# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-04
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-04 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv API，确认 2026-05-04 检索时最新 Robotics new listing 仍为 2026-05-01 批次；按近期待补录口径收录此前每日纪要未覆盖、与 Kinbot 任务执行异常处理、可达安全、端侧概率安全评估、稀疏 3D 重建、策略学习、交互式 humanoid 控制、低成本触觉和发育式多模态经验相关的 8 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-04。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv API。
2. 优先检查 2026-05-03 至 2026-05-04 是否出现新的 `2605` Robotics 批次；本轮检索时官方 `cs.RO/new` 仍显示 `Friday, 1 May 2026` new listing，`cs.RO/recent` 最新日期仍为 `Fri, 1 May 2026`。
3. 按仓库规则补查 2026-04-28 至 2026-04-30 已公告但未进入 `2026-04-29` 至 `2026-05-03` Kinbot 每日论文纪要的论文。
4. 关键词与主题包括 `active perception`、`situation handling`、`reachability safety`、`runtime uncertainty evaluation`、`3D scene reconstruction`、`robot policy learning`、`humanoid control`、`tactile sensing`、`sensorimotor experience`。

筛选标准：

1. 是否对应 Kinbot 一代主线问题：纯视觉导航、开放家庭环境中的执行异常处理、室内安全边界、端侧资源约束、世界状态重建、陪伴 / 看护主动性、运行期安全评估和长期学习。
2. 是否给出资源、频率、硬件平台、样本量、加速比、成本或工程部署线索。
3. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`decision_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`companion_interaction`、`observability_data_governance`。
4. 是否符合一代约束：纯视觉主线、端侧敏感数据处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。触觉、humanoid 全身控制、视频生成控制和大型策略学习只作为研发验证或远期观察，不直接写入一代主线。

## 2. 本轮总判断

本轮没有发现新的 `2605` Robotics 批次。更有价值的动作是补齐 2026-05-01 new listing 中前序纪要未覆盖、但能为 Kinbot Phase 5 验证和一代 guardrail 提供工程启发的论文。

本轮论文对 Kinbot 的价值集中在 5 个方面：

1. **家庭机器人必须能处理执行中途的意外情况**：`VAP-TAMP` 把主动视角选择、VLM 情况评估、scene graph 和 TAMP 连起来，适合作为 Kinbot 家庭任务异常处理的研发参照。
2. **安全不应只有静态阈值**：`Field of Safe Motion` 和 `Real-Time GPU-Accelerated Monte Carlo Evaluation` 都提醒 Kinbot 应把可达集、概率风险和实时预算纳入避障 / 停车 / 接近用户的安全边界。
3. **世界状态需要从稀疏观测中补全，但不能把生成结果当事实**：`RecGen` 对遮挡物体、部件姿态和稀疏 RGB-D 观测有价值；Kinbot 可吸收其不确定性表达，而不是把生成式 3D 重建直接放进执行链。
4. **策略学习和视频生成控制仍偏研发侧**：`TFM-S3` 和 `ExoActor` 提供低样本探索、交互行为生成和未来任务预演方向，但训练成本、可验证性和行为安全尚不足以进入一代运行时。
5. **触觉与多模态身体经验是未来能力，不应冲击当前纯视觉主线**：`FlexiTac` 和 infant sensorimotor retargeting 对未来操作、触摸反馈和陪伴感有启发；当前只能作为后续 SKU 或实验平台观察项。

复杂度自检：现在的架构是不是太复杂了？本轮答案是“主线不应再加新实体”。这些论文应被收敛为 4 类验证任务：执行异常处理、可达安全评估、端侧概率预算、世界状态不确定性评估。触觉和 humanoid 相关论文只保留研究输入，不进入一代量产基线。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | Robot Planning and Situation Handling with Active Perception | 纳入家庭任务执行异常处理验证池，重点看主动视角选择、VLM 判断和 scene graph 是否可低频触发。 |
| A | Real-Time GPU-Accelerated Monte Carlo Evaluation of Safety-Critical AEB Systems Under Uncertainty | 借鉴其端侧概率安全预算，设计 Kinbot 避障 / 停止距离 / 接近用户的 Monte Carlo 回放评估。 |
| A- | The Field of Safe Motion | 把可解释 reachability 安全边界转化为 Kinbot 室内可达安全概念验证。 |
| A- | Reconstruction by Generation | 纳入稀疏观测下世界状态补全对照，严禁生成结果直接驱动执行。 |
| B+ | Can Tabular Foundation Models Guide Exploration in Robot Policy Learning? | 作为低样本策略优化研发输入，优先用于离线仿真调参，不进入端侧运行时。 |
| B | ExoActor | 保留为远期 humanoid / 动作预演观察项，当前只看“第三人称视频作为任务预演界面”的思想。 |
| B | FlexiTac | 保留为未来低成本触觉和操作能力观察项，不改写一代纯视觉主线。 |
| B- | Simulating Infant First-Person Sensorimotor Experience via Motion Retargeting from Babies to Humanoids | 作为发育式多模态数据构造和陪伴感研究输入，不进入当前架构冻结范围。 |

## 3. 论文卡片

### 3.1 Robot Planning and Situation Handling with Active Perception

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.26988](https://arxiv.org/abs/2604.26988) |
| 提交日期 | 2026-04-28 |
| 分类 | `cs.RO` |
| 方法关键词 | `VAP-TAMP`, active perception, VLM, scene graph, task and motion planning |

摘要要点转述：

论文关注机器人在开放动态环境中执行计划时遭遇意外情况的问题，例如门卡住、地面出现障碍、人的活动改变了原计划前提等。作者提出 `VAP-TAMP`，让机器人在执行过程中利用任务动作知识主动选择观察视角，提示 VLM 评估当前情况，并构建 / 推理 scene graph，最后把情况处理纳入任务与运动规划。论文在仿真服务任务和移动操作平台上做了评估。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 家庭环境中“计划不是一次性生成后顺序执行”的问题：夜间巡护、找人、回桩、递送提醒都会遇到门、障碍物、宠物、用户移动等中途变化。
2. 对应 `decision_orchestration + mobility_navigation`：需要把异常检测、主动补看、语义解释和重规划连接起来。
3. 对应 `world_state_memory`：scene graph 可作为异常发生前后状态差异的解释载体。

资源消耗与部署信号：

1. 论文摘要未给出模型大小、端侧延迟、内存峰值或控制频率。
2. VLM 主动提示和 scene graph 构建不宜进入高频底盘环，适合作为低频异常处理或离线回放验证链路。
3. 移动操作平台评估说明方法不是纯模拟，但 Kinbot 仍需验证普通家庭光照、遮挡和弱纹理环境下的可靠性。

优势：

1. 直接击中家庭机器人长程自主运行的执行中断问题。
2. 把 VLM 用在“看哪里、发生了什么”的情况评估，而不是直接输出底盘动作，符合 Kinbot 安全边界。
3. scene graph 便于生成可审计的异常解释。

劣势与风险：

1. 对 VLM 判断质量敏感，存在误判异常或漏判异常的风险。
2. 主动观察会增加任务时延和能耗。
3. 论文面向服务任务与移动操作，Kinbot 一代若无机械臂，需只吸收“异常处理框架”而非完整操作栈。

推荐理由：

建议作为 Kinbot Phase 5 的“执行中途异常处理”验证输入：先选 5 到 8 个家庭任务中断场景，用纯视觉日志测试主动补看、scene graph 差分和重规划触发条件，避免新增一套并行任务规划主模块。

### 3.2 Real-Time GPU-Accelerated Monte Carlo Evaluation of Safety-Critical AEB Systems Under Uncertainty

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.27193](https://arxiv.org/abs/2604.27193) |
| 提交日期 | 2026-04-29 |
| 分类 | `cs.RO`, `cs.CE`, `cs.DC`, `eess.SY` |
| 篇幅 | arXiv 页面标注 10 页、6 图 |

摘要要点转述：

论文面向自动紧急制动系统，指出确定性的停止距离或 TTC 阈值难以覆盖感知、路况和动力学不确定性。作者提出 GPU 加速 Monte Carlo 评估框架，以高保真纵向车辆模型传播不确定性，并采用 one-thread-per-sample 并行方式。论文在 GTX 1650、RTX 5070、Jetson Orin Nano 和 Jetson AGX Orin 上测试，报告最高 `54.57x` 加速；在完整 AEB 时间预算下，Jetson AGX Orin 可在 `530 ms` 内执行约 `25,000` 个样本。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 室内移动安全：靠固定距离阈值不足以处理地面摩擦、用户突然移动、视觉延迟、障碍物类别和底盘制动差异。
2. 对应 `safety_compliance_authorization + mobility_navigation`：安全阈值应能表达不确定性和风险概率。
3. 对应 `platform_runtime`：需要明确端侧实时预算，而不是把概率评估只留在离线仿真。

资源消耗与部署信号：

1. 摘要给出 Jetson Orin Nano / AGX Orin 等嵌入式平台信号，对 Kinbot 边缘算力评估有参考价值。
2. `530 ms` 和 `25,000` 样本是车用 AEB 场景预算，不能直接套到家庭机器人高频避障；但可转化为低频风险评估或日志回放评估。
3. Monte Carlo 样本并行适合 GPU，但会占用与 VLM / 视觉感知共享的加速资源。

优势：

1. 给出明确硬件平台、预算和加速比，工程信号强。
2. 把概率风险评估从离线验证推进到运行期组件，适合启发 Kinbot Phase 5。
3. CPU 生成随机样本并保持 CPU/GPU 数值一致的做法，有利于审计与复现。

劣势与风险：

1. 面向车辆纵向制动，不覆盖家庭机器人二维避障、人群互动和低速接近用户。
2. 家庭机器人算力预算更紧，不能牺牲视觉主链路实时性。
3. 若模型假设错误，Monte Carlo 会给出看似精确但错误的风险判断。

推荐理由：

建议把该论文转化为 Kinbot 的“概率安全回放评估”任务：先离线评估停止距离、窄通道会车、老人突然起身、宠物横穿等场景，再决定是否保留轻量运行期风险评估，不直接把 GPU Monte Carlo 放入量产实时主链路。

### 3.3 The Field of Safe Motion: Operationalizing Affordances in the Field of Safe Travel Using Reachability Analysis

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.27168](https://arxiv.org/abs/2604.27168) |
| 提交日期 | 2026-04-29 |
| 分类 | `cs.RO`, `cs.HC` |
| 方法关键词 | reachability analysis, affordance, interpretable safety model |

摘要要点转述：

论文把 `Field of Safe Travel` 中关于驾驶者可用感知和动作空间的概念，转化为可计算的 `Field of Safe Motion`。核心是用可达性分析判断行动者在任一时刻是否仍保有无碰撞逃逸路径，并把人的物理能力和其他道路参与者的可预见行为纳入模型。论文强调该方法依赖少量可枚举假设，并具备可解释性。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 在室内接近老人、绕过家具、穿过窄门和与人同向移动时，是否仍保有可解释安全余量的问题。
2. 对应 `mobility_navigation`：安全不应只看当前碰撞框，还应看未来几秒是否有“可退路”。
3. 对应 `safety_compliance_authorization`：可解释安全模型可用于给家属 App 或工程日志解释为什么机器人减速、绕行或暂停。

资源消耗与部署信号：

1. 摘要未给出实时频率、模型参数量或平台指标。
2. 可达性分析通常比简单距离阈值更重，Kinbot 可先做低频策略层判断或离线评估。
3. 该方法依赖运动学假设和他者行为边界，家庭场景需重建适合低速移动机器人的参数。

优势：

1. 可解释性强，适合安全评审和用户信任。
2. 相比纯学习避障，更容易列出假设、边界和失效条件。
3. 可与 Kinbot 现有安全状态机结合，不必引入新顶层架构。

劣势与风险：

1. 论文主场景偏驾驶，家庭低速机器人需重做问题设定。
2. 对人类未来动作的可预见性建模可能过于乐观。
3. 若作为高频实时控制组件，可能增加计算复杂度。

推荐理由：

建议作为 Kinbot 室内“可达安全边界”的概念验证输入：用简化运动学模型定义机器人、老人、儿童、宠物和家具的可达域，先用于策略层减速 / 停止 / 绕行解释，而非替代底盘避障控制器。

### 3.4 Reconstruction by Generation: 3D Multi-Object Scene Reconstruction from Sparse Observations

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.27106](https://arxiv.org/abs/2604.27106) |
| 提交日期 | 2026-04-29 |
| 分类 | `cs.CV`, `cs.AI`, `cs.LG`, `cs.RO` |
| 项目页 | [reconstruction-by-generation.github.io](https://reconstruction-by-generation.github.io) |

摘要要点转述：

论文提出 `RecGen`，用于从一个或多个稀疏 RGB-D 观测中概率性估计多物体场景的物体形状、部件形状和姿态。方法利用组合式合成场景生成和强 3D 形状先验，在遮挡、对称物体、复杂纹理和部件结构下提升重建质量。摘要称其使用比前一 SOTA `SAM3D` 少约 `80%` 的训练 mesh，同时几何质量、纹理重建和姿态估计分别提升 `30.1%`、`9.1%` 和 `33.9%`。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 纯视觉家庭场景中“看到一部分，如何理解完整物体和可通行空间”的问题。
2. 对应 `world_state_memory`：遮挡下的家具、药箱、充电桩、门口障碍物需要不确定性表达。
3. 对应 `mobility_navigation`：巡护和回桩时，可用低频重建辅助判断局部空间是否发生显著变化。

资源消耗与部署信号：

1. 方法使用 RGB-D 输入，但 Kinbot 一代主线为纯视觉，深度相机 / 激光雷达不作为产品 fallback；因此只能把它作为研发真值参考或双目深度对照。
2. 生成式 3D 重建通常计算量较高，摘要未给出端侧延迟、显存或模型大小。
3. 少训练 mesh 的信号有利于小数据场景，但部署前仍需家庭场景数据校验。

优势：

1. 对遮挡、部件和姿态不确定性建模，与家庭空间理解高度相关。
2. 可作为仿真场景构造和世界状态补全的离线工具。
3. 结果指标明确，方便纳入研发对照实验。

劣势与风险：

1. RGB-D 依赖与 Kinbot 一代纯视觉主线不完全一致。
2. 生成结果可能“补得像真”，但不一定是真实世界事实。
3. 若直接驱动执行，可能把虚构物体形状或姿态引入安全链路。

推荐理由：

建议只作为离线世界状态补全和仿真数据生成对照：Kinbot 可吸收其“不确定性 + 形状先验”的表达方式，但量产链路必须把生成结果降级为候选假设，并经过视觉复核和安全校验。

### 3.5 Can Tabular Foundation Models Guide Exploration in Robot Policy Learning?

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.27667](https://arxiv.org/abs/2604.27667) |
| 提交日期 | 2026-04-30 |
| 分类 | `cs.RO`, `cs.LG` |
| 篇幅 | arXiv 页面标注 8 页、6 图 |

摘要要点转述：

论文关注高维连续控制中的策略优化。传统局部优化需要调参和好初值，全球搜索又需要大量 rollout。作者提出 `TFM-S3`，把高频局部更新与间歇性全局搜索结合起来：先用 SVD 动态构造低维策略子空间，再用预训练 tabular foundation model 从少量上下文样本中预测候选策略回报，以有限 rollout 成本筛选候选。实验表明，在相同 rollout 预算下，该方法相对 TD3 和群体式基线加速早期收敛并提升最终表现。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 在仿真中优化底盘策略、局部避障参数、主动视角策略或交互触发策略时，样本预算有限的问题。
2. 对应 `platform_runtime` 的研发工具链：候选策略不应依赖无限 rollout 或人工调参。
3. 对应 Phase 5 验证：可以作为参数搜索和策略调优的离线方法，而不是端侧模型。

资源消耗与部署信号：

1. 摘要未给出模型大小、训练时长、GPU 资源或真实机器人实验。
2. 关键资源收益是减少 rollout 成本和降低对初值的敏感性。
3. 运行时不应部署 tabular foundation model；更适合研发仿真和离线参数搜索。

优势：

1. 面向样本效率，符合 Kinbot 小团队快速验证需求。
2. 与连续控制和局部策略优化相关，可用于底盘参数或局部 planner 调参。
3. 低维策略子空间有助于控制搜索复杂度。

劣势与风险：

1. 论文只在连续控制 benchmark 上验证，距离家庭机器人真实场景较远。
2. 预训练 tabular foundation model 的泛化边界不透明。
3. 若把优化结果未经仿真外推和实机安全验证直接部署，会放大安全风险。

推荐理由：

建议进入 Kinbot 研发工具观察池：优先用作仿真参数搜索和策略候选排序，输出仍必须经过场景覆盖、失败模式分析和实机限速验证。

### 3.6 ExoActor: Exocentric Video Generation as Generalizable Interactive Humanoid Control

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.27711](https://arxiv.org/abs/2604.27711) |
| 提交日期 | 2026-04-30 |
| 分类 | `cs.RO` |
| 备注 | Work in progress |

摘要要点转述：

论文提出 `ExoActor`，尝试把第三人称视频生成作为建模机器人、环境、物体和任务意图交互动态的统一界面。给定任务指令和场景上下文，系统生成可能的执行过程视频，再通过人体运动估计和通用运动控制器把视频转为 humanoid 行为序列。作者展示其在新场景中不额外采集真实数据也能泛化，并讨论当前实现限制。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 远期“任务预演”和“动作意图可视化”的问题：模型先生成可解释执行过程，再由安全层过滤。
2. 对应 `companion_interaction`：第三人称预演可帮助家属理解机器人计划，但不等于可执行动作。
3. 对应 `decision_orchestration`：生成式计划必须被拆成候选意图，而非直接控制。

资源消耗与部署信号：

1. 大规模视频生成模型推理成本高，摘要未给出端侧延迟、显存或帧率。
2. humanoid 全身控制与 Kinbot 一代形态差异大，不能迁移为当前运行时能力。
3. Work in progress 状态意味着工程成熟度和安全验证不足。

优势：

1. 把交互动态、任务意图和场景上下文放在同一预演界面中，概念上有启发。
2. 可作为远期 humanoid 行为合成和家庭服务任务演示工具。
3. 第三人称视频比隐式策略更易被人审阅。

劣势与风险：

1. 生成视频可能物理不可执行或安全不可接受。
2. 从视频到控制的转换误差大，尤其在接触、避障和人体附近动作中风险高。
3. 与 Kinbot 一代硬件和算力边界距离较远。

推荐理由：

建议仅作为远期观察项：吸收“计划可视化 / 执行预演”的产品启发，不引入视频生成控制栈。若未来用于 Kinbot，必须先作为离线演示或家属确认界面，不能进入实时执行链。

### 3.7 FlexiTac: A Low-Cost, Open-Source, Scalable Tactile Sensing Solution for Robotic Systems

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.28156](https://arxiv.org/abs/2604.28156) |
| 提交日期 | 2026-04-30 |
| 分类 | `cs.RO`, `cs.AI`, `cs.LG` |
| 项目页 | [flexitac.github.io](https://flexitac.github.io) |

摘要要点转述：

论文提出 `FlexiTac`，一种低成本、开源、可扩展的压阻式触觉传感方案，面向机器人末端执行器。系统由柔性触觉 pad 和多通道读出板组成，采用 `FPC-Velostat-FPC` 三层密封结构，电极集成在柔性电路中，以提高制造吞吐和一致性。读出电子使用常见低成本元件，通过串口以 `100 Hz` 输出同步触觉信号。论文还展示其可支持 3D 视触融合、跨本体技能迁移和 real-to-sim-to-real 微调。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 未来若进入递送、抓取、陪伴触摸或药盒交互，低成本触觉可能补齐纯视觉无法判断接触状态的问题。
2. 对应 BOM 约束：低成本开源触觉比定制高端触觉更适合后续 SKU 预研。
3. 对应 `safety_compliance_authorization`：触觉可作为人机接触安全监控的额外证据。

资源消耗与部署信号：

1. `100 Hz` 串口触觉流是明确频率信号。
2. 低成本、通用元件和开源项目页是工程可获得性信号。
3. Kinbot 当前一代传感主线为纯视觉，触觉不能作为当前产品 fallback；若未来加入，需重新评估硬件、线束、结构、驱动和可靠性。

优势：

1. 低成本和可扩展性较好，适合实验平台快速验证。
2. 柔性 pad 可适配不同夹爪或触摸区域。
3. 视触融合和 real-to-sim-to-real 路线有助于未来操作能力学习。

劣势与风险：

1. 与 Kinbot 一代纯视觉主线冲突，不能直接写入当前量产基线。
2. 家庭长期使用需要耐久、防水、防污、清洁和一致性验证。
3. 触觉数据引入后，会增加传感融合和安全认证复杂度。

推荐理由：

建议保留为未来操作 / 触摸能力的低成本硬件观察项。当前只在研究目录记录，不推动一代改传感配置；若后续出现明确操作 SKU，再进入硬件专项评估。

### 3.8 Simulating Infant First-Person Sensorimotor Experience via Motion Retargeting from Babies to Humanoids

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.27583](https://arxiv.org/abs/2604.27583) |
| 提交日期 | 2026-04-30 |
| 分类 | `q-bio.NC`, `cs.RO` |
| 代码 | [github.com/ctu-vras/motion-retargeting](https://github.com/ctu-vras/motion-retargeting/) |

摘要要点转述：

论文研究如何从单个婴儿视频中重建身体构型和 3D 姿态，再把动作重定向到 iCub、pyCub、EMFANT、MIMo 等实体或虚拟 humanoid 平台上，生成关节、肌肉、触觉和视觉等多模态传感流。作者认为，这种重放可用于分析婴儿发育经验、增强行为自动标注，并辅助神经发育障碍早期检测；最佳匹配本体上达到亚厘米级重定向精度。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 远期“从第一人称身体经验理解人类行为”的研究问题，尤其是陪伴、看护和行为理解。
2. 对应 `companion_interaction`：多模态身体经验可启发更自然的动作理解和交互节奏建模。
3. 对应 `observability_data_governance`：医疗 / 发育相关数据高度敏感，只能作为研究启发，不能触碰一代家庭隐私边界。

资源消耗与部署信号：

1. 摘要给出单视频输入、多个虚拟 / 实体平台输出和亚厘米级重定向精度信号。
2. 未给出实时性能、模型大小、训练成本或端侧部署指标。
3. 涉及多模态仿真和 humanoid 平台，距离 Kinbot 一代量产形态较远。

优势：

1. 把视频动作、身体本体、触觉和视觉流统一到发育式经验数据中，研究视角新。
2. 对陪伴机器人理解人类动作节奏和行为意图有远期启发。
3. 开源代码便于后续研究复核。

劣势与风险：

1. 与当前 Kinbot 产品主线距离远，不能支撑近期工程决策。
2. 婴儿和健康相关数据敏感，商业产品中需极强隐私与伦理边界。
3. humanoid 重定向不等同于 Kinbot 本体可执行能力。

推荐理由：

建议仅作为长期研究输入：用于提醒 Kinbot 陪伴 / 看护能力未来可能需要“身体经验 + 多模态节律”的数据视角；当前不回写主线，不新增任务。

## 4. 对 Kinbot 的落地 / 文档建议

1. 新增研发验证候选：`执行中途异常处理`。输入可来自 `VAP-TAMP`，但应收敛为 Kinbot 自有场景：门被关上、地面新增障碍、用户离开原位置、充电桩路径被挡、夜间巡护光照突变。
2. 新增研发验证候选：`可达安全 / 概率安全评估`。把 `Field of Safe Motion` 和 GPU Monte Carlo 论文合并为一个验证池，优先做离线回放和风险曲线，不新增运行时主模块。
3. 新增研发验证候选：`世界状态不确定性补全`。用 `RecGen` 类方法做离线对照，验证遮挡物体、半开门、家具移动和药盒位置变化的候选假设质量。
4. 工具链观察：`TFM-S3` 可作为仿真参数搜索和策略调优方法，不作为端侧部署模型。
5. 远期观察：`ExoActor`、`FlexiTac` 和 infant sensorimotor retargeting 均不改变一代传感、算力和产品形态，只保留研究指针。

## 5. 本轮未进入主线的原因 / 复杂度自检

本轮不回写 `docs/00_governance/03_decision_log.md`、主线架构文档或 Linear，原因如下：

1. 本轮没有发现新的 arXiv `2605` Robotics 批次，收录内容属于近期待补录，不构成新的外部事实冲击。
2. 8 篇论文均是研究输入或验证方法来源，尚未形成足以改变 Kinbot 纯视觉主线、传感配置、端侧资源线或 Phase 5 门控的稳定证据。
3. 最有价值的部分可收敛为验证任务，不需要扩张当前架构实体数、接口面或模块层级。
4. 触觉、humanoid 控制、视频生成控制和发育式多模态数据与一代量产主线距离较远，若直接吸收会明显增加复杂度。

现在的架构是不是太复杂了？本轮结论是：主线架构无需变更；验证任务可以增加，但必须复用既有 `platform_runtime`、`mobility_navigation`、`world_state_memory` 和 `safety_compliance_authorization` 边界，避免把每篇论文变成一个新模块。

## 6. 来源

1. arXiv Robotics new listing: [https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv Robotics recent listing: [https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
3. Robot Planning and Situation Handling with Active Perception: [https://arxiv.org/abs/2604.26988](https://arxiv.org/abs/2604.26988)
4. Real-Time GPU-Accelerated Monte Carlo Evaluation of Safety-Critical AEB Systems Under Uncertainty: [https://arxiv.org/abs/2604.27193](https://arxiv.org/abs/2604.27193)
5. The Field of Safe Motion: [https://arxiv.org/abs/2604.27168](https://arxiv.org/abs/2604.27168)
6. Reconstruction by Generation: [https://arxiv.org/abs/2604.27106](https://arxiv.org/abs/2604.27106)
7. Can Tabular Foundation Models Guide Exploration in Robot Policy Learning?: [https://arxiv.org/abs/2604.27667](https://arxiv.org/abs/2604.27667)
8. ExoActor: [https://arxiv.org/abs/2604.27711](https://arxiv.org/abs/2604.27711)
9. FlexiTac: [https://arxiv.org/abs/2604.28156](https://arxiv.org/abs/2604.28156)
10. Simulating Infant First-Person Sensorimotor Experience via Motion Retargeting from Babies to Humanoids: [https://arxiv.org/abs/2604.27583](https://arxiv.org/abs/2604.27583)
