# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-02
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-02 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮本地日更时官方最新 Robotics listing 为 `Monday, 1 June 2026`，合计 `91` 篇 entries；其中 new submissions `47` 篇、cross submissions `12` 篇、replacement submissions `32` 篇。本轮按 `3-5` 篇强相关论文 + 候选排除表口径，收录室内语义全局定位、`VLA` 运行时失败检测、视觉语言模型碰撞 grounding、端侧推理冗余消除和 batch-1 物理 AI 推理资源相关 5 篇论文，并记录周度滚动判断。

---

## 1. 检索口径

本轮检索日期：2026-06-02。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮本地日更时官方 `cs.RO/new` 最新 Robotics listing 为 `Monday, 1 June 2026`，合计 `91` 篇 entries；其中 new submissions `47` 篇、cross submissions `12` 篇、replacement submissions `32` 篇。
3. 官方 `cs.RO/recent` 中 `Mon, 1 Jun 2026` 显示 `59` 篇 recent entries，对应 new submissions 与 cross submissions，不含 replacement；本轮以 `cs.RO/new` 的完整结构作为主口径。
4. 本轮已是新的 Robotics listing，不再继续复用 2026-05-29 listing；先排除 2026-05-30、2026-05-31、2026-06-01 已覆盖的端侧 VLA 动态算力调度、VLA 成功置信、真实 footprint 安全导航、实机 VLA 评测、动态场景图长期记忆、视觉分辨率门控、扩散策略越界、验证 provenance、近身互动安全、穿戴校准和 shadow run 组织等直接重复主题。
5. `replacement` / `cross-list` 只在确实新增 Kinbot 评测项、治理项或端侧资源判断时收录。本轮主卡片中的 `Probing Collision Grounding` 和 `Memory-Bound but Not Bandwidth-Limited` 来自 cross submissions，原因分别是补充物理碰撞 grounding 评测口径和 batch-1 端侧推理资源口径；replacement 条目均进入候选排除表或暂不收录。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全、端侧资源或 Phase 5 验证组织的判断，而不是继续增加泛 `VLA`、manipulation、humanoid、自动驾驶、户外 SLAM 或纯工具链论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：语义全局定位歧义、运行时失败提前量、碰撞 grounding 覆盖、端侧 reasoning 调用档位、batch-1 decode 延迟与量化 kernel 验证。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 `91` 篇 entries 自动扩张主卡片数量；泛操作 VLA、灵巧手、humanoid、UAV、自动驾驶、户外建图、手术机器人和工业装配论文多数不改变 Kinbot 一代家庭移动闭环。
2. `BOKBO` 对 VLA 安全弃权有技术价值，但和本轮 `Hide-and-Seek` 同属 VLA 运行时安全，且更偏 K-sample action chunk / manipulation；本轮保留为候选，不把同一方向拆成多个产品级在线组件。
3. `TAGA` 是 replacement，提出 group crossing rate 等社会导航指标，对家庭多方场景有参考价值；但其新版本仍主要是人群仿真和组边界规避，本轮先进入候选排除表，不把 replacement 写成新的主线判断。
4. `PInVerify`、`DisPlace`、`TARIC`、`AR Forcing`、`CoMo3R-SLAM`、`Triangle Splatting SLAM` 等都有相邻价值，但分别偏实例识别 benchmark、视觉地点检索、户外 VLN、world model 或高成本建图；不改变当前纯视觉家庭室内主线和端侧资源边界。

## 2. 本轮总判断

本轮官方 Robotics listing 从 2026-05-29 更新到 `Monday, 1 June 2026`。相比前几天同一 listing 的补录，本轮新增判断更集中在“真实家庭部署时怎么知道自己在哪里、什么时候该停、什么时候该少想、端侧推理是否真的省资源”：

