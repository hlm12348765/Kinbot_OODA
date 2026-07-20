# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-11
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-11 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页，确认本轮本地日更时官方最新 Robotics listing 为 `Thursday, 11 June 2026`，合计 `86` 篇 entries；其中 new submissions `47` 篇、cross submissions `8` 篇、replacement submissions `31` 篇。本轮按 `3-5` 篇强相关论文 + 候选排除表口径，收录视觉导航安全、社交导航实机可行性、测试时算力路由、多模态异步控制和具身 benchmark 证据链相关 5 篇论文，并记录候选排除表与周度综合判断。

---

## 1. 检索口径

本轮检索日期：2026-06-11。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Thursday, 11 June 2026`，合计 `86` 篇 entries；其中 new submissions `47` 篇、cross submissions `8` 篇、replacement submissions `31` 篇。
3. 官方 `cs.RO/recent` 在本轮检索时仍以 `Wed, 10 Jun 2026` 为顶部 recent 批次，页面显示 `showing first 50 of 63 entries`；本轮以 `cs.RO/new` 的 `Thursday, 11 June 2026` 作为正式 listing 口径，`recent` 只用于近期待补录与重复主题复核。
4. 上一轮 2026-06-10 覆盖的是 `Wednesday, 10 June 2026` listing。本轮为新的官方 Robotics listing，不按同一 listing 补录处理。
5. 新增主卡片均未出现在既有 `docs/09_research/00_papers/` 每日论文纪要中；`replacement` / `cross-list` 只在确实新增 Kinbot 评测项、治理项或端侧资源判断时收录，本轮主卡片全部来自 new submission。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全、端侧资源、验证证据链或老人照护评测的判断，而不是继续增加泛 `VLA`、world model、manipulation、humanoid、自动驾驶、UAV 或纯工具链论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`、`health_care_service_orchestration`。
3. 是否能低成本转化为 Phase 5 验证项：视觉导航障碍 / free-space 结构、社交导航运动学可行性、测试时算力预算、多模态传感频率解耦、benchmark 构造 provenance 与审计字段。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 `Embodied-R1.5`、`DAM-VLA`、`VICX`、`VeriSpace`、`DIRECT` 等论文继续扩张一代在线 `VLA` 或 foundation model 主链路；只吸收对端侧资源、验证字段和运行时调度有增量的部分。
2. `PIGEON`、`VeriSpace`、`SafeManip` 均有评测 / 验证价值，但分别是 replacement、manipulation VLA 或 temporal manipulation safety，且 ObjectNav / VLA safety 主题近期已接近饱和，本轮进入候选排除表或专题候选。
3. `Fast-SDE` 与人机交互距离很相关，但 Kinbot 一代已有麦克风阵列自研主线，本轮不因单麦克风方法改写语音声学硬件或交互距离策略。
4. 自动驾驶、UAV、多机器人、机械手、触觉手和水下 / 农业 / 手术机器人论文只在能新增 Kinbot 家庭移动闭环、老人安全、端侧资源或 Phase 5 证据字段时进入主卡片；否则作为候选排除。

## 2. 本轮总判断

本轮真正新增的判断不是“又需要一个更大的具身模型”，而是五个更能转成验证字段的工程口径：

