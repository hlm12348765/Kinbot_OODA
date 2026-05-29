# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-26
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-26 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 为 `Monday, 25 May 2026`，合计 `54` 篇 entries；其中 new submissions `27` 篇、cross submissions `7` 篇、replacement submissions `20` 篇。本轮恢复为最新官方 listing 精筛口径，收录端侧纯视觉深度不确定性、隐式意图导航评测、VLN 在线适应资产、多楼层可达图探索和欠指定奖励澄清相关 5 篇论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-05-26。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 Robotics listing 日期为 `Monday, 25 May 2026`，合计 `54` 篇 entries；其中 new submissions `27` 篇、cross submissions `7` 篇、replacement submissions `20` 篇。
3. 官方 `cs.RO/recent` 中同日 recent entries 对应 new submissions 与 cross submissions，不含 replacement；本轮以 `cs.RO/new` 的完整结构作为主口径。
4. 本轮先排除 2026-05-22 至 2026-05-25 主卡片已收录的具身拒答 / 澄清、安全置信校准、局部风险场规划、视觉地点识别、`AwareVLN`、动态空间记忆、`Pre-VLA`、runtime governance、自调节模拟规划、底层执行物理可实现性、具身 MLLM 技能诊断、运动估计置信和纯视觉动态目标检测条目。
5. `replacement` / `cross-list` 只在新增 Kinbot 评测项、治理项或端侧资源判断时收录；本轮主卡片中仅 `IntentionNav` 来自 cross submission，因其提供隐式人类意图导航评测维度而进入主卡片。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是继续增加泛 `VLA`、world model、humanoid manipulation、多机器人或自动驾驶论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：视觉深度不确定性、隐式意图导航、非平稳环境适应、可达结构图、偏好 / 奖励欠指定澄清。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因新 listing 自动补满全部高相关方向；泛 `VLA` 在线适配、manipulation world model、humanoid tracking、multi-robot fleet 和自动驾驶 VLA 继续作为饱和主题处理。
2. 含云端或联网 VLM 的探索论文只进入候选排除表，不升级为 Kinbot 一代在线依赖。
3. 多楼层探索论文进入主卡片，是因为其“可达支持面 + tentative graph + structural priors”对室内复杂结构建图有工程增量；不意味着 Kinbot 一代要承诺上下楼或跨楼层机动能力。

## 2. 本轮总判断

本轮官方 Robotics listing 已从 2026-05-22 切换到 `Monday, 25 May 2026`，论文池不再只是前几日的饱和补录。真正对 Kinbot 有增量的方向不是“继续扩大 VLA / world model 主链路”，而是把 Phase 5 的验证字段往更可测的边界收敛：纯视觉深度什么时候不可信、用户隐含需求如何被导航系统识别、在线适应是否会变成可复用资产、复杂建筑结构如何表达可达性，以及机器人什么时候应该主动解释并索要纠正样例。

本轮对 Kinbot 有 5 个增量判断：

1. **纯视觉深度需要低成本不确定性，而不是只输出单点深度**：`UfM*` 证明多视角分歧可以用紧凑 Gaussian 表达，并以单次 DNN 推理获得资源友好的不确定性估计。Kinbot 一代坚持纯视觉时，应在深度 / 避障 / 地面可通行回放中记录 `depth_uncertainty_from_multiview_disagreement`、`depth_prediction_calibration_error` 和 `uncertainty_energy_cost`。
2. **家庭导航的目标不是只有 object category，而是隐式人类意图**：`IntentionNav` 将“我需要热饭”“房间闷”等自由文本意图拆成目标推断、可达邻域和终止成功等评测维度。Kinbot 的老人陪伴和家属协同不能只测“找杯子”，还要测“从需求推断物体 + 到达正确实例 + 判断任务是否完成”。
3. **VLN 在线适应要从临时更新变成可审计资产**：`IDEA` 把 test-time adaptation 转化为可累积的 prompt 资产库和跨域桥接。Kinbot 不应在家庭样机中做不可解释的持续在线微调，但可以把环境差异、家庭布局、视觉退化和导航提示转成离线可审计的 adaptation asset。
4. **复杂室内结构需要显式可达图，而不是把 2D / 2.5D 地图硬扩张**：`Multi-Floor Exploration` 用 reachable support surface graph 表达重叠可通行面、楼梯、坡道和多高度结构。Kinbot 一代可以吸收“可达结构图 + 假设节点 + 结构先验”的记录方式，用于门槛、坡道、平台边界和不可达区域解释。
5. **欠指定偏好要触发解释式澄清，而不是默认执行或盲目学习**：`Robots That Know What to Ask` 虽然面向桌面操作奖励学习，但其核心是识别示教 / 偏好中被欠指定的特征，并用自然语言说明不确定点后请求纠正。Kinbot 可将其转化为 `preference_underspecified_reason`、`clarification_requested_feature` 和 `corrective_example_needed`，不引入在线 reward learning 主链路。

