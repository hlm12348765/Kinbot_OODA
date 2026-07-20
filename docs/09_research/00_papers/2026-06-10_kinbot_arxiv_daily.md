# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-10
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-10 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页，确认本轮本地日更时官方最新 Robotics listing 为 `Wednesday, 10 June 2026`，合计 `95` 篇 entries；其中 new submissions `56` 篇、cross submissions `7` 篇、replacement submissions `32` 篇。本轮按 `3-5` 篇强相关论文 + 候选排除表口径，收录单目跨本体局部规划、关系归纳 ObjectNav、社交导航安全、非侵入式 `ROS 2` 观测和老人照护基础模型评测口径相关 5 篇论文，并记录候选排除表与周度综合判断。

---

## 1. 检索口径

本轮检索日期：2026-06-10。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Wednesday, 10 June 2026`，合计 `95` 篇 entries；其中 new submissions `56` 篇、cross submissions `7` 篇、replacement submissions `32` 篇。
3. 官方 `cs.RO/recent` 在本轮检索时显示 `Wed, 10 Jun 2026` 批次，页面显示 `showing first 50 of 63 entries`；该 `63` 篇对应本轮 new + cross 条目，不含 replacement。
4. 上一轮 2026-06-09 覆盖的是 `Monday, 8 June 2026` listing。本轮为新的官方 Robotics listing，不按同一 listing 补录处理。
5. `replacement` / `cross-list` 只在确实新增 Kinbot 评测项、治理项或端侧资源判断时收录。本轮主卡片全部来自 new submission；cross-list 与 replacement 条目进入候选排除表或专题候选说明，不直接升级为主线事实。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全、端侧资源、验证证据链或老人照护评测的判断，而不是继续增加泛 `VLA`、world model、manipulation、humanoid、自动驾驶、UAV 或纯工具链论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`、`health_care_service_orchestration`。
3. 是否能低成本转化为 Phase 5 验证项：单目局部避障 envelope、语义误导抑制、人与障碍物反事实安全、非侵入式运行观测、照护结果证据分层。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 Wednesday listing 出现大量 `VLA`、manipulation、humanoid locomotion、自动驾驶和 UAV 论文而扩张主卡片数量。
2. `AllDayNav`、`AgenticNav`、`GUIDE`、`FOUND-IT` 都与导航 / 记忆有关，但分别存在大模型隐式记忆、深度工具依赖、腿式 / depth 场景和 replacement 口径问题，本轮只作为候选排除或专题候选，不改写 Kinbot 一代导航主线。
3. `EM-Fall` 对老人看护很相关，但依赖 `mmWave` 与 humanoid embodied sensing；本轮只吸收“跌倒评测需覆盖昼夜 / 遮挡 / 多房间”的验证提醒，不改变一代纯视觉传感主线。

## 2. 本轮总判断

本轮真正新增的判断不是“需要更大的具身大模型”，而是五个更容易转成工程验证字段的口径：

