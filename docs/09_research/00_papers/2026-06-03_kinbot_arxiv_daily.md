# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-03
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-03 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮本地日更时官方最新 Robotics listing 为 `Tuesday, 2 June 2026`，合计 `197` 篇 entries；其中 new submissions `104` 篇、cross submissions `17` 篇、replacement submissions `76` 篇。本轮按 `3-5` 篇强相关论文 + 候选排除表口径，收录纯视觉主动重建、开放词汇导航不确定性、动态室内语义记忆、低调用 VLN 接口和 `VLA` 成功 / 安全缺口评测相关 5 篇论文，并记录周度滚动判断。

---

## 1. 检索口径

本轮检索日期：2026-06-03。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮本地日更时官方 `cs.RO/new` 最新 Robotics listing 为 `Tuesday, 2 June 2026`，合计 `197` 篇 entries；其中 new submissions `104` 篇、cross submissions `17` 篇、replacement submissions `76` 篇。
3. 官方 `cs.RO/recent` 在本轮检索时已显示 `Wed, 3 Jun 2026` recent submissions，`showing first 50 of 80 entries`，但 `cs.RO/new` 主页面仍以 `Tuesday, 2 June 2026` 作为官方最新 new listing。本轮主卡片以 `cs.RO/new` 的完整结构为准；`Wed, 3 Jun 2026` recent 中的 `Worth Remembering`、`RobotValues`、`eMEM`、`GN0`、`Denoising Tells When to Replan` 等只作为近期待补录候选，下一轮优先核对是否进入官方 new listing。
4. 本轮是相对 2026-06-02 日更的新官方 listing，不复用前一日 `Monday, 1 June 2026` listing；先排除前序已覆盖的室内语义全局定位、`VLA` 运行时失败检测、碰撞 grounding、端侧 reasoning 节流和 batch-1 decode profiling 直接重复主题。
5. `replacement` / `cross-list` 只在确实新增 Kinbot 评测项、治理项或端侧资源判断时收录。本轮主卡片中的 `Goal2Pixel` 来自 cross submission，原因是它给出 VLN 接口从动作预测转向像素目标 grounding 后的 VLM 调用次数下降信号；replacement 条目均进入候选排除表或暂不收录。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全、端侧资源或 Phase 5 验证组织的判断，而不是继续增加泛 `VLA`、manipulation、humanoid、自动驾驶、户外 SLAM 或纯工具链论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：单目主动重建帧率、开放词汇导航误检、动态记忆膨胀、VLN 调用次数 / 历史压缩、安全成功缺口。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 `197` 篇 entries 自动扩张主卡片数量；泛统一 `VLA`、灵巧手、humanoid、UAV、自动驾驶、工业装配、医疗和水下机器人论文多数不改变 Kinbot 一代家庭移动闭环。
2. `Permissive Safety Through Trusted Inference`、`PaCo-VLA`、`Can Predicted Dynamics Exist in the Physical World?` 都有运行时安全价值，但本轮主卡片已用 `SafeVLA-Bench` 承接成功 / 安全缺口评测，其他安全过滤论文先进入候选，避免把安全治理拆成多条未验证在线组件。
3. `Per-Group Error, Not Total MSE` 对异构自由度机器人评测有价值，但仍偏移动操作 `VLA` checkpoint selection；本轮先保留为候选，不把机器人手臂 / 夹爪指标直接升级为 Kinbot 一代主线需求。
4. `ActMVS` 虽然是 UAV / robot 通用主动重建，但其纯单目在线 occupancy map 方向直接影响 Kinbot 纯视觉导航验证，故进入主卡片；涉及深度相机、LiDAR、事件相机或自动驾驶多模态融合的相邻论文不进入主卡片。

## 2. 本轮总判断

本轮官方 Robotics listing 从 2026-06-01 更新到 `Tuesday, 2 June 2026`。相比前一日，本轮真正有增量的不是更多大模型策略，而是五个更贴近 Phase 5 的验证问题：