周度滚动判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 纯视觉置信、深度不确定性、视觉退化解释 | 值得专题跟踪 | 将 `UfM*` 与前序视觉安全置信、动态目标检测退化、自运动补偿合并为纯视觉失败归因字段包。 |
| 隐式意图导航与家庭语义任务 | 值得进入专题 | 用 `IntentionNav` 的目标推断 / 邻域到达 / 终止成功三段指标改造 Kinbot 家庭找物和帮助类任务评测。 |
| VLN 在线适应与长期环境记忆 | 接近专题成熟 | 近期已有导航自感知、记忆型目标导航、动态空间记忆和 `IDEA`；下一步应做回放字段与资产生命周期，而不是继续扩张在线模型层。 |
| 多楼层 / 复杂支持面探索 | 仍有增量 | 保留为复杂住宅、坡道、门槛、平台和不可达区域解释候选；不写成一代跨楼层能力承诺。 |
| 泛 `VLA`、manipulation world model、humanoid whole-body、multi-agent fleet | 已饱和 | 只有新增 Kinbot 家庭移动实机闭环、端侧资源实测、安全审计字段或老人照护任务映射时才进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把在线 VLA 适配、持续 reward learning、多楼层探索栈、几何 transformer token pruning、6G embodied agent 和 fleet perception 都纳入 Kinbot 一代在线架构，会明显过复杂”。建议只吸收为 5 类轻量对象：视觉不确定性字段、隐式意图导航测试、VLN 适应资产库、可达结构图回放、欠指定偏好澄清日志。暂不新增在线 reward learning、通用 VLA 适配层、跨楼层产品承诺或多机器人感知框架。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | UfM*: Uncertainty from Motion* for DNN Depth Estimation Using Gaussians | 进入纯视觉安全和端侧资源专题，转成深度不确定性、校准误差、单帧能耗和回放诊断字段。 |
| A- | IntentionNav: A Benchmark for Intent-Driven Object Navigation from Implicit Human Instruction | 进入家庭语义导航评测专题，补充隐式意图、目标推断、终止成功和 grounded success 指标。 |
| B+ | Turning Adaptation into Assets: Cross-Domain Bridging for Online Vision-Language Navigation | 作为 VLN 环境适应资产候选，先做离线资产生命周期，不引入不可审计在线微调。 |
| B+ | Multi-Floor Exploration for Ground Robots via an Incremental Reachable Graph and Structural Priors | 作为复杂室内可达图候选，服务门槛 / 坡道 / 多高度结构解释，不承诺跨楼层能力。 |
| B | Robots That Know What to Ask: Recovering Misaligned Rewards through Targeted Explanations | 转成偏好欠指定澄清和纠正样例请求字段，不进入在线 reward learning 主链路。 |

## 3. 论文卡片