1. **纯视觉导航安全需要把障碍边界与可通行区域显式教给策略**：`SAFER-Nav` 提示 RGB navigation foundation model 生成的轨迹可以到达目标，但在未见障碍或分布偏移下仍不安全；Kinbot 的纯视觉路线应把 segmentation-derived obstacle / free-space 结构转成 safety fine-tuning 或 shadow evaluation 字段。
2. **社交导航不能只评估礼让语义，还要评估底盘运动学可实现性**：`KinematicRL` 提示社交导航 sim-to-real 失败常来自简化一阶动力学、人类跟踪不稳和真实差速底盘控制误差；Kinbot 的老人近身导航应同时验证 social margin 和 control-order / tracking-error 约束。
3. **测试时算力不是统一加大，而要按场景路由**：`DIRECT` 提示 chain-of-thought 深度、模型大小和 memory history 三条扩展轴对成功率、延迟、token 和 FLOPs 的收益并不均匀；Kinbot 的 `OODA` 周期和端侧 / 云侧协同应建立 `test_time_compute_route`，而不是默认长思考或默认大模型。
4. **多模态机器人控制应承认传感器时钟不同步**：`DAM-VLA` 提示语言、视觉和高频物理模态不应被强行塞进同一同步 clock；Kinbot 可吸收“慢语言 / 中速视觉 / 高频 IMU、轮速、触觉或音频事件”的 buffer 与 refresh 口径，但不把该 manipulation VLA 直接升级为一代在线主链路。
5. **benchmark 自动化不会自动降低验证成本，而会把成本转移到审计、版本、诊断和长期治理**：`Intelligent Automation for Embodied Benchmark Construction` 提示 embodied benchmark 不是静态数据集，而是任务、环境、机器人数据、指标、脚本和发布策略的系统工程；Kinbot Phase 5 应先冻结最小 provenance / audit 字段，而不是盲目堆更多场景。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 泛 `VLA`、world model、manipulation policy | 已饱和 | 只有新增家庭移动闭环、老人照护、安全审计字段、目标 SoC 实测资源边界或验证误差闭环时才进入主卡片。 |
| 纯视觉 / RGB 导航安全、障碍边界、free-space 表征 | 值得专题跟踪 | 将 `SAFER-Nav` 与既有 `AgniNav`、纯视觉深度不确定性、局部规划安全论文合并为 `segmentation_safety_finetune`、`traversable_free_space_mask`、`unseen_obstacle_collision_rate` 字段。 |
| 社交导航、人与障碍物反事实、安全距离 | 接近专题成熟 | 将 `KinematicRL` 与 `SALSA`、transparent autonomy、人 / 物反事实评测合并，补充 `kinodynamic_social_feasibility`、`control_order_tracking_error`、`human_tracker_stability` 字段。 |
| 端侧资源、测试时算力、异步多模态调度 | 值得专题跟踪 | 将 `DIRECT` 和 `DAM-VLA` 收敛为 `test_time_compute_route`、`modality_clock_decoupling`、`latency_success_pareto`、`sensor_rate_buffer` 字段，不新增端侧大模型基线。 |
| Phase 5 benchmark、回放、证据链 provenance | 接近专题成熟 | 将 benchmark 构造 survey 与近期 provenance / ros2probe 论文合并，形成 `benchmark_pipeline_version`、`scenario_generation_method`、`metric_definition_version`、`diagnostic_feedback_trace`。 |
| ObjectNav / 语义记忆 / PoI 决策 | 接近饱和 | `PIGEON` 暂不进主卡片；只有新增低调用、可解释、可审计的家庭找物 / 药品定位字段时再收。 |
| HRI 声源距离、calm technology、交互舒适距离 | 专题候选 | `Fast-SDE` 可在语音声学 / 交互距离专题中读取；本轮不改变麦克风阵列自研主线。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 `SAFER-Nav`、`KinematicRL`、`DIRECT`、`DAM-VLA` 和 benchmark automation 都写成在线子系统，会过复杂”。建议只吸收 10 类轻量验证字段：`segmentation_safety_finetune`、`traversable_free_space_mask`、`unseen_obstacle_collision_rate`、`kinodynamic_social_feasibility`、`human_tracker_stability`、`test_time_compute_route`、`latency_success_pareto`、`modality_clock_decoupling`、`benchmark_pipeline_version`、`diagnostic_feedback_trace`。暂不新增在线 VLA 主链路、全自动 benchmark 平台、单麦克风声源距离模块或自动驾驶式 agent 调度层。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | SAFER-Nav: Enhancing Safety for Visual Robot Navigation via Segmentation-Aware Fine-Tuning | 进入纯视觉导航安全验证专题，优先吸收 obstacle / free-space segmentation fine-tuning 与 unseen obstacle collision 字段。 |
| A- | KinematicRL: A Sim-to-Real Reinforcement Learning Framework For Social Navigation With Kinodynamic Feasibility | 进入社交导航安全与实机可行性专题，补充差速底盘控制阶次、tracking error、human tracker 稳定性字段。 |
| A- | DIRECT: When and Where Should You Allocate Test-Time Compute in Embodied Planners? | 进入端侧资源与 `OODA` 算力路由专题，补充按场景选择 CoT 深度、模型大小和 memory history 的 Pareto 字段。 |
| B+ | DAM-VLA: Decoupled Asynchronous Multimodal Vision Language Action model | 进入多模态运行时调度候选，吸收传感器时钟解耦和 latent buffer 字段；不升级为一代在线 VLA 主链路。 |
| B+ | Intelligent Automation for Embodied Benchmark Construction: Pipelines, Embodiments, Simulators, and Trends | 进入 Phase 5 验证证据链候选，补充 benchmark pipeline、metric version、auditability 和 refresh governance 字段。 |