1. **纯视觉导航需要补单目主动重建的实测门槛**：`ActMVS` 把 active reconstruction 从离线 MVS 推向在线单目 occupancy map，提示 Kinbot 不应只讨论“纯视觉能不能”，而要量化单目 / 双目输入在家庭走廊、家具遮挡和弱纹理场景中的帧率、深度一致性、轨迹规划失效率。
2. **开放词汇导航不能把语义检测当确定事实**：`PSG-Nav` 将物体类别分布、多个可能世界和历史成功 / 失败记忆结合，提醒 Kinbot 对“杯子在厨房”“去药箱旁边”这类语言目标，应记录语义候选、误检来源和过往验证，而不是只保留单一 top-1 识别。
3. **动态室内记忆要有上限和重定位修正机制**：`DREAM` 用 redundancy-aware pruning 把长期观察维持在有限内存，并在 pose correction 后更新历史观测。它不改变 Kinbot 纯视觉传感主线，但补强了“长期记忆不能无限膨胀，定位修正后要追溯更新”的验证字段。
4. **VLN 接口应从高频动作预测转向低频、可落地的空间目标**：`Goal2Pixel` 用像素目标 grounding 和可见性 keyframe memory 降低 VLM 调用次数，提示 Kinbot 的端侧导航 reasoning 更适合输出 waypoint / pixel / region 级目标，再交给几何安全链路执行。
5. **成功率不能替代安全率**：`SafeVLA-Bench` 明确同一 rollout 可以“任务成功但轨迹不安全”，这应进入 Kinbot Phase 5 的评测口径：成功提醒、成功到达、成功抓取或成功靠近，都必须同时记录是否扰动旁物、越过安全距离、造成自接触或超出速度 / 接触约束。

周度滚动判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 泛统一 `VLA`、world model、diffusion action、humanoid manipulation | 已饱和 | 只有新增家庭移动闭环、老人照护、安全审计字段或端侧实测资源边界时才进入主卡片。 |
| 纯视觉导航、单目 / 双目深度、主动重建、低成本 occupancy map | 值得专题跟踪 | 将 `ActMVS` 与前序纯 RGB SLAM、单目深度不确定性、动态目标检测合并成 Phase 5 视觉导航回放字段。 |
| 开放词汇导航、语义图、目标导航误检与记忆校准 | 值得专题跟踪 | 将 `PSG-Nav`、`Goal2Pixel`、前序 `VLM-GLoc`、`SAFEVPR` 合并，形成语义目标误检、历史验证和低调用 VLN 专题。 |
| 动态空间记忆、长期场景图、物品重定位 | 接近专题成熟 | 将 `DREAM`、前序 `DynaMem`、动态 3D 场景图和家庭物品归属记忆收敛为记忆容量 / 更新 / 过期 / 人工确认字段，不新增多套在线 memory store。 |
| `VLA` / `VLM` 运行时安全、失败检测、成功 / 安全缺口 | 接近专题成熟 | 将 `SafeVLA-Bench`、`Hide-and-Seek`、`VLAConf`、碰撞 grounding 和弃权 / fallback 统一成 `success + safety + fallback + audit` 评测包。 |
| 户外、自动驾驶、UAV、LiDAR / event camera / 3DGS 生成 | 不进入一代主线 | 仅作为对照或远期技术储备，不改变一代家庭室内纯视觉和 BOM 边界。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 ActMVS、PSG-Nav、DREAM、Goal2Pixel、SafeVLA-Bench 以及候选安全过滤器全部写成在线架构，会过复杂”。建议只吸收 5 类轻量对象：视觉重建回放指标、语义不确定性字段、动态记忆容量 / 修正字段、VLN 调用次数 / keyframe 字段、成功 / 安全缺口指标。暂不新增单目主动重建产品主链路、概率场景图在线中枢、LiDAR-RGBD 记忆 backend、通用 `VLA` 主控或独立安全过滤平台。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | ActMVS: Active Scene Reconstruction with Monocular Multi-View Stereo | 进入纯视觉导航验证专题，转成单目 / 双目在线 occupancy map、深度一致性和轨迹规划失败字段。 |
| A- | PSG-Nav: Probabilistic Scene Graph Navigation via Multiverse Decision Making | 进入开放词汇导航专题，补充语义分布、多假设 landmarks 和历史成功 / 失败记忆校准字段。 |
| B+ | Dynamic Resilient Spatio-Semantic Memory with Hybrid Localization for Mobile Manipulation | 进入动态室内记忆专题，吸收记忆上限、pose correction 后历史观测更新和目标重获字段；不吸收 LiDAR-RGBD 传感主线。 |
| B+ | Goal2Pixel: Grounding Goals to Pixels for Vision-Language Navigation | 进入端侧 VLN 接口专题，验证像素 / waypoint 级目标输出能否降低 VLM 调用次数和延迟。 |
| B+ | SafeVLA-Bench: A Benchmark for the Success-Safety Gap in Vision-Language-Action Models | 进入安全评测专题，补充成功但不安全、违反严重度和任务安全约束字段。 |