### 3.1 UfM*: Uncertainty from Motion* for DNN Depth Estimation Using Gaussians

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.23098](https://arxiv.org/abs/2605.23098) |
| 本轮 listing 口径 | 2026-05-25 官方 listing new submission；abs 页显示 `Submitted on 21 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | monocular depth uncertainty, multiview disagreement, Gaussian mixture, edge deployment, calibration |

摘要要点转述：

论文关注单目深度 DNN 在安全关键机器人中的不确定性估计。传统 ensemble 或采样方法需要对同一图像多次推理，计算和内存成本高；单帧不确定性又无法捕捉同一区域在不同视角下的预测分歧。作者提出 `UfM*`，用紧凑 Gaussian mixture 表示历史和当前视角的 3D 区域差异，只需每张图一次 DNN 推理即可得到多视角分歧信号。实验显示，该方法与 aleatoric uncertainty 结合后相对 ensemble 改善校准误差，同时在 ScanNet out-of-distribution 序列上只消耗 ensemble 很小一部分能量和内存；作者还给出 Arm Cortex-A76 CPU 上 `224x224` 图像 `30 FPS`、约 `63 mJ` 的端侧运行信号。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`platform_runtime` 与 `observability_data_governance` 中“纯视觉深度什么时候不可信”的问题。
2. Kinbot 一代不回退深度相机 / 激光雷达作为产品 fallback，因此视觉深度必须提供可解释置信，而不能只输出单点深度。
3. 对应 Phase 5：建议增加 `depth_uncertainty_from_multiview_disagreement`、`depth_prediction_calibration_error`、`depth_uncertainty_energy_cost`、`uncertainty_triggered_slowdown` 和 `visual_depth_degraded_reason` 字段。

资源消耗与部署信号：

1. 方法强调单次 DNN 推理和 Gaussian 表达，方向上匹配 `12GB RAM + 32GB Flash` 下对低成本回放诊断的需求。
2. 论文给出了能耗、内存和 CPU 实时运行信号，比只报 benchmark accuracy 的深度论文更适合作为 Kinbot 端侧资源评估输入。
3. 仍需注意输入分辨率、模型大小、相机运动模式和家庭低视角数据差异；不能把论文数字直接写成 Kinbot 实机指标。

优势：

1. 直接服务一代纯视觉主线，补的是置信与降级解释，不是新增主动传感器。
2. 同时覆盖安全和资源两条线：既解释深度何时不可信，也给出能耗 / 内存约束下的实现方向。
3. 可与前序视觉安全置信校准、动态目标检测退化和自运动补偿论文合并为纯视觉失败归因专题。

劣势与风险：

1. 依赖跨视角几何一致性，若家庭场景纹理少、近距离动态遮挡多或相机运动太小，多视角分歧可能不稳定。
2. 论文实验不等于 Kinbot 双目 / 单目组合和移动底盘视角下的结果。
3. 若把不确定性估计嵌入所有视觉链路，仍可能增加端侧复杂度；应先作为离线回放和关键场景触发字段。

推荐理由：

建议作为 A- 级输入。它不改变 Kinbot 纯视觉主线，但明显提升“纯视觉如何可验证、可降级、可审计”的工程口径。

### 3.2 IntentionNav: A Benchmark for Intent-Driven Object Navigation from Implicit Human Instruction

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.23187](https://arxiv.org/abs/2605.23187) |
| 本轮 listing 口径 | 2026-05-25 官方 listing cross submission from `cs.CV`；abs 页显示 `Submitted on 22 May 2026`。因新增隐式人类意图导航评测项，本轮进入主卡片 |
| 分类 | `cs.CV`, `cs.RO` |
| 方法关键词 | intent-driven object navigation, implicit instruction, object goal inference, terminal success, benchmark |

摘要要点转述：

论文指出现有 object navigation benchmark 通常直接告诉 agent 要找的物体类别，但真实家庭交互常是隐式需求，例如需要加热食物、房间空气不好、想找某个可满足状态的物品。作者提出 `IntentionNav`，把任务定义为从自由文本意图推断目标物体、在场景中主动搜索并判断是否到达目标。数据集包含 500 个意图、176 个 Isaac Sim 场景和 64 个目标类别，并用 4 种受控语言风格和 4 类意图模式区分措辞和语义线索。基线评测显示，VLM 可在约一半 episode 中识别目标，但最终 grounded 1m success 很低，暴露了目标推断、视觉验证和终止判断的明显断点。

解决 Kinbot 的什么问题：

1. 对应 `interaction_orchestration`、`mobility_navigation` 与 `world_state_memory` 中“用户没有直接说物体名时机器人如何导航”的问题。
2. Kinbot 老人陪伴场景更常见的是需求表达而不是 object category，例如“帮我看看药在哪”“屋里有点闷”“我想喝点热的”。
3. 对应 Phase 5：建议增加 `implicit_intent_mode`、`inferred_target_category`、`intent_target_confidence`、`target_neighborhood_reached`、`terminal_success_verified` 和 `grounded_success_distance` 字段。

资源消耗与部署信号：

1. 论文是 benchmark，不给出端侧部署成本；它的价值在评测维度，而不是模型方案。
2. 数据使用 RGB-D observations 与 pose，Kinbot 一代不能因此改写纯视觉主线；可把指标迁移到双目 / 视觉里程计回放与仿真评测中。
3. 适合先作为离线 eval set 设计参考，避免直接引入云端 VLM 在线控制。

优势：

1. 让导航评测从“找指定类别”升级到“理解隐式需求并终止确认”，贴近家庭真实任务。
2. 指标拆得细：目标推断、邻域到达、终止成功和 grounded success 可以帮助定位失败环节。
3. 与 Kinbot “温暖、聪明”的产品感相关，但仍能落到可测字段，而不是泛泛强化大模型交互。

劣势与风险：

1. Isaac Sim 场景和 RGB-D 输入与 Kinbot 家庭样机存在 domain gap。
2. 如果直接追求隐式意图全覆盖，容易扩张成开放世界生活助手；一代应限制在高频家庭物品和安全边界内。
3. 终止成功很低，说明该方向当前更适合评测暴露问题，不适合承诺产品级能力。

推荐理由：

建议作为 A- 级输入。它能把 Kinbot 的家庭找物 / 帮助类任务从“会不会导航”升级为“是否理解了用户真正需求”，但不要求改变一代系统边界。

### 3.3 Turning Adaptation into Assets: Cross-Domain Bridging for Online Vision-Language Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.23257](https://arxiv.org/abs/2605.23257) |
| 本轮 listing 口径 | 2026-05-25 官方 listing new submission；abs 页显示 `Submitted on 22 May 2026` |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | vision-language navigation, test-time adaptation, historical assets, soft prompts, domain bridging |

摘要要点转述：

论文面向真实部署中的 VLN 非平稳环境变化。现有 test-time adaptation 常把在线更新当成一次性临时调整，容易遗忘旧环境或把错误迁移到新环境。作者提出 `IDEA`，把每次适应过程转成可积累资产：先用 Fisher-guided weighting 优化 soft prompts 捕捉可迁移知识，再为这些 prompt 加入 domain coordinates，形成动态 asset library；面对目标域时，通过把目标域投影到历史知识的凸包中构造跨域桥接，从而初始化新的适应过程。实验覆盖 REVERIE、R2R 与 R2R-CE，强调 training-free adaptation 与资产共享。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 与 `observability_data_governance` 中“家庭环境变化如何沉淀为可审计经验”的问题。
2. Kinbot 会遇到家具位置变化、光照变化、节假日布置、用户习惯变化和临时障碍；这些不应都变成不可追踪的在线模型更新。
3. 对应 Phase 5：建议增加 `navigation_adaptation_asset_id`、`environment_shift_descriptor`、`asset_reuse_confidence`、`negative_transfer_suspected` 和 `adaptation_rollback_reason` 字段。

资源消耗与部署信号：

1. 论文侧重 prompt / asset library，不是直接训练大模型；但它仍依赖 VLN 模型和 benchmark 环境，不等于端侧可直接部署。
2. Kinbot 更现实的路径是离线回放中沉淀“家庭环境变化资产”，由版本化规则或轻量提示策略使用，而不是在本体上持续微调。
3. 需要明确资产过期、冲突、回滚和隐私边界，避免把家庭历史观察变成不可控长期记忆。

优势：

1. 把在线适应从黑箱更新转成可命名、可复用、可回滚的资产，贴合 Kinbot 数据治理。
2. 与前序动态空间记忆和导航自感知形成互补：记忆不是无限扩张，而是有生命周期的 adaptation asset。
3. 能降低 repeated household changes 对 VLN 评测的干扰，让回放更可解释。

劣势与风险：

1. 仍是 benchmark-driven VLN，不等于家庭机器人闭环导航。
2. 如果资产库无限增长，会带来隐私、存储、冲突解析和调试复杂度。
3. prompt asset 的可解释性有限，进入产品前需要更强的审计和删除机制。

推荐理由：

建议作为 B+ 级输入。它不应触发 Kinbot 在线微调主链路，但值得转成“导航环境适应资产”的离线治理模型。

### 3.4 Multi-Floor Exploration for Ground Robots via an Incremental Reachable Graph and Structural Priors

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.23350](https://arxiv.org/abs/2605.23350) |
| 本轮 listing 口径 | 2026-05-25 官方 listing new submission；abs 页显示 `Submitted on 22 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | multi-floor exploration, reachable graph, support surfaces, structural priors, hierarchical planning |

摘要要点转述：

论文关注地面机器人在多楼层建筑中的自主探索。传统 2D / 2.5D 地图难以表达楼梯、坡道和重叠可通行高度，导致 frontier detection 和全局规划不稳定。作者提出基于 incremental reachable graph 的探索框架，在可达支持面上构建稀疏图，并保留 sparse observation 下的 tentative graph elements；当机器人需要探索新楼层时，从已探索楼层投影 task-zone priors，初始化目标楼层的 hypothetical graph，再随着新观察逐步校正。仿真显示探索效率和地图完整性提升，实机 onboard 实验验证了实时可行性。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 与 `world_state_memory` 中“复杂室内结构如何表达可达性”的问题。
2. Kinbot 一代不应承诺上下楼，但家庭里仍可能有门槛、坡道、下沉空间、平台、儿童围栏、地毯边界和不可达区域。
3. 对应 Phase 5：建议增加 `reachable_support_surface_id`、`tentative_connectivity_edge`、`structural_prior_source`、`unreachable_region_reason` 和 `frontier_reachability_confidence` 字段。

资源消耗与部署信号：

1. 方法是图结构和层级规划，不直接依赖重型大模型；但多楼层场景通常需要足够可靠的几何感知和定位。
2. Kinbot 可先将其用作离线地图 / 回放表达，而不是上线全自动复杂建筑探索。
3. 若映射到一代产品，重点是“可达 / 不可达解释”和“探索边界”，不是跨楼层移动。

优势：

1. 明确解决 2D / 2.5D 地图表达重叠可达面的不足。
2. tentative graph 与 structural priors 可帮助在 sparse observation 下保持探索假设，而不是过早确认错误拓扑。
3. 与 Kinbot 的室内巡护、回充路径、门槛绕行和临时障碍解释存在工程映射。

劣势与风险：

1. 论文的 multi-floor framing 容易被误读为 Kinbot 要具备跨楼层能力，需要在文档中明确边界。
2. 若底层纯视觉几何和定位不稳定，可达图也会继承错误。
3. 如果与现有地图 / world state schema 叠加不当，会增加导航实体和接口复杂度。

推荐理由：

建议作为 B+ 级输入。它适合帮助 Kinbot 表达复杂室内可达结构和不可达原因，但只作为验证 / 回放字段，不改写一代移动能力边界。

### 3.5 Robots That Know What to Ask: Recovering Misaligned Rewards through Targeted Explanations

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.22986](https://arxiv.org/abs/2605.22986) |
| 本轮 listing 口径 | 2026-05-25 官方 listing new submission；abs 页显示 `Submitted on 21 May 2026` |
| 分类 | `cs.RO`, `cs.AI`, `cs.HC`, `cs.LG` |
| 方法关键词 | underspecified reward, targeted explanation, corrective demonstrations, preference ambiguity, human-in-the-loop |

摘要要点转述：

论文研究从示教中学习 reward function 时的欠指定问题：用户示教可能因为认知负担、操作难度或覆盖不足，未充分表达某些重要特征，导致部署时 reward 模糊或行为错位。作者利用示教统计信号判断哪些特征被稳定优化、哪些特征变化很大且可能欠指定；机器人随后用自然语言解释自己对哪些特征不确定，并请求针对这些特征的纠正示例。实验包括仿真桌面操作和真实 Franka 用户研究，结果显示定向、解释引导的查询比随机查询或被动收集更能恢复目标 reward。

解决 Kinbot 的什么问题：

1. 对应 `interaction_orchestration`、`safety_compliance_authorization` 与 `observability_data_governance` 中“机器人什么时候应该问，而不是执行”的问题。
2. Kinbot 的家庭任务常有偏好欠指定，例如老人希望“温柔一点提醒”“不要打扰睡觉”“帮我找常用药但别碰隐私抽屉”；这些不能只靠一次用户指令默认推断。
3. 对应 Phase 5：建议增加 `preference_underspecified_reason`、`uncertain_task_feature`、`clarification_requested_feature`、`corrective_example_needed` 和 `post_clarification_policy_delta` 字段。

资源消耗与部署信号：

1. 论文不是端侧资源论文，且实验是 manipulation reward learning；Kinbot 不应直接引入在线 reward learning。
2. 可低成本吸收为澄清日志和纠正样例采集策略，用于人工审阅、家庭偏好设置和安全策略调试。
3. 若涉及长期家庭偏好数据，必须遵守原始敏感数据端侧处理和受控回流边界。

优势：

1. 将“机器人要问什么问题”从泛化对话能力转成可诊断的欠指定特征。
2. 与 Kinbot 的拒答 / 澄清 / 授权 / 人工覆盖链路兼容，不要求改变控制主线。
3. 适合补充高端产品感：聪明不是默认猜，而是知道何时解释不确定并请求确认。

劣势与风险：

1. 场景是桌面操作和 reward learning，不是家庭移动机器人任务。
2. 如果过度询问，会破坏陪伴体验；需要阈值和任务风险分级。
3. 若把纠正样例直接用于在线策略更新，容易带来安全和审计问题。

推荐理由：

建议作为 B 级输入。它适合转成澄清与偏好治理字段，不应触发 Kinbot 在线 reward learning 主链路。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| Agentic-VLA: Efficient Online Adaptation for Vision-Language-Action Models | [2605.22896](https://arxiv.org/abs/2605.22896) | 2026-05-25 new submission | 在线 VLA 适配、reward synthesis、experience memory 有方法价值，但任务集中在 manipulation benchmark；本轮已用 `IDEA` 覆盖更贴近导航和记忆治理的适应资产，不扩张 VLA 主控。 |
| Semantic-Aware Guided Drone Exploration for Language-Conditioned 3D Indoor Mapping | [2605.23160](https://arxiv.org/abs/2605.23160) | 2026-05-25 new submission | 语义 frontier 和 open-vocabulary indoor mapping 与找物相关，但载体是无人机、3D mapping 和 offboard CLIP；本轮优先收录更直接的 `IntentionNav` 与可达图。 |
| Autonomous Frontier-Based Exploration with VLM Guidance | [2605.23165](https://arxiv.org/abs/2605.23165) | 2026-05-25 new submission | VLM 选 frontier 可启发高层探索，但论文明确依赖 internet connection，未给出 Kinbot 端侧 / 隐私边界；不进入一代在线导航主链路。 |
| Signal Temporal Logic Motion Planning via Graphs of Convex Sets | [2605.23240](https://arxiv.org/abs/2605.23240) | 2026-05-25 new submission | STL + GCS 对可审计时序约束有价值，但实验跨 quadrotor、humanoid 和机械臂；本轮缺少直接家庭移动机器人指标，保留为形式化安全候选。 |
| SFG-ROS: A Resource-Aware Framework for Dense Multi-Agent Perception | [2605.23832](https://arxiv.org/abs/2605.23832) | 2026-05-25 new submission | ROS 2 网络隔离和解码 offload 对工程系统有启发，但对象是多机器人 fleet、LiDAR 和 stereo depth dense streams；Kinbot 一代仍是单机器人纯视觉主线。 |
| Good Token Hunting: A Hitchhiker's Guide to Token Selection for Visual Geometry Transformers | [2605.23892](https://arxiv.org/abs/2605.23892) | 2026-05-25 cross submission from `cs.CV` | token selection 对端侧几何 transformer 有资源价值，但主要面向多视图 3D reconstruction，尚未给出 Kinbot 导航 / 安全回放指标；暂作为资源 profiling 候选。 |
| Lipschitz Optimization for Formal Verification of Homographies | [2605.23203](https://arxiv.org/abs/2605.23203) | 2026-05-25 cross submission from `cs.CV` | camera motion 下的视觉鲁棒形式化验证很有治理价值，但假设以平面结构和 homography 为主；本轮主卡片已覆盖更直接的纯视觉不确定性，后续可进入视觉认证专题。 |
| PIMbot: A Self-Adaptive Attack Framework for Adversarial Manipulation of Multi-Robot Reinforcement Learning | [2605.23027](https://arxiv.org/abs/2605.23027) | 2026-05-25 new submission | adversarial stress test 和 Jetson Orin Nano 资源测量有旁路价值，但核心是多机器人 RL social dilemma；Kinbot 一代不是 fleet product。 |
| Four Simple Proprioceptive Estimators for Legged Robots | [2605.23100](https://arxiv.org/abs/2605.23100) | 2026-05-25 new submission | 与 2026-05-25 已收 `OCELOT` 的腿式里程计 / 接触估计主题高度相邻；本轮不重复扩张底层运动估计专题。 |
| Point Tracking Improves World Action Models | [2605.23856](https://arxiv.org/abs/2605.23856) | 2026-05-25 new submission | point tracking 对 world action model 的动态表征有价值，但仍是 manipulation / policy learning 语境；近期 world model 和 VLA 主题已饱和。 |
| 6G Communication Networks Enabling Embodied Agents: Architecture and Prototype | [2605.23263](https://arxiv.org/abs/2605.23263) | 2026-05-25 new submission | 远程交互和低延迟通信与 `KBT-57` 后台服务 / 坐席有远期关系，但 6G 架构不是 Kinbot 当前量产预备阶段的决策输入。 |

## 5. 对 Kinbot 的落地 / 文档建议

本轮建议只作为研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。原因是 5 篇主卡片主要新增 Phase 5 评测字段、回放字段和专题候选，没有形成需要改变一代纯视觉主线、传感器主线、端侧 / 云边界、成本基线或 Phase 5 门控的稳定产品判断。

建议后续轻量落地动作：

1. 在纯视觉安全回放字段候选中补充 `depth_uncertainty_from_multiview_disagreement`、`depth_prediction_calibration_error`、`uncertainty_triggered_slowdown` 和 `visual_depth_degraded_reason`。
2. 在家庭语义导航评测中补充隐式意图任务，至少拆出 `target inference`、`neighborhood reached`、`terminal success` 和 `grounded success` 四类指标。
3. 在 `VLN -> NFM` 专题跟踪中把在线适应从“模型更新”改写为“版本化 adaptation asset”，补充资产创建、复用、冲突、过期和回滚口径。
4. 在复杂室内结构回放中用 `reachable support surface` 和 `tentative connectivity` 描述门槛、坡道、平台、不可达区域和导航失败原因。
5. 在澄清 / 授权 / 偏好设置链路中增加“欠指定特征解释 + 纠正样例请求”动作，但不启用在线 reward learning。

本轮未进入主线的原因：这些论文改变的是“如何评测和记录纯视觉、导航、适应、可达性、偏好澄清”，不改变“Kinbot 一代必须纯视觉、端侧处理敏感原始数据、12GB + 32GB 默认量产线、移动而非操作”的主线边界。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent` 官方 listing：[https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
3. `UfM*: Uncertainty from Motion* for DNN Depth Estimation Using Gaussians`：[https://arxiv.org/abs/2605.23098](https://arxiv.org/abs/2605.23098)
4. `IntentionNav: A Benchmark for Intent-Driven Object Navigation from Implicit Human Instruction`：[https://arxiv.org/abs/2605.23187](https://arxiv.org/abs/2605.23187)
5. `Turning Adaptation into Assets: Cross-Domain Bridging for Online Vision-Language Navigation`：[https://arxiv.org/abs/2605.23257](https://arxiv.org/abs/2605.23257)
6. `Multi-Floor Exploration for Ground Robots via an Incremental Reachable Graph and Structural Priors`：[https://arxiv.org/abs/2605.23350](https://arxiv.org/abs/2605.23350)
7. `Robots That Know What to Ask: Recovering Misaligned Rewards through Targeted Explanations`：[https://arxiv.org/abs/2605.22986](https://arxiv.org/abs/2605.22986)
8. `Agentic-VLA`：[https://arxiv.org/abs/2605.22896](https://arxiv.org/abs/2605.22896)
9. `Semantic-Aware Guided Drone Exploration`：[https://arxiv.org/abs/2605.23160](https://arxiv.org/abs/2605.23160)
10. `Autonomous Frontier-Based Exploration with VLM Guidance`：[https://arxiv.org/abs/2605.23165](https://arxiv.org/abs/2605.23165)
11. `Signal Temporal Logic Motion Planning via Graphs of Convex Sets`：[https://arxiv.org/abs/2605.23240](https://arxiv.org/abs/2605.23240)
12. `SFG-ROS`：[https://arxiv.org/abs/2605.23832](https://arxiv.org/abs/2605.23832)
13. `Good Token Hunting`：[https://arxiv.org/abs/2605.23892](https://arxiv.org/abs/2605.23892)
14. `Lipschitz Optimization for Formal Verification of Homographies`：[https://arxiv.org/abs/2605.23203](https://arxiv.org/abs/2605.23203)
15. `PIMbot`：[https://arxiv.org/abs/2605.23027](https://arxiv.org/abs/2605.23027)
16. `Four Simple Proprioceptive Estimators for Legged Robots`：[https://arxiv.org/abs/2605.23100](https://arxiv.org/abs/2605.23100)
17. `Point Tracking Improves World Action Models`：[https://arxiv.org/abs/2605.23856](https://arxiv.org/abs/2605.23856)
18. `6G Communication Networks Enabling Embodied Agents`：[https://arxiv.org/abs/2605.23263](https://arxiv.org/abs/2605.23263)
