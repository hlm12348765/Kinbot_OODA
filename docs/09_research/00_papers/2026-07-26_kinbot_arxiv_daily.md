# Kinbot arXiv 每周论文纪要

---

文档版本：v1.0
创建日期：2026-07-26
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-07-26 | Codex-架构师 | 联网复核 arXiv 官方 `cs.RO/new`、`cs.RO/recent?show=2000`、论文详情页与正文，确认周日未出现当日新批次、最新正式 Robotics listing 为 `Friday, 24 July 2026`，共 `58` 篇 entries（`30 new + 5 cross + 23 replacement`）；从 2026-07-20 至 2026-07-24 的 `245` 篇 recent entries 中去重精筛 5 篇主卡片，覆盖顺序记忆、记忆执行合同、world-model 评测归因、嵌入式纯视觉定位和 Agent 到物理技能的运行时治理，并保留候选排除表、主题饱和判断与端侧资源边界。

---

## 1. 检索口径

本轮检索日期：2026-07-26。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent?show=2000`、论文详情页、HTML 正文和本地既有论文纪要。
2. 本轮刷新时，官方 `cs.RO/new` 最新 Robotics listing 为 `Friday, 24 July 2026`，合计 `58` 篇 entries；其中 new submissions `30` 篇、cross submissions `5` 篇、replacement submissions `23` 篇。
3. 官方 `cs.RO/recent?show=2000` 覆盖 `Mon, 20 Jul 2026` 至 `Fri, 24 Jul 2026`，显示 `Total of 245 entries`；分日为 `35 + 34 + 39 + 91 + 46`。`recent` 不包含 replacement，因此正式 listing 的分类计数以 `cs.RO/new` 为准，`recent` 用于周度宽筛和去重。
4. 今天为 2026-07-26 周日，本轮检索时 arXiv 尚未出现 `Sunday, 26 July 2026` Robotics 新批次；本纪要按“最新正式 listing + 最近一周综合判断”形成。
5. 已对 `docs/09_research/00_papers/` 既有纪要做 arXiv ID 去重。本轮 5 篇主卡片均未进入既有纪要；上一轮的实机 VLN、`MEMORA`、能力合同、`CD-LAM` 与 `BadWAM` 不重复收录，只作为判断本周增量的对照。
6. 本轮唯一 cross-list 主卡是 `RT-SHCUA`。它进入主卡不是因为跨列表热度，而是新增了可测量的技能准入、状态 / 时效校验、fallback、证据链和可信执行开销，符合 cross-list 例外口径。
7. 本轮不因 replacement 本身新增主卡。`DART-VLN v3` 与 `Do World Action Models Generalize Better than VLAs? v4` 未在官方元数据或可审计修订说明中给出新的 Kinbot 评测项、治理项或目标资源证据，继续放入候选排除表。

筛选标准：

1. 是否改变 Kinbot 对家庭导航、长期记忆、运行时安全、world-model 证据资格或端侧资源的判断。
2. 是否能映射到 `mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`platform_runtime` 或 `observability_data_governance`。
3. 是否能转化为 Phase 5 字段、离线 assurance test、运行时准入门或目标板验证，而不是继续扩张在线模型层。
4. 是否尊重当前边界：一代纯视觉、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、独立确定性硬安全数据面，以及 `5000 到 6000 元` BOM 目标。

未优先收录说明：

1. 通用 manipulation VLA / WAM 的参数扩张、生成画质、数据规模和单项成功率已趋饱和；本轮只提升改变评测归因或治理判断的 world-model 论文。
2. ObjectNav / VLN 的新 backbone、语义地图和短时记忆单元已趋饱和；没有纯 RGB 家庭实机碰撞、完整端侧链路或新的动态安全评测项时，不再仅凭 benchmark 增益进入主卡。
3. RTX 4090、A100、A5000、Orin 或 Xavier 上的平均值不能直接证明目标 SoC 可行；缺少 batch-1 `P95 / max / jitter`、峰值内存、持续功耗和热稳态的结果，只作为研究输入。
4. RGB-D、LiDAR 和外部真值系统仍可作为研发对照，但不能因单篇论文结果改写 V1 纯视觉产品主线。

## 2. 本轮总判断

本周最重要的增量不是“又出现五个模型”，而是五条判断边界更清楚了：