1. **单目局部避障需要显式绑定本体 envelope**：`AgniNav` 提示纯视觉局部规划不能只看相机图像，还要把碰撞相关高度、前后长度和半宽作为可配置安全 envelope，避免换头部相机高度或底盘宽度后隐性失效。
2. **ObjectNav 需要记录“哪些语义线索不可信”**：`DB-Nav` 提示开放词汇检测和 `VLM` 先验会带来 false positive、过期静态先验和反复失败探索；Kinbot 的空间记忆应保留 action-level falsification，而不是只累积目标候选。
3. **社交导航安全应从“人是障碍物”升级为“人是可预期行动者”**：`SALSA` 提示预训练 `VLA` 可能已有行人 / 物体区分和未来碰撞信号，但需要把这些中间表征对齐到动作头；Kinbot 可把它转成老人、保姆、访客、儿童和宠物的反事实场景评测。
4. **Phase 5 观测链路不能扰动被测系统**：`ros2probe` 提示常规 `ROS 2` 观测工具加入 `DDS` 域后会产生 probe effect，导致发现平面膨胀、消息丢失和观测结果偏差；Kinbot 的样机日志应记录观测开销和观测是否改变运行行为。
5. **老人照护机器人评测要从可用性提升走向真实照护结果证据**：`Exploration of Foundation Model-Based Robots in Patient and Elderly Care` 提示当前证据多停在互动参与、易用性和近端指标，可靠性故障、幻觉、工作流兼容和 accountable oversight 才是进入照护闭环前的关键门槛。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 泛 `VLA`、world model、manipulation policy | 已饱和 | 只有新增家庭移动闭环、老人照护、安全审计字段、目标 SoC 实测资源边界或验证误差闭环时才进入主卡片。 |
| 纯视觉 / 单目局部导航、身体 envelope、低成本避障 | 值得专题跟踪 | 将 `AgniNav` 与既有纯视觉深度不确定性、局部规划安全论文合并为 `collision_envelope_config`、`monocular_pseudo_scan_confidence`、`body_dimension_planner_check` 字段。 |
| 语义场景记忆、ObjectNav 误导抑制、失败探索记忆 | 值得专题跟踪 | 将 `DB-Nav` 的 activation / inhibition bias 与近期 `SCOUT` 的 semantic coverage 字段合并，补充 `failed_access_memory` 和 `semantic_false_positive_suppression`。 |
| 社交导航、人与障碍物反事实、安全距离 | 接近专题成熟 | 将 `SALSA` 与既有人与机器人近身安全、transparent autonomy 论文合并，形成 `human_object_counterfactual`、`anticipatory_near_collision`、`social_navigation_margin` 字段。 |
| Phase 5 运行观测、日志、验证证据链 | 接近专题成熟 | 将 `ros2probe` 的 observer probe effect 纳入 provenance / evidence chain TODO，不新增完整观测平台，先记录观测开销与 trace 失真。 |
| 老人照护基础模型、照护工作流、临床 / 照护结果证据 | 值得专题跟踪 | 从“能聊天 / 能参与”转向 `care_outcome_level`、`workflow_integration`、`accountable_autonomy` 和 hallucination / breakdown 复盘字段。 |
| `mmWave` 跌倒检测、humanoid embodied sensing、主动传感 | 暂不升级 | 保留夜间 / 遮挡 / 多房间跌倒评测提醒，不改变一代纯视觉主线和主动传感边界。 |
| replacement 中的 monocular scene graph、RobotEQ、deterministic ROS 2 | 专题候选 | 只有当后续验证模板需要 scene graph granularity、主动社会规范或实时调度确定性字段时再吸收，不因 replacement 直接扩张主线。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 AgniNav、DB-Nav、SALSA、ros2probe、FOUND-IT、AllDayNav 和 EM-Fall 都写成在线子系统，会过复杂”。建议只吸收 8 类轻量字段：`collision_envelope_config`、`monocular_pseudo_scan_confidence`、`semantic_false_positive_suppression`、`failed_access_memory`、`human_object_counterfactual`、`anticipatory_near_collision`、`observer_probe_effect`、`care_outcome_level`。暂不新增独立 ObjectNav 大脑、在线 lifelong RL 主链路、主动 `mmWave` 传感方案或完整 `ROS 2` 观测平台。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | AgniNav: Configuration-Driven Cross-Embodiment Local Planning for Robot Navigation | 进入纯视觉局部规划 / 本体 envelope 验证专题，优先吸收四参数安全 envelope 与单目 pseudo-scan 端侧运行字段。 |
| A- | Rethinking Embodied Navigation via Relational Inductive Bias | 进入 ObjectNav 语义误导抑制和空间记忆验证专题，补充 activation / inhibition bias 与失败探索记忆字段。 |
| A- | Act on What You See: Unlocking Safe Social Navigation in Vision-Language-Action Models | 进入社交导航安全验证候选，吸收人 / 物反事实、未来碰撞和近身安全 margin 字段；不升级为一代 `VLA` 主链路。 |
| B+ | ros2probe: Non-intrusive, Kernel-selective Observability for Robot Operating System 2 Middleware | 进入 Phase 5 观测证据链候选，吸收 observer probe effect 与 topic-selective trace 字段。 |
| B+ | Exploration of Foundation Model-Based Robots in Patient and Elderly Care | 进入老人照护评测口径候选，补充真实照护结果证据、工作流兼容和 accountable oversight 字段。 |

