# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-30
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-30 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮本地日更时官方最新 Robotics listing 为 `Friday, 29 May 2026`，合计 `76` 篇 entries；其中 new submissions `32` 篇、cross submissions `11` 篇、replacement submissions `33` 篇。本轮按 `3-5` 篇强相关论文 + 候选排除表口径，收录端侧 VLA 动态算力调度、VLA 成功置信校准、任意外形本体安全导航、实机 VLA 分布式评测方法、动态 3D 高斯场景图长期记忆相关 5 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-30。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮本地日更时官方 `cs.RO/new` 尚未出现以 `Saturday, 30 May 2026` 为 listing 日期的新 Robotics 批次；官方最新 Robotics listing 为 `Friday, 29 May 2026`，合计 `76` 篇 entries；其中 new submissions `32` 篇、cross submissions `11` 篇、replacement submissions `33` 篇。
3. 官方 `cs.RO/recent` 中 `Fri, 29 May 2026` 显示 `43` 篇 recent entries，对应 new submissions 与 cross submissions，不含 replacement；本轮以 `cs.RO/new` 的完整结构作为主口径。
4. 本轮先排除 2026-05-26 至 2026-05-29 主卡片已覆盖的端侧实时推理调度、纯视觉相对 3D 导航地图、主动询问、视觉地点识别拒绝、动态不确定性安全控制和端侧路径规划压缩等相邻主题，避免重复堆叠同类判断。
5. `replacement` / `cross-list` 只在新增 Kinbot 评测项、治理项或端侧资源判断时收录；本轮主卡片中 `DGSG-Mind` 来自 cross submission，原因是其对长期动态场景记忆和 grounding 增量明确。replacement 条目均进入候选排除表或暂不收录。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是继续增加泛 `VLA`、manipulation、humanoid、自动驾驶、蜂群或制造类论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：动态算力门控、任务成功置信、外形安全裕量、分布式实机评测、长期场景记忆更新。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 `76` 篇 entries 自动扩张主卡片数量；泛操作 VLA、双臂 / dexterous manipulation、UAV / aerial docking、swarm、自动驾驶、WAAM 制造和 wearable sensing 继续作为低相关或饱和主题处理。
2. `Replicable Simulation-Based Robot Validation through Provenance` 对 Phase 5 证据链有价值，但其核心是仿真测试过程的 provenance / FAIR 元数据治理；本轮主卡片已用 `PhAIL` 覆盖更直接的实机评测统计方法，该文进入候选排除表作为验证流程补充。
3. `Embodied3DBench`、`3DVLA`、`Qwen-VLA` 都说明 3D 空间智能与统一 VLA 仍在快速推进，但它们更容易把 Kinbot 一代推向重型端侧模型和操作承诺；本轮只收录更贴近长期场景记忆的 `DGSG-Mind`。
4. `When Should a Robot Think?` 与本轮 `ElegantVLA` 主题接近，但属于 replacement submission，且 `ElegantVLA` 是本轮 new submission，给出了更具体的 VLA 内部动态计算调度落点；replacement 不重复进入主卡片。

## 2. 本轮总判断

本轮官方 Robotics listing 从 2026-05-28 更新到 `Friday, 29 May 2026`。相比前几天主要围绕导航恢复、VPR 拒绝、物品归属和动态安全，本轮更集中地提示 Kinbot：不能只问“模型能不能做”，还要问“什么时候值得调用重计算、什么时候能给出可信置信、怎样把真实本体几何纳入安全导航、怎样用分布式统计而不是少量成功率证明能力、长期场景图怎样在动态家庭中更新”。

本轮对 Kinbot 有 5 个增量判断：

