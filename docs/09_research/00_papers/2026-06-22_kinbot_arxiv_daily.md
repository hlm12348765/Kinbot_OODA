# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-22
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-22 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API 与论文详情页，确认本轮官方最新 Robotics listing 仍为 `Friday, 19 June 2026`，合计 `113` 篇 entries；其中 new submissions `66` 篇、cross submissions `5` 篇、replacement submissions `42` 篇。官方 `cs.RO/recent` 顶部同为 `Fri, 19 Jun 2026`，显示 `Total of 369 entries`，其中 `Fri, 19 Jun 2026` 为 `71` 篇 entries；本轮按周一尚未出现新批次说明 + 同一 listing 连续多日覆盖后的日更补录 + 周度综合判断口径，补录长期物品位置记忆、VLA / 策略失败可解释预测和自适应视觉伺服资源调度 3 篇论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-06-22。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 仍为 `Friday, 19 June 2026`，合计 `113` 篇 entries；其中 new submissions `66` 篇、cross submissions `5` 篇、replacement submissions `42` 篇。
3. 官方 `cs.RO/recent` 顶部同为 `Fri, 19 Jun 2026`，显示 `Total of 369 entries`；其中 `Fri, 19 Jun 2026` 为 `71` 篇 entries、`Thu, 18 Jun 2026` 为 `62` 篇 entries、`Wed, 17 Jun 2026` 为 `54` 篇 entries、`Tue, 16 Jun 2026` 为 `127` 篇 entries、`Mon, 15 Jun 2026` 为 `55` 篇 entries。该页只显示 `new + cross` 条目，不含 `replacement` 条目，因此本轮仍以 `cs.RO/new` 作为正式 Robotics listing、entries 总数与 `new / cross / replacement` 计数口径。
4. 今天为 2026-06-22 周一，本轮检索时 arXiv 官方尚未出现 `Monday, 22 June 2026` Robotics 新批次；本轮按“最新官方 listing + 周一尚未出现新批次说明”形成日更。
5. 2026-06-20 已覆盖同一 2026-06-19 listing 的导航失败预警、实时故障诊断、概率时序安全约束、慢 `VLM` / 快 planner 和失败识别证据库；2026-06-21 已继续补录数据标准 / provenance、RGB last-meter 精定位和局部安全 fallback。本轮先排除这些直接重复主题，只补录能新增 Kinbot 字段、验证项或周度判断的论文。

筛选标准：

1. 是否改变 Kinbot 对家庭室内导航、长期记忆、安全治理、端侧资源或 Phase 5 验证证据链的判断。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`decision_orchestration`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 字段：动态物品位置预测、家庭对象记忆新鲜度、策略失败信息论信号、跨模型失败迁移、视觉伺服分辨率调度、last-meter 精定位误差和端侧 `VRAM / latency` 预算。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `Mobile Target Search with Imperfect Perception`、`ARC` 和 `MMD-SLAM` 都有感知不确定性、鲁棒估计或视觉建图价值，但分别偏 adversarial target search、`UWB` 非视距定位和 3DGS SLAM；本轮不把它们写成 Kinbot 在线搜索、UWB fallback 或新 SLAM 主线。
2. `Dual-Agent Framework for Cross-Model Verified Translation`、`Stable Transformer-Actor-Critic MPC` 和 `Start Right, Arrive Right` 都提供验证、稳定性或异步执行启发，但对象分别是实验室 protocol、无人机 MPC 和 manipulation action chunk；本轮只保留相邻字段，不新增实验室 agent、Transformer-MPC 或 action chunk 执行层。
3. `FlowMaps` 与此前动态语义地图、ObjectNav 和长期记忆论文相邻，本轮收录的理由不是新增 online world model，而是其明确针对 household object relocation 与 dynamic ObjectNav，可直接补充 Kinbot “家庭物品会被人移动”的长期记忆验证字段。
4. `Tri-Info` 与近期失败预警主题相邻，本轮收录的理由是它提供可解释的信息论诊断信号和跨模型 / sim-to-real 迁移结果；收录不意味着 Kinbot 一代新增 `VLA` 操作主链路。
5. `ART-VS` 属于 `cs.RO/recent` 近期待补录，而非 2026-06-19 `cs.RO/new` 新 submission；收录原因是其端侧视觉 patch / tile 调度和 last-meter visual servoing 指标可补 2026-06-21 RGB last-meter 对齐字段。