## 3. 论文卡片

### 3.1 AgniNav: Configuration-Driven Cross-Embodiment Local Planning for Robot Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.10903](https://arxiv.org/abs/2606.10903) |
| 本轮 listing 口径 | 2026-06-10 官方 listing new submission；abs/API 显示 `Published: 2026-06-09` |
| 分类 | `cs.RO` |
| 方法关键词 | monocular local navigation, collision envelope, pseudo-laserscan, cross-embodiment transfer, dimension-aware local planner |

摘要要点转述：

论文关注轻量机器人如何只用单目彩色图像做局部导航，同时避免视觉策略与某个特定本体、相机高度或足迹尺寸强绑定。作者提出 `AgniNav`，把机器人抽象为 4 个可测量安全 envelope 参数：碰撞相关高度、前向长度、后向长度和半宽。高度参数用于条件化 image-to-scan 网络，从单目图像预测一维 pseudo-laserscan；其余足迹参数进入尺寸感知 local planner 做碰撞检查。训练阶段用彩色图像与深度生成的 column-minimum scan label 监督，但部署阶段只需要单目图像。实机在 Turtlebot2、Unitree Go2 和 Accelerated Evolution K1 上测试，报告 30 Hz Jetson Orin 运行表现。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`platform_runtime` 和本体结构 / 相机布局变化后“局部避障策略是否仍然有效”的问题。
2. Kinbot 一代若坚持低成本纯视觉路线，应把底盘宽度、头部 / 躯干相机高度、前后突出量和可通过门槛能力显式写进局部规划验证，而不是只验证抽象导航成功率。
3. 对应 Phase 5：建议增加 `collision_envelope_config`、`collision_relevant_height`、`front_length`、`rear_length`、`half_width`、`monocular_pseudo_scan_confidence`、`dimension_aware_collision_check` 和 `zero_retraining_body_config_check` 字段。

资源消耗与部署信号：

1. 训练仍依赖 paired color-depth data 生成监督标签，但部署端不要求主动深度相机。
2. 论文报告 Jetson Orin 30 Hz，适合转成 Kinbot 目标 SoC 上的 batch-1 延迟、峰值内存、热功耗和帧率验证；不能直接外推到 `12GB RAM + 32GB Flash` 默认量产线。
3. pseudo-laserscan 是低维几何信号，对端侧内存友好，但可能损失语义风险、透明障碍和低矮物体细节。

优势：

1. 直接贴合 Kinbot 纯视觉、低成本、本体尺寸仍在收敛中的工程现实。
2. 把感知和规划都绑定同一组安全 envelope，便于结构 / 导航 / 测试跨团队对齐。
3. 比“换一个大模型”更容易进入 Phase 5 实机 A/B 和回放验证。

劣势与风险：

1. 单目 pseudo-scan 不等于完整深度感知，对镜面、玻璃、低矮障碍、宠物和软物体仍需专门测试。
2. 训练标签来自深度数据，Kinbot 自建数据闭环需要明确真值采集和标定策略。
3. 该方法主要解决局部碰撞 envelope，不替代全局语义导航、任务规划或长期记忆。

推荐理由：

建议作为 A 级输入。它应进入纯视觉局部规划 / 本体 envelope 验证专题，帮助 Kinbot 把“单目可行”落到可测量身体参数和端侧运行指标；不建议据此新增主动深度传感或更复杂导航主链路。