1. **端侧 VLA / VLM 调用应从固定频率改为阶段感知算力门控**：`ElegantVLA` 提示 Kinbot 不应把每一帧、每一步都交给同等强度的视觉语言推理；应记录 `reasoning_compute_mode`、`vision_llm_reuse_span`、`action_refinement_level`、`goal_sensitive_phase_detected` 和 `control_frequency_after_gating`。
2. **任务成功置信要独立于动作输出本身**：`VLAConf` 将 frozen VLA 内部表征接一个轻量置信头，用单次前向估计 step-wise anomaly / success confidence。Kinbot 可把它收敛成 `task_success_confidence`、`step_anomaly_score`、`confidence_calibrated` 和 `fallback_due_to_low_confidence`。
3. **导航安全应显式建模机器人真实外形，而不是只做圆形 / 膨胀占据近似**：`EXACT-MPPI` 对非凸、带附件或复杂 footprint 的本体安全导航有启发。Kinbot 头部、屏幕、底盘外缘和药箱 / 传感结构的空间外形，需要进入 `footprint_clearance_margin`、`shape_aware_collision_cost` 和 `convex_proxy_failure_case`。
4. **Phase 5 实机评测不应只看少量二元成功率**：`PhAIL` 用 time-to-success CDF、human-relative throughput、bootstrap confidence intervals 和 paired significance test 处理真实机器人 VLA 对比。Kinbot 应把家庭任务评测从 `success/fail` 扩展到分布、置信区间和人类基线。
5. **长期场景记忆需要同时处理实例关联、拓扑变化和 grounding**：`DGSG-Mind` 把动态 3D Gaussian scene graph 与多模态 reasoning agent 合并，提示 Kinbot 的家庭空间记忆不能只固定一张静态语义图，应记录 `scene_instance_relinked`、`object_topology_changed`、`localized_map_refinement`、`grounding_evidence_rendered` 和 `stale_memory_region_flag`。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 端侧推理调度、动态计算、资源感知 reasoning | 值得进入专题 | 将 `ElegantVLA` 与前序端侧 DAG 调度、`When Should a Robot Think?`、VLA latency 和 edge GEMM 合并，形成 `platform_runtime` 的 reasoning budget profiling 表；优先定义字段，不新增在线重型 agent。 |
| VLA / VLM 置信、失败预测、拒绝 / 回退 | 值得进入专题 | 将 `VLAConf` 与前序 `SAFEVPR`、具身拒答、VLM safety oracle 合并，形成统一 `confidence -> fallback -> audit` 机制。 |
| 纯视觉导航、外形安全裕量、动态 / 窄空间局部规划 | 接近专题成熟 | `EXACT-MPPI`、前序 `Chance-Constrained MPPI`、`CP-RPN`、`RCSP` 已足够支撑 Phase 5 局部导航安全回放字段包；后续重点是端侧 profiling 和实机窄通道回放。 |
| 长期空间记忆、动态场景图、开放词汇 grounding | 值得专题跟踪 | `DGSG-Mind` 与前序动态空间记忆、功能 3D 场景图、纯视觉 3D scene graph 合并，先做轻量字段与隐私边界，不把 3DGS 写成一代在线必选链路。 |
| 泛统一 VLA、manipulation foundation model、humanoid / dexterous 操作 | 已饱和 | 只有新增 Kinbot 家庭移动实机闭环、端侧资源实测、安全审计字段或老人照护任务映射时才进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把动态 VLA 调度、独立置信头、MPPI 几何控制、分布式实机评测平台、动态 3DGS 场景图和仿真 provenance 全部写成 Kinbot 一代在线架构，会明显过复杂”。建议只吸收为 5 类轻量验证对象：端侧算力门控字段、任务成功置信字段、真实外形安全裕量字段、分布式实机评测口径、动态场景记忆 stale / relink 字段。暂不新增通用 VLA foundation model 主链路、3DGS 在线地图主链路或 GPU 依赖型 MPPI 控制主链路。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | ElegantVLA: Learning When to Think for Efficient Vision-Language-Action Models | 进入端侧推理调度专题，转成阶段感知 VLA / VLM 算力门控和控制频率 profiling 字段。 |
| A- | VLAConf: Calibrated Task-Success Confidence for Vision-Language-Action Models | 进入安全置信与失败预测专题，补充任务成功置信、step anomaly、低置信 fallback 和校准字段。 |
| B+ | EXACT-MPPI: Exact Signed-Distance Navigation for Arbitrary-Footprint Robots from Point Clouds via Path Integral Control | 进入局部导航安全专题，吸收真实 footprint、窄空间 clearance 和 proxy failure case 字段。 |
| B+ | PhAIL: A Real-Robot VLA Benchmark and Distributional Methodology | 进入 Phase 5 评测方法候选，把少量二元成功率升级为 time-to-success 分布、人类基线和置信区间。 |
| B+ | DGSG-Mind: Dynamic 3D Gaussian Scene Graphs for Long-Term Scene Understanding and Grounding | 进入长期空间记忆专题，作为动态场景图、实例 relink 和 stale memory 的研究输入；暂不升级为一代在线 3DGS 主线。 |