## 3. 论文卡片

### 3.1 SAFER-Nav: Enhancing Safety for Visual Robot Navigation via Segmentation-Aware Fine-Tuning

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.11636](https://arxiv.org/abs/2606.11636) |
| 本轮 listing 口径 | 2026-06-11 官方 listing new submission；abs/API 显示 `Published: 2026-06-10` |
| 分类 | `cs.RO` |
| 方法关键词 | RGB navigation, segmentation-aware fine-tuning, obstacle boundary, traversable free space, unseen obstacles |

摘要要点转述：

论文关注视觉导航 foundation model 的一个常见失配：RGB-only 模型可以生成看似可行的目标轨迹，但面对未见障碍、环境偏移或动态障碍时，轨迹仍可能不安全。作者认为，已有外部轨迹修正或几何先验没有让策略内部显式学习障碍边界与可通行 free-space 结构。`SAFER-Nav` 将这些 segmentation-derived 结构通过 fine-tuning 注入不同 RGB backbone，并在多平台、室内环境、静态 / 动态障碍场景中对比 `ViNT`、`NoMaD` 和 `CARE` 增强变体，报告 collision frequency 下降，同时保持 goal-reaching 表现。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`safety_compliance_authorization` 和一代纯视觉主线下“只用 RGB 是否足够安全”的问题。
2. Kinbot 不应只看 `SR / SPL / 到达率`，还应在家庭窄通道、低矮障碍、宠物、地毯边缘、药箱开仓和老人近身场景中记录 obstacle boundary 与 free-space 是否被策略正确利用。
3. 对应 Phase 5：建议增加 `segmentation_safety_finetune`、`traversable_free_space_mask`、`obstacle_boundary_alignment`、`unseen_obstacle_collision_rate`、`dynamic_obstacle_collision_rate` 和 `goal_reaching_under_safety_constraint` 字段。

资源消耗与部署信号：

1. 方法仍基于 RGB backbone，符合 Kinbot 纯视觉成本方向；但 segmentation 监督可能引入额外标注、伪标签生成或 teacher model 计算成本。
2. 不应直接外推到 Kinbot 目标 SoC；需要在 `12GB RAM + 32GB Flash` 默认量产线下测 batch-1 延迟、峰值内存、热稳定和低照度误检。
3. 如果 segmentation 只在训练 / fine-tuning 阶段使用，部署成本相对可控；如果在线生成 dense mask，则需重新评估端侧资源和 pipeline 延迟。

优势：

1. 直接贴合 Kinbot 低成本纯视觉导航安全，而不是绕回深度相机或激光雷达。
2. 将“轨迹可达”和“轨迹安全”拆开评估，能补强 Phase 5 安全证据链。
3. 适合与 `AgniNav` 的本体 envelope 字段组合，形成视觉 free-space + 机器人身体参数的双约束。

劣势与风险：

1. segmentation 质量本身会受光照、反光、透明物体和低矮障碍影响，不能替代实机安全兜底。
2. 论文未直接覆盖老人家庭的语义风险、宠物和夜间静默巡护，需要 Kinbot 自建场景回放。
3. 若将 segmentation 模块在线化，可能增加端侧算力、内存和调试复杂度。

推荐理由：

建议作为 A 级输入。它应进入纯视觉导航安全验证专题，帮助 Kinbot 把“RGB 导航是否安全”落到 obstacle / free-space 结构、碰撞率和安全约束下的到达率；不建议因此新增主动深度传感或在线 dense perception 平台。

### 3.2 KinematicRL: A Sim-to-Real Reinforcement Learning Framework For Social Navigation With Kinodynamic Feasibility

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.12042](https://arxiv.org/abs/2606.12042) |
| 本轮 listing 口径 | 2026-06-11 官方 listing new submission；abs/API 显示 `Published: 2026-06-10` |
| 分类 | `cs.RO` |
| 方法关键词 | social navigation, sim-to-real, differential drive, higher-order control, human tracking, residual gating |

摘要要点转述：

论文研究深度强化学习社交导航从仿真到实机部署时的两个弱点：一是常用一阶动力学和真实差速底盘控制之间有 tracking error；二是人类状态估计 pipeline 复杂、场景依赖强。作者先用理论分析说明提高控制阶次可让仿真与实际位置误差更快衰减，并为差速机器人设计二阶控制 action space；再用随机迭代 `iLQR` 预训练策略，通过 divergence minimization 提升可部署性。同时，论文用仅 `2D LiDAR` 的 cluster-based human tracking 避免 camera-LiDAR fusion 复杂度，并用 residual gating 平衡反应式和记忆式行为。实机结果显示该策略能以较小修改部署到真实差速机器人。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 与老人 / 保姆 / 访客近身场景中的社交导航安全。
2. Kinbot 的底盘是轮式，实际运动性能、控制延迟、加速度 / jerk 限制和人类跟踪稳定性，会决定“礼貌绕行”是否能真实执行，而不是只由社交语义模型决定。
3. 对应 Phase 5：建议增加 `kinodynamic_social_feasibility`、`control_order_tracking_error`、`differential_drive_action_space`、`human_tracker_stability`、`reaction_memory_gate_state` 和 `near_person_deceleration_profile` 字段。

资源消耗与部署信号：

1. 论文人类跟踪使用 `2D LiDAR`，不符合 Kinbot 一代纯视觉传感主线；本轮只吸收实机可行性与控制阶次验证口径，不吸收其传感器方案。
2. 二阶控制与 residual gating 不一定高算力，但需要底盘控制、导航策略和实机安全测试共同验证。
3. 社交导航评测应记录感知 pipeline、控制频率、底盘响应、最大减速度和最小近身距离，而不是只记录策略成功率。

优势：

1. 把社交导航从“看懂人”拉回“真实底盘能否安全执行”，契合 Kinbot 产品化问题。
2. 与 2026-06-10 的 `SALSA` 互补：`SALSA` 提供人 / 物反事实和未来碰撞，`KinematicRL` 补上控制可实现性。
3. 能转化为低成本实机指标，不要求新增大模型。

劣势与风险：

1. 论文使用 `2D LiDAR` 作为 tracking pipeline，Kinbot 不能据此改变一代纯视觉路线。
2. DRL 社交导航仍需严格约束安全 envelope，不能直接在老人家庭中在线学习。
3. 实验场景与家庭老人低速、窄空间、宠物干扰和夜间巡护仍有差距。

推荐理由：

建议作为 A- 级输入。它应进入社交导航安全与实机可行性专题，重点吸收控制阶次、tracking error、近人减速曲线和 human tracker 稳定性字段；不建议引入 `2D LiDAR` 或在线 RL 主链路。

### 3.3 DIRECT: When and Where Should You Allocate Test-Time Compute in Embodied Planners?

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.12402](https://arxiv.org/abs/2606.12402) |
| 本轮 listing 口径 | 2026-06-11 官方 listing new submission；abs/API 显示 `Published: 2026-06-10` |
| 分类 | `cs.RO`, `cs.AI`, `cs.CV` |
| 方法关键词 | test-time compute, embodied planner, routing, CoT depth, model size, memory history, latency-success Pareto |

摘要要点转述：

论文针对具身规划里越来越常见的“测试时算力扩展”提出警示：增加 chain-of-thought 深度、使用更大模型或拉更长 memory history，都会提高 latency、token 和 FLOPs，但对下游成功率的收益不均匀，甚至会出现边际收益递减。作者提出 `DIRECT`，用多模态场景上下文为每个 prompt 路由计算预算，在 chain-of-thought 深度、模型大小和记忆历史三条扩展轴之间做选择。论文在 `VLABench`、`RoboMME` 与 Franka 实机任务中报告，相比固定强模型，路由策略可保持或超过成功率，并降低平均延迟。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`decision_orchestration`、`world_state_memory` 和端云协同下“什么时候该思考更久、什么时候该快速行动”的问题。
2. Kinbot 的 `OODA` 周期不应固定为单一大模型调用或统一长上下文；应根据风险、任务类型、用户等待容忍度、网络状态和端侧资源动态选择规划预算。
3. 对应 Phase 5：建议增加 `test_time_compute_route`、`cot_depth_choice`、`model_size_choice`、`memory_history_window`、`latency_success_pareto`、`edge_cloud_compute_budget` 和 `planner_timeout_fallback` 字段。

资源消耗与部署信号：

1. 论文直接关注 latency、token 与 FLOPs，适合作为 Kinbot 端侧资源和云端调用预算的评估模板。
2. 不应把 `DIRECT` 理解为必须接入更大模型；更重要的是用路由减少不必要的 test-time compute。
3. 需要结合 Kinbot 本地模型、云模型、网络离线策略和隐私数据边界做二次约束。

优势：

1. 正面回应 Kinbot 对 `OODA` 时间尺度动态调整的需求。
2. 能把“更聪明”与“更慢、更贵、更耗电”之间的权衡变成可量化 Pareto。
3. 与 `12GB RAM + 32GB Flash` 默认量产线兼容：优先定义预算路由，而不是默认抬高硬件。

劣势与风险：

1. 实机验证以 Franka manipulation 为主，不等于家庭移动机器人全栈规划。
2. 如果路由器本身不可解释，可能把高风险场景错误分配到低算力路径。
3. 需要与安全优先级绑定：紧急避障不能等待长思考，医疗 / 权限判断不能只追求低延迟。

推荐理由：

建议作为 A- 级输入。它应进入端侧资源与 `OODA` 算力路由专题，帮助 Kinbot 建立按场景分配 test-time compute 的证据字段；不建议据此新增统一大模型规划层或默认长上下文。

### 3.4 DAM-VLA: Decoupled Asynchronous Multimodal Vision Language Action model

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.12105](https://arxiv.org/abs/2606.12105) |
| 本轮 listing 口径 | 2026-06-11 官方 listing new submission；abs/API 显示 `Published: 2026-06-10` |
| 分类 | `cs.RO`, `cs.CV`, `cs.LG` |
| 方法关键词 | asynchronous multimodal VLA, sensor-rate latent buffer, gated cross-attention, 100 Hz control, modality clock |

摘要要点转述：

论文指出，许多 `VLA` 模型继承了视觉语言预训练中的同步输入假设：所有模态按同一频率处理。但真实物理交互里，语言在一段任务中几乎不变，视觉中速变化，而触觉、力、关节状态或其他高频物理信号可达数百 Hz。同步处理会过采样慢模态、欠采样快模态，并让动作生成受最慢有效频率限制。`DAM-VLA` 为每个模态维护按自身传感器频率刷新的 latent buffer，动作头连续读取这些 buffer，并用 gated cross-attention 接入高频模态而不破坏预训练 backbone。论文在 7 个真实 contact-rich manipulation 任务中报告相比同步 baseline 有显著成功率提升，并能维持平滑的 100 Hz 控制。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`interaction_orchestration`、`mobility_navigation` 和多模态输入频率不一致的问题。
2. Kinbot 也存在慢语言、中速视觉、高频 IMU / 轮速 / 触觉 / 音频事件之间的时钟错配；如果全部用统一推理节拍处理，会浪费算力或降低安全反应。
3. 对应 Phase 5：建议增加 `modality_clock_decoupling`、`sensor_rate_buffer`、`latent_buffer_refresh_rate`、`high_frequency_event_path`、`action_head_read_frequency` 和 `slow_modality_reuse_window` 字段。

资源消耗与部署信号：

1. 论文的模型和实验集中在 manipulation `VLA`，不能直接推导为 Kinbot 一代必须采用在线 `VLA` 控制。
2. 对 Kinbot 更合理的吸收方式是运行时设计原则：高频安全 / 运动信号不被低频语言模型阻塞，慢模态结果可复用。
3. 需要在目标 SoC 上评估 buffer 数量、内存驻留、跨模态同步延迟和异常事件优先级。

优势：

1. 提供了多模态异步调度的清晰工程抽象，能帮助 Kinbot 避免“所有感知都进一个大模型”的复杂化。
2. 与端侧资源约束一致：慢模态复用、高频模态轻量更新。
3. 可直接进入 runtime profiling，而不必先改主线模型。

劣势与风险：

1. 论文主实验是接触式 manipulation，不覆盖轮式家庭导航与老人交互。
2. 如果 buffer / attention 机制设计过重，反而增加平台复杂度。
3. 高低频模态冲突时仍需要 safety arbitration，而不是只靠动作头融合。

推荐理由：

建议作为 B+ 级输入。它应进入多模态运行时调度候选，吸收传感器时钟解耦和 latent buffer 字段；不建议升级为一代在线 `VLA` 主链路。

### 3.5 Intelligent Automation for Embodied Benchmark Construction: Pipelines, Embodiments, Simulators, and Trends

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.12207](https://arxiv.org/abs/2606.12207) |
| 本轮 listing 口径 | 2026-06-11 官方 listing new submission；abs/API 显示 `Published: 2026-06-10` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | embodied benchmark, benchmark pipeline, automation, auditability, metric version, diagnostic feedback |

摘要要点转述：

论文是一篇具身 benchmark 构造自动化综述。作者指出，具身评测不同于静态数据集：它把任务规格、环境、机器人数据、示教、标注、指标、脚本和发布策略组合成一个评价系统。论文按五阶段 pipeline 梳理 benchmark 构造：需求与任务构造、数据获取、清洗与标注、benchmark suite 与指标定义、评测执行和诊断反馈；并比较人工、传统自动化、foundation-model 辅助和 agentic 闭环工作流。核心结论是，自动化不只是降低成本，很多时候是把成本转移到验证、审计、版本控制、长期治理和返工风险上。

解决 Kinbot 的什么问题：

1. 对应 `observability_data_governance`、Phase 5 验证口径和家庭样机试点证据链。
2. Kinbot 后续如果构造家庭导航、老人看护、药品递送、夜间巡护和交互安全 benchmark，不能只生成更多场景，还要保留任务版本、指标版本、数据来源、清洗规则、脚本版本和诊断反馈。
3. 对应 Phase 5：建议增加 `benchmark_pipeline_version`、`task_spec_version`、`scenario_generation_method`、`annotation_policy_version`、`metric_definition_version`、`evaluation_script_hash`、`diagnostic_feedback_trace` 和 `refresh_governance_owner` 字段。

资源消耗与部署信号：

1. 该论文不要求新增在线模型或端侧组件，主要影响验证组织方式。
2. 资源消耗在工程组织上体现为数据 / 仿真资产、标注、脚本维护、版本治理、审计和返工成本。
3. 与近期 provenance TODO 一致：应先冻结最小字段，而不是建设完整 benchmark 平台。

优势：

1. 对 Kinbot 当前 Phase 5 证据链最贴近，能防止“场景很多但证据不可追溯”。
2. 将 benchmark 当作系统工程，有利于跨导航、交互、安全、端侧资源和照护服务统一口径。
3. 能与 `ros2probe` 的观测扰动字段、A 档论文整合评审中的 provenance 字段包合并。

劣势与风险：

1. 综述论文不提供可直接部署算法。
2. 如果照搬完整 pipeline，容易过度平台化，拖慢 Phase 5 样机验证。
3. 自动化构造的场景仍需人工抽检和真实家庭有效性验证。

推荐理由：

建议作为 B+ 级输入。它应进入 Phase 5 验证证据链候选，帮助 Kinbot 定义 benchmark pipeline、metric version、auditability 和 refresh governance 最小字段；不建议据此启动完整自动 benchmark 平台。

## 4. 候选排除表

| 论文 | arXiv | listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| Embodied-R1.5: Evolving Physical Intelligence via Embodied Foundation Models | [2606.11324](https://arxiv.org/abs/2606.11324) | 2026-06-11 new submission | 8B `EFM`、15B tokens 和 `EmbodiedEvalKit` 有前瞻价值，但资源规模和 manipulation / affordance grounding 重点不适合作为 Kinbot 一代在线主链路；可在后续评测集对标中读取，不进入本轮主卡片。 |
| Dynamic Execution Horizon Prediction for Chunk-based Robot Policies | [2606.11408](https://arxiv.org/abs/2606.11408) | 2026-06-11 new submission | 动态 execution horizon 与 `OODA` 时间尺度很相关，但实验集中在高精度 manipulation chunk policy；本轮已用 `DIRECT` 与 `DAM-VLA` 覆盖更直接的算力路由和模态时钟口径，暂作为 runtime horizon 候选。 |
| PIGEON: VLM-Driven Object Navigation via Points of Interest Selection | [2511.13207](https://arxiv.org/abs/2511.13207) | 2026-06-11 replacement | PoI 把 VLM 决策与可执行 waypoint / 原始观测绑定，对 ObjectNav 很有价值，但本轮是 replacement，且 ObjectNav / 语义记忆近期已接近饱和；不因 replacement 扩张主卡片。 |
| VeriSpace: Spatially Grounded Action Verification for Vision-Language-Action Models | [2606.10568](https://arxiv.org/abs/2606.10568) | 2026-06-11 new submission | 3D-aware action verifier 能补强 test-time action selection，但对象是 manipulation VLA；Kinbot 可在未来 action verification 专题吸收，不作为本轮导航 / 端侧资源主卡片。 |
| Fast-SDE: Efficient Single-Microphone Sound Source Distance Estimation in Reverberant Environments | [2606.12339](https://arxiv.org/abs/2606.12339) | 2026-06-11 cross submission from `cs.SD` | 单麦克风声源距离估计与交互舒适距离相关，但 Kinbot 一代已有麦克风阵列自研与语音声学主线；本轮不改变声学硬件或交互距离策略，后续语音专题再读。 |
| PEBRE: An Open-Hardware Compute and Perception Add-On for the Pepper Robot | [2606.12112](https://arxiv.org/abs/2606.12112) | 2026-06-11 new submission | 机器人 compute / perception 加装包对样机快速开发有参考，但对象是 Pepper 平台，并引入 `RealSense` 等主动深度配置；不符合 Kinbot 一代纯视觉量产边界。 |
| SafeManip: A Property-Driven Benchmark for Temporal Safety Evaluation in Robotic Manipulation | [2605.12386](https://arxiv.org/abs/2605.12386) | 2026-06-11 replacement | `LTLf` temporal safety 模板可启发任务安全评测，但仍是 manipulation benchmark 且为 replacement；本轮不重复扩张安全模板，后续如写递送 / 药箱 temporal safety 再读取。 |
| Learning Unions of Convex Sets via Invertible Latent Decomposition for Path Planning | [2606.12027](https://arxiv.org/abs/2606.12027) | 2026-06-11 new submission | collision-free planning 表达有数学价值，但偏高维配置空间与抽象规划表示；对 Kinbot 家庭轮式导航当前字段增量不如 `SAFER-Nav` 和 `KinematicRL` 直接。 |
| MASK: Multi-Agent Semantic K-Scheduling for Risk-Sensitive 6G Robotics | [2606.11249](https://arxiv.org/abs/2606.11249) | 2026-06-11 new submission | risk-sensitive semantic scheduling 有资源受限启发，但面向多智能体 6G 通信和 swarm control；Kinbot 单机家庭场景暂不吸收为主卡片。 |
| DrivingAgent: Design and Scheduling Agents for Autonomous Driving Systems | [2606.12236](https://arxiv.org/abs/2606.12236) | 2026-06-11 new submission | 设计 / 调度 agent 的 continuous operation 口径有系统工程价值，但载体是自动驾驶，并与本轮 `DIRECT` 的 test-time compute routing 部分重叠；不作为 Kinbot 一代 agent 调度依据。 |
| Adversarial Attacks on Learned Policies for Surgical Robotic Tasks | [2606.11535](https://arxiv.org/abs/2606.11535) | 2026-06-11 new submission | 视觉扰动攻击对高风险机器人安全有警示，但场景是手术 subtask，且 Kinbot 一代不以 learned manipulation policy 为主链路；可作为未来红队素材。 |
| VLGA: Vision-Language-Geometry-Action Models for Autonomous Driving | [2606.12396](https://arxiv.org/abs/2606.12396) | 2026-06-11 cross submission from `cs.CV` | geometry grounding 对 VLA action 很重要，但依赖自动驾驶、LiDAR pointmap 和 dense 3D supervision；不改变 Kinbot 当前纯视觉家庭移动主线。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮论文默认仍作为 `docs/09_research/00_papers/` 下的研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。
2. 若后续处理 Phase 5 验证模板、家庭样机试点或导航回放报告，可优先吸收本轮最小字段：`segmentation_safety_finetune`、`traversable_free_space_mask`、`unseen_obstacle_collision_rate`、`kinodynamic_social_feasibility`、`human_tracker_stability`、`test_time_compute_route`、`latency_success_pareto`、`modality_clock_decoupling`、`benchmark_pipeline_version`、`diagnostic_feedback_trace`。
3. 不建议新增在线 `VLA` 主链路、全自动 benchmark 平台、单麦克风声源距离模块、`2D LiDAR` 社交导航感知方案或自动驾驶式 agent 调度层；当前更合理的是先把字段写入验证报告、回放分析和样机观测约束。
4. 如果后续要专题跟踪，优先方向是“纯视觉导航安全 + 社交导航运动学可行性 + 测试时算力路由 + benchmark provenance”的最小闭环，而不是继续堆叠模型层。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent` 官方 listing：<https://arxiv.org/list/cs.RO/recent>
3. `SAFER-Nav: Enhancing Safety for Visual Robot Navigation via Segmentation-Aware Fine-Tuning`：<https://arxiv.org/abs/2606.11636>
4. `KinematicRL: A Sim-to-Real Reinforcement Learning Framework For Social Navigation With Kinodynamic Feasibility`：<https://arxiv.org/abs/2606.12042>
5. `DIRECT: When and Where Should You Allocate Test-Time Compute in Embodied Planners?`：<https://arxiv.org/abs/2606.12402>
6. `DAM-VLA: Decoupled Asynchronous Multimodal Vision Language Action model`：<https://arxiv.org/abs/2606.12105>
7. `Intelligent Automation for Embodied Benchmark Construction: Pipelines, Embodiments, Simulators, and Trends`：<https://arxiv.org/abs/2606.12207>
8. 候选排除表条目：[`Embodied-R1.5`](https://arxiv.org/abs/2606.11324)、[`Dynamic Execution Horizon Prediction`](https://arxiv.org/abs/2606.11408)、[`PIGEON`](https://arxiv.org/abs/2511.13207)、[`VeriSpace`](https://arxiv.org/abs/2606.10568)、[`Fast-SDE`](https://arxiv.org/abs/2606.12339)、[`PEBRE`](https://arxiv.org/abs/2606.12112)、[`SafeManip`](https://arxiv.org/abs/2605.12386)、[`Learning Unions of Convex Sets`](https://arxiv.org/abs/2606.12027)、[`MASK`](https://arxiv.org/abs/2606.11249)、[`DrivingAgent`](https://arxiv.org/abs/2606.12236)、[`Adversarial Attacks on Learned Policies for Surgical Robotic Tasks`](https://arxiv.org/abs/2606.11535)、[`VLGA`](https://arxiv.org/abs/2606.12396)