### 3.2 Rethinking Embodied Navigation via Relational Inductive Bias

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.10348](https://arxiv.org/abs/2606.10348) |
| 本轮 listing 口径 | 2026-06-10 官方 listing new submission；abs/API 显示 `Published: 2026-06-09` |
| 分类 | `cs.RO` |
| 方法关键词 | DB-Nav, ObjectNav, relational inductive bias, activation bias, inhibition bias, failed access memory |

摘要要点转述：

论文指出 ObjectNav 的问题不只是“去哪里找”，更是“哪些语义线索不该信”。开放词汇检测和 `VLM` 先验容易受 false positive、过期静态常识和反复失败探索污染，导致地图和决策一起偏离。作者提出 `DB-Nav`，把目标相关关系拆成两类：Activation Bias 用于传播上下文证据，Inhibition Bias 用于根据感知混淆和行动级证伪抑制不可靠区域。二者合并为 Relational Activation-Inhibition Exploration Graph，用在线观测和失败访问记录调制 frontier exploration value。实验报告在 ObjectNav benchmark 上提高 `SR` 与 `SPL`，且不依赖昂贵的在线 `VLM` reasoning。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`mobility_navigation` 和家庭找物 / 巡护中“物体可能在哪里”和“哪些候选已经被证伪”的问题。
2. Kinbot 面对药盒、遥控器、门口障碍、充电线、常用水杯时，不能只把开放词汇检测结果写进记忆，还要记录已检查未找到、被相似物误导、用户纠正和环境变化。
3. 对应 Phase 5：建议增加 `activation_bias_score`、`inhibition_bias_reason`、`semantic_false_positive_suppression`、`failed_access_memory`、`outdated_relation_prior`、`objectnav_falsification_event` 和 `frontier_value_after_inhibition` 字段。

资源消耗与部署信号：

1. 论文强调轻量、可解释，并避免高成本在线 `VLM` 推理，符合 Kinbot 端侧资源约束方向。
2. 实际资源消耗取决于对象关系图、开放词汇检测频率和失败事件存储策略；适合先做回放验证，不应直接上线长期自动改写记忆。
3. 需要与隐私区域、用户权限和家庭成员纠正输入绑定，避免把误检 / 误证伪写成永久事实。

优势：

1. 明确补上“语义负证据”这一类 Kinbot 空间记忆缺口。
2. 与近期 `SCOUT` 的语义覆盖缺口互补：一个关注哪里没看清，一个关注哪里已经被证伪。
3. 可解释性较强，便于向用户或后台说明为什么不再去某个区域找物。

劣势与风险：

1. ObjectNav benchmark 与家庭老人照护任务仍有差距，需要用 Kinbot 自建家庭场景验证。
2. 关系先验若过强，可能压制真实但低频的物品摆放变化。
3. 失败探索记忆需要过期机制，否则会把临时变化误当长期规律。

推荐理由：

建议作为 A- 级输入。它应进入 ObjectNav 语义误导抑制和空间记忆验证专题，帮助 Kinbot 从“累积候选”升级为“累积候选 + 证伪证据”；不建议新增独立 ObjectNav 大脑。

### 3.3 Act on What You See: Unlocking Safe Social Navigation in Vision-Language-Action Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.10495](https://arxiv.org/abs/2606.10495) |
| 本轮 listing 口径 | 2026-06-10 官方 listing new submission；abs/API 显示 `Published: 2026-06-09` |
| 分类 | `cs.RO` |
| 方法关键词 | SALSA, social navigation, VLA, counterfactual human-object pairs, temporal safety alignment, near-collision |

摘要要点转述：

论文研究安全社交导航中一个很实际的问题：机器人必须把人和普通障碍物区分开，并在风险变成迫近碰撞前提前行动。作者发现，预训练 `VLA` 模型的中间表征里已经包含行人 / 物体区分和未来碰撞信号，但行为克隆训练没有稳定把这些信号转成社会适宜动作。`SALSA` 用两阶段无标注后训练解决这个错位：先通过人 / 物反事实场景对齐中间层社会特征和动作头，打破视觉显著性捷径；再用自动生成的未来风险监督训练提前避让。论文在 `SCAND` 和实机部署中报告近碰撞下降 `86.4%`，social counterfactual accuracy 从 `53%` 提升到 `93%`。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`safety_compliance_authorization` 和家庭近身交互中“老人 / 保姆 / 访客 / 儿童 / 宠物不应被当成普通障碍物”的问题。
2. Kinbot 的靠近、绕行、停靠、等待和主动打断动作都需要社交安全 margin，而不仅是底盘碰撞半径。
3. 对应 Phase 5：建议增加 `human_object_counterfactual`、`social_counterfactual_accuracy`、`anticipatory_near_collision`、`future_risk_supervision`、`social_navigation_margin`、`near_person_slowdown_reason` 和 `interpersonal_distance_violation` 字段。

资源消耗与部署信号：

1. 论文基于 `VLA` 后训练，不能直接推导为 Kinbot 一代需要在线 `VLA` 主链路。
2. 对 Kinbot 更合理的迁移方式是把反事实数据构造和未来风险标签作为验证集 / shadow-run 字段，而不是直接替换局部规划器。
3. 若后续采用端侧轻量视觉策略，可用该论文的“中间表征已含社会信号但动作未对齐”作为诊断假设。

优势：

1. 直接覆盖家庭机器人最敏感的近人安全与产品感问题。
2. counterfactual human-object pairs 适合构造 Kinbot 自建测试集，避免把人当作桌椅一类障碍物。
3. 可与老人看护、夜间静默巡护和主动靠近用户场景结合。

劣势与风险：

1. `VLA` 路线与 Kinbot 一代默认端侧资源线之间仍有距离。
2. 论文指标来自特定数据集和实机平台，需重做家庭狭窄空间、低速底盘、老人步态和宠物干扰评测。
3. 社交安全策略过保守会降低召回和陪伴自然度，需要按风险等级调节。

推荐理由：

建议作为 A- 级输入。它应进入社交导航安全验证候选，帮助 Kinbot 建立人 / 物反事实、未来碰撞和近身安全 margin 测试；不建议据此把 `VLA` 升级为一代在线主链路。

### 3.4 ros2probe: Non-intrusive, Kernel-selective Observability for Robot Operating System 2 Middleware

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.10746](https://arxiv.org/abs/2606.10746) |
| 本轮 listing 口径 | 2026-06-10 官方 listing new submission；abs/API 显示 `Published: 2026-06-09` |
| 分类 | `cs.RO` |
| 方法关键词 | ROS 2, DDS, observer probe effect, non-intrusive observability, in-kernel filter, embedded robot logging |

摘要要点转述：

论文指出 `ROS 2` 机器人系统的常规观测工具会加入 `DDS` 域，成为被测系统的一部分，从而引入 probe effect：发现平面膨胀、反序列化开销增加、观测到的丢包和真实订阅者收到的消息不一致，接近饱和时甚至挤掉真实订阅者消息。作者提出 `ros2probe`，先从 discovery packets 重建 `ROS 2` 通信状态，再用内核过滤器只提取用户指定 topic 的 packets，既保留 `ROS 2` 语义，又避免按全流量被动抓包。论文在 laptop、Jetson、Raspberry Pi，两个 `DDS` 实现和 7 个 robot-operation workloads 上测试，报告发现图扰动小于 `0.5%`，而 domain-joining 工具可膨胀到 `2.6x`；接近饱和时传统工具造成 `38.5%` 订阅消息丢失，`ros2probe` 不丢，且 CPU / memory 最高降低 `7x` / `28x`。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`observability_data_governance` 和 Phase 5 样机日志 / 证据链中“观测是否改变被观测系统”的问题。
2. Kinbot 在端侧资源紧张、网络不稳定、视觉 / 导航 / 语音并发时，如果日志工具本身扰动 `DDS` 通信，会把验证结果污染成假故障或漏故障。
3. 对应 Phase 5：建议增加 `observer_probe_effect`、`trace_perturbation_budget`、`subscriber_actual_loss`、`topic_selective_capture`、`logging_cpu_overhead`、`logging_memory_overhead` 和 `near_saturation_trace_validity` 字段。

资源消耗与部署信号：

1. 方法是内核选择性观测，适合嵌入式机器人，但引入 Linux kernel / network capture 权限和安全维护成本。
2. 对 Kinbot 的短期价值是验证工具选择和日志开销字段，而不是立刻标准化该工具。
3. 若 Kinbot 后续采用非 `ROS 2` 中间件，仍可保留“观测扰动预算”作为通用证据链要求。

优势：

1. 正面解决 Phase 5 证据链中容易被忽略的观测污染问题。
2. 报告覆盖 Jetson 和 Raspberry Pi，具备端侧资源参考价值。
3. 可直接迁移为样机日志验收字段，不要求新增算法主链路。

劣势与风险：

1. 工具级论文不直接提升导航、记忆或交互能力。
2. 内核过滤和网络抓包涉及安全、权限、可维护性和量产调试边界。
3. 只覆盖 `ROS 2` / `DDS` 语境，需与 Kinbot 实际中间件选型对齐。

推荐理由：

建议作为 B+ 级输入。它应进入 Phase 5 观测证据链候选，帮助 Kinbot 规定日志工具不得显著扰动被测系统；不建议因此新增完整观测平台。

### 3.5 Exploration of Foundation Model-Based Robots in Patient and Elderly Care

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.10208](https://arxiv.org/abs/2606.10208) |
| 本轮 listing 口径 | 2026-06-10 官方 listing new submission；abs/API 显示 `Published: 2026-06-08` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | elderly care robot, patient care, foundation model, accountable autonomy, care-specific evaluation, workflow integration |

摘要要点转述：

论文是一篇面向病患与老人照护机器人基础模型应用的 Perspective。作者把现有系统梳理为设计特征、用户体验和照护结果证据三类，指出当前基础模型多作为语音社交型机器人里的对话和推理层，真正的多模态 grounding 与物理自主仍有限。已有实证通常能证明易用性、参与度或认知互动等近端收益，但可靠性故障仍贯穿交互链路，包括幻觉、对话中断和任务失败；对经过验证的临床或照护结果，证据仍不足。作者建议未来转向照护专属评测标准、accountable autonomy 和工作流整合。

解决 Kinbot 的什么问题：

1. 对应 `health_care_service_orchestration`、`interaction_orchestration`、`safety_compliance_authorization` 和老人照护主价值中“什么才算照护效果”的问题。
2. Kinbot 不能只用“老人愿意聊天”“家属觉得有用”来证明健康管理价值，还要区分参与度、任务完成、风险发现、家属响应、医疗 / 社区工作流对接和真实照护结果证据。
3. 对应 Phase 5：建议增加 `care_outcome_level`、`proximal_engagement_metric`、`validated_care_outcome_metric`、`workflow_integration_point`、`accountable_autonomy_owner`、`hallucination_or_breakdown_event` 和 `human_oversight_required` 字段。

资源消耗与部署信号：

1. 论文不要求新增模型或传感器，主要影响评测设计和照护服务闭环。
2. 对 Kinbot 的资源含义是避免为了“更像照护机器人”盲目增加大模型能力，应先定义可验证照护结果和人工监督责任。
3. 后续如接入后台坐席或医疗 / 社区链路，应把人工监督、异常升级和责任边界作为评测指标，而不是只看对话模型效果。

优势：

1. 与 Kinbot 一代价值排序中的健康管理和老人看护高度相关。
2. 强提醒当前行业证据短板，避免把基础模型对话体验误写成照护闭环完成。
3. 可直接指导 Phase 5 家庭样机试点和用户研究表单。

劣势与风险：

1. Perspective 论文不是新算法，不能直接提供可部署模块。
2. 讨论范围偏广，需要 Kinbot 自己收敛到中国大陆家庭、社区 / 物业、互联网医疗和家属协同语境。
3. 若评测指标过早医疗化，可能超出一期产品合规和服务能力边界。

推荐理由：

建议作为 B+ 级输入。它应进入老人照护评测口径候选，帮助 Kinbot 把“照护价值”拆成可验证结果、工作流兼容和人工监督责任；不建议据此扩张医疗承诺或新增未确认服务闭环。

## 4. 候选排除表

| 论文 | arXiv | listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| AllDayNav: Lifelong Navigation via Real-World Reinforcement Learning | [2606.10927](https://arxiv.org/abs/2606.10927) | 2026-06-10 new submission | lifelong navigation 与记忆强相关，但方案把场景动态隐式写入 billion-scale 模型并自生成指令 / reward；资源、可解释性和治理成本过高。本轮只保留“长期导航需时间上下文”判断，不新增在线 lifelong RL 主链路。 |
| AgenticNav: Zero-Shot Vision-and-Language Navigation as a Tool-Calling Harness | [2606.10577](https://arxiv.org/abs/2606.10577) | 2026-06-10 new submission | tool-calling harness、pixel action 和 compact map memory 对 VLN 有启发，但依赖 depth tool 与强 `VLM` 在线推理；与近期 VLN waypoint / tool harness 主题接近饱和。本轮不作为主卡片。 |
| GUIDE: Goal-Initialized Directional Understanding for End-to-End Visual Navigation | [2606.10832](https://arxiv.org/abs/2606.10832) | 2026-06-10 new submission | goal-initialized spatial memory 有价值，但方法面向 quadruped、raw depth 和 proprioceptive history；Kinbot 一代轮式纯视觉路线暂不吸收为主卡片。 |
| FOUND-IT: Foundation-model-first Task-driven 3D Scene Graphs with Granularity on Demand | [2605.25371](https://arxiv.org/abs/2605.25371) | 2026-06-10 replacement | uncalibrated monocular real-time scene graph 和 task-driven granularity 很相关，但本轮是 replacement，且与近期 `SCOUT` / semantic scene graph 主题重叠；作为 semantic memory 专题候选，不因 replacement 直接改写主线。 |
| EM-Fall: Embodied mmWave Sensing for Day-and-Night Fall Detection on Humanoid Robots | [2606.11109](https://arxiv.org/abs/2606.11109) | 2026-06-10 new submission | 老人跌倒检测高度相关，但方法依赖 `mmWave`、humanoid 移动 sensing 和主动传感视角调整；只吸收昼夜 / 遮挡 / 多房间跌倒评测提醒，不改变一代纯视觉主线。 |
| Equanimity in HRI: Applying Calm Technology Principles to Human-Robot Interaction | [2606.09836](https://arxiv.org/abs/2606.09836) | 2026-06-10 cross-list from `cs.HC` | 家庭 assistive robot 的 calm technology 原则与“温暖、精致”产品感相关，但偏设计指南，缺少可直接进入导航、记忆、安全或端侧资源的验证字段；后续交互规范专题再吸收。 |
| Efficient-WAM: A 1B-Parameter World-Action Model with Low-Cost Future Imagination | [2606.10040](https://arxiv.org/abs/2606.10040) | 2026-06-10 new submission | `1B` WAM、粗未来视频和 `100 ms` per chunk 有端侧资源启发，但仍是 manipulation / world-action model 主线，且近期该主题已饱和；不作为一代在线模型层新增依据。 |
| Test-time Adversarial Takeover: A Real-time Hijacking Interface against Robotic Diffusion Policies | [2606.10371](https://arxiv.org/abs/2606.10371) | 2026-06-10 new submission | 视觉攻击接管具身策略的安全警示重要，但 Kinbot 一代尚未冻结 diffusion action policy 主链路；作为未来安全红队用例，不进入本轮主卡片。 |
| What Demonstration Curation Metrics Do to Your Policy | [2606.10229](https://arxiv.org/abs/2606.10229) | 2026-06-10 new submission | “缺陷检测指标不等于策略质量”与 2026-06-06 示教数据审计主题一致，但实验是 contact-rich manipulation；本轮不重复扩张主卡片。 |
| Robotic Nonprehensile Object Transportation with a Hanging Tray | [2606.10039](https://arxiv.org/abs/2606.10039) | 2026-06-10 new submission | 移动底盘 + 悬挂托盘可启发送药 / 送物形态，但偏机械结构和服务演示，不直接改变本轮导航、记忆、安全、端侧资源判断；后续若讨论储物仓 / 送药机构再读取。 |
| Uncovering Vulnerability of Vision-Language-Action Models under Joint-Level Physical Faults | [2606.10501](https://arxiv.org/abs/2606.10501) | 2026-06-10 new submission | 物理故障下策略执行错配值得关注，但对象是 joint-level `VLA`，更接近机械臂 / 关节策略；Kinbot 可在运动故障诊断专题吸收，不作为本轮主卡片。 |
| A Distributed Multi-UGV Exploration Framework With Loop-Aware Planning and Descriptor-Aided Localization in Resource-Limited Environments | [2606.11088](https://arxiv.org/abs/2606.11088) | 2026-06-10 new submission | resource-limited exploration 和 loop-aware planning 有工程价值，但依赖多 `UGV`、`LiDAR` descriptor 和协同探索；不符合 Kinbot 单机家庭纯视觉默认边界。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮论文默认仍作为 `docs/09_research/00_papers/` 下的研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。
2. 若后续处理 Phase 5 验证模板、家庭样机试点或导航回放报告，可优先吸收本轮最小字段：`collision_envelope_config`、`monocular_pseudo_scan_confidence`、`semantic_false_positive_suppression`、`failed_access_memory`、`human_object_counterfactual`、`anticipatory_near_collision`、`observer_probe_effect`、`care_outcome_level`。
3. 不建议新增在线 lifelong RL 记忆主链路、完整 semantic scene graph 服务、`mmWave` 跌倒检测传感器、端侧大 `VLA` 主链路或完整 `ROS 2` 观测平台；当前更合理的是先把字段写入验证报告、回放分析和样机观测约束。
4. 如果后续要专题跟踪，优先方向是“单目局部避障 envelope + 语义误导抑制 + 社交导航反事实 + 非扰动观测链路”的最小闭环，而不是继续堆叠模型层。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent` 官方 listing：<https://arxiv.org/list/cs.RO/recent>
3. `AgniNav: Configuration-Driven Cross-Embodiment Local Planning for Robot Navigation`：<https://arxiv.org/abs/2606.10903>
4. `Rethinking Embodied Navigation via Relational Inductive Bias`：<https://arxiv.org/abs/2606.10348>
5. `Act on What You See: Unlocking Safe Social Navigation in Vision-Language-Action Models`：<https://arxiv.org/abs/2606.10495>
6. `ros2probe: Non-intrusive, Kernel-selective Observability for Robot Operating System 2 Middleware`：<https://arxiv.org/abs/2606.10746>
7. `Exploration of Foundation Model-Based Robots in Patient and Elderly Care`：<https://arxiv.org/abs/2606.10208>
8. 候选排除表条目：[`AllDayNav`](https://arxiv.org/abs/2606.10927)、[`AgenticNav`](https://arxiv.org/abs/2606.10577)、[`GUIDE`](https://arxiv.org/abs/2606.10832)、[`FOUND-IT`](https://arxiv.org/abs/2605.25371)、[`EM-Fall`](https://arxiv.org/abs/2606.11109)、[`Equanimity in HRI`](https://arxiv.org/abs/2606.09836)、[`Efficient-WAM`](https://arxiv.org/abs/2606.10040)、[`TAKO`](https://arxiv.org/abs/2606.10371)、[`What Demonstration Curation Metrics Do to Your Policy`](https://arxiv.org/abs/2606.10229)、[`Robotic Nonprehensile Object Transportation with a Hanging Tray`](https://arxiv.org/abs/2606.10039)、[`Joint-Level Physical Faults`](https://arxiv.org/abs/2606.10501)、[`Distributed Multi-UGV Exploration`](https://arxiv.org/abs/2606.11088)