1. **记忆持久不等于知识积累。** 在论文比较的四种架构中，只有保存空间定位和视觉语义证据的 3D-Mem 同时改善后续判断正确率与导航成本；单纯保留占用信息或短上下文的被测架构，可能因证据缺失或时间错位失效。Kinbot 的长期记忆验收不能只测“还能不能取到记录”。
2. **检索相关不等于可以执行。** `MemoGuard` 显示，语义上最相似的旧经验可能已因拓扑变化、资源余量或历史结果可靠性而失效。记忆 freshness / provenance 之外，还需要使用时的执行合同与拒绝原因。
3. **世界模型结论也受评测器污染。** `KineBench` 把 world model 与 learned IDM 解耦后，暴露动作提取误差和失败归因歧义。今后任何 closed-loop world-model verdict 都必须绑定动作提取器 lineage、校准误差、可见性和失败归属，不能只报生成视频质量或最终成功率。
4. **嵌入式加速必须连同 fallback 占空比一起看。** `GLidE-SLAM` 在 Orin Nano 上可获得显著中位延迟改善，但在 Radxa 的困难序列上也会倒退。Kinbot 不能引用“最高 9.6 倍”作为产品结论，必须同时记录直接跟踪接受率、间接恢复比例、尾延迟、精度、功耗与热状态。
5. **Agent 输出成为物理动作前需要独立准入对象。** `RT-SHCUA` 的价值不在 UAV 拓扑，而在把自由文本输出编译为带时效、状态、权限、fallback 和证据语义的技能调用，并给出原型新增组件的占用与准入开销。它补充的是语义治理，不替代低层硬安全。

周度综合判断：

| 主题 | 当前状态 | 本周判断与后续动作 |
| --- | --- | --- |
| 通用 manipulation VLA / WAM 扩模、画质和数据规模 | 主卡边际证据已饱和 | 只跟踪 verdict admissibility、action causality、评测器归因、对抗完整性和目标板资源；不再因更大模型或更真视频新增主卡。 |
| ObjectNav / VLN backbone、通用语义地图 | 模型结构增量接近饱和 | 只提升纯 RGB 家庭实机碰撞、语义停止、动态环境陈旧度和完整端侧链路证据。 |
| 长期记忆 | 值得进入专题跟踪 | 用“持久性—积累性—freshness / provenance—执行有效性”四层测试代替单一检索命中率，并同时考核决策增益与导航 / 能耗节省。 |
| world-model assurance | 持续有关键增量 | 在 `Validate the Dream -> CD-LAM -> BadWAM` 证据链中加入 `KineBench` 的评测器校准和 failure attribution；运动学可行不等于接触动力学或安全可行。 |
| Agent 到物理技能的运行时治理 | 值得专题跟踪 | 评审带 deadline、状态快照、权限、策略版本、fallback 和 evidence 的准入对象；模型仍只是提议者，硬安全与即时降级留在独立低层。 |
| 动态 / 近人导航 | 值得专题跟踪，但本周主卡名额让位于更强证据链 | 候选论文进一步支持推理期间环境不应暂停，以及碰撞 / 最小距离之外还需 projected-TTC、平滑度和主观舒适度；等待家庭老人样本和目标传感链。 |
| 端侧资源 | 仍无整机可行性证据 | `GLidE-SLAM` 和 `RT-SHCUA` 只分别补充低层视觉跟踪与治理层开销；仍需目标 SoC 的完整链路 `P50 / P95 / max`、RSS、Flash、持续功耗与热稳态。 |
| 老人看护 / 健康陪伴 | 本周无足够强的新增实证 | `Clinical Pathways` 只有概念约束，个性化 HRI 又是短时年轻样本；不硬凑主卡，等待长期家庭、脆弱人群、隐私和健康闭环证据。 |

## 3. 推荐优先级

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | Beyond Episodic Evaluation: Memory Architectural Bottlenecks in Sequential Embodied Question Answering | 把顺序问题准确率增益与导航成本节省纳入长期记忆验证；同时检查过早停止、查询序号漂移和语义证据保留，不把 3D / LiDAR 实现直接变成产品依赖。 |
| A | MemoGuard: An Adaptive Runtime for Guarding Against Memory Traps in Communication-Limited Robot Navigation | 为记忆复用增加拓扑、资源余量和结果可靠性合同，记录拒绝与 fallback 的时延 / 能耗；不把 3B fallback 或仿真结果写入在线主线。 |
| A | KineBench: Benchmarking Embodied World Models via IDM-Free Kinematic Grounding | 在 world-model assurance 中增加动作提取器 lineage、校准误差、可见性和失败归因；作为离线评测器审计，不进入产品推理链。 |
| A- | GLidE-SLAM: GL-Accelerated Indirect-Direct Embedded SLAM | 在目标 SoC 上复测“直接跟踪 + 间接恢复”的接受率、fallback 占空比、尾延迟、ATE、功耗和热稳态；不引用最高倍数替代场景分层结果。 |
| A | RT-SHCUA: Real-Time Self-Hosted Computer-Use Agent for UAV Control | 作为本轮唯一 cross-list 破例，评审技能调用的时效、状态、权限、fallback 与 evidence schema；复用治理语义，不复制 UAV 架构或让 Agent 直达控制。 |

## 4. 论文卡片

### 4.1 Beyond Episodic Evaluation: Memory Architectural Bottlenecks in Sequential Embodied Question Answering