1. **室内语义定位要显式处理几何 / 语义混淆**：`VLM-GLoc` 提醒 Kinbot 在重复房间、相似门、相似柜体、走廊和临时杂物遮挡场景中，不能只依赖几何特征或单次 VLM 描述。语义粒子提议、永久物体筛选和定位歧义评分应进入验证字段。
2. **VLA / VLM 执行监控需要定位失败发生的时间点**：`Hide-and-Seek` 用粗粒度轨迹标签学习局部失败信号，提示 Kinbot 的 fallback 不能只在任务最终失败后记录，而应记录低置信动作、异常片段、提前量和触发回退的时间。
3. **VLM 看懂场景不等于懂碰撞**：`Probing Collision Grounding` 显示当前 VLM 在机器人本体几何、视角、人体距离和未来接触判断上仍不可靠。Kinbot 不应把 VLM 作为唯一碰撞安全裁判，应保留几何 / 运动学安全链路和碰撞 grounding 专项评测。
4. **端侧机器人 reasoning 应利用时序冗余，而不是每帧重思考**：`On-Device Robotic Planning` 的 `REIS` 把轻量场景门控、KV 路由和必要时 deliberative reasoning 结合，提示 Kinbot 可把“相邻观察是否产生同一子目标 / 动作”作为节流依据。
5. **batch-1 LLM decode 需要实测 kernel 和 runtime，不应只按参数量 / 量化位宽估算**：`Memory-Bound but Not Bandwidth-Limited` 指出物理 AI 的单流 batch-1 decode 并不随显存带宽线性收益，量化也不必然换来理论级提速。Kinbot 的 `12GB RAM + 32GB Flash` 资源线需要目标 SoC、KV cache、量化 kernel 和 runtime profiling 支撑。

周度滚动判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 泛统一 VLA、manipulation foundation model、灵巧手 / humanoid / 工业操作 | 已饱和 | 只有新增家庭移动闭环、老人照护任务、安全审计字段或端侧资源实测时才进入主卡片。 |
| VLA / VLM 运行时安全、失败检测、弃权 / 回退 | 接近专题成熟 | 将 `Hide-and-Seek`、`BOKBO`、前序 `VLAConf`、具身拒答和策略越界合并成 `confidence / anomaly / abstention -> fallback -> audit` 字段包，避免继续按论文新增在线组件。 |
| 室内语义定位、VPR、安全拒绝、定位歧义 | 值得专题跟踪 | 将 `VLM-GLoc`、前序 `SAFEVPR`、语义导航和视觉地点识别候选合并，形成重复室内空间的定位歧义与恢复验证集。 |
| 碰撞 grounding、近身安全、社会导航 | 值得专题跟踪 | 将 `TouchSafeBench`、前序 `SM2ITH`、`TAGA` 和真实 footprint 安全导航合并，重点验证人 / 物 / 本体几何和未来接触预警。 |
| 端侧推理资源、batch-1 decode、reasoning 触发门控 | 值得专题跟踪 | 将 `REIS`、`Memory-Bound`、前序 `ElegantVLA`、多分辨率视觉和端侧 DAG 调度合并为 `platform_runtime` profiling 表，先测 latency / memory / thermal，不新增重型在线 agent。 |
| 户外 SLAM / 3DGS / 自动驾驶 / UAV | 不进入一代主线 | 仅作为远期技术储备或对照，不改变一代家庭室内纯视觉和 BOM 边界。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 VLM 语义 MCL、VLA failure monitor、TouchSafeBench、REIS reasoning、batch-1 decode profiling、TAGA 社会导航和 BOKBO 弃权层全部写成一代在线架构，会明显过复杂”。建议只吸收 5 类轻量对象：语义定位歧义字段、运行时失败提前量字段、碰撞 grounding 评测字段、reasoning 复用 / 节流字段、batch-1 decode profiling 字段。暂不新增 VLM 唯一安全监控器、通用 VLA 主控、3DGS 在线地图或 cloud-heavy 规划链路。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | VLM-GLoc: Vision-Language Model Enhanced Monte Carlo Localization for Robust Semantic Global Localization in Cluttered Quasi-Static Environments | 进入室内语义定位专题，转成重复空间定位歧义、永久物体证据和语义粒子提议字段。 |
| A- | Hide-and-Seek in Trajectories: Discovering Failure Signals for VLA Runtime Monitoring | 进入运行时安全监控专题，补充局部失败信号、fallback 提前量和 conformal 门控字段。 |
| A- | Probing Collision Grounding in Vision-Language Models for Safe Human-Robot Collaboration | 进入近身安全评测专题，作为 VLM 不可单独承担碰撞裁判的证据，并补充碰撞 grounding 评测字段。 |
| B+ | On-Device Robotic Planning: Eliminating Inference Redundancy for Efficient Decision-Making | 进入端侧 reasoning 调度专题，转成轻量场景门控、KV 复用和重思考触发 profiling 字段。 |
| B+ | Memory-Bound but Not Bandwidth-Limited: The Physical AI Inference Gap in Batch-1 LLM Decode | 进入端侧资源专题，作为 batch-1 LLM decode / KV cache / quant kernel 的实测基线要求。 |

