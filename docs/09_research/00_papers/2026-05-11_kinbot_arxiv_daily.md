# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-11
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-11 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 仍为 `Friday, 8 May 2026`，合计 `68` 篇 entries；按 2026-05-11 日更补录口径，筛选前序纪要未收录且与 Kinbot object-addressable world action model、VLA 关系结构、视觉真实仿真评测、结构保持动力学、不确定性、信息瓶颈、sim-to-real、HOI 生成、低成本触觉和多机器人协同相关的 10 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-11。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 仍显示最新 listing 日期为 `Friday, 8 May 2026`，合计 `68` 篇 entries；其中 new submissions `32` 篇、cross submissions `10` 篇、replacement submissions `26` 篇。
3. arXiv 官方 `cs.RO/recent` 显示最新日期为 `Fri, 8 May 2026`，该日有 `42` 篇 recent entries，随后是 `Thu, 7 May 2026`；未出现 `Saturday, 9 May 2026`、`Sunday, 10 May 2026` 或 `Monday, 11 May 2026` 的 Robotics 新批次。
4. 因无 2026-05-11 Robotics 新 listing，本轮按“日更补录”处理：优先从 `2026-05-08` 批次和 replacement 中补入前序 `2026-04-29` 至 `2026-05-10` Kinbot 每日论文纪要未收录的条目。
5. 关键词与主题包括 `object-addressable world action model`、`triadic relational VLA`、`visually realistic simulation`、`structure-preserving dynamics`、`variational regularization`、`sim-to-real`、`human-object interaction generation`、`contact-free grasp stability`、`electronics-free tactile sensing`、`multi-robot coordination`。

筛选标准：