## 3. 论文卡片

### 3.1 ElegantVLA: Learning When to Think for Efficient Vision-Language-Action Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.29438](https://arxiv.org/abs/2605.29438) |
| 本轮 listing 口径 | 2026-05-29 官方 listing new submission；abs 页显示 `Submitted on 28 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | phase-adaptive inference, dynamic compute scheduling, temporal reuse, VLA acceleration, control frequency |

摘要要点转述：

论文面向 VLA 模型在真实机器人控制中的算力与频率矛盾：大视觉语言骨干和迭代式 action head 如果在每个控制步都完整运行，会拉低控制频率，也会让端侧部署更难。作者提出 `ElegantVLA`，把 VLA 推理拆成阶段感知的动态计算调度：调度器观察时序表征相似度、机器人运动状态和 episode 进度，在视觉编码、LLM 推理和动作生成之间选择不同计算档位。稳定阶段可以复用前序视觉语言表征或中间 denoising 状态，目标敏感阶段则保留更完整推理。论文报告其在 `GR00T`、`CogACT` 和真实任务上取得明显加速，并把控制频率从低频提升到更高频段。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`interaction_orchestration` 与 `mobility_navigation` 中“端侧大模型 / VLA / VLM 什么时候值得调用”的问题。
2. Kinbot 一代默认 `12GB RAM + 32GB Flash`，不能把所有帧都按最重推理路径处理；家庭导航、巡护和提醒任务需要低延迟稳定执行。
3. 对应 Phase 5：建议增加 `reasoning_compute_mode`、`vision_llm_reuse_span`、`action_refinement_level`、`goal_sensitive_phase_detected`、`control_frequency_after_gating` 和 `fallback_to_full_compute_reason` 字段。

资源消耗与部署信号：

1. 论文直接讨论推理开销和控制频率，是本轮最贴近端侧资源的论文。
2. 其方法仍依赖现代 VLA pipeline，Kinbot 不应据此新增一代在线 VLA 主控；更现实的落点是给现有 VLM / planner / policy 调用增加计算档位和 profiling。
3. 需要在目标 SoC 上验证调度器本身的收益，避免为了省算力而新增不可解释的调度复杂度。

优势：

1. 把“要不要思考”从静态规则推进到可观测、可度量的阶段调度。
2. 与 Kinbot 端侧资源线和实时控制频率高度相关。
3. 可转化为离线回放字段，不必直接引入论文完整 VLA 系统。

劣势与风险：

1. 论文主要面向 manipulation VLA，不等同于 Kinbot 家庭移动和安全巡护。
2. 动态复用历史表征可能在场景突变、人员进入或障碍变化时漏检风险。
3. 如果调度策略不可审计，会增加故障归因难度。

推荐理由：

建议作为 A- 级输入。它应进入端侧推理调度专题，帮助 Kinbot 把“推理预算、控制频率、目标敏感阶段”写成可测字段，而不是新增重型在线 VLA 架构。

### 3.2 VLAConf: Calibrated Task-Success Confidence for Vision-Language-Action Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.29605](https://arxiv.org/abs/2605.29605) |
| 本轮 listing 口径 | 2026-05-29 官方 listing new submission；abs 页显示 `Submitted on 28 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | task-success confidence, step-wise anomaly, post-hoc calibration, single forward pass, VLA safety |