- arXiv：[2607.21571](https://arxiv.org/abs/2607.21571)
- Authors：Zikui Cai, Kaushal Janga, Tan Dat Dao, Seungjae Lee, Shivin Dass, Mingyo Seo, Kaiyu Yue, Mintong Kang, Nandhu Pillai, Monte Hoover, Aadi Palnitkar, Ruchit Rawal, Ruijie Zheng, Bo Li, Yuke Zhu, Roberto Martín-Martín, Tom Goldstein, Furong Huang
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：`Fri, 24 Jul 2026` original `cs.RO` new submission；abs 页显示 submitted on 2026-07-23。
- Inclusion type：weekly main card / sequential embodied memory evaluation

摘要转述：

论文把以往彼此独立的 Embodied Question Answering 改成同一环境内连续提问，并让 Agent 在问题之间保留记忆。比较结果显示，2D occupancy memory 能记住已探索几何，却保不住回答所需的视觉语义证据；短时 VLA 上下文又会因时间错位失效。带空间定位的 3D 视觉语义记忆同时改善回答与导航复用，说明“记忆对象仍在”并不等于“知识真的累计”。

Kinbot 问题映射：

1. 对应 `world_state_memory` 与 `mobility_navigation` 中“长期共处后，旧探索是否真正减少后续移动，同时不降低判断正确性”的问题。
2. Phase 5 候选字段：`sequential_memory_advantage`、`sequential_navigation_saving`、`query_index_accuracy_delta`、`memory_semantic_evidence_retained`、`memory_reuse_caused_premature_stop`、`spatial_grounding_type`、`memory_sensor_dependency`。
3. 路径缩短本身不是成功：若机器人因错误记忆提前停止，导航成本会下降而答案更差，必须把正确性与成本联合验收。

资源消耗：

1. 主要实验使用 `Qwen3-VL-8B-Instruct` 的 FP8 量化版本，并在 NVIDIA A5000 上运行；未给出目标 SoC 的峰值 RAM、Flash、尾延迟、功耗或热稳态。
2. 论文报告 3D-Mem 在顺序评测中相对独立 episodic 评测的准确率从 `25.5%` 提升到 `58.8%`，路径步数从 `5.6` 降到 `2.6`；这是 `33.3` 个百分点准确率增益与约 `53.3%` 路径节省，不是模型压缩或端侧加速结果。
3. 小规模实机使用 Unitree Go2、RealSense D435i 和 LiDAR L2，每轮只有 5 个问题；3D-Mem 从 `20%` 提升到 `40%`，样本和传感栈均不足以改写纯视觉主线。

优劣势：

1. 优势：把“记得过去”拆成可验证的正确性增益与行动成本节省，能发现单一 episodic benchmark 掩盖的架构瓶颈。
2. 优势：同时比较不同记忆表示，而不是只更换一个问答模型。
3. 劣势：真实机器人样本很小，且依赖 RGB-D / LiDAR；未测长期 freshness、编辑、删除、隐私和存储增长。
4. 风险：若只吸收 3D 表示而不保留 provenance 与更新规则，会把错误的空间语义状态固化。

推荐理由与判断变化：

建议作为 A 级研究输入。它改变的是记忆验收：长期记忆必须证明“后续判断更准且移动更少”，并报告查询序号漂移；不是把 3D point cloud 或 8B VLM 直接写入产品。

主线边界：

只进入顺序记忆测试和字段候选，不改变 V1 纯视觉路线，不新增 LiDAR / RGB-D 产品依赖。

### 4.2 MemoGuard: An Adaptive Runtime for Guarding Against Memory Traps in Communication-Limited Robot Navigation

- arXiv：[2607.15589](https://arxiv.org/abs/2607.15589)
- Authors：Rajat Bhattacharjya, Hyeonjong Ju, Sing-Yao Wu, Eli Bozorgzadeh, Nikil Dutt
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：`Mon, 20 Jul 2026` original `cs.RO` new submission；abs 页显示 submitted on 2026-07-17。
- Inclusion type：weekly main card / contract-validated memory reuse

摘要转述：

论文定义了“memory trap”：检索到的旧经验虽然语义相似，但当前拓扑、剩余资源或历史执行结果已经不再支持复用。系统为每条经验附带前状态、动作、执行合同与结果统计，使用前验证拓扑、资源可行性和结果可靠性；任一检查失败时，才调用本地推理生成 fallback。核心结论是检索相关性和执行有效性是两个不同问题。

Kinbot 问题映射：

1. 对应 `world_state_memory`、`decision_orchestration` 与 `safety_compliance_authorization` 中“旧经验何时有资格再次成为动作”的问题。
2. Phase 5 候选字段：`memory_execution_contract_id`、`memory_topology_valid`、`memory_resource_margin`、`memory_outcome_reliability`、`memory_trap_reason`、`memory_reuse_decision`、`fallback_reason`、`fallback_latency_ms`、`fallback_energy_j`、`post_reuse_outcome`。
3. 它补充而不替代上周 `MEMORA / PreSIST`：前两者解决记忆如何更新和保持新鲜，本论文解决在实际使用时是否仍满足执行前提。

资源消耗：

1. 论文在图走廊仿真中使用 `11,558` 条离线记忆；Top-1 直接复用的任务成功率为 `32.6%`、电池安全违规率为 `67.4%`，MemoGuard 分别为 `84.2%` 与 `15.8%`。
2. fallback 在 Jetson AGX Xavier `MODE_30W_ALL` 上运行本地 `Llama 3.2 3B`；单次调用平均 `0.922s`、`9.288J`。相对每步都推理，平均少 `3.98` 次调用，约节省 `3.67s` 和 `36.97J`。
3. 论文没有给出 3B 模型量化、峰值内存、记忆索引占用、守卫本身的尾延迟或持续热稳态，因此不能证明 `12GB RAM + 32GB Flash` 可行。

优劣势：

1. 优势：把“相似经验”与“当前可执行”明确拆开，并提供拒绝和 fallback 路径。
2. 优势：给出 fallback 的边缘侧时延与能耗，能把记忆复用转化为资源治理问题。
3. 劣势：实验只是图走廊仿真，资源 trap 主要是电池；没有动态人员、定位不确定性和实机导航。
4. 风险：若把合同校验实现成新的通用在线 Agent，会引入不必要复杂度；它更适合作为现有记忆—动作边界上的确定性 validator。

推荐理由与判断变化：

建议作为 A 级研究输入。它改变的是记忆使用规则：fresh、可追溯且相似仍然不够，复用前必须验证当前拓扑、资源余量和结果可靠性。

主线边界：

只进入记忆准入 schema、回放和资源测量，不部署论文的 3B fallback，不替代独立低层安全。

### 4.3 KineBench: Benchmarking Embodied World Models via IDM-Free Kinematic Grounding

- arXiv：[2607.19876](https://arxiv.org/abs/2607.19876)
- Authors：Zeyu Liu, Zhangzhe Zhu, Yang Zhang, Chenyou Fan, Chenjia Bai, Xuelong Li
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：`Thu, 23 Jul 2026` original `cs.RO` new submission；abs 页显示 submitted on 2026-07-22。
- Inclusion type：weekly main card / world-model evaluator attribution

摘要转述：

常见 world-model 闭环评测会用 learned inverse dynamics model 从生成视频恢复动作；生成结果 OOD 时，最终失败可能来自 world model，也可能来自 IDM。`KineBench` 改用可检查的视觉运动学链：分割、度量深度、6D 位姿与末端轨迹提取，再送入 ManiSkill3 闭环执行。它把 IID、任务迁移、视觉 OOD 与复杂度扩展拆开，并用轨迹平滑、可达性和 manipulability 评价运动学质量。

Kinbot 问题映射：

1. 对应 `observability_data_governance` 与 world-model assurance 中“评测 verdict 的误差究竟来自被测模型还是评测器”的问题。
2. Phase 5 候选字段：`wm_action_extractor_id`、`wm_action_extractor_version`、`wm_extractor_translation_error_cm`、`wm_extractor_rotation_error_deg`、`wm_extractor_visibility_valid`、`wm_closed_loop_execution_success`、`wm_kinematic_feasibility`、`wm_complexity_stratum`、`wm_failure_attribution_status`。
3. “IDM-free”不等于“误差 free”；任何结果都要绑定动作提取器、校准集、可见性条件和误差范围。

资源消耗：

1. 评测覆盖 ManiSkill3 的 `20` 个操作任务，使用 YOLOv11、微调 MoGeV2 与 FoundationPose；被测模型包括 Wan2.1 1.3B、Wan2.2 5B 与 CogVideoX 2B。
2. 训练 / 评测使用 `4 × NVIDIA A100`。预测深度链的平移误差约 `1.5-3cm`，相对 learned IDM 的 OOD 误差更低，但旋转误差仍约 `10°`。
3. 论文报告 Wan2.2-5B 的 IID 闭环成功率为 `56.32%`，任务迁移仅 `11.90%`；部分视觉 OOD 与任务复杂度结果也出现非单调变化，说明规模或视觉质量不能替代分层闭环验证。

优劣势：

1. 优势：主动隔离 evaluator failure，补齐上周 world-model 证据链缺少的归因层。
2. 优势：同时报告闭环成功、轨迹平滑和 manipulability，不只看未来视频相似度。
3. 劣势：只覆盖仿真操作，使用运动规划专家轨迹；没有家庭轮式导航、实机接触或动态人。
4. 风险：分割、深度、姿态和末端可见性仍会造成评测误差；运动学可行不能推出碰撞、接触动力学或安全可行。

推荐理由与判断变化：

建议作为 A 级离线研究输入。它改变的是 world-model verdict 的证据格式：必须同时审计被测模型与评测动作提取链，并把未归因失败保留为不可下结论状态。

主线边界：

只进入离线评测器审计与字段候选，不部署 world model、FoundationPose 或 5B 视频模型，不让其 verdict 进入硬安全通过链。

### 4.4 GLidE-SLAM: GL-Accelerated Indirect-Direct Embedded SLAM

- arXiv：[2607.16897](https://arxiv.org/abs/2607.16897)
- Authors：Carlos A. Pinheiro de Sousa, Heiko Hamann, Oliver Deussen
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：`Tue, 21 Jul 2026` original `cs.RO` new submission；abs 页显示 submitted on 2026-07-18。
- Inclusion type：weekly main card / embedded monocular localization resource evidence

摘要转述：

论文在单目 SLAM 中交替使用两条路径：由 OpenGL ES compute shader 承担多数帧的直接光度位姿跟踪，ORB-SLAM2 的间接特征管线负责建图、质量恢复和重定位。它不是用神经网络替换全部定位栈，而是把高频、可并行的跟踪放到嵌入式 GPU，同时保留成熟的 CPU 一致性与恢复路径。

Kinbot 问题映射：

1. 对应 `mobility_navigation` 与 `platform_runtime` 中“纯视觉定位如何在低成本 SoC 上分配 GPU / CPU，并在直接跟踪失效时恢复”的问题。
2. Phase 5 候选字段：`tracking_path_type`、`direct_tracking_acceptance_rate`、`indirect_fallback_rate`、`frame_latency_p50`、`frame_latency_p95`、`frame_latency_max`、`ate_rmse`、`gpu_api_driver`、`sustained_power_w`、`thermal_throttle_event`、`cpu_headroom`。
3. 最高速度提升与最差场景退化必须同时呈现；fallback 比例是资源预算的一部分，不是实现细节。

资源消耗：

1. 论文实测 Radxa Zero 3W（RK3566 / Mali-G52 MP2）、Jetson Orin Nano 和 RTX 4060 笔记本，使用 OpenGL ES 3.1，不绑定 CUDA。
2. Orin Nano 上 GLidE-SLAM 的中位每帧时延约 `3.1-32.6ms`，ORB-SLAM2 约 `29.2-35.4ms`，最高提升 `9.6×`；但困难序列并非都改善。
3. Radxa 上 GLidE-SLAM 约 `43.9-180.5ms`，ORB-SLAM2 约 `124-136ms`，提升范围约 `0.7-2.9×`；EuRoC `MH03` 出现从约 `135ms` 到 `180.5ms` 的退化。论文只报告中位数与 ATE，没有 RAM、Flash、功耗、热稳态和尾延迟。

优劣势：

1. 优势：少见地在低端 Mali GPU 与 Orin Nano 上给出同一算法的场景分层结果，并保留可解释 recovery。
2. 优势：OpenGL ES 路线有跨厂商启发，适合验证端侧异构分工而非绑定单一 GPU 生态。
3. 劣势：数据只有 TUM RGB-D / EuRoC 六段序列，未覆盖家庭动态人、弱光、反光和长期运行。
4. 风险：只看中位时延与最高倍数会掩盖 fallback 频繁、困难序列退化和热降频；部分序列精度也会下降。

推荐理由与判断变化：

建议作为 A- 级端侧证据输入。它改变的是验证口径而非芯片结论：混合跟踪是否省资源，必须用直接接受率、恢复占空比、场景分层精度和尾延迟共同判断。

主线边界：

不把 GLidE-SLAM 或 ORB-SLAM2 冻结为量产实现，不改变 NFM 研究方向；只进入目标 SoC A/B 测试候选。

### 4.5 RT-SHCUA: Real-Time Self-Hosted Computer-Use Agent for UAV Control

- arXiv：[2607.17951](https://arxiv.org/abs/2607.17951)
- Authors：Di Lu, Bo Zhang, Xiyuan Li, Yongzhi Liao, Xuewen Dong, Yulong Shen, Zhiquan Liu, Jianfeng Ma
- Source：arXiv `cs.CR` primary，cross-listed to `cs.RO`
- 本轮 listing 口径：`Tue, 21 Jul 2026` `cs.CR -> cs.RO` cross submission；abs 页显示 submitted on 2026-07-20。
- Inclusion type：weekly main card / cross-list exception / physical-skill runtime governance

摘要转述：

论文指出，自托管 computer-use Agent 的串行工具调用可以容忍秒级延迟，但物理平台状态持续变化，旧、越权或被篡改的决定可能在到达时已经不可执行。系统不允许 Agent 直接发原始飞控命令，而是把输出编译为带生成时间、有效窗、状态前提、权限范围、fallback 与 evidence 要求的技能调用；板端运行时只能执行仍及时、获授权且与当前状态一致的调用，否则拒绝、延后或降级。

Kinbot 问题映射：

1. 对应 `decision_orchestration`、`safety_compliance_authorization`、`platform_runtime` 与 `observability_data_governance` 中“语义决策何时有资格影响物理世界”的问题。
2. Phase 5 候选字段：`skill_invocation_contract_id`、`generated_at`、`valid_until`、`state_snapshot_id`、`authority_scope`、`policy_version`、`admission_decision`、`fallback_action`、`evidence_chain_head`、`decision_to_admission_p95_ms`、`replay_rejected`、`post_execution_outcome`。
3. 论文明确把 Agent 定位为任务级提议者，而不是高频控制器；这与独立低层安全边界相容，但不能据此复制其 UAV 组件拓扑。

资源消耗：

1. 论文报告新增运行时组件体积 `156.43KB`、峰值内存 `488.52KB`；软件准入校验 `P95` 约 `0.32ms`，本地降级 fallback `P95 < 0.149ms`。
2. 单条 evidence record 平均约 `545B`，追加 `P95` 约 `56.46μs`；TrustZone 路径的校验 `P95` 却约 `181-185ms`，说明可信边界位置会改变时延结论。
3. 实验使用 PX4 SITL / Gazebo、256GB DDR5 Xeon 主机和 QEMU OP-TEE；体积统计不包含 LLM、PX4、Gazebo、MAVSDK 等大组件，不能外推为 Kinbot 整栈资源。

优劣势：

1. 优势：把 deadline、状态、权限、fallback 和 evidence 变成同一可审计执行对象，新增了明确的准入 / 拒绝 / 降级测试项。
2. 优势：原型报告的新增组件占用较小，并公开了软件与可信执行路径的明显差异；该占用尚未在目标 MCU / SoC 验证。
3. 劣势：主要是仿真 UAV，未验证家庭轮式机器人、动态人员、网络断续或目标 MCU / SoC。
4. 风险：若把 TEE、Agent runtime 与 safety supervisor 合并成单一同步关键路径，会产生新的时延和单点故障；语义准入也不能证明物理轨迹安全。

推荐理由与判断变化：

建议作为 A 级研究输入，并作为本轮唯一 cross-list 破例。它新增的是可直接测试的物理技能治理项和 evidence provenance；不是因为 `computer-use Agent` 名称，也不授权 Agent 直达执行器。

主线边界：

只评审契约对象、准入状态机与证据字段，不复制 UAV 架构，不把 TEE 设为默认同步路径，不替代独立确定性硬安全数据面。

## 5. 候选排除表

| 论文 | arXiv / listing | 未收录为主卡片原因 | 保留启发 |
| --- | --- | --- | --- |
| Token-Wise Latent Streaming from Slow Reasoners to Fast Planners for Dynamic Vision Language Navigation（SPARK-VLN） | [2607.16806](https://arxiv.org/abs/2607.16806)，7 月 21 日 original `cs.RO` new | “推理期间行人继续运动”的 benchmark 很重要，但系统使用 8B VILA、单 RTX 4090 与 RGB-D 仿真；realistic dynamic 场景碰撞率仍为 `29.3%`，相对已有慢语义 / 快控制与环境陈旧度证据不足以挤入本轮 5 张主卡。 | 保留 `environment_runs_during_inference`、`observation_to_action_latency_p95`、`dynamic_object_displacement_during_inference`、`human_collision_rate`、`personal_space_compliance`。 |
| Stability and Comfort in Mobile Robot-Pedestrian Interactions | [2607.17604](https://arxiv.org/abs/2607.17604)，7 月 21 日 original `cs.RO` new | 32 名年轻校园参与者、480 次计划交互的实证强，但平台依赖 ZED-X、VLP-16、额外 2D LiDAR 与 Orin 64GB；尚不能替代家庭老人 / 脆弱人群评测，且近人 personal-space 主题已有积累。 | 保留 `projected_ttc`、`trajectory_jerk`、`subjective_comfort_score`、参与者人群分层；碰撞 / 最近距离不能代表主观安全。 |
| Learning Adaptive Safety Margins for Visual Navigation | [2607.18200](https://arxiv.org/abs/2607.18200)，7 月 21 日 original `cs.RO` new | 自适应软裕度有价值，但使用 RGB-D、静态 PointGoal 和 RTX 4060；CBF residual 只是候选轨迹评分项，不是形式化硬保证，也无动态人碰撞统计。 | 保留 `adaptive_margin_distribution`、`clearance_budget_violation`、`candidate_count` 与完整端到端时延；固定物理最小间距不可下穿。 |
| Difference-Based Relational Learning for Zero-Shot Object-Goal Visual Navigation With Direct Sim-to-Real Transfer（T-DRN） | [2607.15642](https://arxiv.org/abs/2607.15642)，7 月 20 日 original `cs.RO` new | 2.96M 策略与纯 RGB TurtleBot4 实证较强，但 `0.5ms/frame` 不含完整 YOLOv7 链路，实体任务仅 39 次且论文承认 RGB 距离误差会造成碰撞；仍属已饱和 ObjectNav 结构。 | 保留 detector / policy 分拆延迟、短时缓冲消融、实体 `sim_real_gap` 与 `rgb_only_collision_rate`。 |
| Robostral Navigate | [2607.20785](https://arxiv.org/abs/2607.20785)，7 月 24 日 original `cs.RO` new | 8B 单目 waypoint 模型和 2.4M 轨迹带来较高仿真分数，但无定量实机碰撞 / 语义停止、目标 SoC 内存、功耗或热稳态；Habitat pathfinder 执行高层 waypoint 也不能证明低层安全。 | 保留图像空间 waypoint 与快慢层接口；不把 prefix token `22×` 节省误写为整链端侧节省。 |
| WorldScape Policy 2.0 / Test-Time Scaling of World Action Models | [2607.18840](https://arxiv.org/abs/2607.18840), [2607.17454](https://arxiv.org/abs/2607.17454)，本周 original new | 分别增加 manipulation WAM 数据 / 记忆和 Best-of-N 选择，但没有新增 Kinbot 导航动作因果、评测器归因、对抗完整性或目标板资源；属于已饱和的扩模 / 测试时算力路线。 | 只保留 gated extra compute 的调用率、边际成功增益与资源代价，等待非操作域和目标 SoC 证据。 |
| Recti-Q | [2607.18540](https://arxiv.org/abs/2607.18540)，7 月 22 日 `cs.CV -> cs.RO` cross submission | 揭示 W4 PTQ 的 OOD robustness gap，adapter 最小可到约 6KB；但仅通用图像分类，无机器人任务、目标硬件、延迟、功耗或热证据，不满足 cross-list 主卡破例。 | 保留 `quantization_robustness_gap`、`adapter_flash_bytes`、corruption / domain shift 分层；等待完整视觉链。 |
| Masked Visual Actions / Koopman Dreamer | [2607.19343](https://arxiv.org/abs/2607.19343), [2607.19719](https://arxiv.org/abs/2607.19719)，本周 cross submission | 前者仍依赖 learned IDM，重新引入 KineBench 的归因歧义；后者主要是 DMC / UAV-LiDAR 仿真，没有真实纯视觉、适用域或端侧证据。两者均未新增足以触发 cross-list 破例的 Kinbot 治理项。 | 保留 visual-action interface 的偏差审计与谱稳定约束，等待可归因的 closed-loop Kinbot 任务。 |
| Clinical Pathways for Safe Human-Robot Interaction | [2607.19827](https://arxiv.org/abs/2607.19827)，7 月 23 日 original `cs.RO` new | 把临床路径映射为时序安全约束的方向强相关，但目前只有概念架构和伪轨迹，无患者队列、实机、部署时延、资源或误拒绝证据。 | 进入健康安全专题观察，保留 `care_pathway_constraint_id`、违例原因和人工升级链。 |
| DART-VLN v3 / Do World Action Models Generalize Better than VLAs? v4 | [2607.01043](https://arxiv.org/abs/2607.01043), [2603.22078](https://arxiv.org/abs/2603.22078)，7 月 24 日 replacement | 官方元数据和可审计修订说明未证明本次 revision 新增 Kinbot 评测项、治理项或资源证据；后者又属于已饱和 manipulation robustness 主题。按 replacement 规则不重复收录。 | 等待明确 revision diff、目标任务和新治理字段后再评估。 |

## 6. 对 Kinbot 的落地 / 文档建议

1. 暂不回写主线架构、`03_decision_log.md` 或 Linear；本轮所有结论仍是研究输入、Phase 5 字段候选或后续专题验证建议。
2. 后续更新 Phase 5 模板时，可评审四组字段包：
   - 顺序记忆与执行有效性：`sequential_memory_advantage`、`sequential_navigation_saving`、`query_index_accuracy_delta`、`memory_execution_contract_id`、`memory_topology_valid`、`memory_resource_margin`、`memory_outcome_reliability`、`memory_reuse_decision`
   - world-model 评测归因：`wm_action_extractor_id`、`wm_extractor_translation_error_cm`、`wm_extractor_rotation_error_deg`、`wm_extractor_visibility_valid`、`wm_failure_attribution_status`、`wm_closed_loop_execution_success`
   - 端侧视觉定位：`direct_tracking_acceptance_rate`、`indirect_fallback_rate`、`frame_latency_p50 / p95 / max`、`ate_rmse`、`gpu_api_driver`、`sustained_power_w`、`thermal_throttle_event`
   - 物理技能治理：`skill_invocation_contract_id`、`valid_until`、`state_snapshot_id`、`authority_scope`、`policy_version`、`admission_decision`、`fallback_action`、`evidence_chain_head`
3. 长期记忆专题建议按三步做最小验证：先用本论文的 sequential test 判断“是否真的积累”，再用 `PreSIST / MEMORA` 检查 freshness、编辑与 provenance，最后用 `MemoGuard` 检查使用时执行前提；三步不能合并成单一检索准确率。
4. world-model assurance 建议采用 `Validate the Dream -> CD-LAM -> KineBench -> BadWAM` 的轻量顺序：先判断 verdict 是否具备证据资格，再查 action causality，再隔离 evaluator attribution，最后做动作—想象完整性红队。任一适用关键门未通过时，world model 只能生成测试 / 探索场景，不能提供安全通过证据。
5. 若做端侧验证，先在目标 SoC 和 Kinbot 自有弱光 / 动态 / 纹理退化序列上复测 `GLidE-SLAM` 的两条路径，不先移植完整系统；只有 `P95 / max`、ATE、fallback duty cycle、功耗与热稳态一起通过，才可形成资源路线判断。
6. 若评审 Agent 到 RobotSkill 的接口，只吸收 `RT-SHCUA` 的合同字段、准入状态和 evidence 语义，并把软件路径与可信执行路径分开测；不因论文名称增加新 Agent，也不让语义准入替代 F1 类确定性硬安全。

## 7. 主线与复杂度自检

本轮未进入主线的原因：

1. 五篇论文均未在 Kinbot 自有家庭数据、目标 SoC 与安全回放上完整复现；其中顺序记忆依赖 RGB-D / LiDAR 与 A5000，world-model 评测使用 4×A100，治理论文主要是 UAV 仿真。
2. `GLidE-SLAM` 只证明特定序列和板卡上的局部资源分工，`RT-SHCUA` 只证明治理层本身较轻；两者都不能证明 `12GB RAM + 32GB Flash` 整机闭环。
3. 本周价值是增加验证字段、拒绝门和 failure attribution，不是新增在线 VLM、3B fallback、world model、LiDAR / RGB-D 或新的 Agent 层。
4. 当前边界仍是纯视觉、端侧优先、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、独立硬安全数据面和 `5000 到 6000 元` BOM 目标。

复杂度自检：

若把五篇论文各自产品化为 3D memory server、3B fallback、world-model evaluator、独立 SLAM 分支和新 UAV-style runtime，架构会明显过度复杂。本轮只保留四类可复用增量：顺序记忆 / 执行合同测试、world-model evaluator lineage、定位路径与 fallback 观测字段、现有技能接口的准入 / evidence schema。它们应复用既有 Phase 5、运行时治理和数据链，不扩张在线 Agent 拓扑。

## 8. 来源

1. arXiv `cs.RO/new`：[https://arxiv.org/list/cs.RO/new?show=2000](https://arxiv.org/list/cs.RO/new?show=2000)
2. arXiv `cs.RO/recent?show=2000`：[https://arxiv.org/list/cs.RO/recent?show=2000](https://arxiv.org/list/cs.RO/recent?show=2000)
3. `Beyond Episodic Evaluation`：[https://arxiv.org/abs/2607.21571](https://arxiv.org/abs/2607.21571)
4. `MemoGuard`：[https://arxiv.org/abs/2607.15589](https://arxiv.org/abs/2607.15589)
5. `KineBench`：[https://arxiv.org/abs/2607.19876](https://arxiv.org/abs/2607.19876)
6. `GLidE-SLAM`：[https://arxiv.org/abs/2607.16897](https://arxiv.org/abs/2607.16897)
7. `RT-SHCUA`：[https://arxiv.org/abs/2607.17951](https://arxiv.org/abs/2607.17951)
8. `SPARK-VLN`：[https://arxiv.org/abs/2607.16806](https://arxiv.org/abs/2607.16806)
9. `Stability and Comfort in Mobile Robot-Pedestrian Interactions`：[https://arxiv.org/abs/2607.17604](https://arxiv.org/abs/2607.17604)
10. `Learning Adaptive Safety Margins for Visual Navigation`：[https://arxiv.org/abs/2607.18200](https://arxiv.org/abs/2607.18200)
11. `T-DRN`：[https://arxiv.org/abs/2607.15642](https://arxiv.org/abs/2607.15642)
12. `Robostral Navigate`：[https://arxiv.org/abs/2607.20785](https://arxiv.org/abs/2607.20785)
13. `Recti-Q`：[https://arxiv.org/abs/2607.18540](https://arxiv.org/abs/2607.18540)
14. `Clinical Pathways for Safe Human-Robot Interaction`：[https://arxiv.org/abs/2607.19827](https://arxiv.org/abs/2607.19827)
15. `DART-VLN`：[https://arxiv.org/abs/2607.01043](https://arxiv.org/abs/2607.01043)
