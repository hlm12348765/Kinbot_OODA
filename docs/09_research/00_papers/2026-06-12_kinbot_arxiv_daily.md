# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-12
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-12 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv API，确认本轮本地日更时官方最新 Robotics listing 为 `Friday, 12 June 2026`，合计 `88` 篇 entries；其中 new submissions `43` 篇、cross submissions `13` 篇、replacement submissions `32` 篇。本轮按 `3-5` 篇强相关论文 + 候选排除表口径，收录开放导航线索推理、安全标准控制约束、实时自回归策略执行、端云对象级语义地图和稀疏人工反馈安全预警相关 5 篇论文，并记录周度综合判断。

---

## 1. 检索口径

本轮检索日期：2026-06-12。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Friday, 12 June 2026`，合计 `88` 篇 entries；其中 new submissions `43` 篇、cross submissions `13` 篇、replacement submissions `32` 篇。
3. 官方 `cs.RO/recent` 在本轮检索时显示 `Total of 341 entries`，当前页为 `1-50`；顶部条目来自 `Friday, 12 June 2026` listing，可辅助确认今日新条目，但本轮正式 listing 口径以 `cs.RO/new` 为准。
4. 上一轮 2026-06-11 覆盖的是 `Thursday, 11 June 2026` listing。本轮为新的官方 Robotics listing，不按同一 listing 补录处理。
5. 新增主卡片均未出现在既有 `docs/09_research/00_papers/` 每日论文纪要中；`replacement` / `cross-list` 只在确实新增 Kinbot 评测项、治理项、端云边界或安全证据字段时收录。本轮 `SemanticXR` 为 cross submission，因其新增对象级端云语义地图与带宽 / 内存治理字段而收录；`Learning Robot Safety from Sparse Human Feedback using Conformal Prediction` 为 replacement submission，因其新增 human-feedback safety warning 与 miss-rate 证据字段而收录。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全、端侧资源、端云边界或验证证据链的判断，而不是继续增加泛 `VLA`、world model、manipulation、humanoid、自动驾驶、UAV 或纯工具链论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：开放导航线索审计、近人安全控制约束、实时策略延迟边界、对象级端云语义地图、人工标注 unsafe-region 的误报 / 漏报证据。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 `NavWAM`、`EWAM`、`MaskWAM`、`WEAVER`、`EA-WM` 等论文继续扩张一代在线 world model / `VLA` 主链路；只吸收能转为导航评测、资源路由或证据字段的部分。
2. `SPARC`、`RoboProcessBench` 和 `Trajectory-Level Redirection Attacks` 都有数据质量或安全评测价值，但对象集中在 manipulation / `VLA`；本轮已用 `Foresight`、`ISO 10218 + CBF`、`real-time autoregressive policy` 和 `conformal safety warning` 覆盖更直接的导航、安全与端侧运行时问题。
3. `From Imitation to Alignment / FlowPilot` 与单目长程社交导航相关，但场景是 outdoor sidewalk / micro-mobility；可作为社交导航专题候选，不直接改写 Kinbot 家庭室内路径策略。
4. `Humor Style Drives Laughter...` 与 Kinbot “俏皮但谨慎”的交互风格相关，但研究场景是课堂机器人讲笑话；本轮不把幽默风格写成一代交互主线或默认人设。

## 2. 本轮总判断

本轮真正新增的判断不是“再上一个更大的导航世界模型”，而是五个可以变成 Phase 5 字段的工程口径：

1. **开放导航需要把“线索是否重要”纳入执行前审计**：`Foresight` 提示 mapless navigation 的难点不只是看见环境，而是从稀疏语言目标中发现哪些路牌、坡道、绕行、门洞或语义 cue 会改变路线；Kinbot 可把执行前的 clue critique 作为 shadow evaluation，不让 VLM 直接控制底盘。
2. **安全标准要下沉到控制约束，而不是只停留在规则文案**：`Embedding ISO 10218 Safety Compliance...` 提示安全距离、人体加速度和最坏停止轨迹可以转成 `CBF / SQP` 约束；Kinbot 可吸收近人安全控制字段，但不照搬工业机器人 `ISO 10218` 作为家庭场景唯一标准。
3. **实时策略要有严格延迟边界，而不是只比较模型成功率**：`Real-Time Execution with Autoregressive Policies` 提示自回归策略可通过 tokenization horizon 和 constrained decoding 达到异步实时执行；Kinbot 应评估 `strict_latency_bound`、`smooth_action_trajectory` 和 `fast_reactivity`，而不是默认同步大模型推理。
4. **端云语义地图应以对象为通信、执行和记忆单元**：`SemanticXR` 提示在低功耗设备上，开放词汇语义地图可以按 object-level sparse local map、incremental update 和 update prioritization 划分端云边界；Kinbot 可吸收对象级语义回流 / 查询字段，但仍需遵守原始敏感数据端侧处理边界。
5. **安全偏好可以用稀疏人工反馈形成可量化预警区域**：`Learning Robot Safety from Sparse Human Feedback...` 提示可以让人标注轨迹是否不安全，再用 conformal prediction 给出 suspected unsafe region 与保证漏报率；Kinbot 可把家属 / 测试员标注接入离线安全证据链，而不是让机器人在线学习用户安全偏好。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 泛 `VLA`、world action model、manipulation policy | 已饱和 | `NavWAM`、`EWAM`、`MaskWAM` 等只在新增家庭移动闭环、目标 SoC 资源边界或可审计安全验证字段时进入主卡片。 |
| 开放词汇 / 纯视觉导航线索推理 | 值得专题跟踪 | 将 `Foresight` 与既有 VLN / ObjectNav 论文合并为 `navigation_clue_set`、`plan_critique_before_execution`、`cue_relevance_score` 字段。 |
| 社交导航与近人安全控制 | 接近专题成熟 | 将 `ISO 10218 + CBF`、`KinematicRL`、`SALSA` 和近人反事实评测合并为 `human_acceleration_assumption`、`worst_case_stopping_distance`、`near_person_control_barrier` 字段。 |
| 端侧资源、实时执行、异步推理 | 值得专题跟踪 | 将实时自回归策略与 `DIRECT`、`DAM-VLA` 合并为 `tokenization_horizon`、`strict_latency_bound`、`async_inference_frequency`、`trajectory_smoothness_under_latency` 字段。 |
| 语义地图、对象级记忆、端云边界 | 值得专题跟踪 | 将 `SemanticXR` 作为 cross-list 专题候选，验证 object-level sparse map、incremental update、bandwidth / memory budget 与隐私边界。 |
| 安全偏好、human feedback、conformal warning | 值得专题跟踪 | 将 sparse human feedback safety warning 纳入 Phase 5 离线标注与安全证据链，但不做在线偏好学习主链路。 |
| 幽默交互、BCI 认知对齐、课堂 / 实验室 HRI | 专题候选 | 暂不进入主卡片；只有能转成老人家庭交互礼仪、打断时机或安全授权字段时再收录。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 `Foresight`、`FlowPilot`、`NavWAM`、`SemanticXR` 和 conformal safety warning 都写成在线子系统，会过复杂”。建议只吸收 11 类轻量字段：`navigation_clue_set`、`plan_critique_before_execution`、`cue_relevance_score`、`human_acceleration_assumption`、`worst_case_stopping_distance`、`near_person_control_barrier`、`tokenization_horizon`、`strict_latency_bound`、`object_level_sparse_map`、`unsafe_region_warning`、`guaranteed_miss_rate`。暂不新增在线 world model 主链路、完整端云语义地图平台、在线安全偏好学习或默认幽默人设模块。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | Foresight: Iterative Reasoning About Clues that Matter for Navigation | 进入开放导航线索推理专题，优先吸收 plan critique、cue relevance 和执行前 shadow evaluation 字段。 |
| A- | Embedding ISO 10218 Safety Compliance in Robots via Control Barrier Functions for Human-Robot Collaboration | 进入近人安全控制专题，吸收人体加速度、最坏停止距离、CBF / SQP 安全过滤字段；不照搬工业标准边界。 |
| A- | Real-Time Execution with Autoregressive Policies | 进入端侧实时执行专题，补充 tokenization horizon、constrained decoding、strict latency bound 和异步执行字段。 |
| B+ | SemanticXR: Low Power and Real-time Queryable Semantic Mapping with an Object-Level Device-Cloud Architecture | 进入对象级语义地图与端云边界候选，验证 object-level sparse map、incremental update、带宽 / 内存预算和隐私边界。 |
| B+ | Learning Robot Safety from Sparse Human Feedback using Conformal Prediction | 进入安全证据链候选，补充 human-labeled unsafe region、conformal miss-rate guarantee 和预警阈值字段。 |

## 3. 论文卡片

### 3.1 Foresight: Iterative Reasoning About Clues that Matter for Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.12550](https://arxiv.org/abs/2606.12550) |
| 本轮 listing 口径 | 2026-06-12 官方 listing new submission；abs/API 显示 `Published: 2026-06-10` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | mapless navigation, sparse language instruction, clue critique, VLM planning, human feedback reward model |

摘要要点转述：

论文关注开放世界 mapless navigation 中的欠指定目标问题：用户用稀疏语言描述目的地时，机器人不只要识别场景，还要判断哪些视觉线索会改变路线，例如坡道、标识、绕行路径、门口或局部障碍。作者提出 `Foresight`，让经过微调的 VLM 在测试时交替生成 image-space motion plan，并基于语言目标和视觉上下文批判上一轮计划；后续计划再条件化到这些 critique 上，从而在执行前迭代修正。论文还用 human feedback 训练 reward model，使线索批判与路线修正更贴近开放场景中的人类偏好。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 与 `interaction_orchestration` 中“用户说去某处，但目标或路径线索不足”的问题。
2. Kinbot 在家庭内可能遇到“去阳台那边”“去药箱旁边”“别从客厅中间走”等欠指定指令，不能只把目标解析成单个 waypoint；应记录哪些 cue 影响路线选择。
3. 对应 Phase 5：建议增加 `navigation_clue_set`、`cue_relevance_score`、`plan_critique_before_execution`、`critique_iteration_count`、`ambiguous_goal_resolution_trace` 和 `execution_blocked_by_missing_clue` 字段。

资源消耗与部署信号：

1. 该方法包含测试时 VLM 迭代 critique，直接在线化会增加延迟、token、端云调用和不可解释风险。
2. 对 Kinbot 更合理的吸收方式是离线 / shadow evaluation：用它审计导航策略是否忽略关键线索，而不是让 VLM 直接控制底盘。
3. 若后续在线使用，应受 `test_time_compute_route`、隐私数据端侧处理和安全优先级约束。

优势：

1. 与 Kinbot 纯视觉 + 语言目标导航高度相关，尤其适合欠指定家庭指令。
2. 把“看见很多东西”收敛为“哪些线索真正影响路线”，能减少语义地图无边界扩张。
3. 可与 `DIRECT` 的测试时算力路由结合，只在高不确定性场景触发更深 critique。

劣势与风险：

1. VLM critique 可能产生语言化解释但不保证几何可行。
2. 家庭室内路线比开放 outdoor / mapless 场景更依赖低矮障碍、老人活动区域和动态物体，需要自建数据。
3. 若迭代轮数不受控，会拖慢 `OODA` 周期并损害实时安全。

推荐理由：

建议作为 A 级输入。它应进入开放导航线索推理专题，帮助 Kinbot 把欠指定指令下的关键 cue、计划批判和执行前审计转成验证字段；不建议新增在线 VLM 直接导航主链路。

### 3.2 Embedding ISO 10218 Safety Compliance in Robots via Control Barrier Functions for Human-Robot Collaboration

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.13203](https://arxiv.org/abs/2606.13203) |
| 本轮 listing 口径 | 2026-06-12 官方 listing new submission；abs/API 显示 `Published: 2026-06-11` |
| 分类 | `cs.RO` |
| 方法关键词 | ISO 10218, control barrier function, speed and separation monitoring, human acceleration, SQP safety filter |

摘要要点转述：

论文试图把人机协作安全标准中的 Speed and Separation Monitoring 从保守规则变成控制层约束。传统安全过滤器常假设人体速度恒定，因此难以准确预测最小人机距离，容易导致不必要停机。作者提出一种 Control Barrier Function，将人体加速度数据纳入最坏停止轨迹下的最小距离预测，并把该约束作为 Sequential Quadratic Programming 的不等式条件。论文给出两类实现：带 CBF 约束的 PD safety filter，以及带 spatial tube constraint 的 task-scaling SQP controller，并在仿真和真实机器人上验证。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 与 `safety_compliance_authorization` 中老人、保姆、访客、宠物近身时的安全距离控制。
2. Kinbot 不应只用“离人多远”这种静态阈值，还应考虑人的速度、加速度、机器人最坏制动轨迹和底盘控制延迟。
3. 对应 Phase 5：建议增加 `human_acceleration_assumption`、`worst_case_stopping_distance`、`near_person_control_barrier`、`ssm_filter_trigger_reason`、`task_scaling_safety_state` 和 `unnecessary_stop_rate` 字段。

资源消耗与部署信号：

1. `CBF / SQP` 属于控制层约束，资源消耗通常低于大模型推理，但依赖稳定的人体状态估计和底盘制动模型。
2. 论文面向工业协作机器人，不能直接替代家庭机器人法规、儿童 / 老人风险模型或产品安全设计。
3. Kinbot 应先用其字段审计安全 envelope，再决定是否进入实时控制器。

优势：

1. 把安全标准下沉到控制约束，有助于形成可审计的近人安全证据。
2. 与 2026-06-11 的 `KinematicRL` 互补：前者补底盘可实现性，本文补安全过滤器与最坏停止距离。
3. 不要求新增主动传感器主线，理论上可与视觉人体跟踪和轮速 / IMU 状态结合。

劣势与风险：

1. `ISO 10218` 是工业机器人安全标准，家庭老人场景还需要更细的交互礼仪、舒适距离和误报容忍度。
2. 人体加速度估计在纯视觉、遮挡、夜间和多人场景中可能不稳定。
3. 过度保守会造成频繁停车，影响高端产品感和陪伴体验。

推荐理由：

建议作为 A- 级输入。它应进入近人安全控制专题，帮助 Kinbot 把“近人安全”拆成可测的最坏制动距离、人体运动假设和控制层安全过滤字段；不建议将工业标准直接写成家庭产品已冻结合规边界。

### 3.3 Real-Time Execution with Autoregressive Policies

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.13355](https://arxiv.org/abs/2606.13355) |
| 本轮 listing 口径 | 2026-06-12 官方 listing new submission；abs/API 显示 `Published: 2026-06-11` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | autoregressive policy, asynchronous inference, tokenization horizon, constrained decoding, strict latency bound |

摘要要点转述：

论文讨论大规模 `VLA` 策略部署时的实时执行问题。已有实时策略多围绕 diffusion policy 展开，而自回归策略由于同步 rollout 慢，更容易受延迟影响。作者指出，自回归策略可以通过调整 tokenization horizon 和 constrained decoding，在异步推理下获得严格延迟边界，同时保持平滑动作轨迹和快速反应；在模拟与真实环境中，该策略相对同级 flow-matching policy 有更好的任务完成速度和竞争性表现。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`mobility_navigation` 与 `OODA` 周期中的“策略推理能否实时执行”问题。
2. Kinbot 即使不把 `VLA` 作为一代在线主链路，也需要为导航、交互、药箱递送和安全避障记录推理延迟、动作平滑性与反应时间。
3. 对应 Phase 5：建议增加 `tokenization_horizon`、`constrained_decoding_latency_bound`、`async_inference_frequency`、`multi_trajectory_decode_count`、`trajectory_smoothness_under_latency` 和 `emergency_interrupt_latency` 字段。

资源消耗与部署信号：

1. 论文直接围绕实时执行和异步推理，对 Kinbot `12GB RAM + 32GB Flash` 默认量产线有参考价值。
2. 它不意味着 Kinbot 应默认采用自回归 `VLA`，而是提醒所有高层策略都需要严格延迟边界和安全中断机制。
3. 如果使用 multi-trajectory decoding，需要明确内存、峰值算力、温升和电池影响。

优势：

1. 将模型类型讨论转成 latency / smoothness / reactivity 的工程指标。
2. 与 `DIRECT` 的测试时算力路由和 `DAM-VLA` 的异步多模态调度可合并成 runtime profiling 模板。
3. 可帮助防止“模型成功率高但执行慢”的假阳性。

劣势与风险：

1. 论文场景仍偏 `VLA` policy，不等同于 Kinbot 纯视觉导航全栈。
2. constrained decoding 的安全性取决于约束定义，不能替代底层避障和 emergency stop。
3. 多轨迹解码会带来额外端侧资源压力。

推荐理由：

建议作为 A- 级输入。它应进入端侧实时执行专题，帮助 Kinbot 建立 strict latency bound、异步推理频率和动作平滑性字段；不建议据此新增一代在线自回归 `VLA` 控制链路。

### 3.4 SemanticXR: Low Power and Real-time Queryable Semantic Mapping with an Object-Level Device-Cloud Architecture

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.12849](https://arxiv.org/abs/2606.12849) |
| 本轮 listing 口径 | 2026-06-12 官方 listing cross submission from `cs.DC`；abs/API 显示 `Published: 2026-06-11` |
| 分类 | `cs.DC`, `cs.CV`, `cs.RO` |
| 方法关键词 | object-level semantic mapping, device-cloud architecture, low power, real-time query, sparse local map |

摘要要点转述：

论文面向 XR 设备上的开放词汇语义地图与查询，目标是在低功耗、低带宽和有限内存下实现实时语义空间服务。作者指出，现有开放词汇语义地图通常假设 server-class resource，单纯云端卸载也缺少清晰的设备 / 云边界。`SemanticXR` 的核心做法是把可语义识别的对象提升为通信、执行和记忆的一等单元：云端用对象级并行、几何下采样和深度映射协同降低延迟与上行带宽；设备端维护对象级稀疏本地地图，通过增量更新和优先级更新支持网络不稳时的查询。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`observability_data_governance` 和端云协同下“机器人如何记住物体、位置和语义关系”的问题。
2. Kinbot 不能把原始视觉长期回流云端；更合理的边界是端侧处理敏感原始数据后，按受控对象级语义、置信度、更新时间和授权范围回流或查询。
3. 对应 Phase 5：建议增加 `object_level_sparse_map`、`semantic_object_update_priority`、`upstream_bandwidth_budget`、`bounded_local_memory`、`network_robust_query_success` 和 `cloud_query_privacy_gate` 字段。

资源消耗与部署信号：

1. 论文明确以低功耗、实时、带宽和内存为目标，适合 Kinbot 的端侧资源评估。
2. 该方法仍依赖开放词汇语义识别与端云协作，需验证目标 SoC 上的对象提取、局部缓存和断网退化。
3. 对 Kinbot 来说，最重要的是数据边界：原始视觉端侧处理，云端只接收受控结构化对象信息。

优势：

1. 将语义地图从“全量场景表示”收敛到对象级通信与记忆单元，有利于控制复杂度。
2. 与家庭找物、药品位置、危险物状态、储物仓交接记录等场景相容。
3. 可与 Kinbot 非隐私结构化数据受控回流的 `provisional` 战略假设保持区分。

劣势与风险：

1. 论文场景是 XR，不是移动机器人全栈；缺少底盘运动、遮挡变化和家庭长期维护验证。
2. 开放词汇识别错误可能污染长期记忆，需要人工纠错和置信门控。
3. 若云端查询过重，会与隐私、网络离线和服务成本目标冲突。

推荐理由：

建议作为 B+ 级输入。它应进入对象级语义地图与端云边界候选，帮助 Kinbot 定义 object-level sparse map、增量更新和隐私 gate 字段；不建议据此启动完整云端语义地图平台。

### 3.5 Learning Robot Safety from Sparse Human Feedback using Conformal Prediction

| 项目 | 内容 |
| --- | --- |
| arXiv | [2501.04823](https://arxiv.org/abs/2501.04823) |
| 本轮 listing 口径 | 2026-06-12 官方 listing replacement submission；abs/API 显示 `Published: 2025-01-08`，`Updated: 2026-06-11` |
| 分类 | `cs.RO`, `math.OC`, `stat.AP` |
| 方法关键词 | sparse human feedback, conformal prediction, unsafe region warning, guaranteed miss rate, policy improvement |

摘要要点转述：

论文研究如何从稀疏人工安全反馈中学习机器人预警区域。作者认为，用户定义的硬约束可能漏掉边界情况，安全数据训练出的策略也可能在新状态下失效，而且“是否安全”本身可能带有主观偏好。方法上，系统向人展示策略轨迹，让人用二元反馈标注是否不安全；随后利用 conformal prediction 在状态空间或 learned latent space 中识别 suspected unsafe region，并给出覆盖未来策略错误的统计保证。系统在进入疑似不安全区域时触发预警，也可通过避开该区域改进控制策略。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`observability_data_governance` 和 Phase 5 外场 / 回放证据链。
2. Kinbot 的老人家庭场景有大量“规则难以预写”的安全偏好，例如靠近老人轮椅、药箱交接、夜间静默靠近、宠物干扰和家属授权边界；这些可以先用人工标注形成离线 unsafe-region 证据。
3. 对应 Phase 5：建议增加 `human_safety_feedback_label`、`unsafe_region_warning`、`conformal_miss_rate_target`、`false_alarm_rate`、`safety_preference_version` 和 `policy_improvement_by_avoidance` 字段。

资源消耗与部署信号：

1. 该方法不要求大规模在线模型，但需要轨迹采样、人工标注、状态表示、统计校准和回放验证。
2. 适合先做离线验证 / shadow warning，不应直接让用户家庭中的反馈在线改变安全策略。
3. 需要记录标注人、场景版本、轨迹来源和偏好版本，否则安全证据不可追溯。

优势：

1. 把主观安全偏好转成可量化的预警区域和漏报率目标，适合 Phase 5 证据链。
2. 能补足硬编码规则覆盖不到的家庭 corner case。
3. 与 Kinbot “安全 > 合规 > 用户指令”的决策优先级一致，可作为安全策略审计输入。

劣势与风险：

1. replacement 论文，不应因更新而扩张主线范围。
2. 人工反馈稀疏且有偏，不能替代法规、工程安全和物理冗余。
3. conformal guarantee 依赖数据分布和校准假设，跨家庭泛化仍需审慎验证。

推荐理由：

建议作为 B+ 级输入。它应进入安全证据链候选，帮助 Kinbot 定义 human-labeled unsafe region、漏报率目标和离线预警验证字段；不建议上线为用户偏好驱动的实时安全学习模块。

## 4. 候选排除表

| 论文 | arXiv | listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| NavWAM: A Navigation World Action Model for Goal-Conditioned Visual Navigation | [2606.13494](https://arxiv.org/abs/2606.13494) | 2026-06-12 new submission | 目标条件视觉导航很相关，但 world action model / navigation foundation model 近期已饱和；本轮只将其作为闭环导航专题候选，不新增在线 `WAM` 主链路。 |
| SPARC: Reliable Spatial Annotations from Robot Demonstrations at Scale | [2606.13497](https://arxiv.org/abs/2606.13497) | 2026-06-12 new submission | 可靠空间标注和 calibration 对数据治理有价值，但场景集中在 robot demonstrations / manipulation；可在后续数据标注专题读取，不进入本轮主卡片。 |
| From Imitation to Alignment: Human-Preference Flow Policies for Long-Horizon Sidewalk Navigation | [2606.12603](https://arxiv.org/abs/2606.12603) | 2026-06-12 new submission | 单目长程社交导航与 human preference alignment 有启发，但场景是 outdoor sidewalk、配送机器人 / 轮椅类；Kinbot 室内老人近身导航已有 `SALSA` 与 `KinematicRL` 覆盖，本轮作为专题候选。 |
| Learning to Assist: Collaborative VLAs for Implicit Human-Robot Collaboration | [2606.12475](https://arxiv.org/abs/2606.12475) | 2026-06-12 new submission | 识别 action chunk 泄漏导致过早协助的 failure mode 很有价值，但对象是 collaborative manipulation `VLA`；Kinbot 一代不以机械臂协作为主，暂不进主卡片。 |
| Trajectory-Level Redirection Attacks on Vision-Language-Action Models | [2606.12978](https://arxiv.org/abs/2606.12978) | 2026-06-12 new submission | prompt-only 轨迹重定向攻击对红队有价值，但仍是 manipulation `VLA`；本轮已有 sparse human feedback + conformal warning 覆盖更贴近 Kinbot 的安全证据链。 |
| RoboProcessBench: Benchmarking Process-Aware Understanding in Vision-Language Robotic Manipulation | [2606.13040](https://arxiv.org/abs/2606.13040) | 2026-06-12 new submission | process-aware VLM benchmark 可补充过程级监控，但任务是 manipulation；后续如写药箱 / 递送过程诊断再读取。 |
| Humor Style Drives Laughter, Topic Shapes Acceptability: Evaluating Bilingual Personal and Political Robot-Delivered AI Jokes | [2606.13256](https://arxiv.org/abs/2606.13256) | 2026-06-12 new submission | 与 Kinbot “俏皮但谨慎”的交互风格相关，但研究是课堂讲笑话，且政治 / 人身笑话风险较高；不写成一代默认交互策略。 |
| Multi-Modal Multi-Agent Robotic Cognitive Alignment enabled by Non-Invasive Consumer Brain Computer Interfaces | [2606.13190](https://arxiv.org/abs/2606.13190) | 2026-06-12 new submission | 打断时机和 cognitive workload 相关，但依赖消费级 BCI，不符合 Kinbot 一代家庭交互默认输入；可作为远期 HRI 候选。 |
| Y-BotFrame: An Extensible Embodied Agent Framework for Quadruped Robot Assistants | [2606.13049](https://arxiv.org/abs/2606.13049) | 2026-06-12 new submission | 多模态具身 agent framework 与系统集成有关，但载体是四足、含 LiDAR 与 LLM cognitive core；不改变 Kinbot 轮式纯视觉一代主线。 |
| Comparing Commercial Depth Sensor Accuracy for Medical Applications | [2606.13028](https://arxiv.org/abs/2606.13028) | 2026-06-12 new submission | 医疗应用深度传感器评测有参考价值，但 Kinbot 一代深度相机 / LiDAR 只作为研发对比和真值参考，不作为产品 fallback。 |
| MaskWAM: Unifying Mask Prompting and Prediction for World-Action Models | [2606.13515](https://arxiv.org/abs/2606.13515) | 2026-06-12 cross submission from `cs.CV` | object-centric mask supervision 可降低语言歧义，但仍是 WAM / manipulation 泛化线；近期同类主题已饱和，不因 cross-list 扩张主卡片。 |
| Goal2Pixel: Grounding Goals to Pixels for Vision-Language Navigation | [2606.01621](https://arxiv.org/abs/2606.01621) | 2026-06-12 replacement | 该论文已在 2026-06-03 主卡片收录；本轮 replacement 不重复收录。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮论文默认仍作为 `docs/09_research/00_papers/` 下的研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。
2. 若后续处理 Phase 5 验证模板、家庭样机试点或导航回放报告，可优先吸收本轮最小字段：`navigation_clue_set`、`plan_critique_before_execution`、`cue_relevance_score`、`human_acceleration_assumption`、`worst_case_stopping_distance`、`near_person_control_barrier`、`tokenization_horizon`、`strict_latency_bound`、`object_level_sparse_map`、`unsafe_region_warning`、`guaranteed_miss_rate`。
3. 不建议新增在线 world model 主链路、完整端云语义地图平台、在线安全偏好学习、工业安全标准直译层或默认幽默人设模块；当前更合理的是先把字段写入验证报告、回放分析和样机观测约束。
4. 如果后续要专题跟踪，优先方向是“开放导航线索推理 + 近人安全控制 + 实时策略延迟边界 + 对象级端云语义地图 + human-feedback 安全证据链”的最小闭环。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent` 官方 listing：<https://arxiv.org/list/cs.RO/recent>
3. `Foresight: Iterative Reasoning About Clues that Matter for Navigation`：<https://arxiv.org/abs/2606.12550>
4. `Embedding ISO 10218 Safety Compliance in Robots via Control Barrier Functions for Human-Robot Collaboration`：<https://arxiv.org/abs/2606.13203>
5. `Real-Time Execution with Autoregressive Policies`：<https://arxiv.org/abs/2606.13355>
6. `SemanticXR: Low Power and Real-time Queryable Semantic Mapping with an Object-Level Device-Cloud Architecture`：<https://arxiv.org/abs/2606.12849>
7. `Learning Robot Safety from Sparse Human Feedback using Conformal Prediction`：<https://arxiv.org/abs/2501.04823>
8. 候选排除表条目：[`NavWAM`](https://arxiv.org/abs/2606.13494)、[`SPARC`](https://arxiv.org/abs/2606.13497)、[`From Imitation to Alignment`](https://arxiv.org/abs/2606.12603)、[`Learning to Assist`](https://arxiv.org/abs/2606.12475)、[`Trajectory-Level Redirection Attacks`](https://arxiv.org/abs/2606.12978)、[`RoboProcessBench`](https://arxiv.org/abs/2606.13040)、[`Humor Style Drives Laughter`](https://arxiv.org/abs/2606.13256)、[`Multi-Modal Multi-Agent Robotic Cognitive Alignment`](https://arxiv.org/abs/2606.13190)、[`Y-BotFrame`](https://arxiv.org/abs/2606.13049)、[`Comparing Commercial Depth Sensor Accuracy`](https://arxiv.org/abs/2606.13028)、[`MaskWAM`](https://arxiv.org/abs/2606.13515)、[`Goal2Pixel`](https://arxiv.org/abs/2606.01621)