## 3. 论文卡片

### 3.1 ActMVS: Active Scene Reconstruction with Monocular Multi-View Stereo

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.01367](https://arxiv.org/abs/2606.01367) |
| 本轮 listing 口径 | 2026-06-02 官方 listing new submission；本轮属于 2026-06-03 日更收录；abs 页显示 `Submitted on 31 May 2026` |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | monocular active reconstruction, online MVS, occupancy map, collision-free navigation, global depth optimization |

摘要要点转述：

论文面向机器人和 UAV 在主动重建过程中同时规划轨迹和更新环境模型的问题。作者指出，传统 active reconstruction 常依赖深度传感器更新 occupancy map，增加成本和重量；而现有单目重建多偏离线，难以在导航所需帧率下输出一致深度。`ActMVS` 将 view factor graph、MVS 深度预测和全局深度优化组合起来，让单目机器人在探索过程中在线生成较高质量、全局一致的 dense depth，用于维护可碰撞规避的 occupancy map。论文在 Replica 数据集上报告其效果可接近 RGB-D 方案。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 和 `platform_runtime` 中“纯视觉路线如何支撑安全路径规划”的问题。
2. Kinbot 一代冻结为纯视觉主线，真正风险不是是否使用深度相机，而是纯视觉深度 / 占据图在低纹理、遮挡、反光、窄走廊和家具边缘处能否稳定支撑速度控制。
3. 对应 Phase 5：建议增加 `monocular_reconstruction_profile_id`、`occupancy_map_update_fps`、`depth_consistency_under_motion`、`collision_free_planning_uses_visual_depth`、`visual_depth_recovery_after_occlusion` 和 `rgbd_baseline_gap` 字段。

资源消耗与部署信号：

1. 在线 MVS 和全局深度优化可能重于 Kinbot 默认端侧预算，必须在目标 SoC 上测 latency、memory、thermal，而不是只看 Replica 数据集指标。
2. 对 Kinbot 更现实的落点是作为双目 / 单目视觉导航回放验证基线，先评估何种场景触发 occupancy map 失真，不直接升级为产品主链路。
3. 该方向有助于减少主动深度传感器依赖，但不等于单目视觉已满足量产安全门槛。

优势：

1. 直接服务纯视觉导航和低成本 BOM 边界。
2. 将视觉重建和 collision-free planning 绑定，适合转成 Phase 5 回放指标。
3. 可作为 RGB-D 真值对照链路下的纯视觉候选算法基线。

劣势与风险：

1. 实验主要在 Replica 等仿真 / 数据集环境，家庭实机低光、镜面、宠物和动态人体仍需验证。
2. 单目尺度、重定位和运动模糊风险没有被产品化解决。
3. 如果把完整在线 MVS 写入一代主链路，可能明显增加端侧算力与调参复杂度。

推荐理由：

建议作为 A- 级输入。它应进入纯视觉导航验证专题，帮助 Kinbot 把单目 / 双目 occupancy map 的帧率、稳定性和 RGB-D gap 写成验证字段；不建议直接把 ActMVS 固化为一代产品算法。

### 3.2 PSG-Nav: Probabilistic Scene Graph Navigation via Multiverse Decision Making

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.01313](https://arxiv.org/abs/2606.01313) |
| 本轮 listing 口径 | 2026-06-02 官方 listing new submission；本轮属于 2026-06-03 日更收录；abs 页显示 `Submitted on 31 May 2026` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | open-vocabulary navigation, probabilistic scene graph, semantic uncertainty, multiverse decision, evidential experience calibrator |

摘要要点转述：

论文关注开放词汇 ObjectNav 中的语义不确定性。作者认为，现有方法常把检测结果收敛为确定标签，再在局部最优路径上决策，无法处理“物体类别、候选 landmark、历史误检”共同导致的多种可能世界。`PSG-Nav` 构建 3D probabilistic scene graph，保留完整类别分布；再通过 multiverse decision 从联合分布中采样多个最可能世界，比较不同 landmark 在这些可能世界中的兼容性。为减少开放词汇误检，论文还引入 Evidential Experience Calibrator，用过去成功 / 失败记忆校准检测可信度。实验在 MP3D、HM3D、HSSD 上报告成功率分别达到 `66.1%`、`44.8%`、`67.9%`。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 和 `interaction_orchestration` 中“语言目标和开放词汇物体如何转成可导航目标”的问题。
2. Kinbot 家庭任务常是“去药箱旁边”“看一下阳台窗户”“找爷爷常用杯子”，语义目标具有歧义、重复和动态变化，不能只记录 top-1 识别结果。
3. 对应 Phase 5：建议增加 `semantic_object_distribution_logged`、`navigation_landmark_hypotheses`、`world_hypothesis_count`、`objectnav_false_positive_source`、`experience_calibrator_hit` 和 `semantic_goal_requires_user_confirm` 字段。

资源消耗与部署信号：

1. 概率场景图、多世界采样和历史校准比普通 top-1 目标导航更重，适合先在离线回放与低频任务规划中验证。
2. Kinbot 不应新增一套独立概率 scene graph 中枢；更合理的是在现有 `world_state_memory` 中保留语义置信、历史证据和人工确认字段。
3. 若进入端侧，应测图规模、查询延迟、历史记录上限和错误传播。

优势：

1. 直接补上开放词汇导航中“语义不确定性不是异常，而是常态”的设计口径。
2. 把历史成功 / 失败用于校准，和 Kinbot 家庭长期记忆天然相关。
3. 支持把 VLN / ObjectNav 评测从单次成功率扩展到误检、假设和确认路径。

劣势与风险：

1. 数据集仍是标准室内 benchmark，不等于真实家庭长期部署。
2. 3D probabilistic scene graph 可能扩张复杂度，尤其和现有世界状态模型叠加时。
3. 多假设规划需要清楚定义何时询问用户，避免机器人犹豫或反复确认损伤体验。

推荐理由：

建议作为 A- 级输入。它应进入开放词汇导航专题，帮助 Kinbot 把语义分布、历史证据和人工确认写成验证字段；不建议新增独立概率场景图平台。

### 3.3 Dynamic Resilient Spatio-Semantic Memory with Hybrid Localization for Mobile Manipulation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.00576](https://arxiv.org/abs/2606.00576) |
| 本轮 listing 口径 | 2026-06-02 官方 listing new submission；本轮属于 2026-06-03 日更收录；abs 页显示 `Submitted on 30 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | dynamic spatio-semantic memory, hybrid localization, memory pruning, pose correction, object reacquisition |

摘要要点转述：

论文提出 `DREAM`，面向动态室内环境中的移动操作任务。作者指出，长期任务需要一个既几何一致、又可语义查询、且资源受限的场景表示；预建地图、静态场景假设和高精度相机位姿依赖都会在物体移动或位姿修正后失效。`DREAM` 使用 RGB-D 观察和 LiDAR-inertial-visual SLAM backend 构建在线 spatio-semantic voxel memory，并用 pose-graph-aware Redundancy-Aware Memory Pruning 在位姿修正后更新历史观测，同时限制长期观察膨胀。目标定位和重获结合语言条件 3D 检索、开放词汇图像检测和多模态 LLM 语义验证。四个动态室内实验室场景中，论文报告任务成功率相对 DynaMem 从 `40%-60%` 提升到 `55%-70%`，内存约 `0.37-0.63 GB`，在线更新约 `0.43-0.53 s`。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`mobility_navigation` 和 `observability_data_governance` 中“长期家庭记忆如何限制容量、处理物体移动和定位修正”的问题。
2. Kinbot 会长期面对家具轻微移动、药盒 / 水杯 / 遥控器位置变化、用户手动整理物品和机器人重定位修正；记忆不能只追加，也必须能剪枝和纠错。
3. 对应 Phase 5：建议增加 `spatial_memory_size_mb`、`memory_update_latency_ms`、`pose_correction_rewrites_memory`、`object_reacquisition_after_move`、`memory_pruned_due_to_redundancy` 和 `semantic_verification_requires_mllm` 字段。

资源消耗与部署信号：

1. 论文的 RGB-D 与 LiDAR-inertial-visual SLAM 不符合 Kinbot 一代纯视觉产品主线，只能作为研发对照和 memory governance 输入。
2. `0.37-0.63 GB` 的记忆占用对 `12GB RAM` 资源线是可讨论量级，但还需要叠加模型、KV cache、导航栈和系统服务后评估。
3. `0.43-0.53 s` 的在线更新提示该类记忆不适合高频阻塞控制环，应放在低频 world-state update 或回放评估中。

优势：

1. 明确给出长期空间记忆的容量和更新延迟量级。
2. 把 pose correction 后历史观测重写这个问题显性化，适合 Kinbot 验证数据链。
3. 对家庭物品重获、巡护目标重定位和长期任务恢复有参考价值。

劣势与风险：

1. 传感器 backend 与 Kinbot 一代产品主线不一致。
2. 场景是实验室动态环境，不是老人家庭长期杂乱场景。
3. 多模态 LLM 语义验证可能带来隐私、延迟和审计成本。

推荐理由：

建议作为 B+ 级输入。它应进入动态室内记忆专题，吸收记忆上限、历史观测修正和目标重获字段；不建议吸收其 LiDAR-RGBD backend 或完整 mobile manipulation 系统。

### 3.4 Goal2Pixel: Grounding Goals to Pixels for Vision-Language Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.01621](https://arxiv.org/abs/2606.01621) |
| 本轮 listing 口径 | 2026-06-02 官方 listing cross submission from `cs.CV`；本轮属于 2026-06-03 日更收录；abs 页显示 `Submitted on 1 Jun 2026` |
| 分类 | `cs.CV`, `cs.RO` |
| 方法关键词 | VLN-CE, navigable pixel grounding, waypoint interface, visibility-aware keyframe memory, VLM call reduction |

摘要要点转述：

论文认为，许多 VLM-based VLN 方法把导航直接做成低层动作预测，接口短视、模糊且需要反复调用 VLM。`Goal2Pixel` 将 VLN-CE 改写为可导航像素 grounding：模型在当前图像中预测一个可前进像素，再反投影成 3D waypoint；转向和停止则通过图像边缘的辅助 directive region 表达。为支持长程导航，论文引入 visibility-aware keyframe memory 作为紧凑历史表示，并通过语义 embedding 和坐标辅助 loss 适配预训练 VLM。论文报告在 R2R-CE Val-Unseen 上达到 `54.1% SR` 和 `52.5% SPL`，每个 episode 仅需 `7.75` 次 VLM 调用，显著少于直接动作预测方案的 `46.62` 次。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`platform_runtime` 和 `interaction_orchestration` 中“导航 reasoning 输出什么粒度最适合端侧执行”的问题。
2. Kinbot 不应让 VLM 高频直接输出底盘动作；更适合输出像素、waypoint、region 或语义目标，再由几何 / 安全链路执行。
3. 对应 Phase 5：建议增加 `vlm_calls_per_navigation_episode`、`pixel_goal_projected_to_waypoint`、`visibility_keyframe_count`、`navigation_action_generated_by_vlm`、`low_level_controller_owns_motion` 和 `goal_grounding_requires_requery` 字段。

资源消耗与部署信号：

1. VLM 调用次数从几十次降到个位数级别，对 Kinbot 端侧延迟、功耗和热设计有明确参考价值。
2. pixel grounding 仍需可靠深度 / 位姿 / waypoint 执行链；Kinbot 必须把视觉目标和几何安全链路绑定。
3. keyframe memory 的长度、淘汰策略和隐私处理需要纳入端侧数据治理。

优势：

1. 明确把 VLM 从底层动作器降级为低频目标 grounding 器，符合 Kinbot “重 reasoning 有边界”的架构方向。
2. 给出 VLM 调用次数这样的端侧资源字段，而不只是成功率。
3. 与前序 `REIS`、端侧 reasoning 节流和 VLN 数据设计可以合并。

劣势与风险：

1. VLN-CE benchmark 与真实家庭动态人 / 宠物 / 光照变化仍有距离。
2. 像素目标可能在不可通行、反光或遮挡情况下误导底层控制。
3. 若缺少安全链路，低调用并不等于安全导航。

推荐理由：

建议作为 B+ 级输入。它应进入端侧 VLN 接口专题，重点验证 pixel / waypoint 级目标能否降低调用次数并保持安全；不建议把 VLM 直接写成低层动作控制器。

### 3.5 SafeVLA-Bench: A Benchmark for the Success-Safety Gap in Vision-Language-Action Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.00773](https://arxiv.org/abs/2606.00773) |
| 本轮 listing 口径 | 2026-06-02 官方 listing new submission；本轮属于 2026-06-03 日更收录；abs 页显示 `Submitted on 30 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | VLA safety benchmark, success-safety gap, Signal Temporal Logic, Succ-But-Unsafe, Violation Severity Index |

摘要要点转述：

论文指出，现有 `VLA` benchmark 常用二值任务成功率衡量策略，但“完成任务”可能掩盖轨迹中的安全问题，例如过度接触、扰动旁边物体、让被抓物体不稳定或进入机器人自接触。`SafeVLA-Bench` 是一个 post-hoc safety evaluation framework，把任务相关安全要求形式化为 Signal Temporal Logic，并在原有成功率之外报告两个指标：`Succ-But-Unsafe` 表示成功但违反安全的 rollout 占比，`Violation Severity Index` 表示有界最坏违反深度。论文在 LIBERO 和 RoboCasa-365 上评估九个策略 / benchmark 条目，发现高成功率不代表安全执行，桌面高成功率基线仍有约 `13%-15%` 不安全 episode，RoboCasa-365 的成功 rollout 中约 `36%-56%` 违反至少一个安全条款。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`observability_data_governance` 和 Phase 5 验证中的“成功任务是否安全完成”的问题。
2. Kinbot 的提醒、巡护、靠近老人、递送或物品互动不能只记录任务是否完成，还必须记录是否扰动环境、突破安全距离、触发碰撞风险或造成用户不适。
3. 对应 Phase 5：建议增加 `task_success_with_safety_checked`、`succ_but_unsafe_rate`、`violation_severity_index`、`stl_safety_clause_id`、`nearby_object_disturbed`、`self_contact_or_body_margin_violation` 和 `human_distance_violation` 字段。

资源消耗与部署信号：

1. 该论文主要是评测框架，在线资源消耗低于新模型，但需要仿真 / 回放中具备足够的接触、距离、对象状态和约束标签。
2. Kinbot 可先将其转为 Phase 5 回放与实机日志审计字段，不需要新增在线 `VLA` 安全模型。
3. STL 条款要和家庭机器人真实速度、距离、接触、用户体验边界绑定，不能照搬桌面 / 厨房 manipulation 条款。

优势：

1. 明确把成功率和安全率拆开，适合作为量产预备门控语言。
2. 指标简单，可与现有任务成功、fallback、人工接管日志叠加。
3. 与前序碰撞 grounding、运行时失败检测和弃权机制可形成统一安全评测包。

劣势与风险：

1. 任务偏 manipulation benchmark，Kinbot 家庭移动 / 陪伴 /健康场景需重新定义安全 clause。
2. Post-hoc 指标不能替代在线安全链路。
3. 若 clause 过多，会导致验证成本和误报解释复杂度上升。

推荐理由：

建议作为 B+ 级输入。它应进入安全评测专题，帮助 Kinbot 明确“成功但不安全”必须作为独立失败类型；不建议因此引入通用 `VLA` 主控或重型在线 safety judge。

## 4. 候选排除表

| 候选论文 | 类型 | 未收录原因 |
| --- | --- | --- |
| Permissive Safety Through Trusted Inference: Verifiable Belief-Space Neural Safety Filters for Assured Interactive Robotics | new submission | 可信推理 + belief-space safety filter 对人机互动安全有价值，但实验偏模拟人车交互和形式化安全过滤；本轮先由 `SafeVLA-Bench` 承接评测口径，不新增在线安全过滤平台。 |
| PaCo-VLA: Passivity-Shielded Compliance Prior for Contact-Rich Vision-Language-Action Manipulation | new submission | passivity shield 对接触安全和低层控制合同很强，但任务是 connector insertion 和 contact-rich manipulation；Kinbot 一代不以机械臂接触操作为主线，先作为未来接触控制候选。 |
| Can Predicted Dynamics Exist in the Physical World? | new submission | physical admissibility gate 对 action chunk / world model 预执行验证有价值，但与前序物理可实现性、运行时失败检测和本轮安全评测重叠；先保留为治理候选。 |
| Per-Group Error, Not Total MSE: Fine-Tuning Vision-Language-Action Models for 11-DoF Mobile Manipulation | new submission | 异构自由度误差分组对移动操作机器人评测有启发，但仍偏 Toyota HSR 与 `VLA` fine-tuning；Kinbot 可吸收“总 MSE 不够”的思想，暂不进入主卡片。 |
| OneVLA: A Unified Framework for Embodied Tasks | new submission | 泛统一导航 / 操作 `VLA` 已饱和；未新增 Kinbot 一代家庭导航、记忆、安全或端侧资源的明确验证字段。 |
| DeepIPCv3: Event-Aware Multi-Modal Sensor Fusion for Sudden Pedestrian Crossing Avoidance | new submission | 突发穿行安全有相邻价值，但依赖 LiDAR + DVS，且偏自动驾驶；不改变 Kinbot 一代纯视觉家庭室内主线。 |
| DAG-Plan: Generating Directed Acyclic Dependency Graphs for Dual-Arm Cooperative Planning | replacement | DAG 规划能减少 repeated LLM calls，但是 replacement 且偏双臂厨房操作；不因 replacement 写成新主线变化。 |
| RoboTrustBench: Benchmarking the Trustworthiness of Video World Models for Robotic Manipulation | cross submission | world model trustworthiness 有价值，但与前序 world model / VLA 安全评测重复，且偏视频生成与 manipulation；先作为安全评测候选。 |
| `HSAN`、`HSGM` 等其他同类 VLN 图方法 | cross / replacement | 本轮已用 `PSG-Nav` 和 `Goal2Pixel` 覆盖语义不确定性与低调用 VLN 接口；不继续堆叠多篇图导航方法。 |
| Qwen-VLA、Wall-OSS-0.5、Discrete Diffusion VLA 等泛 foundation model replacement | replacement | 泛大模型能力指标已经饱和，且多为 replacement；除非新增端侧资源实测、安全审计字段或家庭任务失败分析，否则不进入主卡片。 |
| Wed, 3 Jun 2026 recent 中的 `Worth Remembering`、`RobotValues`、`eMEM`、`GN0`、`Denoising Tells When to Replan` | recent 待核对 | `cs.RO/recent` 已显示当日候选，但本轮官方 `cs.RO/new` 仍以 2026-06-02 listing 为主。下一轮若进入官方 new listing，再按近期待补录或新 listing 精筛。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮不回写 `docs/00_governance/03_decision_log.md`：论文只新增研究输入、验证字段和专题候选，不改变当前冻结事实。
2. 不改变一代纯视觉主线：`ActMVS` 只增强纯视觉验证基线；`DREAM` 的 LiDAR-RGBD backend 不作为产品 fallback。
3. 不改变端侧资源线：`Goal2Pixel` 与 `DREAM` 提供调用次数、内存和更新延迟参考，但仍需目标 SoC 实测。
4. 建议后续在 Phase 5 验证模板中合并字段：`occupancy_map_update_fps`、`semantic_object_distribution_logged`、`spatial_memory_size_mb`、`vlm_calls_per_navigation_episode`、`succ_but_unsafe_rate`。
5. 周度综合判断继续收敛：导航 / 记忆 / 安全三个方向已接近专题成熟，应从“收更多论文”切到“合并成验证字段包和最小回放实验”。

## 6. 来源

1. arXiv 官方 `cs.RO/new`：https://arxiv.org/list/cs.RO/new
2. arXiv 官方 `cs.RO/recent`：https://arxiv.org/list/cs.RO/recent
3. `ActMVS: Active Scene Reconstruction with Monocular Multi-View Stereo`：https://arxiv.org/abs/2606.01367
4. `PSG-Nav: Probabilistic Scene Graph Navigation via Multiverse Decision Making`：https://arxiv.org/abs/2606.01313
5. `Dynamic Resilient Spatio-Semantic Memory with Hybrid Localization for Mobile Manipulation`：https://arxiv.org/abs/2606.00576
6. `Goal2Pixel: Grounding Goals to Pixels for Vision-Language Navigation`：https://arxiv.org/abs/2606.01621
7. `SafeVLA-Bench: A Benchmark for the Success-Safety Gap in Vision-Language-Action Models`：https://arxiv.org/abs/2606.00773