摘要要点转述：

论文关注 VLA 模型执行开放世界任务时的成功置信估计。已有方法常依赖 ensemble、重复采样或 action token 概率，推理成本高，并且难以跨离散 / 连续动作空间通用。`VLAConf` 使用 frozen VLA 内部表征训练轻量置信头，通过单次前向产生 step-wise anomaly score，再做后验校准，输出任务成功可能性。论文在 `LIBERO` 和真实机器人实验中验证了置信信号质量和推理效率。其核心价值不是提高某个操作任务成功率，而是给机器人提供“何时不应继续自信执行”的独立安全信号。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`interaction_orchestration` 与 `observability_data_governance` 中“模型不知道自己快失败时怎么办”的问题。
2. Kinbot 在提醒、巡护、看护和自然语言任务中，需要判断“继续执行、放慢、重看、澄清、转人工或放弃”。
3. 对应 Phase 5：建议增加 `task_success_confidence`、`step_anomaly_score`、`confidence_calibrated`、`low_confidence_fallback_type`、`failure_anticipated_before_stop` 和 `confidence_head_version` 字段。

资源消耗与部署信号：

1. 单次前向 + 轻量 confidence head 的设计比 repeated sampling 更适合端侧或边缘侧部署。
2. 置信头需要校准数据和跨任务验证，Kinbot 不应把单一 benchmark 的置信阈值直接搬到家庭场景。
3. 若与 VPR、语义地图、任务执行状态统一校准，可成为 Phase 5 安全回放中的通用字段。

优势：

1. 把 VLA 输出和成功置信分开，便于安全层做拒绝和 fallback。
2. 与前序 `SAFEVPR` 的视觉地点识别拒绝机制可形成统一置信治理口径。
3. 能把“模型失败”从事后标签提前到执行过程中的 anomaly 轨迹。

劣势与风险：

1. 论文仍以 manipulation 任务为主，Kinbot 移动和交互任务需要重新校准。
2. 置信高不等于安全可执行，还需叠加授权、物理风险和隐私边界。
3. 若置信信号频繁误报，会造成机器人过度停顿或过多询问。

推荐理由：

建议作为 A- 级输入。它应进入安全置信与失败预测专题，重点转成轻量置信字段和 fallback 策略，不改变 Kinbot 一代主线。