## 2. 本轮总判断

同一 2026-06-19 listing 已被 2026-06-20 和 2026-06-21 连续覆盖后，本轮真正新增的判断是：Kinbot 的下一步不是继续扩张 `VLA / WAM / semantic map / formal planner`，而是把 Phase 5 字段收敛到三类仍有增量的验证问题：家庭物品会随人的日常习惯移动、策略失败应有可解释的跨模型信号、端侧视觉精定位要能按任务阶段调分辨率。

1. **长期记忆不能只记录“上次看到在哪里”**：`FlowMaps` 提醒，家庭中物体位置变化并非完全随机。Kinbot 的找物、巡护和提醒任务应记录对象位置分布、时间上下文、家庭习惯线索和预测新鲜度，而不是只存一个最后观测坐标。
2. **失败预测要从结果回放前移到执行中风险信号**：`Tri-Info` 的价值不在于给 Kinbot 新增 `VLA`，而在于把失败诊断拆成动作多样性、时间一致性和状态转移耦合三个可解释信号，可与 2026-06-20 的轨迹级失败预警互补。
3. **视觉 last-meter 要把精度和资源预算绑在一起**：`ART-VS` 表明全图高分辨率处理并不等于更稳。Kinbot 更适合用粗到细、局部 tile、阶段化视觉伺服的方式，记录精定位收益、延迟和显存 / 内存代价。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 家庭对象长期位置记忆 / dynamic ObjectNav | 值得专题跟踪 | 将 `object_location_multimodal_distribution`、`object_memory_staleness`、`human_routine_context`、`relocalization_attempt_count` 合并到长期记忆与找物验证字段；不新增完整 flow-matching 在线 world model。 |
| 导航失败预警 / 策略失败解释 | 值得字段整合 | 将 `GroundControl` 的轨迹级风险与 `Tri-Info` 的信息论信号合并，形成 execution failure warning 字段包；不把 `VLA` failure detector 写成自动安全裁决。 |
| RGB last-meter / visual servoing 资源调度 | 值得轻量专题跟踪 | 将 `ART-VS` 与 2026-06-21 last-meter navigation 合并，形成 `coarse_to_fine_visual_servo_phase`、`tile_patch_budget`、`visual_servo_latency_ms`、`last_meter_position_error_cm` 字段。 |
| 数据 provenance、故障诊断、概率 STL、慢 VLM / 快 planner、失败 RAG | 已在 2026-06-20 / 2026-06-21 覆盖 | 下一步做字段去重与 Phase 5 模板候选，不继续从同一 listing 扩张新子系统。 |
| 3D scene graph / semantic map / ObjectNav | 已接近饱和 | 下一步应做专题整合，尤其区分对象记忆字段和在线语义地图组件。 |
| WAM / VLA / manipulation / humanoid skill datasets | 已饱和或相邻 | 只有新增家庭移动安全、端侧资源、试点证据链或可迁移失败字段时进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 FlowMaps、Tri-Info、ART-VS、Mobile Target Search、ARC、MMD-SLAM、Dual-Agent protocol translation、Transformer-MPC 和 PAINT 全部写成在线系统，会明显过复杂”。建议只吸收 15 类轻量字段：`object_location_multimodal_distribution`、`object_memory_staleness`、`human_routine_context`、`relocalization_attempt_count`、`dynamic_objnav_success_delta`、`action_diversity_signal`、`temporal_consistency_signal`、`state_transition_coupling_signal`、`failure_prediction_cross_model_transfer`、`failure_diagnostic_label`、`coarse_to_fine_visual_servo_phase`、`tile_patch_budget`、`visual_servo_latency_ms`、`visual_servo_vram_delta`、`last_meter_position_error_cm`。暂不新增在线 flow-matching object world model、`VLA` 操作主链路、完整视觉伺服策略替换、实验室 protocol agent、Transformer-MPC 控制器或 action chunk 异步执行层。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | FlowMaps: Modeling Long-Term Multimodal Object Dynamics with Flow Matching | 进入家庭对象长期记忆 / dynamic ObjectNav 专题，吸收物品位置多峰分布、时间上下文和记忆新鲜度字段；不新增在线 world model。 |
| B+ | Tri-Info: Generalizable, Interpretable Failure Prediction for VLA Models via Information Theory | 进入策略失败预警字段候选，吸收动作多样性、时间一致性、状态转移耦合和跨模型迁移评估；不把 `VLA` failure detector 写成安全裁决器。 |
| B+ | ART-VS: Adaptive Resolution Tiling for Vision Transformer Visual Servoing | 进入 RGB last-meter 与端侧视觉资源字段候选，吸收粗到细 tile 调度、定位误差、延迟和显存代价；不替换 Kinbot 导航栈。 |