1. 是否对应 Kinbot 一代或后续演进问题：纯视觉、端侧资源约束、家庭巡护、低频复杂决策、运行时安全、用户目标理解、长期交互和可审计降级。
2. 是否能映射到 Kinbot 现有模块：`decision_orchestration`、`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`observability_data_governance`、`platform_runtime`、`companion_interaction`。
3. 是否提供结构化 world model、关系抽象、仿真真实性、低样本动力学、不确定性、信息过滤、数据生成、低成本传感或协同协议等低成本研究信号。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `Topology-Driven Anti-Entanglement Control for Soft Robots`、`On the Emergence of Pendular Structure in Multi-Contact Locomotion`、`ReActor`、`asRoBallet` 等更偏软体、腿足、humanoid 或球形机器人形态，不写成 Kinbot 一代形态变化。
2. `Robust H-infinity Controller Design for INDI-Controlled Quadrotor`、`A Comparative Study of INDI and NDI`、`Accurate Trajectory Tracking with MPCC for Flapping-Wing MAVs`、`Passive Fault Tolerance through Tension-to-Thrust Feed-Forward` 等偏空中机器人控制，不进入家庭轮式底盘主线。
3. `Generating Roadside LiDAR Datasets`、`Real-world Latency Analysis of Vehicular Visible Light Communication with Multiple LED Transmitters and an Event-Based Camera` 等依赖 LiDAR、事件相机、VLC 或车路基础设施，不进入一代纯视觉默认链路。
4. `GA3T`、`SwarmCoDe`、`Separation Assurance between Heterogeneous Fleets of Small Unmanned Aerial Systems` 等偏异构机群或空域协同，仅保留为长期观察，不纳入本轮主卡片。
5. `A GPU-Accelerated Hybrid Method for a Class of Multi-Depot Vehicle Routing Problems` 具备调度算法价值，但当前更偏大规模物流路径优化；Kinbot 一代家庭单机任务调度无需引入该复杂度。

## 2. 本轮总判断

本轮仍无新的 Robotics 官方批次，因此价值在于继续补齐 2026-05-08 批次中“未被前序日更吸收、但能给 Kinbot 后续验证和研究指标带来启发”的条目。相比 2026-05-10 偏 VLA / WAM 参数高效适配和安全学习，本轮更偏结构化表示与验证工程：对象可寻址 world-action 状态、任务-对象-执行体关系瓶颈、视觉真实仿真评测、结构保持动力学、不确定性、信息瓶颈，以及面向未来操作能力的低成本感知与 sim-to-real 训练线索。

对 Kinbot 最有价值的结论有 6 个：

1. **world model 应从整体视频转向可寻址对象状态**：家庭场景里用户经常指代“这个药盒”“那把椅子”“左边的人”，对象地址与对象内容分离比整体 latent 更利于审计和纠错。
2. **VLA 泛化不应只依赖视觉外观**：显式关系结构能降低对背景和物体外观的过拟合，Kinbot 可借鉴到 `person-object-task` 或 `user-object-room` 关系抽象。
3. **仿真评测必须看视觉真实性**：照明、材质和空间 grounding 会直接影响纯视觉策略评测可信度；仿真相关系数比单一 benchmark 分数更有产品价值。
4. **低样本动力学与不确定性值得保留研究入口**：仅用稀疏位置观测学习稳定长期预测，适合未来视觉定位退化、运动模型漂移和自检场景。
5. **信息瓶颈是端侧模型压缩的候选评价维度**：减少中间特征噪声可能比盲目增大模型更接近 Kinbot 的端侧资源约束。
6. **未来操作能力必须被严格隔离为研究输入**：DexSim2Real、抓取稳定性、低成本触觉对药仓 / 递送想象有启发，但 Kinbot 一代不以移动操作或灵巧操作为主线。

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把对象 slot WAM、TriRelVLA、VISER、LGP、VR、DexSim2Real、HOI 生成、ToF 抓取和 TouchDrive 全部接入产品运行时，会显著过复杂”。建议仅吸收 5 个轻量研究动作：对象可寻址评测字段、关系瓶颈评测字段、视觉仿真真实性检查、低样本不确定性指标、信息瓶颈 / 特征噪声指标。涉及操作、触觉、多机器人 V2X 和真实抓取的内容继续停留在研究区，不回写一代主线。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | OA-WAM: Object-Addressable World Action Model for Robust Robot Manipulation | 作为未来 WAM 结构化表示基线，重点吸收对象地址、内容状态分离和 slot intervention 评测。 |
| A- | TriRelVLA: Triadic Relational Structure for Generalizable Embodied Manipulation | 把 object-hand-task 关系瓶颈转译为 Kinbot 的 user-object-room / task 关系评测字段。 |
| B+ | Toward Visually Realistic Simulation: A Benchmark for Evaluating Robot Manipulation in Simulation | 用于纯视觉仿真验证口径，重点关注照明、材质、PBR asset 与真实相关性。 |
| B+ | Structure-Preserving Gaussian Processes Via Discrete Euler-Lagrange Equations | 作为低样本动力学和不确定性评测输入，不进入实时主链路。 |
| B+ | Information Filtering via Variational Regularization for Robot Manipulation | 用作未来 diffusion / VLA 模型特征噪声和信息瓶颈研究指标。 |
| B | DexSim2Real: Foundation Model-Guided Sim-to-Real Transfer for Generalizable Dexterous Manipulation | 作为 sim-to-real 训练管线参考，不改变一代无灵巧操作边界。 |
| B | MaMi-HOI: Harmonizing Global Kinematics and Local Geometry for Human-Object Interaction Generation | 用于人-物交互数据生成和异常理解研究，不作为动作执行能力。 |
| B- | Contact-Free Grasp Stability Prediction with In-Hand Time-of-Flight Sensors | 仅作为未来低风险递送 / 药仓抓取研究输入，不进入一代默认传感。 |
| B- | TouchDrive: Electronics-Free Tactile Sensing Interface for Assistive Grasping | 作为低成本被动触觉思想观察，不进入当前 BOM 或机械方案。 |
| C+ | Multi-Robot Coordination in V2X Environments | 作为未来社区 / 公共空间协同协议观察，不进入家庭一代架构。 |

## 3. 论文卡片

### 3.1 OA-WAM: Object-Addressable World Action Model for Robust Robot Manipulation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06481](https://arxiv.org/abs/2605.06481) |
| 本轮 listing 口径 | 2026-05-08 new submission，日更补录 |
| 分类 | `cs.RO` |
| 方法关键词 | world action model, object slots, persistent address, flow matching, slot intervention |

摘要要点转述：

论文指出，现有 WAM 常把未来世界表示成整体图像、视频 token 或全局 latent，动作解码器在处理“对某个特定对象行动”的指令时难以稳定寻址，尤其在场景变化时容易把对象身份和背景上下文混在一起。`OA-WAM` 将每帧拆成 `N+1` 个 slot：一个机器人 slot 和 `N` 个对象 slot；每个 slot 同时包含持久地址向量和随时间变化的内容向量，并和文本、图像、本体感知、历史动作 token 进行 block-causal 融合。模型在同一次前向中预测下一帧 slot 状态，并用 flow-matching action head 解码 `16` 步连续动作 chunk。论文报告在 `LIBERO` 上达到 `97.8%`，在 `SimplerEnv` 上达到 `79.3%`，对象 slot intervention 的 swap-binding cosine 达到 `0.87`，明显优于整体表示基线。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 家庭场景中对象指代、房间状态和用户目标的稳定绑定问题。
2. 对应 `world_state_memory`：对象身份、对象当前状态和历史变化应可分离记录。
3. 对应 `decision_orchestration`：未来若引入 WAM / VLA，不应只看整体视频预测像真度，还要看对象可寻址性。

资源消耗与部署信号：

1. `16` 步 action chunk 和 slot transformer 仍偏大模型研究，不适合直接进入端侧实时链路。
2. 对象 slot 不额外增加 token 的设计有资源优势，但总模型体量、显存和延迟仍需单测。
3. swap-binding intervention 可转化为低成本离线评测，而不是直接部署模型。

优势：

1. 把“哪个对象”和“对象现在是什么状态”分开，符合家庭长期记忆与审计需要。
2. 提供明确对象干预测试，优于只报任务成功率。
3. 与 Kinbot 的对象级世界状态、语义地图和用户指令解析有较强概念一致性。

劣势与风险：

1. 当前验证以操作任务为主，与 Kinbot 一代移动服务边界仍有距离。
2. slot 绑定错误会形成稳定但错误的对象身份，必须配套重识别和置信度机制。
3. 端侧实时部署成本未知。

推荐理由：

建议作为 A- 级输入。Kinbot 可把 `object_addressability`、`slot_identity_stability`、`slot_intervention_consistency` 加入未来 WAM / 世界状态评测表，不改变一代产品主线。

### 3.2 TriRelVLA: Triadic Relational Structure for Generalizable Embodied Manipulation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.05714](https://arxiv.org/abs/2605.05714) |
| 本轮 listing 口径 | 2026-05-08 cross submission，日更补录 |
| 分类 | `cs.CV`, `cs.RO` |
| 方法关键词 | VLA, triadic relational structure, graph transformer, relational bottleneck, generalization |

摘要要点转述：

论文关注 VLA 在训练场景中表现较好、但跨场景、跨对象和跨任务组合泛化不足的问题。作者认为原因在于隐式视觉表示把物体外观、背景和布局纠缠在一起，导致动作预测依赖外观统计而非动作相关关系。`TriRelVLA` 显式构造 object-hand-task 三元关系表示，把多模态输入转换为关系原语，再用任务引导 cross-attention 构建关系图，并通过 relation-aware graph transformer 建模节点交互。最后，关系结构被压缩进 bottleneck 空间并投影到 LLM 进行动作预测。实验显示，该结构在微调任务、跨场景、跨对象和跨任务泛化上都有明显收益。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 对“人-物-任务-房间”关系的理解，而不是只识别单个物体类别。
2. 对应 `companion_interaction`：用户语言常省略上下文，需要机器人根据关系推断目标。
3. 对应 `world_state_memory`：家庭长期记忆应保存关系变化，而不是只保存对象列表。

资源消耗与部署信号：

1. graph transformer 和 LLM 投影会增加运行时成本，适合先做离线研究或轻量评测。
2. 论文没有给出可直接用于 Kinbot 的端侧延迟、显存和功耗数据。
3. 关系 bottleneck 本身可作为低成本中间表示评估，不必直接部署完整 VLA。

优势：

1. 明确从外观泛化转向关系泛化，符合家庭场景长期变化特征。
2. 关系瓶颈便于审计，可解释性强于纯 latent。
3. 可迁移到 Kinbot 的 `user-object-room-task` 关系抽象。

劣势与风险：

1. 原任务仍偏操作，不能直接转成家庭巡护或健康管理能力。
2. 关系抽取错误会影响后续决策，需要置信度和人工澄清。
3. 若关系图层级过多，会增加系统复杂度。

推荐理由：

建议作为 A- 级输入。Kinbot 可吸收“关系瓶颈”评测思想，先定义 `relation_generalization`、`context_binding_accuracy`、`ambiguous_reference_resolution` 三个指标。

### 3.3 Toward Visually Realistic Simulation: A Benchmark for Evaluating Robot Manipulation in Simulation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06311](https://arxiv.org/abs/2605.06311) |
| 本轮 listing 口径 | 2026-05-08 new submission，日更补录 |
| 分类 | `cs.RO` |
| 方法关键词 | simulation benchmark, visual realism, PBR, VLA evaluation, sim-to-real correlation |

摘要要点转述：

论文认为现有机器人仿真 benchmark 虽覆盖多类任务，但视觉真实性不足，导致仿真评测对真实世界表现的预测能力不稳定。作者系统分析照明和材质对几何推理与空间 grounding 的影响，并提出 `VISER`，一个视觉真实机器人操作仿真评测基准。VISER 包含超过 `1000` 个带 PBR 材质的高保真 3D asset，并通过多模态大模型辅助材质感知部件分割和材质检索，生成物理上更可信的资产和场景。论文报告该 benchmark 上仿真与真实表现的平均 Pearson 相关系数达到 `0.92`。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 纯视觉主线下，仿真验证是否能预测真实家庭表现的问题。
2. 对应 `observability_data_governance`：仿真评测需要可复现实验条件和真实相关性指标。
3. 对应 `mobility_navigation` 与 `world_state_memory`：照明、材质和反光会影响目标识别、避障和场景理解。

资源消耗与部署信号：

1. `1000+` PBR asset 和高保真场景生成适合离线验证，不是端侧部署负担。
2. 需要资产制作、渲染、标注和真实数据对齐成本。
3. Kinbot 可先吸收评测口径，而不是搭完整高保真仿真平台。

优势：

1. 明确把视觉真实性与真实表现相关性挂钩。
2. 提醒 Kinbot 不能只用简化材质 / 简化光照验证纯视觉能力。
3. `Pearson correlation` 可作为仿真可信度指标。

劣势与风险：

1. 论文任务偏操作，家庭移动、老人看护和健康交互仍需另建场景。
2. 高保真资产建设成本高，短期可能拖慢验证节奏。
3. MLLM 自动生成资产仍可能引入不可控偏差。

推荐理由：

建议作为 B+ 级输入。Kinbot 可在仿真验证清单中加入 `lighting_material_coverage`、`sim_real_correlation`、`visual_grounding_stress_case`，不把高保真仿真写成当前阶段硬门槛。

### 3.4 Structure-Preserving Gaussian Processes Via Discrete Euler-Lagrange Equations

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06246](https://arxiv.org/abs/2605.06246) |
| 本轮 listing 口径 | 2026-05-08 cross submission，日更补录 |
| 分类 | `cs.LG`, `cs.RO` |
| 方法关键词 | Lagrangian Gaussian Processes, uncertainty, sparse position data, stable long-term prediction |

摘要要点转述：

论文提出 `Lagrangian Gaussian Processes`，用离散 forced Euler-Lagrange 方程和变分离散化，把 Lagrange-d'Alembert 原理的几何结构内置到高斯过程动力学学习中。相比普通数据驱动模型，该方法在没有外力时能保留物理结构，减少能量漂移，从而得到更稳定的长期预测。一个关键价值是，它可以只用离散位置快照学习动力学，不依赖速度或动量观测；这对 motion capture、视觉伺服等只有位置测量的场景有意义。实验包括合成与真实案例，以及带迟滞的真实软体机器人，展示了低样本、物理一致和带不确定性的长期预测能力。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 在纯视觉和轮式底盘条件下，如何用稀疏观测监测运动模型漂移。
2. 对应 `mobility_navigation`：视觉定位退化时，需要知道动力学预测是否可信。
3. 对应 `safety_compliance_authorization`：不确定性可用于触发保守速度、暂停或重新观测。

资源消耗与部署信号：

1. Gaussian Process 在大数据高频在线场景可能扩展性受限，更适合离线建模或小样本局部校准。
2. 论文强调仅需位置快照，这是对低传感成本友好的信号。
3. 可先作为异常检测 / 校准模型研究，不进入实时控制主链路。

优势：

1. 将物理一致性与不确定性结合，优于纯黑箱拟合。
2. 对低样本、缺速度观测场景友好。
3. 长期稳定预测与 Kinbot 家庭长期部署需求一致。

劣势与风险：

1. 与家庭服务机器人完整状态空间仍有距离。
2. GP 规模化和实时性需要额外工程验证。
3. 软体机器人实验不能直接代表 Kinbot 轮式底盘。

推荐理由：

建议作为 B+ 级输入。Kinbot 可将 `physics_consistency`、`position_only_dynamics`、`uncertainty_triggered_slowdown` 纳入未来导航退化与自检研究。

### 3.5 Information Filtering via Variational Regularization for Robot Manipulation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2601.21926](https://arxiv.org/abs/2601.21926) |
| 本轮 listing 口径 | 2026-05-08 replacement，日更补录 |
| 分类 | `cs.RO` |
| 方法关键词 | diffusion policy, variational regularization, information bottleneck, feature noise, visuomotor policy |

摘要要点转述：

论文研究基于 3D 视觉表示的 diffusion visuomotor policy。作者观察到，许多方法使用过大的 denoising decoder，虽然模型容量提升可能改善去噪，但也会在中间特征块中引入冗余和噪声。实验发现，在推理时随机 mask backbone feature 或跳过 DiT 中间层，反而可能提升性能，说明中间特征中存在任务无关噪声。论文提出 plug-and-play 的 `Variational Regularization` 模块，对 noisy feature 施加条件高斯分布和 KL 正则，形成自适应信息瓶颈。作者在 `RoboTwin2.0`、`Adroit` 和 `MetaWorld` 等仿真基准以及真实实验中报告了稳定收益。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 端侧模型不能盲目堆大，需要识别中间特征噪声和任务无关信息。
2. 对应 `platform_runtime`：未来 VLA / diffusion policy 评测应同时看成功率、延迟、特征冗余和可压缩性。
3. 对应 `observability_data_governance`：模型解释中需要知道哪些特征真正影响动作 / 判断。

资源消耗与部署信号：

1. VR 模块会增加训练正则项，但可能降低任务无关噪声；是否减少端侧推理成本仍需另测。
2. 论文覆盖 DP3-UNet 与 DP3-DiT，有利于比较不同 policy backbone。
3. 当前任务仍偏操作，不等于 Kinbot 一代导航 / 交互。

优势：

1. 提供“模型越大不一定越好”的证据，符合 Kinbot 端侧资源约束。
2. plug-and-play 形态便于作为研究基线。
3. 对特征噪声和信息瓶颈的度量可迁移到感知 / 决策模型。

劣势与风险：

1. 成功率提升不必然等于功耗、延迟或内存下降。
2. KL 正则强度和 feature bottleneck 需要任务级调参。
3. 研究对象偏操作策略，不能直接进入产品主链路。

推荐理由：

建议作为 B+ 级输入。Kinbot 可把 `feature_noise_ratio`、`bottleneck_sensitivity`、`skip_layer_robustness` 加入未来端侧 VLA / diffusion policy 研究表。

### 3.6 DexSim2Real: Foundation Model-Guided Sim-to-Real Transfer for Generalizable Dexterous Manipulation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.05241](https://arxiv.org/abs/2605.05241) |
| 本轮 listing 口径 | 2026-05-08 new submission，日更补录 |
| 分类 | `cs.RO`, `cs.LG` |
| 方法关键词 | sim-to-real, foundation model, domain randomization, tactile-visual cross attention, curriculum |

摘要要点转述：

论文关注灵巧操作策略从仿真迁移到真实世界的落差。`DexSim2Real` 由三部分组成：用视觉语言模型作为视觉真实度 critic，通过闭环 `CMA-ES` 优化仿真参数的 `FM-DR`；用于 zero-shot sim-to-real RL 的 tactile-visual cross-attention policy；以及结合 LLM 任务分解与难度调度的 progressive skill curriculum。论文在 6 个操作任务中报告 `78.2%` 平均真实成功率，并把 sim-to-real gap 降至 `8.3%`。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 未来若验证药仓递送、简单取放或外设交互，如何用仿真降低真实试错成本。
2. 对应 `observability_data_governance`：用 foundation model 评价仿真真实性时，要记录评估依据和偏差。
3. 对应 `platform_runtime`：触觉-视觉融合是未来能力，不是当前一代默认链路。

资源消耗与部署信号：

1. VLM critic、CMA-ES、触觉-视觉策略和 LLM curriculum 形成复杂训练管线，短期不适合产品运行时。
2. `78.2%` 真实成功率和 `8.3%` gap 是有价值的离线验证信号。
3. 依赖触觉与灵巧操作硬件，超出 Kinbot 一代当前主线。

优势：

1. 训练管线覆盖视觉真实性、触觉融合和技能课程，系统性较强。
2. 用真实成功率和 sim-to-real gap 评估，而不是只报仿真分数。
3. 对未来操作能力验证有参考价值。

劣势与风险：

1. 工程复杂度高，且依赖硬件形态。
2. foundation model critic 可能把“看起来真实”误当成“物理上正确”。
3. 当前不应诱导 Kinbot 一代转向灵巧操作。

推荐理由：

建议作为 B 级研究输入。Kinbot 仅吸收 `sim_real_gap`、`visual_realism_critic_bias`、`curriculum_transfer_success` 等评测字段，不回写一代形态和传感主线。

### 3.7 MaMi-HOI: Harmonizing Global Kinematics and Local Geometry for Human-Object Interaction Generation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.05756](https://arxiv.org/abs/2605.05756) |
| 本轮 listing 口径 | 2026-05-08 new submission，日更补录 |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | human-object interaction, diffusion, geometry-aware adapter, kinematic harmony, data generation |

摘要要点转述：

论文研究 3D 人-物交互生成，指出现有方法能较好对齐高层语义，但容易丢失精确对象接触。作者称这种问题为 `Geometric Forgetting`：随着 diffusion 模型加深，语义特征压过对象几何特征，使模型逐渐失去对对象几何的感知。`MaMi-HOI` 通过两类 adapter 解决宏观运动与微观接触的矛盾：`GAPA` 重新注入密集对象细节并做 residual snapping correction，`KHA` 让全身姿态主动适配空间目标，降低局部强制接触带来的僵硬。实验显示其能同时提升自然运动和精确接触，并扩展到长程复杂轨迹。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 对老人取物、坐下、扶物、拿药等人-物交互的理解和异常检测。
2. 对应 `companion_interaction`：机器人需要理解用户正在与哪个物体交互，而不是只识别人和物体。
3. 对应 `observability_data_governance`：HOI 生成可用于离线数据增强，但不得替代真实安全验证。

资源消耗与部署信号：

1. diffusion 生成和几何 adapter 适合离线数据生成，不适合端侧实时。
2. 对 Kinbot 有价值的是 contact / posture 质量指标，而不是生成模型本身。
3. 长程轨迹生成可作为异常检测数据补充，但需人工筛查。

优势：

1. 明确揭示语义特征压过几何特征的问题。
2. 同时处理局部接触和整体姿态自然性。
3. 可启发老人行为理解中的人-物关系标注。

劣势与风险：

1. 生成数据可能带来不真实或偏置动作。
2. 与机器人自身执行无直接关系。
3. 若误用于安全关键验证，风险较高。

推荐理由：

建议作为 B 级输入。Kinbot 可在人体行为理解研究中加入 `object_contact_consistency`、`posture_object_alignment`、`generated_hoi_review_required`。

### 3.8 Contact-Free Grasp Stability Prediction with In-Hand Time-of-Flight Sensors

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.05461](https://arxiv.org/abs/2605.05461) |
| 本轮 listing 口径 | 2026-05-08 new submission，日更补录 |
| 分类 | `cs.RO` |
| 方法关键词 | grasp stability, contact-free prediction, time-of-flight sensor, low-latency classification |

摘要要点转述：

论文提出一种用 gripper distal links 上的 multi-zone ToF 传感器进行抓取稳定性预测的方法。相比触觉分类器需要先接触或抓住物体，这种方法在抓取前就能预测稳定性，因此分类循环可达到 `15 Hz`。作者采集超过 `2500` 次真实抓取，覆盖 `15` 个对象，并在额外未见对象上做验证和测试。结果显示，验证对象准确率为 `85.5%`，测试对象准确率为 `86.0%`。

解决 Kinbot 的什么问题：

1. 对应未来如果 Kinbot 需要药盒递送、轻量拿取或仓内物品处理，如何在接触前降低失败风险。
2. 对应 `safety_compliance_authorization`：抓取动作应先有低风险预测，再进入执行。
3. 对应 `platform_runtime`：`15 Hz` 是一个明确的低延迟感知信号。

资源消耗与部署信号：

1. 需要额外 ToF 传感器和 gripper 结构，不符合一代纯视觉主线。
2. `15 Hz` 分类速度、`2500+` 真实抓取样本和 `86.0%` 测试准确率可作为未来操作评测参考。
3. 不适合直接加入当前 BOM 或传感器方案。

优势：

1. 在接触前判断稳定性，有利于降低错误抓取。
2. 指标清楚，资源信号明确。
3. 对未来低风险操作能力有直接启发。

劣势与风险：

1. 需要新增硬件和机械执行器。
2. 验证对象数量有限，泛化仍需谨慎。
3. 与 Kinbot 一代“移动交互机器人，不要求物理操作”的边界冲突。

推荐理由：

建议作为 B- 级观察输入。Kinbot 只保留 `pre_contact_grasp_risk` 和 `low_latency_manipulation_sensor` 研究字段，不进入当前一代架构。

### 3.9 TouchDrive: Electronics-Free Tactile Sensing Interface for Assistive Grasping

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06432](https://arxiv.org/abs/2605.06432) |
| 本轮 listing 口径 | 2026-05-08 new submission，日更补录 |
| 分类 | `cs.RO` |
| 方法关键词 | tactile sensing, passive mechanical loop, pneumatic feedback, assistive grasping, low-cost interface |

摘要要点转述：

论文提出 `TouchDrive`，一种面向辅助抓取的无电子触觉感知接口。系统通过阀控切换将接触力直接转换为气动反馈，把感知、信号生成和反馈集成在单一被动机械回路中，可由常闭气动阀、压缩空气罐、感知元件和触觉反馈执行器组成，不依赖电子感知和多级处理链路。论文称该接口可帮助用户调节抓取力，支持对柔软和易碎物体的细致操作，并在多种平台和最多 `20` 个日常物体上完成验证。

解决 Kinbot 的什么问题：

1. 对应未来若有低成本辅助抓取或药品递送，如何降低电子传感和处理复杂度。
2. 对应 `platform_runtime`：一些安全感知可以通过被动机械反馈降复杂度，而不是全部软件化。
3. 对应 `safety_compliance_authorization`：被动反馈可作为人机协同操作的安全冗余。

资源消耗与部署信号：

1. 无电子触觉降低算力和信号处理需求，但需要气动元件和机械集成。
2. 论文属于 ICRA 2026 workshop 接收，成熟度仍偏早期。
3. 当前 Kinbot 一代不应新增抓取硬件，因此只作为长期低成本设计观察。

优势：

1. 通过机械回路降低系统复杂度，符合低 BOM 思路。
2. 面向辅助抓取和日常物体，场景比工业抓取更接近家庭。
3. 提供“机械安全冗余”思路。

劣势与风险：

1. 气动组件对体积、可靠性、维护性有要求。
2. 用户触觉反馈范式不等于机器人自主抓取。
3. 与当前无物理操作边界不一致。

推荐理由：

建议作为 B- 级观察输入。Kinbot 可记录 `passive_haptic_feedback` 与 `electronics_free_sensing`，但不回写 BOM、结构或操作能力。

### 3.10 Multi-Robot Coordination in V2X Environments

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.06662](https://arxiv.org/abs/2605.06662) |
| 本轮 listing 口径 | 2026-05-08 new submission，日更补录 |
| 分类 | `cs.RO` |
| 方法关键词 | multi-robot coordination, V2X, robot awareness service, maneuver coordination, finite-state coordination |

摘要要点转述：

论文提出面向复杂城市交通环境中社交机器人的 V2X 协同框架。框架基于 ETSI Cooperative Awareness 与 Maneuver Coordination 服务，引入两类机器人设施层服务：`Robot Awareness Service` 和 `Robot Maneuver Coordination Service`，分别通过 `Robot Awareness Message` 与 `Robot Maneuver Coordination Message` 实现。RAS 支持角色感知、任务导向的机器人 awareness，并将非 V2X 行人等弱势交通参与者纳入协同感知；RMCS 支持基于明确角色的事件驱动、低延迟机器人机动协同。论文包含 humanoid 与 quadruped 协助行人过街的真实 proof of concept，以及机器人介导 VRU clustering 的仿真。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 长期若进入社区、物业或多机器人服务网络时，如何做角色化 awareness 和协同动作。
2. 对应 `observability_data_governance`：结构化消息比原始感知数据直接共享更容易治理。
3. 对应 `decision_orchestration`：多实体协同需要显式角色、状态和事件，而不是临时对话协商。

资源消耗与部署信号：

1. 依赖 V2X / ETSI 协议和公共空间基础设施，不适合家庭一代产品。
2. 结构化消息和有限状态协同模型可作为未来伴生系统 / 社区场景研究输入。
3. 当前无必要引入多机器人通信栈。

优势：

1. 强调标准对齐和结构化消息，便于长期平台化。
2. 明确区分 awareness 与 maneuver coordination。
3. 将非 V2X 行人纳入协同 awareness，有社会安全价值。

劣势与风险：

1. 城市交通场景和 Kinbot 家庭室内场景差异大。
2. humanoid / quadruped proof of concept 不代表家庭服务机器人。
3. 引入多机器人协同会显著扩大验证和合规范围。

推荐理由：

建议作为 C+ 级长期观察。Kinbot 当前只记录 `role_aware_awareness_message`、`structured_coordination_state` 两个未来字段，不进入一代产品架构。

## 4. 对 Kinbot 的落地 / 文档建议

本轮不建议回写主线架构基线或 `03_decision_log.md`，因为论文结论仍属于研究补录输入，没有形成经用户确认的稳定产品 / 架构判断。

建议后续低成本吸收以下动作：

1. 在未来 WAM / world state 研究评测表中加入 `object_addressability`、`slot_identity_stability`、`slot_intervention_consistency`。
2. 在家庭语义关系研究中加入 `relation_generalization`、`context_binding_accuracy`、`ambiguous_reference_resolution`，但避免新增复杂关系实体层。
3. 在纯视觉仿真验证中加入 `lighting_material_coverage`、`sim_real_correlation`、`visual_grounding_stress_case`。
4. 在导航退化与自检研究中加入 `physics_consistency`、`position_only_dynamics`、`uncertainty_triggered_slowdown`。
5. 在端侧模型评测中加入 `feature_noise_ratio`、`bottleneck_sensitivity`、`skip_layer_robustness`。
6. 对抓取、触觉、V2X 和多机器人协同，仅保留为未来研究观察项，不进入当前一代物理操作、传感器、BOM 或伴生系统主线。

## 5. 本轮未进入主线的原因

1. 本轮是 2026-05-11 日更补录，官方最新 Robotics listing 仍为 2026-05-08；没有新增事实足以改变 Kinbot 主线基线。
2. 多数论文提供的是研究候选、验证指标、离线训练方法或未来能力接口，不构成硬件、传感、形态、BOM 或阶段门变化。
3. 涉及 WAM / VLA、仿真高保真、GP 动力学、diffusion 信息瓶颈、sim-to-real、HOI 生成、触觉和多机器人协同的内容若直接产品化，会显著增加运行时复杂度、验证负担和安全责任面。
4. 当前主线仍保持：一代纯视觉、端侧敏感数据处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[Robotics new listings for Friday, 8 May 2026](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent` 官方 listing：[Robotics recent listings](https://arxiv.org/list/cs.RO/recent)
3. [OA-WAM: Object-Addressable World Action Model for Robust Robot Manipulation](https://arxiv.org/abs/2605.06481)
4. [TriRelVLA: Triadic Relational Structure for Generalizable Embodied Manipulation](https://arxiv.org/abs/2605.05714)
5. [Toward Visually Realistic Simulation: A Benchmark for Evaluating Robot Manipulation in Simulation](https://arxiv.org/abs/2605.06311)
6. [Structure-Preserving Gaussian Processes Via Discrete Euler-Lagrange Equations](https://arxiv.org/abs/2605.06246)
7. [Information Filtering via Variational Regularization for Robot Manipulation](https://arxiv.org/abs/2601.21926)
8. [DexSim2Real: Foundation Model-Guided Sim-to-Real Transfer for Generalizable Dexterous Manipulation](https://arxiv.org/abs/2605.05241)
9. [MaMi-HOI: Harmonizing Global Kinematics and Local Geometry for Human-Object Interaction Generation](https://arxiv.org/abs/2605.05756)
10. [Contact-Free Grasp Stability Prediction with In-Hand Time-of-Flight Sensors](https://arxiv.org/abs/2605.05461)
11. [TouchDrive: Electronics-Free Tactile Sensing Interface for Assistive Grasping](https://arxiv.org/abs/2605.06432)
12. [Multi-Robot Coordination in V2X Environments](https://arxiv.org/abs/2605.06662)