## 3. 论文卡片

### 3.1 VLM-GLoc: Vision-Language Model Enhanced Monte Carlo Localization for Robust Semantic Global Localization in Cluttered Quasi-Static Environments

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.30506](https://arxiv.org/abs/2605.30506) |
| 本轮 listing 口径 | 2026-06-01 官方 listing new submission；本轮属于 2026-06-02 日更收录；abs 页显示 `Submitted on 28 May 2026` |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | semantic Monte Carlo localization, open-vocabulary VLM, text-to-map retrieval, cluttered indoor localization, permanence reasoning |

摘要要点转述：

论文面向杂乱、几何重复且准静态的室内环境中的全局定位问题。作者指出，超市、办公室、学校、医院这类空间常有相似货架、桌椅、门、走廊和临时遮挡，单纯几何特征或固定视觉 pipeline 容易混淆。`VLM-GLoc` 将开放词汇 VLM 作为语义观察前端，给 Monte Carlo Localization 引入语义层级：用文本特征做反向语义提议来初始化粒子，通过对模糊 / 动态物体的质量过滤和永久性推理来增强定位。论文在一个约 `3500 sq. ft.` 超市场景和一个约 `3700 sq. ft.` 实验室场景中验证，分别报告约 `70%` 和 `74%` 的全局定位成功率，优于几何或领域定制基线。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 和 `observability_data_governance` 中“重复室内空间如何恢复定位”的问题。
2. Kinbot 家庭环境也会出现相似门、相似柜体、临时杂物、桌椅移动和低纹理走廊；纯几何重定位可能不足以支撑长期巡护和老人看护。
3. 对应 Phase 5：建议增加 `semantic_mcl_particle_seed_source`、`place_ambiguity_score`、`permanent_object_evidence_used`、`dynamic_clutter_filtered`、`global_localization_success_under_clutter` 和 `localization_recovery_requires_human_confirm` 字段。

资源消耗与部署信号：

1. VLM 语义前端相对传统 VPR / SLAM 更重，不能默认在端侧高频运行。
2. 更现实的落点是定位失败、重定位、空间初始化或低频巡护复核时触发，而不是替代全时局部定位。
3. 论文成功率仍未达到家庭安全闭环可接受水平，Kinbot 应把它作为歧义恢复辅助手段，并保留可审计失败记录和人工确认路径。

优势：

1. 直接击中家庭室内重复空间和临时遮挡导致的重定位难题。
2. 与纯视觉主线相容，不要求新增深度相机或激光雷达产品 fallback。
3. 可转化为回放字段和重定位专项测试，而不是马上引入完整 VLM-MCL 在线系统。

劣势与风险：

1. 实验环境不是家庭老人居住场景，物品语义和空间尺度不同。
2. VLM 语义判断可能引入隐私风险和幻觉，需要端侧处理与证据留痕。
3. 成功率不足以单独承担安全导航定位闭环。

推荐理由：

建议作为 A- 级输入。它应进入室内语义定位专题，帮助 Kinbot 把“重复空间 / 准静态遮挡 / 永久物体证据”写成验证字段；不建议直接升级为一代常开 VLM 定位主链路。

### 3.2 Hide-and-Seek in Trajectories: Discovering Failure Signals for VLA Runtime Monitoring

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.30834](https://arxiv.org/abs/2605.30834) |
| 本轮 listing 口径 | 2026-06-01 官方 listing new submission；本轮属于 2026-06-02 日更收录；abs 页显示 `Submitted on 29 May 2026` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | VLA runtime monitoring, coarse trajectory supervision, localized failure signal, conformal prediction, fallback timing |

摘要要点转述：

论文关注 VLA 模型在真实部署中的执行失败检测。作者指出，现有方法要么依赖昂贵的 action resampling 或外部模型，要么把整条轨迹的成功 / 失败标签均匀传播到每个时间步，导致局部失败信号被淹没。`Hide-and-Seek` 将 VLA 失败检测建模为粗监督学习问题，通过轨迹间和轨迹内对比目标，从只有轨迹级标签的数据中定位可能导致失败的动作片段。论文在 `LIBERO`、`VLABench` 和真实机器人平台上测试 `OpenVLA`、`pi_0`、`pi_0.5` 等策略，并用 conformal prediction 讨论准确率和提前预警之间的权衡。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`interaction_orchestration` 和 `platform_runtime` 中“任务还没最终失败时，系统如何知道该降级 / 请求澄清 / 交给人工”的问题。
2. Kinbot 的提醒、巡护、导航、陪伴互动和健康观察都不能只在结果失败后记账；需要在低置信动作、异常片段或连续犹豫阶段提前触发 fallback。
3. 对应 Phase 5：建议增加 `runtime_failure_signal_timestep`、`failure_signal_localized`、`monitor_conformal_threshold`、`fallback_lead_time_ms`、`false_alarm_cost_estimate` 和 `fallback_due_to_runtime_monitor` 字段。

资源消耗与部署信号：

1. 相比额外采样大量候选动作，粗监督监控头更可能落入端侧轻量监控预算。
2. 论文仍以操作型 VLA benchmark 为主，Kinbot 应先将思路转为任务回放 / 轨迹日志中的异常定位，而不是新增通用 VLA 执行器。
3. 需要验证误报成本：频繁中止会损伤陪伴体验和高端产品感，漏报又会带来安全风险。

优势：

1. 把失败检测从最终结果推进到时间局部信号，适合做 Phase 5 回放字段。
2. conformal prediction 口径有助于把阈值、误报和漏报写成可审计参数。
3. 可与前序 `VLAConf`、策略越界、具身拒答和 VPR 安全拒绝合并成统一 fallback 机制。

劣势与风险：

1. 数据集和任务偏操作，Kinbot 家庭移动和健康提醒场景需要重新标注失败片段。
2. 局部失败信号不等于可解释因果原因，仍需结合传感、状态机和用户上下文。
3. 监控模型本身也需要版本、漂移和误报审计。

推荐理由：

建议作为 A- 级输入。它应进入运行时安全监控专题，帮助 Kinbot 明确“失败发生在什么时候、提前多久可回退、阈值如何校准”；不建议因此新增一条重型 VLA 在线控制主线。

### 3.3 Probing Collision Grounding in Vision-Language Models for Safe Human-Robot Collaboration

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.31196](https://arxiv.org/abs/2605.31196) |
| 本轮 listing 口径 | 2026-06-01 官方 listing cross submission from `cs.CV`；本轮属于 2026-06-02 日更收录；abs 页显示 `Submitted on 29 May 2026` |
| 分类 | `cs.CV`, `cs.AI`, `cs.CL`, `cs.RO` |
| 方法关键词 | collision grounding, TouchSafeBench, human-robot collaboration, imminent contact warning, VLM safety monitor |

摘要要点转述：

论文提出“collision grounding”问题：安全人机协作不只是描述画面，而是要把视觉观察和机器人本体几何、相机视角、场景布局、人与机器人的距离以及时间运动绑定起来，判断当前是否碰撞、是否安全分离、是否即将接触。作者构建 `TouchSafeBench`，在 `Habitat 3.0` 中生成 `2940` 个室内共处 episode，覆盖社会导航和社会 rearrangement，包含多视角 RGB-D、top-down 轨迹图、相机元数据和仿真接触标签。论文测试多种前沿或机器人向 VLM，发现当前模型对当前安全状态和即将碰撞预警都远未可靠，最佳平均 Macro-F1 低于 `50%`，显式深度输入也不会自动变成可靠的本体碰撞证据。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`mobility_navigation` 和近身互动安全中的“VLM 能否作为安全监控器”的问题。
2. Kinbot 会在老人、家属、保姆、宠物和家具附近移动；VLM 可以解释场景，但不能被默认视为碰撞安全裁判。
3. 对应 Phase 5：建议增加 `collision_grounding_viewpoint_complete`、`robot_body_geometry_bound`、`human_proximity_metric_source`、`imminent_collision_warning_horizon_ms`、`vlm_collision_monitor_allowed_scope` 和 `collision_label_from_geometry_chain` 字段。

资源消耗与部署信号：

1. 该论文的核心价值不是新增在线 VLM 监控，而是提醒安全验证必须绑定几何、视角、时间和本体尺寸。
2. 多视角 RGB-D benchmark 不等于 Kinbot 一代产品传感器配置；Kinbot 应用纯视觉 + 本体几何 / 运动学链路构建最小可验证版本。
3. 若未来使用 VLM 解释安全事件，应只作为辅助审计 / 归因，不替代底层碰撞约束、速度限制和 emergency stop。

优势：

1. 直接支撑“VLM 不可单独负责安全”的架构边界判断。
2. 给近身安全回放提供明确评测对象：当前接触、即将接触、人接触、场景接触。
3. 与前序真实 footprint 导航、`SM2ITH` 人类反应预测和社会导航候选可合并成安全验证字段包。

劣势与风险：

1. 数据来自仿真，真实家庭中的遮挡、反光、低光和非刚体接触还需实机验证。
2. 论文使用 RGB-D 和多视角信息，Kinbot 一代纯视觉方案需要做传感器可得性收敛。
3. 如果直接把 benchmark 指标搬到产品，会过度扩张验证平台复杂度。

推荐理由：

建议作为 A- 级输入。它应进入近身安全评测专题，用来约束 VLM 安全监控边界，并补强 Phase 5 碰撞 grounding 回放字段；不建议把 VLM 写成唯一安全裁判。

### 3.4 On-Device Robotic Planning: Eliminating Inference Redundancy for Efficient Decision-Making

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.31460](https://arxiv.org/abs/2605.31460) |
| 本轮 listing 口径 | 2026-06-01 官方 listing new submission；本轮属于 2026-06-02 日更收录；abs 页显示 `Submitted on 29 May 2026` |
| 分类 | `cs.RO`, `eess.SY` |
| 方法关键词 | on-device robotic planning, temporal redundancy, lightweight scene gating, KV-steered routing, deliberative reasoning |

摘要要点转述：

论文关注使用大语言模型和视觉语言模型做机器人语义规划时的高延迟问题。作者观察到，机器人 reasoning 工作负载存在明显时序冗余：相邻观察经常对应相同动作或子目标，不必每一步都重新完整推理。论文提出 `REIS`，用轻量场景门控判断是否需要重新 reasoning，用 KV-steered affordance routing 复用已有语义状态，并在必要时调用 deliberative reasoning。实验在 `ALFRED` 和真实机器人任务中验证，报告该方法能显著降低 reasoning 开销，同时保持有竞争力的任务表现。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime` 与 `interaction_orchestration` 中“端侧 Agent / planner 什么时候应重思考，什么时候可以复用”的问题。
2. Kinbot 的巡护、提醒、陪伴对话和导航常处在低变化场景；如果每帧都调用重 reasoning，会浪费算力、增加延迟和热负担。
3. 对应 Phase 5：建议增加 `reasoning_reuse_span_steps`、`scene_gate_changed`、`subgoal_reused`、`kv_route_hit`、`deliberative_reasoning_triggered` 和 `stale_reasoning_detected` 字段。

资源消耗与部署信号：

1. 论文直接面向 on-device planning，和 Kinbot `12GB RAM + 32GB Flash` 资源线高度相关。
2. 轻量门控的收益必须在目标 SoC、真实摄像头输入和家庭任务频率下实测；不能只以任务成功率代替 latency / memory / thermal。
3. 复用 reasoning 有 stale risk，家人突然进入、老人跌倒、障碍移动、门开关变化等场景必须强制重新评估。

优势：

1. 给端侧 reasoning 节流提供了明确工程结构：轻量门控、语义复用、必要时重思考。
2. 可以和前序 `ElegantVLA`、动态分辨率、端侧 DAG 调度合并为统一 runtime profiling。
3. 不要求新增硬件，适合作为回放字段和性能实验。

劣势与风险：

1. 论文任务和 Kinbot 产品闭环不同，真实家庭任务需要自建 benchmark。
2. KV / 语义状态复用会引入版本、过期和错误传播问题。
3. 如果门控逻辑不可解释，故障归因会变难。

推荐理由：

建议作为 B+ 级输入。它应进入端侧 reasoning 调度专题，用来定义重 reasoning 的触发条件和复用边界；不建议直接导入完整 REIS 作为产品架构事实。

### 3.5 Memory-Bound but Not Bandwidth-Limited: The Physical AI Inference Gap in Batch-1 LLM Decode

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.30571](https://arxiv.org/abs/2605.30571) |
| 本轮 listing 口径 | 2026-06-01 官方 listing cross submission from `cs.AR`；本轮属于 2026-06-02 日更收录；abs 页显示 `Submitted on 28 May 2026` |
| 分类 | `cs.AR`, `cs.AI`, `cs.DC`, `cs.PF`, `cs.RO` |
| 方法关键词 | physical AI inference, batch-1 decode, memory bandwidth, KV cache, quantized kernels, CUDA Graphs |

摘要要点转述：

论文讨论机器人、自动驾驶、具身 agent 和 edge copilot 等物理 AI 系统中常见的单流 batch-1 自回归解码。作者认为，这类负载常被简单概括为“显存带宽受限”，但实际延迟不只由理论带宽决定。论文测试 3 个 `7B-8B` 级 GQA transformer，在 H100、A100、L40S、L4 四类 NVIDIA GPU 上覆盖 `2048` 到 `16384` 上下文长度。结果显示，峰值带宽更高的 GPU 未必按比例接近理论 memory floor；CUDA Graphs 在 H100 上收益明显，在 L4 上收益较小；多种 int4 / nf4 / AWQ 路径也没有自动获得理论上的流量节省，具体 kernel 和 runtime 决定了实际效果。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`observability_data_governance` 和当前量产资源线中的“端侧 LLM / VLM 到底能不能跑、跑多快、量化是否真省”的问题。
2. Kinbot 当前默认 `12GB RAM + 32GB Flash`，不能只用参数量、量化位宽或云端 benchmark 推断端侧响应；需要 batch-1、低并发、实时交互和长上下文场景下的实测。
3. 对应 Phase 5：建议增加 `llm_decode_profile_id`、`batch1_tokens_per_second`、`decode_latency_p95_ms`、`kv_cache_size_mb`、`quant_kernel_name`、`memory_floor_gap_ratio` 和 `runtime_graph_optimization_enabled` 字段。

资源消耗与部署信号：

1. 论文的 GPU 平台不等同于 Kinbot 目标 SoC，但它明确提示端侧推理评估不能只看理论 TOPS / 带宽 / 位宽。
2. 量化路径、KV cache、kernel 实现、runtime graph 优化和上下文长度都需要被纳入 profiling。
3. 对 Kinbot 最实用的落点是形成目标芯片的 batch-1 decode benchmark，而不是据此新增更大模型或更贵芯片。

优势：

1. 直接补强端侧资源判断方法，避免用云端吞吐或大 batch 指标误导机器人部署。
2. 对 `12GB RAM + 32GB Flash` 资源线、长上下文和实时交互 latency 有现实警示。
3. 可转成最小 profiling 表，不改变产品功能边界。

劣势与风险：

1. 论文实验基于 NVIDIA GPU，Kinbot SoC、NPU、CPU、内存体系和 runtime 可能完全不同。
2. 不直接评估视觉编码、ASR/TTS、导航栈并发和热功耗。
3. 若只吸收“batch-1 很难”而不做本机实测，仍无法支撑工程决策。

推荐理由：

建议作为 B+ 级输入。它应进入端侧资源专题，作为 Kinbot 后续 LLM / VLM / Agent runtime profiling 的方法约束；不建议据此上修 BOM 或改写当前量产资源线。

## 4. 候选排除表

| 候选论文 | arXiv | listing 口径 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| BOKBO (Best of K Bad Options): Calibrated Abstention for VLA Policies | [2605.30660](https://arxiv.org/abs/2605.30660) | 2026-06-01 cross submission from `cs.LG` | VLA 安全弃权有价值，但偏 K-sample action chunk 和 manipulation；本轮 `Hide-and-Seek` 更直接覆盖运行时失败定位。后续可并入安全弃权专题，不单独扩主卡片。 |
| TAGA: A Tangent-Based Reactive Approach for Socially Compliant Robot Navigation Around Human Groups | [2503.21168](https://arxiv.org/abs/2503.21168) | 2026-06-01 replacement submission；abs 页显示 v3 `Submitted on 28 May 2026` | Group crossing rate 对家庭多方社会导航有参考价值，但 replacement 且主要是人群仿真 / 组边界规避；先作为近身安全候选指标，不写成主线新增判断。 |
| PInVerify: An Offline Embodied Benchmark for Active Instance Verification | [2605.30639](https://arxiv.org/abs/2605.30639) | 2026-06-01 cross submission from `cs.CV` | 细粒度物体实例验证与家庭找物相邻，但 ObjectNav / 主动询问 / 视觉地点识别已多次覆盖；论文中主动视角选择增益也不稳定，本轮不升级。 |
| Learning-Based Navigation for Indoor Mobile Robots | [2605.30468](https://arxiv.org/abs/2605.30468) | 2026-06-01 new submission | 室内移动导航主题相关，但组合 supervised global planner + DWA + PPO refinement 更像常规学习导航方案；相较 `VLM-GLoc`，没有新增 Kinbot 特定治理或资源字段。 |
| DisPlace: Discriminative Place Projections for Multi-Reference Visual Place Recognition | [2605.30769](https://arxiv.org/abs/2605.30769) | 2026-06-01 cross submission from `cs.CV` | VPR 有价值，但视觉地点识别拒绝和语义定位已由前序 `SAFEVPR` 与本轮 `VLM-GLoc` 覆盖；保留为 VPR 专题候选。 |
| TARIC: Memory-Augmented Traversability-Aware Outdoor VLN under Interrupted Semantic Cues | [2605.31121](https://arxiv.org/abs/2605.31121) | 2026-06-01 new submission | 记忆增强 VLN 和语义中断有前瞻价值，但场景是 outdoor traversability；Kinbot 一代重点是家庭室内，不因此扩户外 VLN 主线。 |
| AR Forcing: Towards Long-Horizon Robot Navigation World Model | [2605.31314](https://arxiv.org/abs/2605.31314) | 2026-06-01 new submission | 长程导航 world model 仍值得跟踪，但 world model / future rollout 主题已接近饱和；本轮不新增产品级在线 world model。 |
| CoMo3R-SLAM / Triangle Splatting SLAM / LiftNav | [2605.30488](https://arxiv.org/abs/2605.30488), [2605.31419](https://arxiv.org/abs/2605.31419), [2605.31376](https://arxiv.org/abs/2605.31376) | 2026-06-01 new / cross submissions | dense SLAM、RGB-D mesh、Gaussian / TSDF 导航均有技术价值，但会引入较重建图和几何表示；不改变一代纯视觉轻量主线。 |
| ELAN4D / HARP-VLA / DeMaVLA / Primitive Subspaces | [2605.30484](https://arxiv.org/abs/2605.30484), [2605.31234](https://arxiv.org/abs/2605.31234), [2605.31286](https://arxiv.org/abs/2605.31286), [2605.30695](https://arxiv.org/abs/2605.30695) | 2026-06-01 new submissions | 均属 VLA / manipulation / transfer 方向，主题已饱和；没有新增家庭移动闭环、老人照护评测或端侧资源实测，不进入主卡片。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮不回写主线架构和 `03_decision_log.md`，仅作为研究输入留存在 `docs/09_research/00_papers/`。
2. 建议室内语义定位专题补充：`semantic_mcl_particle_seed_source`、`place_ambiguity_score`、`permanent_object_evidence_used`、`dynamic_clutter_filtered`、`global_localization_success_under_clutter`、`localization_recovery_requires_human_confirm`。
3. 建议运行时安全监控专题补充：`runtime_failure_signal_timestep`、`failure_signal_localized`、`monitor_conformal_threshold`、`fallback_lead_time_ms`、`false_alarm_cost_estimate`、`fallback_due_to_runtime_monitor`。
4. 建议近身安全评测专题补充：`collision_grounding_viewpoint_complete`、`robot_body_geometry_bound`、`human_proximity_metric_source`、`imminent_collision_warning_horizon_ms`、`vlm_collision_monitor_allowed_scope`、`collision_label_from_geometry_chain`。
5. 建议端侧资源专题补充：`reasoning_reuse_span_steps`、`scene_gate_changed`、`subgoal_reused`、`kv_route_hit`、`llm_decode_profile_id`、`batch1_tokens_per_second`、`decode_latency_p95_ms`、`quant_kernel_name`、`memory_floor_gap_ratio`。
6. 当前周度判断已从“继续扩论文数量”切到“专题字段收敛”：VLA 运行时安全、室内语义定位、碰撞 grounding、端侧 reasoning / decode profiling 值得专题跟踪；泛 VLA、manipulation、humanoid、户外 SLAM 和自动驾驶继续视为饱和或低增量主题。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent` 官方 listing：[https://arxiv.org/list/cs.RO/recent?show=100](https://arxiv.org/list/cs.RO/recent?show=100)
3. `VLM-GLoc: Vision-Language Model Enhanced Monte Carlo Localization for Robust Semantic Global Localization in Cluttered Quasi-Static Environments`：[https://arxiv.org/abs/2605.30506](https://arxiv.org/abs/2605.30506)
4. `Hide-and-Seek in Trajectories: Discovering Failure Signals for VLA Runtime Monitoring`：[https://arxiv.org/abs/2605.30834](https://arxiv.org/abs/2605.30834)
5. `Probing Collision Grounding in Vision-Language Models for Safe Human-Robot Collaboration`：[https://arxiv.org/abs/2605.31196](https://arxiv.org/abs/2605.31196)
6. `On-Device Robotic Planning: Eliminating Inference Redundancy for Efficient Decision-Making`：[https://arxiv.org/abs/2605.31460](https://arxiv.org/abs/2605.31460)
7. `Memory-Bound but Not Bandwidth-Limited: The Physical AI Inference Gap in Batch-1 LLM Decode`：[https://arxiv.org/abs/2605.30571](https://arxiv.org/abs/2605.30571)
8. 候选排除表条目：[`BOKBO`](https://arxiv.org/abs/2605.30660)、[`TAGA`](https://arxiv.org/abs/2503.21168)、[`PInVerify`](https://arxiv.org/abs/2605.30639)、[`Learning-Based Navigation for Indoor Mobile Robots`](https://arxiv.org/abs/2605.30468)、[`DisPlace`](https://arxiv.org/abs/2605.30769)、[`TARIC`](https://arxiv.org/abs/2605.31121)、[`AR Forcing`](https://arxiv.org/abs/2605.31314)