### 3.3 EXACT-MPPI: Exact Signed-Distance Navigation for Arbitrary-Footprint Robots from Point Clouds via Path Integral Control

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.29663](https://arxiv.org/abs/2605.29663) |
| 本轮 listing 口径 | 2026-05-29 官方 listing new submission；abs 页显示 `Submitted on 28 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | arbitrary footprint, signed distance, point cloud navigation, MPPI, shape-aware collision cost |

摘要要点转述：

论文指出很多地面机器人实际外形不是简单圆形或矩形：载荷、附件、外壳和执行结构会让 footprint 变成复杂甚至非凸形状。传统局部规划常把机器人膨胀成凸形或栅格占据，这会在窄空间中过度保守，也可能掩盖真实碰撞风险。作者提出 `EXACT-MPPI`，从局部点云和稀疏引导直接输出运动命令，在 MPPI rollout 中嵌入解析 signed-distance evaluator，用多边形描述真实 footprint，并通过批量 GPU / JAX 计算保持实时性。实验显示它能在密集静态和动态障碍中保留更多可行运动，并可通过更换 footprint 描述和运动模型适配多类平台。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`safety_compliance_authorization` 与本体结构之间“真实外形安全裕量如何进入导航”的问题。
2. Kinbot 不是抽象点机器人：头部、躯干屏、底盘外缘、药箱 / 传感结构和转弯姿态都会影响窄通道通行。
3. 对应 Phase 5：建议增加 `footprint_clearance_margin`、`shape_aware_collision_cost`、`convex_proxy_failure_case`、`narrow_passage_feasible_but_rejected`、`body_frame_obstacle_distance_min` 和 `footprint_model_version` 字段。

资源消耗与部署信号：

1. 方法依赖点云和批量采样控制，端侧 GPU / NPU / CPU 资源压力需要实测。
2. Kinbot 一代纯视觉主线不应因此新增 LiDAR；若使用，应只把双目 / 视觉重建形成的局部几何输入用于离线评测或受控局部 planner 对照。
3. 真实价值在于“外形安全裕量字段”，不在于直接替换当前局部规划主栈。

优势：

1. 把本体结构和导航安全连接起来，避免软件规划只按理想几何建模。
2. 对家庭窄通道、桌椅边缘、门框和近身绕行有直接启发。
3. 可作为 Phase 5 窄空间回放和 footprint 参数验证的参考。

劣势与风险：

1. MPPI 与批量 signed-distance 计算可能超过低成本端侧预算。
2. 点云质量受视觉重建、低光、反光和动态遮挡影响。
3. 过度追求精确外形可能让一代导航栈复杂度上升。

推荐理由：

建议作为 B+ 级输入。它应进入局部导航安全专题，重点吸收真实 footprint、clearance margin 和 proxy failure case，而不是把 GPU 依赖型 MPPI 写成一代主规划器。

### 3.4 PhAIL: A Real-Robot VLA Benchmark and Distributional Methodology

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.29710](https://arxiv.org/abs/2605.29710) |
| 本轮 listing 口径 | 2026-05-29 官方 listing new submission；abs 页显示 `Submitted on 28 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | real-robot benchmark, time-to-success CDF, human-relative throughput, bootstrap confidence interval, paired significance test |

摘要要点转述：

论文批评真实机器人 VLA 评测常用固定超时下的二元成功率，样本量通常很小，缺少置信区间和配对统计比较，导致相近模型之间难以可靠区分。`PhAIL` 提出用 time-to-success 累积分布作为评测基础，再用 human-relative throughput 作为相对人类遥操作的吞吐指标，并用 bootstrap confidence intervals 和 per-object macro-averaged significance test 判断模型差异。论文在真实 `Franka FR3` 平台上提供数据、分析流程和参考实现。对 Kinbot 来说，其价值是评测方法，而不是具体机械臂任务。

解决 Kinbot 的什么问题：

1. 对应 Phase 5 验证规划中“少量演示成功是否足以证明能力”的问题。
2. Kinbot 家庭试点若只记录 `success/fail`，很难解释“同样成功但一个慢很多、一个更不稳定、一个需要更多人工介入”的差异。
3. 对应 Phase 5：建议增加 `time_to_success_distribution`、`human_relative_throughput`、`bootstrap_ci_lower_upper`、`paired_significance_result`、`per_object_or_per_scene_macro_average` 和 `unresolved_comparison_due_to_budget` 字段。

资源消耗与部署信号：

1. 论文不增加端侧运行负担，但会增加试验设计、数据记录和统计分析要求。
2. 对 Kinbot 更适合从小规模实机试点开始建立人类基线和时间分布，而不是一次性搭完整排行榜。
3. 若与自动回放日志结合，可提高 Phase 5 证据包的可信度。

优势：

1. 直接修正“少量二元成功率”的证据不足问题。
2. 可迁移到导航、巡护、提醒、老人看护等 Kinbot 任务。
3. 有助于向 EMT / 阶段门说明能力提升是否统计上可信。

劣势与风险：

1. 论文平台和任务是操作型 VLA，Kinbot 需要自定义家庭移动任务指标。
2. 统计方法会增加试验组织成本，不能替代安全 case-by-case 审查。
3. 人类基线如何选取、是否代表目标用户，需要单独定义。

推荐理由：

建议作为 B+ 级输入。它应进入 Phase 5 评测方法候选，优先把二元成功率升级为分布、置信区间和人类基线，不新增产品功能。

### 3.5 DGSG-Mind: Dynamic 3D Gaussian Scene Graphs for Long-Term Scene Understanding and Grounding

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.29879](https://arxiv.org/abs/2605.29879) |
| 本轮 listing 口径 | 2026-05-29 官方 listing cross submission；abs 页显示 `Submitted on 28 May 2026`，`cs.CV` 主类，cross-list 到 `cs.RO` |
| 分类 | `cs.CV`, `cs.RO` |
| 方法关键词 | dynamic 3D Gaussian scene graph, long-term scene understanding, instance association, localized refinement, grounding |

摘要要点转述：

论文面向长期具身场景理解中的动态变化问题。现有 3D 场景理解方法常在实例关联、跨视角融合、拓扑变化和自重建地图 grounding 上不稳定，难以支撑机器人长期任务。`DGSG-Mind` 将概率 voxel grid、3D Gaussians、增量语义地图和层级 scene graph 结合起来，用高斯重定位和局部 masked refinement 处理动态变化，再通过多模态 reasoning agent 使用结构关系、空间语义信息和渲染证据进行 grounding。论文在开放词汇 3D segmentation、scene reconstruction 和 zero-shot 3D visual grounding 上报告了较强表现，并展示真实机器人部署。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`mobility_navigation` 与 `interaction_orchestration` 中“家庭空间记忆如何在家具、物品和人员变化后保持可用”的问题。
2. Kinbot 长期运行不能只保存静态语义地图；需要知道哪些物体换了位置、哪些实例需要重新关联、哪些区域记忆过期。
3. 对应 Phase 5：建议增加 `scene_instance_relinked`、`object_topology_changed`、`localized_map_refinement`、`grounding_evidence_rendered`、`stale_memory_region_flag` 和 `dynamic_scene_graph_update_reason` 字段。

资源消耗与部署信号：

1. 3D Gaussian + scene graph + reasoning agent 对端侧资源和数据治理压力较高。
2. Kinbot 一代不应把 3DGS 动态地图写成在线必选链路；更适合先把“动态实例关联、局部更新、证据渲染”转成回放和专题研究字段。
3. 家庭 3D 记忆涉及隐私，默认仍需端侧处理原始敏感数据，只允许评估非隐私结构化统计回流。

优势：

1. 直接处理长期场景变化和 grounding，比静态 3D scene graph 更贴近家庭使用。
2. 能与前序空间记忆、物品归属和主动询问专题合并。
3. 给“地图哪部分已经不可信”提供了更具体的工程语言。

劣势与风险：

1. cross-list 论文，主类为 `cs.CV`；工程系统复杂度明显高于 Kinbot 一代当前边界。
2. 3DGS 资源、存储和隐私成本需要严格评估。
3. 真实家庭中的反光、遮挡、低光和频繁挪动物品可能使实例关联不稳定。

推荐理由：

建议作为 B+ 级输入。它应进入长期空间记忆专题，保留为动态场景图和 grounding 研究输入；短期只吸收 stale / relink / local refinement 字段，不改变一代纯视觉与端侧隐私主线。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| The Open Motion Planning Library 2.0 | [2605.29301](https://arxiv.org/abs/2605.29301) | 2026-05-29 new submission | `OMPL 2.0` 对工程工具链重要，但更像通用 planning library 更新；本轮已有 `EXACT-MPPI` 覆盖更具体的真实 footprint 与窄空间安全导航增量。 |
| Replicable Simulation-Based Robot Validation through Provenance | [2605.29973](https://arxiv.org/abs/2605.29973) | 2026-05-29 new submission | provenance / FAIR metadata 对 Phase 5 证据链有价值，但本轮主卡片优先保留能直接改变导航、记忆、安全和端侧资源字段的论文；建议作为验证流程补充候选。 |
| 3DVLA: Enhancing Vision-Language-Action Models via 3D Spatial and Instance Understanding | [2605.29416](https://arxiv.org/abs/2605.29416) | 2026-05-29 new submission | 3D 空间与实例理解对 VLA 有价值，但核心仍偏 manipulation VLA；本轮 `DGSG-Mind` 更直接对应 Kinbot 长期场景记忆。 |
| Qwen-VLA: Unifying Vision-Language-Action Modeling across Tasks, Environments, and Robot Embodiments | [2605.30280](https://arxiv.org/abs/2605.30280) | 2026-05-29 new submission | 大统一 VLA 模型覆盖导航和操作，但容易推动一代在线模型层膨胀；本轮只保留为前瞻观察，不写成 Kinbot 一代主链路。 |
| Embodied3DBench: Benchmarking Low-Level Embodied Spatial Intelligence of Vision Language Models | [2605.29074](https://arxiv.org/abs/2605.29074) | 2026-05-29 cross submission | 低层 3D 空间智能评测有价值，但 cross-list 且更偏 benchmark；本轮已用 `PhAIL` 覆盖实机评测方法，用 `DGSG-Mind` 覆盖动态空间记忆。 |
| Energy-Aware NECO for Single-Pass Pixel-wise Out-of-Distribution Detection in Semantic Segmentation | [2605.29773](https://arxiv.org/abs/2605.29773) | 2026-05-29 cross submission | 单次前向 OOD segmentation 对端侧视觉安全有启发，但实验偏语义分割 OOD；本轮 `VLAConf` 和 `EXACT-MPPI` 对 Kinbot 安全闭环更直接。 |
| Planning with the Views via Scene Self-Exploration | [2605.29563](https://arxiv.org/abs/2605.29563) | 2026-05-29 cross submission | 主动视角规划与探索相关，但本月主动感知 / 探索主题已多次覆盖；未新增足以改变一代导航判断的字段。 |
| When Should a Robot Think? Resource-Aware Reasoning via Reinforcement Learning for Embodied Robotic Decision-Making | [2603.16673](https://arxiv.org/abs/2603.16673) | 2026-05-29 replacement | 资源感知 reasoning 与 Kinbot 高度相关，但属于 replacement，且与本轮 `ElegantVLA` 主题重叠；作为端侧推理调度专题参考，不重复主卡片。 |
| TACO: Temporal Consensus Optimization for Continual Neural Mapping | [2602.04516](https://arxiv.org/abs/2602.04516) | 2026-05-29 replacement | continual neural mapping 对动态场景记忆有价值，但 replacement 且主题已由 `DGSG-Mind` 覆盖；不因补版扩张主卡片。 |
| Sentinel-VLA: A Metacognitive VLA Model with Active Status Monitoring for Dynamic Reasoning and Error Recovery | [2605.01191](https://arxiv.org/abs/2605.01191) | 2026-05-29 replacement | 状态监控和 error recovery 有治理价值，但属于 replacement，且 VLA 操作治理本月已饱和；除非后续出现家庭移动实机证据，不再重复收录。 |
| CA-AC-MPC: CUDA-Accelerated Actor-Critic Model Predictive Control | [2605.29155](https://arxiv.org/abs/2605.29155) | 2026-05-29 new submission | CUDA 加速控制有端侧性能信号，但偏 UAV / 高性能控制训练推理；Kinbot 当前不因其新增 GPU 依赖型控制主链路。 |
| DynaFLIP: Rethinking Robotics Perception via Tri-Modal-Dynamics Guided Representation | [2605.30350](https://arxiv.org/abs/2605.30350) | 2026-05-29 new submission | 多模态动态表征值得观察，但尚未比本轮场景记忆、置信校准和端侧调度主卡片更直接改变 Kinbot 判断。 |

## 5. 对 Kinbot 的落地 / 文档建议

本轮建议只作为研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。原因是 5 篇主卡片只新增 Phase 5 回放字段、专题候选和评测语言，没有形成需要改变一代纯视觉主线、端侧 / 云边界、传感器主线、成本基线或 Phase 5 门控的稳定产品判断。

建议后续轻量落地动作：

1. 在 `platform_runtime` / 端侧推理调度专题中补充 `reasoning_compute_mode`、`vision_llm_reuse_span`、`action_refinement_level`、`goal_sensitive_phase_detected` 和 `control_frequency_after_gating`。
2. 在安全置信与失败预测专题中补充 `task_success_confidence`、`step_anomaly_score`、`confidence_calibrated`、`low_confidence_fallback_type` 与 `failure_anticipated_before_stop`，并与 `SAFEVPR` 的 VPR 拒绝字段统一口径。
3. 在局部导航安全回放字段中补充 `footprint_clearance_margin`、`shape_aware_collision_cost`、`convex_proxy_failure_case`、`narrow_passage_feasible_but_rejected`，并要求结构 / 导航对同一 footprint 模型版本负责。
4. 在 Phase 5 评测计划中补充 `time_to_success_distribution`、`human_relative_throughput`、`bootstrap_ci_lower_upper` 和 paired significance test 口径，避免只用少量 `success/fail` 演示说明能力。
5. 在长期空间记忆专题中补充 `scene_instance_relinked`、`object_topology_changed`、`localized_map_refinement`、`grounding_evidence_rendered` 和 `stale_memory_region_flag`，但不把 3DGS 动态地图升级为一代在线必选链路。

本轮未进入主线的原因：这些论文主要改变“怎么评测和记录端侧推理、模型置信、外形安全、实机评测分布和动态空间记忆”，不改变“Kinbot 一代必须纯视觉、端侧处理敏感原始数据、12GB + 32GB 默认量产线、移动而非操作”的主线边界。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent` 官方 listing：[https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
3. `ElegantVLA: Learning When to Think for Efficient Vision-Language-Action Models`：[https://arxiv.org/abs/2605.29438](https://arxiv.org/abs/2605.29438)
4. `VLAConf: Calibrated Task-Success Confidence for Vision-Language-Action Models`：[https://arxiv.org/abs/2605.29605](https://arxiv.org/abs/2605.29605)
5. `EXACT-MPPI: Exact Signed-Distance Navigation for Arbitrary-Footprint Robots from Point Clouds via Path Integral Control`：[https://arxiv.org/abs/2605.29663](https://arxiv.org/abs/2605.29663)
6. `PhAIL: A Real-Robot VLA Benchmark and Distributional Methodology`：[https://arxiv.org/abs/2605.29710](https://arxiv.org/abs/2605.29710)
7. `DGSG-Mind: Dynamic 3D Gaussian Scene Graphs for Long-Term Scene Understanding and Grounding`：[https://arxiv.org/abs/2605.29879](https://arxiv.org/abs/2605.29879)
8. 候选排除表条目：[`OMPL 2.0`](https://arxiv.org/abs/2605.29301)、[`Replicable Simulation-Based Robot Validation through Provenance`](https://arxiv.org/abs/2605.29973)、[`3DVLA`](https://arxiv.org/abs/2605.29416)、[`Qwen-VLA`](https://arxiv.org/abs/2605.30280)、[`Embodied3DBench`](https://arxiv.org/abs/2605.29074)、[`Energy-Aware NECO`](https://arxiv.org/abs/2605.29773)、[`Planning with the Views`](https://arxiv.org/abs/2605.29563)、[`When Should a Robot Think?`](https://arxiv.org/abs/2603.16673)、[`TACO`](https://arxiv.org/abs/2602.04516)、[`Sentinel-VLA`](https://arxiv.org/abs/2605.01191)、[`CA-AC-MPC`](https://arxiv.org/abs/2605.29155)、[`DynaFLIP`](https://arxiv.org/abs/2605.30350)