## 3. 论文卡片

### 3.1 FlowMaps: Modeling Long-Term Multimodal Object Dynamics with Flow Matching

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.20209](https://arxiv.org/abs/2606.20209) |
| 本轮 listing 口径 | 2026-06-19 官方 listing new submission；`cs.RO/recent` entry date 为 `Fri, 19 Jun 2026`；属于同一 listing 连续多日覆盖后的日更补录 |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | dynamic ObjectNav, long-term object dynamics, flow matching, multimodal object location distribution, household routines |

摘要要点转述：

论文关注长期家庭环境中物体会被人移动的问题。作者认为，机器人不能只理解静态空间布局，还要理解空间如何随日常行为变化；家庭物体的位置变化受人类习惯和重复模式影响，因此可以学习其时空分布。论文提出 `FlowMaps`，用 latent flow matching 估计动态物体未来位置的多峰连续 3D 分布，并利用过去的人-物交互线索预测物体可能被放到哪里。作者在仿真和真实环境的 dynamic Object Navigation 任务中验证，报告 600 多个 episode 上较现有方法更好，说明长期对象动态建模能提升找物与导航。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`mobility_navigation` 和 `decision_orchestration` 中“物品被用户移动后，机器人如何判断去哪里找、何时重新询问、记忆是否过期”的问题。
2. Kinbot 家庭场景中，药盒、遥控器、眼镜、水杯、钥匙和充电线等对象经常被人移动；仅存最后一次观测位置会导致找物失败、反复绕行或错误提醒。
3. 对应 Phase 5：建议增加 `object_location_multimodal_distribution`、`object_memory_staleness`、`human_routine_context`、`object_relocation_prior`、`relocalization_attempt_count` 和 `dynamic_objnav_success_delta` 字段。

资源消耗与部署信号：

1. 论文使用 flow matching 预测连续 3D 空间中的多峰分布，直接端侧在线部署可能偏重。
2. Kinbot 一代更适合先把它转化为离线回放指标、轻量对象记忆字段和找物任务评测，而不是新增在线 flow-matching world model。
3. 数据采集需严格遵守家庭隐私边界：优先保留结构化对象事件、时间段、房间区域和结果摘要，不扩大原始视频回流。

优势：

1. 论文问题设定直接指向 everyday household environments，与 Kinbot 找物、巡护和提醒任务高度相关。
2. 把对象记忆从单点坐标扩展为带时间和习惯线索的多峰分布，符合真实家庭不确定性。
3. 可与前序长期记忆、dynamic scene graph 和 ObjectNav 论文合并成更清晰的字段包。

劣势与风险：

1. 需要足够长的家庭事件历史，否则容易把偶然摆放学成习惯。
2. 模型级方案可能超出一代端侧资源边界，应先做字段和回放验证。
3. 对用户习惯建模涉及隐私和误判风险，必须可解释、可关闭、可清除。

推荐理由：

建议作为 A- 级输入。它应进入家庭对象长期记忆 / dynamic ObjectNav 专题，帮助 Kinbot 把“物品在哪里”升级为“物品在不同时间和习惯下可能在哪里”；不建议新增在线 flow-matching object world model 或改写当前纯视觉导航主线。

### 3.2 Tri-Info: Generalizable, Interpretable Failure Prediction for VLA Models via Information Theory

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.19998](https://arxiv.org/abs/2606.19998) |
| 本轮 listing 口径 | 2026-06-19 官方 listing new submission；`cs.RO/recent` entry date 为 `Fri, 19 Jun 2026`；属于同一 listing 连续多日覆盖后的日更补录 |
| 分类 | `cs.RO`, `cs.AI`, `cs.CV`, `cs.LG` |
| 方法关键词 | failure prediction, information-theoretic signals, VLA diagnostics, cross-domain transfer, sim-to-real |

摘要要点转述：

论文关注 `VLA` 模型在真实物理交互中的失败预测。作者把 `VLA` 控制过程视为闭环信息管线，认为成功和失败 rollout 在信息论信号上存在系统差异。论文提出 `Tri-Info`，用三类信号判断动作是否保持足够多样性、时间上是否一致、动作与状态转移是否耦合。作者在 6 个 `VLA` 模型和 3 个 benchmark 环境中评估，报告 in-domain 与强基线相当，并且在跨架构、跨环境和 sim-to-real 迁移时不需要重新训练；真实任务上达到约 `83%` 失败预测准确率，同时能给出失败模式解释。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`decision_orchestration` 和 `observability_data_governance` 中“策略看起来仍在输出动作，但是否已经进入高失败风险状态”的问题。
2. Kinbot 一代不应把 `VLA` 操作主链路作为默认主线，但导航、交互确认、找物观察和未来动作策略都需要失败预警与可解释诊断。
3. 对应 Phase 5：建议增加 `action_diversity_signal`、`temporal_consistency_signal`、`state_transition_coupling_signal`、`failure_prediction_cross_model_transfer`、`failure_diagnostic_label` 和 `human_review_required` 字段。

资源消耗与部署信号：

1. 方法价值在于从已有 rollout 中抽取信息论信号，不必先新增大模型或新传感器。
2. 对 Kinbot 更适合作为回放分析、仿真对比和策略版本评估字段，在线阶段只可作为低频风险参考，不可自动裁决安全动作。
3. 若未来用于导航或交互策略，需要先证明这些信号在非 manipulation 场景中仍有效。

优势：

1. 与 2026-06-20 `GroundControl` 的轨迹级失败预警互补：一个看导航进度异常，一个看策略信息管线是否退化。
2. 强调可解释失败模式，适合做人工复核和版本回归分析。
3. 跨模型 / sim-to-real 不重训的结果对样机阶段快速筛查有启发。

劣势与风险：

1. 论文主体仍是 `VLA`，许多实验可能偏 manipulation，不能直接迁移到家庭轮式导航。
2. 信息论指标需要足够规范的状态、动作和 rollout 记录，否则诊断标签会不稳定。
3. 失败预测只能提示风险，不应被写成自动安全裁决器。

推荐理由：

建议作为 B+ 级输入。它应进入策略失败预警字段候选，与导航轨迹失败预警和失败案例检索合并；不建议新增在线 `VLA` failure detector 子系统，也不改写 Kinbot 一代不做机械臂操作主链路的边界。

### 3.3 ART-VS: Adaptive Resolution Tiling for Vision Transformer Visual Servoing

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.19089](https://arxiv.org/abs/2606.19089) |
| 本轮 listing 口径 | `cs.RO/recent` 2026-06-17 entry；属于近期待补录，不属于 2026-06-19 官方 `cs.RO/new` 当日新 submission |
| 分类 | `cs.RO` |
| 方法关键词 | adaptive resolution tiling, visual servoing, Vision Transformer features, coarse-to-fine alignment, runtime resource budget |

摘要要点转述：

论文研究基于自监督 `ViT` 特征的视觉伺服。作者指出，粗 patch 描述子鲁棒但定位精度有限，直接提升全图分辨率会带来大量 patch 和资源开销，但鲁棒性收益很小。论文提出 `ART-VS`，把视觉伺服拆成两个阶段：先用原生 `ViT` 分辨率做稳定粗对齐，再在局部邻域内进行高分辨率 tile 匹配，提高定位精度。论文报告在扰动下 convergence 达到 `95.4%`，相比标准和全分辨率 `ViT` 视觉伺服分别提升 `18.8` 和 `14.4` 个百分点；相对全分辨率方案速度超过 `10x`，`VRAM` 降低 `27%`。实机演示覆盖未见透明瓶和鞋类实例。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`platform_runtime` 和 `world_state_memory` 中“最后一米靠近目标时，如何在端侧资源有限条件下同时保证对齐稳定和定位精度”的问题。
2. Kinbot 一代即使不做抓取，也需要精确停靠充电桩、面向用户、靠近桌边 / 药箱、对准观察区域和确认物品位置。
3. 对应 Phase 5：建议增加 `coarse_to_fine_visual_servo_phase`、`tile_patch_budget`、`visual_servo_latency_ms`、`visual_servo_vram_delta`、`last_meter_position_error_cm` 和 `visual_alignment_convergence_success` 字段。

资源消耗与部署信号：

1. 论文明确比较了 patch 数、速度和 `VRAM`，对 Kinbot `12GB RAM + 32GB Flash` 默认量产线有直接字段价值。
2. 方法仍需依赖 `ViT` backbone 和局部高分辨率匹配，端侧部署前必须测 batch-1 延迟、内存峰值和热稳定性。
3. 对 Kinbot 的首要价值是粗到细视觉资源调度策略和评估字段，而不是直接替换导航栈或引入抓取任务。

优势：

1. 直接处理视觉伺服中“鲁棒性、精度、资源”三者冲突。
2. 与 2026-06-21 的 RGB last-meter navigation 可合并成纯视觉最后一米验证专题。
3. 指标容易进入实机验收：收敛率、定位误差、延迟、patch 数和显存 / 内存差异。

劣势与风险：

1. 论文实机演示仍偏 category-level grasping，Kinbot 需要裁剪为移动底盘停靠 / 对准任务。
2. 高分辨率 tile 对低光、反光、遮挡、运动模糊和家庭杂物背景的鲁棒性仍需验证。
3. 若端侧 `ViT` 特征计算过重，需退回传统视觉 / 几何对齐或云端离线分析，不可为了指标牺牲实时安全。

推荐理由：

建议作为 B+ 级输入。它应进入 RGB last-meter 与端侧视觉资源字段候选，帮助 Kinbot 把“最后一米对齐”拆成粗到细阶段、tile 预算、收敛率和资源代价；不建议替换当前导航栈或新增抓取主线。

## 4. 候选排除表

| 论文 | arXiv | 本轮 listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| Mobile Target Search with Imperfect Perception: A Partially Observable Stochastic Game Theoretical Approach | [2606.20232](https://arxiv.org/abs/2606.20232) | 2026-06-19 new submission | imperfect perception、false alarm / missed detection 和 detectability 与找物相关，但方法是 adversarial POSG、多搜索者和 server-assisted distributed algorithm；Kinbot 家庭场景先吸收 `missed_detection_rate`、`false_alarm_rate`、`eventual_detection_condition` 字段，不新增博弈搜索 planner。 |
| ARC: Adaptive Robust Joint State and Covariance Estimation | [2606.20428](https://arxiv.org/abs/2606.20428) | 2026-06-19 new submission | 鲁棒状态 / 协方差估计对异常观测很有价值，但验证重点是 `UWB` 非视距定位；Kinbot 一代纯视觉主线下只保留 `outlier_downweight_reason`、`covariance_self_tuning` 候选字段，不引入 `UWB` fallback。 |
| MMD-SLAM: Structure-Enhanced Multi-Meta Gaussian Distribution-Guided Visual SLAM | [2606.19874](https://arxiv.org/abs/2606.19874) | 2026-06-19 new submission | 结构化 3DGS Visual SLAM 对纯视觉建图有价值，但 3D scene graph / SLAM / Gaussian map 主题已接近饱和；本轮不再扩张地图表示层，只保留 `structural_line_constraint` 候选。 |
| Dual-Agent Framework for Cross-Model Verified Translation of Natural-Language Protocols into Robotic Laboratory Platform | [2606.20120](https://arxiv.org/abs/2606.20120) | 2026-06-19 new submission | cross-model validation 与自然语言到执行命令的自校正有治理价值，但场景是微孔板实验室自动化；Kinbot 只保留 `parser_validator_disagreement`、`execution_order_check` 字段，不新增 lab protocol agent。 |
| Stable Transformer-Actor-Critic Model Predictive Control: A Contraction Analysis Approach | [2606.20197](https://arxiv.org/abs/2606.20197) | 2026-06-19 new submission | Transformer-MPC 的稳定性证明有理论价值，但验证对象是 3D drone；Kinbot 不新增 sequence-model MPC 主控制器，只保留 `learned_controller_stability_certificate` 候选。 |
| Start Right, Arrive Right: Asynchronous Execution via Initial Noise Selection | [2606.19774](https://arxiv.org/abs/2606.19774) | 2026-06-19 new submission | 异步 action chunk 边界一致性对端侧延迟有启发，但任务是 manipulation / humanoid；Kinbot 一代不做 action chunk policy 主链路，只保留 `async_policy_boundary_consistency` 候选。 |
| Finetuning Vision-Language-Action Models Requires Fewer Layers Than You Think | [2606.20246](https://arxiv.org/abs/2606.20246) | 2026-06-19 new submission | 参数高效微调对模型训练成本有价值，但仍是 `VLA` 训练主题；近期端侧资源与 `VLA` 已饱和，本轮不收录。 |
| Agentic AutoResearch for Space Autonomy: An Auditable, LLM-Driven Research Agent for Aerospace Control Problems | [2606.20394](https://arxiv.org/abs/2606.20394) | 2026-06-19 new submission | auditable LLM agent trace 有相邻治理价值，但对象是航天控制研究生成，不是家庭机器人执行闭环；不进入主卡片。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮不建议回写主线架构或决策日志；这些论文仍属于 Phase 5 研究输入。
2. 建议后续把 `FlowMaps` 与前序动态语义地图、ObjectNav、长期记忆论文合并成一个“家庭对象记忆字段包”，重点区分最后观测、时间习惯、位置多峰分布和询问 / 重扫触发。
3. 建议把 `Tri-Info` 与 2026-06-20 `GroundControl`、`Fail-RAG` 合并成失败预警专题：轨迹级异常、信息论策略退化、失败证据检索和人工复核分别记录，不互相替代。
4. 建议把 `ART-VS` 与 2026-06-21 RGB last-meter navigation 合并成最后一米验证专题：目标朝向、边缘 / 物体对齐、粗到细视觉伺服、延迟和端侧资源同时验收。
5. 不建议因本轮论文新增在线 flow-matching object world model、`VLA` 操作主链路、视觉伺服策略替换、完整 `UWB` fallback、实验室 protocol agent、Transformer-MPC 控制器或 action chunk 异步执行层。

## 6. 来源

1. arXiv `cs.RO/new`：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent`：<https://arxiv.org/list/cs.RO/recent>
3. FlowMaps：<https://arxiv.org/abs/2606.20209>
4. Tri-Info：<https://arxiv.org/abs/2606.19998>
5. ART-VS：<https://arxiv.org/abs/2606.19089>
6. Mobile Target Search with Imperfect Perception：<https://arxiv.org/abs/2606.20232>
7. ARC：<https://arxiv.org/abs/2606.20428>
8. MMD-SLAM：<https://arxiv.org/abs/2606.19874>
9. Dual-Agent Framework：<https://arxiv.org/abs/2606.20120>
10. Stable Transformer-Actor-Critic MPC：<https://arxiv.org/abs/2606.20197>
11. Start Right, Arrive Right：<https://arxiv.org/abs/2606.19774>
12. Finetuning Vision-Language-Action Models Requires Fewer Layers Than You Think：<https://arxiv.org/abs/2606.20246>
13. Agentic AutoResearch for Space Autonomy：<https://arxiv.org/abs/2606.20394>
