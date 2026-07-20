# Kinbot arXiv 每日论文纪要

---

文档版本：v1.1
创建日期：2026-07-12
作者：Codex-架构师

文档变更记录：
- v1.1 | 2026-07-12 | Codex-架构师 | 在同日复核中补查 `cs.RO/recent` 2026-07-07 至 2026-07-09 条目，修正“世界模型整体已饱和”的粗粒度判断：新增世界模型 verdict 可采信等级、长时 action-faithful policy evaluation 与开放世界对象持久性三张主卡片；将开放词汇 ObjectNav、输入约束安全导航和居家认知刺激交互降入候选排除表，主卡片仍控制为 5 篇。
- v1.0 | 2026-07-12 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与论文详情页，确认本轮官方最新 Robotics listing 为 `Friday, 10 July 2026`，合计 `62` 篇 entries；其中 new submissions `26` 篇、cross submissions `12` 篇、replacement submissions `24` 篇。官方 `cs.RO/recent` 顶部覆盖 `Fri, 10 Jul 2026`、`Thu, 9 Jul 2026`、`Wed, 8 Jul 2026`、`Tue, 7 Jul 2026` 与 `Fri, 3 Jul 2026`，显示 `Total of 306 entries`；本轮按周日未出现当日新批次说明 + 最新官方 listing + `cs.RO/recent` 复核 + 周度综合判断口径，收录纯视觉动态避障、流式 VLN、开放词汇 ObjectNav、输入约束安全导航和居家认知刺激交互 5 篇论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-07-12。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent?show=2000` 页面、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Friday, 10 July 2026`，合计 `62` 篇 entries；其中 new submissions `26` 篇、cross submissions `12` 篇、replacement submissions `24` 篇。
3. 官方 `cs.RO/recent?show=2000` 顶部覆盖 `Fri, 10 Jul 2026`、`Thu, 9 Jul 2026`、`Wed, 8 Jul 2026`、`Tue, 7 Jul 2026` 与 `Fri, 3 Jul 2026`，显示 `Total of 306 entries`；其中 `Fri, 10 Jul 2026` 为 `38` 篇、`Thu, 9 Jul 2026` 为 `50` 篇、`Wed, 8 Jul 2026` 为 `50` 篇、`Tue, 7 Jul 2026` 为 `121` 篇、`Fri, 3 Jul 2026` 为 `47` 篇。`cs.RO/recent` 用于近期待补录与重复主题复核，不作为正式 Robotics listing、entries 总数或 `new / cross / replacement` 计数口径。
4. 今天为 2026-07-12 周日，本轮检索时 arXiv 官方尚未出现 `Sunday, 12 July 2026` Robotics 新批次；本轮按“最新官方 listing + 周日未出现新批次说明 + `cs.RO/recent` 复核 + 周度综合判断”形成日更。
5. 上一轮 2026-07-05 已覆盖 `Friday, 3 July 2026` listing 中的低层语言导航接口、端侧闭环推理 runtime、视觉语言延迟攻击、家庭找物个性化边界和纯 RGB 参考轨迹导航。本轮排除这些主卡片与直接重复主题，并对 `cs.RO/recent` 2026-07-07 至 2026-07-10 的 `306` 篇 entries 做二次主题复核，重点补查 world model、长期记忆、导航安全和端侧资源。
6. 本轮新增的 `Validate the Dream`、`GigaWorld-1`、`PreSIST` 均未出现在本地既有日更主卡片中；前两篇属于 `cs.RO` new submission，`PreSIST` 为从 `cs.CV` 进入 `cs.RO/recent` 的 cross-list。它们进入主卡的理由分别是新增世界模型 verdict 证据资格、长时 action-faithful 评测口径和对象持久性 / 记忆 freshness 字段，而不是因为 listing 热度。

筛选标准：

1. 是否改变 Kinbot 对家庭室内导航、长期记忆、安全治理、端侧资源、老人看护或 Phase 5 验证证据链的判断。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`decision_orchestration`、`platform_runtime`、`observability_data_governance`、`health_elderly_care`。
3. 是否能低成本转化为 Phase 5 字段：动态障碍 `TTC`、流式 VLN 上下文预算、对象持久性、世界模型 admissibility、长时 action fidelity 与 sim-real verdict alignment。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `DexVerse`、`FabriVLA`、`Harness VLA`、`EgoWAM`、`TFP`、`SeFA-Policy`、`V-VLAPS` 等 `VLA / WAM / manipulation` 条目仍然密集，但“用世界模型训练 manipulation policy”已接近饱和，不等于“世界模型能否作为安全评测 oracle”也已饱和。后者因 `Validate the Dream` 与 `GigaWorld-1` 出现实质增量，本轮单独进入专题跟踪。
2. `RadLoc`、`Graph-Loc`、`TurboMap` 等雷达、`LiDAR` 或重几何定位条目有工程参考价值，但与 V1 纯视觉产品主线冲突，优先保留为研发对照或离线压力测试。
3. `APIVOT`、`FSD-VLN`、`Early to Share, Late to Save` 等语言导航 / 规划条目有启发，但与本轮已收录的 `StreamVLN` 或既有 `LiveVLN` 运行时专题部分重复；本轮不继续扩张多智能体、航空或厨房 manipulation 规划主线。
4. 开放词汇 ObjectNav、输入约束安全控制与老人认知交互均有价值，但在 5 篇上限下没有优先于本轮新增的 world-model assurance、对象持久性和端侧资源证据。其中 `iCST` 与同作者 `Co-STAR` 高度可能共享一周居家研究队列，本轮先放候选排除表并保留 dataset lineage 核验要求，避免重复计证据。

## 2. 本轮总判断

本轮的有效增量不是“更多大模型机器人能力”，而是把 Kinbot Phase 5 对世界模型证据资格、长时记忆 freshness、导航安全和端侧资源的判断拆得更清楚。

1. **动态避障需要从平均检测准确率转为 `TTC` 长尾风险**：`Time-to-Collision Based Dynamic Obstacle Avoidance` 提醒 Kinbot 纯视觉动态避障不能只看是否识别障碍，还要看 1 秒以内碰撞风险是否被提前发现、是否能输出正确规避方向，以及误检 / 漏检如何触发保守减速。
2. **VLN 低延迟不只是 runtime 封装，也需要上下文预算合同**：`StreamVLN` 将 fast dialogue window、slow memory context、3D-aware token pruning 与 KV cache reuse 组合成流式 VLN 资源形态；但其实机依赖远端 `RTX 4090`、`7B` Video-LLM 和 RGB-D，相当于给 `12GB RAM + 32GB Flash` 量产线提供了“不宜直接上线”的反证。
3. **长期记忆不应把 last-seen pose 当成永久真值**：`PreSIST` 根据对象属性与场景上下文预测对象在未来仍停留于原位的概率，再通过 vision-only 模型低频更新持久性先验。它把“物体是否还在那里”从二值 map 状态改成随时间衰减、可触发重观察的 freshness 证据。
4. **世界模型输出的安全 / 成功 verdict 不能天然算证据**：`Validate the Dream` 把世界模型从视觉逼真 `L0`、action robust `L1`、声明 envelope 与 horizon `L2`、失败归因 `L3` 推到 sim-real verdict transfer `L4`。对 Kinbot 而言，未达到 `L2` 的 world model 只适合探索，不能进入 Phase 5 安全通过证据。
5. **世界模型评测应看长时 action fidelity，而不是短时画面好看**：`GigaWorld-1` 在 `7` 个模型、`4` 类 action encoding 和超过 `324,000` 个与真实执行配对的模拟 rollout 上给出大规模证据：长期 action-faithful consistency、memory 与 action interface 比短时 visual realism 更决定 policy evaluator 是否与实机结果对齐；其 `32 × H20` 训练和 `H20 96GB` 推理也明确说明这条线只能先做离线 / 外部研究输入。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 纯视觉动态避障 / `TTC` | 值得进入 Phase 5 安全回放 | 将 `ttc_under_1s_detected`、`evasive_direction_correct`、`min_ttc_margin_ms`、`dynamic_obstacle_false_negative` 纳入近人移动和夜间巡护回放。 |
| 流式 VLN / 上下文资源 | 值得专题跟踪，但当前不满足量产端侧证据 | 将 `StreamVLN` 与既有 `LiveVLN` 合并验证 guard buffer、fast window、slow memory、KV cache 和 bounded context；必须在目标 SoC 重测，不能沿用远端 `RTX 4090` 结果。 |
| 长期对象记忆 / freshness | 值得进入专题跟踪 | 用对象持久性概率和 last-seen pose expiry 驱动找物前重观察；不扩张为在线 31B VLM 或原始视频长期留存。 |
| world model 作为 test oracle | 本周出现关键增量，值得专题跟踪 | 建立 `L0-L4` admissibility 与 long-horizon action fidelity 评审；未声明 envelope / horizon、未能 OOD 拒绝或未验证 sim-real transfer 的 verdict 不得算安全通过证据。 |
| 开放词汇 ObjectNav | 接近成熟，暂无新主线判断 | 保留开放目标、语义地图与检索延迟字段；`OVExp` replacement 未提供可审计的 v1→v2 方法变化，不作为本轮主卡。 |
| 输入约束安全管 | 有价值但本周非最高优先 | 保留控制余量、offline feasibility 和 actuator saturation 字段，等待与 Kinbot 底盘模型联合评审。 |
| 居家老人认知交互 | 值得轻量试点，但需先核对证据 lineage | `iCST` 与 `Co-STAR` 可能共享研究队列；合并去重后再决定是否进入健康陪伴验证字段。 |
| VLA / WAM / dexterous manipulation | 应用 / 训练路线明显饱和且偏相邻 | 只保留失败预测、动作 jitter、长上下文等字段启发；不要把该饱和判断外推到 world-model assurance。 |
| Radar / LiDAR / heavy geometry localization | 相邻研发对照 | 可作为研发对比或真值参考，不作为产品 fallback。 |

## 3. 推荐优先级

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | Time-to-Collision Based Dynamic Obstacle Avoidance Using Pretrained Vision Models for Robots in Unstructured Environments | 进入纯视觉动态避障与近人安全回放字段，重点验证 `TTC < 1s` 检出、规避方向正确率、长尾漏检和保守停车策略。 |
| A- | StreamVLN: Streaming Vision-and-Language Navigation via SlowFast Context Modeling | 进入 VLN 低延迟和上下文预算专题，和 `LiveVLN` 一起验证 fast window、slow memory、KV cache、上下文上限和控制链路暂停次数。 |
| A- | PreSIST: Vision-Language-Informed Object Persistence Prediction in Open-World Scenes | 进入长期对象记忆 freshness 专题，验证对象持久性概率、last-seen pose 过期、重观察优先级和目标 SoC 查询成本。 |
| A- | Validate the Dream Before You Trust Its Verdict: Admissibility for World-Model Simulators | 进入 world-model assurance 专题，形成“`L0-L1` 不构成安全 verdict、`L2` 才开始具备 envelope 内可采信资格”的候选评审口径。 |
| A- | GigaWorld-1: A Roadmap to Build World Models for Robot Policy Evaluation | 作为大规模离线证据，验证 long-horizon action fidelity、policy ranking alignment、memory / action encoding 和 sim-real success gap；不进入产品在线链。 |

## 4. 论文卡片

### 4.1 Time-to-Collision Based Dynamic Obstacle Avoidance Using Pretrained Vision Models for Robots in Unstructured Environments

- arXiv：[2607.07885](https://arxiv.org/abs/2607.07885)
- Authors：Erik Jagnandan, Mulugeta Haile, Gregory Barber, Pratik Chaudhari
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-07-10 官方 listing new submission；abs 页显示 submitted on 2026-07-08；属于最新官方 listing 日更收录。
- Inclusion type：daily main card

摘要转述：

论文提出一种不依赖大量机器人专用训练数据和仿真策略的视觉动态避障方法。系统用预训练单目深度模型从 RGB 视频估计深度，再用 SuperPoint / SuperGlue 长序列跟踪关键点，将二维像素点投影到三维并通过 bundle adjustment 估计每个关键点的 `time-to-collision`。当某个关键点的碰撞时间低于阈值时，系统在地面平面上选择规避运动 primitive。论文在真实数据上报告，方法对 `TTC < 1s` 的帧识别仍有较多误检 / 漏检，但能在大多数真实障碍实例中至少触发一次低 `TTC` 检测，并在真阳性中较高比例给出正确规避方向。

Kinbot 问题映射：

1. 对应 `mobility_navigation` 与 `safety_compliance_authorization` 中“纯视觉路线如何处理家庭内动态人、宠物、椅子移动和突然穿行”的问题。
2. Kinbot 当前不能把动态避障评估只写成“识别到人 / 物体”；更关键的是低 `TTC` 窗口内是否及时降速、停等或绕行。
3. Phase 5 候选字段：`min_ttc_margin_ms`、`ttc_under_1s_detected`、`dynamic_obstacle_instance_seen`、`evasive_direction_correct`、`dynamic_obstacle_false_negative`、`conservative_stop_triggered`、`monocular_depth_confidence`。

资源消耗：

1. 单目深度、特征匹配、长序列跟踪和 BA 会带来明显端侧计算压力，必须测 batch-1 延迟、帧率、峰值内存和热稳定。
2. 论文方法不需要训练专用策略，适合先作为离线回放和安全评测 oracle，而不是直接进入在线主链路。
3. 若在线运行导致控制频率下降，应优先用低频风险提示驱动保守减速，不要让高成本视觉管线阻塞底盘安全环。

优劣势：

1. 优势：把动态避障从语义识别推进到碰撞时间和规避方向，贴近家庭移动安全。
2. 优势：纯 RGB 输入符合 Kinbot 一代传感主线，且无需大规模 sim-to-real 训练。
3. 劣势：实验场景偏室外 / 非结构化环境，精确率和召回率仍不足以单独承担安全闭环。
4. 风险：单目深度和关键点跟踪在低光、反光、细腿家具、玻璃门或快速运动中可能失效。

推荐理由：

建议作为 A- 级研究输入。它改变的是 Kinbot 动态避障的验收粒度：从“有没有动态目标检测”转为“在碰撞时间窗口内是否给出可审计的规避证据”。

主线边界：

本轮仅进入 Phase 5 动态避障与近人安全回放字段候选，不替代现有局部规划、安全停车和低层控制链路。

### 4.2 StreamVLN: Streaming Vision-and-Language Navigation via SlowFast Context Modeling

- arXiv：[2507.05240](https://arxiv.org/abs/2507.05240)
- Authors：Meng Wei, Chenyang Wan, Xiqian Yu, Tai Wang, Yuqiang Yang, Xiaohan Mao, Chenming Zhu, Wenzhe Cai, Hanqing Wang, Yilun Chen, Xihui Liu, Jiangmiao Pang
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-07-10 官方 listing replacement submission；abs 页显示 v1 submitted on 2025-07-07，v2 last revised on 2026-07-09。2026-04-29 纪要曾在 `LiveVLN` 卡片中把 `StreamVLN` 作为 baseline 间接提及，本轮是首次专卡；arXiv 元数据没有说明 v1→v2 的具体方法变化，因此本轮不把 revision 本身当作新增结论，只收录此前未提取的上下文资源与端侧反证字段。
- Inclusion type：daily main card / replacement validation item

摘要转述：

论文针对真实环境 VLN 中连续视觉流、语言指令和动作生成之间的低延迟矛盾，提出 `StreamVLN`。其核心是 slow-fast 上下文建模：fast-streaming dialogue context 用滑动窗口维护近期视觉、语言和动作交互，支持快速动作生成；slow-updating memory context 用 3D-aware token pruning 压缩历史视觉状态，保留长程信息但限制上下文体积。论文还利用 KV cache 复用来降低实时对话成本，并在 VLN-CE benchmark 上报告低延迟和较强效果。

Kinbot 问题映射：

1. 对应 `mobility_navigation`、`decision_orchestration` 与 `platform_runtime` 中“机器人一边看一边走时，高层 VLN 如何不拖慢底盘控制”的问题。
2. 2026-04-29 的 `LiveVLN` 已提示 runtime guard buffer 可减少停顿；`StreamVLN` 进一步把模型上下文分成 fast window 与 slow memory，补齐上下文预算字段。本轮需标记 `historically_indirectly_mentioned=true`，避免把它误算成全新论文证据。
3. Phase 5 候选字段：`vln_fast_window_tokens`、`vln_slow_memory_tokens`、`kv_cache_reuse_hit_rate`、`context_bound_exceeded`、`streaming_action_latency_ms`、`history_pruning_policy_id`、`navigation_pause_count`、`slow_memory_refresh_interval_ms`。

资源消耗：

1. 系统基于 `LLaVA-Video 7B / Qwen2-7B`；论文指出约 `2K` tokens 的 KV cache 可占约 `5GB`，完整训练约 `1500 A100 GPU-hours`。这不是 Kinbot `12GB RAM + 32GB Flash` 默认量产线已可承载的证据。
2. 实机部署采用 Unitree Go2 + Intel RealSense D455 RGB-D，把推理放在远端 `RTX 4090`；论文报告四个动作约 `0.27s` 推理，另有室内约 `0.2s`、室外约 `1.0s` 通信延迟。该结果既不符合纯视觉产品传感边界，也不能外推为目标 SoC 的闭环延迟。
3. voxel pruning 在 R2R / RxR 上可压缩约 `22%-32%` 视觉 / memory tokens，但仍需在目标板上测 batch-1 延迟、峰值内存、持续功耗、热稳态、网络断开和低层控制不被阻塞。

优劣势：

1. 优势：把 VLN 的长程记忆、细粒度视觉理解和低延迟三者放进同一资源合同，并给出 KV cache 与 token pruning 的可量化方向。
2. 优势：与 `LiveVLN` 的异步执行思路互补，一个偏动作 buffer，一个偏上下文预算。
3. 劣势：VLN-CE benchmark、远端 4090 和 RGB-D 实机链路与 Kinbot 家庭窄通道、纯视觉、目标 SoC 和离线运动安全边界仍有显著差距。
4. 风险：若把论文“real-time”表述直接写成量产端侧结论，会掩盖 `7B` 模型、KV cache、通信和热压力；本轮应把它当资源否证输入，而不是产品选型。

推荐理由：

建议作为 A- 级研究输入。它改变的是 Kinbot 对 VLN 低延迟的拆解方式：不仅要测端到端动作等待时间，还要测 fast / slow 上下文如何消耗内存和推理预算。

主线边界：

本轮不新增在线 VLN 主链路，仅建议进入 `VLN -> NFM` 低延迟专题和 Phase 5 上下文资源字段候选。

### 4.3 PreSIST: Vision-Language-Informed Object Persistence Prediction in Open-World Scenes

- arXiv：[2607.04057](https://arxiv.org/abs/2607.04057)
- Authors：Amanda Adkins, Tarunvidyut Ravisankar, Joydeep Biswas
- Source：arXiv `cs.RO/recent`
- 本轮 listing 口径：`Tue, 7 Jul 2026` recent entry，cross-list from `cs.CV`；abs 页显示 submitted on 2026-07-04；属于近期待补录。cross-list 进入主卡的理由是新增对象持久性、last-seen pose expiry、重观察优先级与 vision-only 部署资源字段。
- Inclusion type：weekly near-term main card / cross-list memory item

摘要转述：

长期运行的机器人通常要等重新看到物体后才知道地图过期；`PreSIST` 改为根据对象属性、支撑关系和场景上下文，主动估计某个实例在任意未来时刻仍位于 last-seen pose 的概率。`PreSIST-Lang` 用 VLM 生成对象持久性先验，`PreSIST-Vis` 再用这些伪标签训练 vision-only 模型，使部署时不需要持续调用大模型。论文在开放世界对象持久性数据上优于 class-only / VLM baseline，并在长期视觉重定位任务中通过过滤低持久性地图点改善匹配质量和 RANSAC 效率。

Kinbot 问题映射：

1. 对应 `world_state_memory` 与 `mobility_navigation` 中“药盒、眼镜、遥控器或充电器上次在那里，现在是否还值得直接去找”的问题。
2. 它与既有“记录对象最后位置”不同：记忆条目需要随时间与场景变化衰减，并在置信度不足时先重观察或向用户澄清。
3. Phase 5 候选字段：`object_persistence_probability`、`persistence_horizon_s`、`last_seen_pose_expiry`、`reobserve_priority`、`persistence_prior_source`、`persistence_prediction_latency_ms`、`stale_landmark_rejected`、`persistence_filter_update_reason`。

资源消耗：

1. `PreSIST-Lang` 使用本地 `Gemma 4 31B`，论文四个域的单对象查询约 `7.5-8.6s`，适合离线伪标或低频地图维护，不适合 Kinbot 在线找物闭环。
2. `PreSIST-Vis` 使用 DINOv2 ViT-L/14 + 轻量 adapter，论文在单张 H100 上训练 / 评测，单对象查询约 `0.04s`；这只是数据中心 GPU 结果，必须在目标 SoC 重测内存、延迟、功耗和多对象批量成本。
3. 在 `81,595` 个地图点、`339` 张图的重定位实验中，先验构建约需 `21min`（Vis）或 `2.3h`（Lang），说明更适合作为建图后 / 充电时的低频任务，而不是逐帧在线模块。

优劣势：

1. 优势：直接把长期对象记忆从静态 last-seen 记录推进为可衰减、可重观察的概率证据。
2. 优势：提供 VLM teacher → vision-only student 路线，并验证持久性过滤对下游重定位有收益。
3. 劣势：训练与速度证据均来自 H100，数据域以校园、停车场、第一视角和商店为主，家庭小物体与多人共居变化仍需验证。
4. 风险：VLM 伪标签、实例 mask 和场景常识可能共同放大偏差；高持久性预测不得替代实际重观察或用户确认。

推荐理由：

建议作为 A- 级研究输入。它改变的是 Kinbot 对长期记忆“正确”的定义：不是永远记住 last-seen pose，而是知道该记忆何时过期、何时必须重新看。

主线边界：

本轮仅建议进入长期对象记忆 freshness 与找物回放字段，不新增在线 31B VLM、原始视频长期存储或独立持久性服务。

### 4.4 Validate the Dream Before You Trust Its Verdict: Admissibility for World-Model Simulators

- arXiv：[2607.07196](https://arxiv.org/abs/2607.07196)
- Authors：Christian Oefinger, Finn Rasmus Schäfer, Korbinian Moller, Mattia Piccinini, Johannes Betz
- Source：arXiv `cs.RO/recent`
- 本轮 listing 口径：`Thu, 9 Jul 2026` recent entry，`cs.RO` new submission；abs 页显示 submitted on 2026-07-08；属于近期待补录。
- Inclusion type：weekly near-term main card / world-model governance item

摘要转述：

论文讨论把生成式 world model 当作 policy test oracle 时的“信任倒置”：传统仿真默认 simulator 可信、被测 policy 不可信，但学习式 world model 自身也是未经验证的产物，画面逼真并不代表会正确响应动作。作者借鉴 `VV&A`、`SOTIF` 和场景测试，提出 `L0-L4` 可采信阶梯：`L0` 只看生成质量；`L1` 要能随不同动作产生不同 rollout；`L2` 声明训练 envelope、有效 horizon 并对 OOD 输入拒绝；`L3` 能区分 simulator failure 与 policy failure；`L4` 要证明仿真 verdict 与真实结果可迁移。对两个自动驾驶 world model 的测试显示，视觉指标更好的模型反而可能 action-following 更差。

Kinbot 问题映射：

1. 对应 `safety_compliance_authorization`、`observability_data_governance` 与 Phase 5 证据链中“world model 生成的成功 / 安全 verdict 能否计入阶段门”的问题。
2. Kinbot 可以用 world model 做探索、负例扩充和候选场景生成，但在未声明有效 envelope、horizon 与拒绝规则前，其 verdict 不能替代实机、回放或可信仿真证据。
3. Phase 5 候选字段：`wm_admissibility_level`、`wm_action_following_score`、`wm_declared_envelope_id`、`wm_admissible_horizon_s`、`wm_ood_refused`、`wm_failure_attribution_status`、`wm_verdict_transfer_validated`、`wm_verdict_accepted_as_evidence`。

资源消耗：

1. 这是离线 assurance / audit 框架，不要求进入机器人在线运行时；主要成本来自成对真实数据、动作扰动 rollout、OOD 测试和 sim-real 相关性验证。
2. 论文下层验证使用两个驾驶 world model 与 `400` 个分层 nuScenes clips，示例中的可采信 horizon 只有秒级；没有给出 Kinbot 家庭导航所需的数据量、GPU 时长或成本。
3. 对 Kinbot 最小可行用法是先维护一张 `L0-L4` 证据表和“verdict 是否可采信”布尔门，不建设完整 certification 平台。

优劣势：

1. 优势：第一次把“世界模型看起来真实”和“世界模型有资格给安全 verdict”明确拆开，直接改善 Phase 5 证据纪律。
2. 优势：`L2` 的 envelope、horizon 与 OOD refusal 可映射为轻量字段，而不要求引入在线 world model。
3. 劣势：论文目前只实证 `L0`、`L1` 和 `L2` 的 horizon 组成，`L3-L4` 仍是框架提案；跨本体协议尚未成熟。
4. 风险：若把 `L0-L1` 结果包装成“仿真已验证安全”，会把 world model 自身的失败错误归因给 policy。

推荐理由：

建议作为 A- 级研究输入。它改变的是证据资格，而不是模型结构：world model 可以参与生成测试，但只有在声明边界、可拒绝、可归因并验证 sim-real transfer 后，verdict 才可能升级为安全证据。

主线边界：

本轮不新增 world model 产品模块，只建议进入 Phase 5 验证证据治理与离线评测专题；`L0-L4` 仍是候选评审口径，不是冻结标准。

### 4.5 GigaWorld-1: A Roadmap to Build World Models for Robot Policy Evaluation

- arXiv：[2607.02642](https://arxiv.org/abs/2607.02642)
- Authors：GigaWorld Team（Angyuan Ma, Boyuan Wang, Bohan Li, Chaojun Ni 等）
- Source：arXiv `cs.RO/recent`
- 本轮 listing 口径：`Tue, 7 Jul 2026` recent entry，`cs.RO` new submission；abs 页显示 submitted on 2026-07-02；属于近期待补录。
- Inclusion type：weekly near-term main card / world-model evaluation item

摘要转述：

论文面向“能否用 world model 代替昂贵实机 rollout 来评测机器人 policy”这一问题，构建 `WMBench`，对 `7` 个 video world models、`4` 种 action representation 和超过 `324,000` 个与真实执行配对的模拟 rollout 做系统比较，并汇入超过 `12,000h` 的训练视频。核心结论是：policy evaluator 是否可信，主要取决于长时 action-faithful rollout、对真实 policy 排名 / 成败的对齐，以及 action encoding、memory 与 evaluator-oriented post-training；短时 visual realism 或更大参数量都不足以保证评测可靠。作者据此实现 `1.3B` 与 `5B` 两档 `GigaWorld-1`。

Kinbot 问题映射：

1. 对应 Phase 5 中“世界模型能否降低导航 / Agent policy 实机回归成本，以及要用什么指标决定它有没有资格”的问题。
2. 它补强 `Validate the Dream`：前者给 evidence ladder，`GigaWorld-1` 用大规模 paired rollout 说明 long-horizon action fidelity、persistent memory 和 sim-real policy alignment 才是更接近有效 verdict 的观测量。
3. Phase 5 候选字段：`wm_policy_ranking_alignment`、`long_horizon_action_fidelity`、`real_sim_success_gap`、`rollout_horizon_s`、`action_encoding_id`、`wm_memory_configuration`、`wm_visual_quality_score`、`wm_policy_eval_disagreement`。

资源消耗：

1. `GigaWorld-1` 采用 `1.3B / 5B` video world-model backbone，训练与蒸馏配置使用 `32 × NVIDIA H20`；推理加速 benchmark 使用单张 `H20 96GB`。它不属于 Kinbot `12GB` 端侧可选项。
2. `324,000+` 人工标注 rollout、`12,000h+` 视频和成对实机执行代表研究平台级成本；Kinbot 应只借用指标与小规模 paired replay 设计，不复制数据规模。
3. 长时评测按约 `40s` autoregressive rollout 分段检查退化；对家庭移动机器人可缩成危险场景 / 恢复场景的分级 horizon，而不是生成长视频作为在线控制。

优劣势：

1. 优势：用大规模实证支持“action fidelity 与 sim-real 对齐优先于画面逼真”，并量化 memory / action interface 的作用。
2. 优势：给 world model evaluator 提供与实机 rollout 配对的评测结构，能直接改善证据 provenance。
3. 劣势：任务集中在 manipulation，数据、算力与人工标注规模远高于 Kinbot 当前边界；结论仍需在轮式家庭导航 / Agent policy 上复核。
4. 风险：如果只引入模型而不保留 paired real rollout、horizon 退化和 policy-ranking 对齐，world model 会变成昂贵的视频生成器而非可信 evaluator。

推荐理由：

建议作为 A- 级研究输入。它改变的是 Kinbot 对 world model 投入顺序的判断：先建立小规模实机配对与 long-horizon action-fidelity 指标，再决定是否值得训练 / 采购 evaluator，而不是先追求生成画质。

主线边界：

本轮不建设在线 world model 或 `WMBench` 复刻平台，只保留离线评测字段、小规模 paired rollout 试验和外部算力研究候选。

## 5. 候选排除表

| 论文 | arXiv | 未收录为主卡片原因 | 保留启发 |
| --- | --- | --- | --- |
| Imagined Rollouts are Kinematic, Not Dynamic: A Diagnosis of Long-Horizon World-Model Failure | [2607.05966](https://arxiv.org/abs/2607.05966) | `iKCE` 与摩擦 regime-boundary 诊断直接相关，但实验只覆盖 DreamerV3 + DMC walker + 单类摩擦 sweep，且与本轮两张 world-model assurance 主卡在“长时动力学可信度”上重复。 | 保留 `imagined_kinematic_consistency_error`、`regime_boundary_sensitivity`、`world_model_dynamics_failure_reason`。 |
| Open-Vocabulary Object-Goal Navigation by Generalizing Semantic Mapping with Dense CLIP | [2407.09016](https://arxiv.org/abs/2407.09016) | 2026-07-10 为 replacement，但 arXiv 元数据未说明 v1→v2 的方法变化；开放词汇语义地图主题已接近成熟，本轮没有高于 world-model assurance / memory freshness 的增量。 | 保留 `unknown_target_generalization_success`、`llm_call_avoided`、`semantic_goal_false_positive`。 |
| Input-Constrained Spatiotemporal Tubes for Safe Navigation of Unknown Euler-Lagrange Systems in Dynamic Environments | [2607.08189](https://arxiv.org/abs/2607.08189) | cross-list 确实新增执行器输入约束与 offline feasibility 字段，但理论框架到 Kinbot 底盘模型仍需接口转换；5 篇上限下先降为候选。 | 保留 `available_control_authority`、`tube_feasibility_verified_offline`、`input_saturation_event`、`safe_stop_distance_margin_mm`。 |
| iCST engagement / Co-STAR one-week in-home study | [2607.07998](https://arxiv.org/abs/2607.07998), [2607.05709](https://arxiv.org/abs/2607.05709) | 两篇同作者、同周出现、均描述一周居家认知刺激研究，分别报告 `8` 人交互分析与 `9` 人可行性研究；可能共享部分队列，但本轮尚未核对 participant / dataset lineage，不能重复计证据。 | 保留 `conversation_engagement_score`、`cognitive_fatigue_signal`、`companion_paper_id`、`participant_cohort_id`。 |
| GEM-Occ: From Visual Geometry Evidence to Embodied Semantic Occupancy Memory | [2607.05543](https://arxiv.org/abs/2607.05543) | connected indoor semantic occupancy、free / unknown 与 revisit consistency 有价值，但依赖 RGB-D benchmark，且动态 / 语义空间记忆主题已接近成熟；`PreSIST` 对家庭小物体 freshness 的增量更直接。 | 保留 `free_unknown_consistency`、`revisit_map_consistency`、`occupancy_memory_bytes_per_m2`、`dense_query_latency_ms`。 |
| EgoWAM / TFP / Harness VLA / FabriVLA / DexVerse | [2607.08436](https://arxiv.org/abs/2607.08436), [2607.08283](https://arxiv.org/abs/2607.08283), [2607.08448](https://arxiv.org/abs/2607.08448), [2607.08575](https://arxiv.org/abs/2607.08575), [2607.08751](https://arxiv.org/abs/2607.08751) | WAM representation、task-progress memory 与 agent harness 有研究价值，但实验集中在双臂 / dexterous manipulation；不改变 Kinbot V1 无手臂、轮式家庭机器人主线。 | 保留 `agent_invariant_effect_representation`、`latent_task_progress_confidence`、`primitive_failure_memory` 和动作延迟字段。 |
| APIVOT / FSD-VLN / cooperative VLN | [2607.08024](https://arxiv.org/abs/2607.08024), [2607.08359](https://arxiv.org/abs/2607.08359), [2607.08504](https://arxiv.org/abs/2607.08504) | 分别偏厨房 manipulation、航空长航程与多机通信；与 `StreamVLN` 的 fast / slow 资源主题重复，不继续扩张 planner 或协作层。 | 保留 `vlm_thought_budget`、`fast_slow_switch_reason`、`bandwidth_budget_hit`。 |
| RadLoc / Graph-Loc / SASGeo | [2607.08115](https://arxiv.org/abs/2607.08115), [2602.08417](https://arxiv.org/abs/2602.08417), [2607.07737](https://arxiv.org/abs/2607.07737) | 雷达、LiDAR 或 UAV cross-view localization 与 V1 纯视觉产品路线不一致；只作研发对照，不能成为产品 fallback。 | 保留 descriptor size、retrieval latency、positive / contradictory / unknown observation 和 alias rejection 评测口径。 |

## 6. 对 Kinbot 的落地 / 文档建议

1. 暂不回写主线架构、`03_decision_log.md` 或 Linear；本轮只作为研究输入和 Phase 5 字段候选。
2. 后续处理 `docs/05_p4_beta_dvt/01_mvp_validation_plan.md` 或样机回放模板时，可评审是否吸收以下字段包：
   - 动态避障：`min_ttc_margin_ms`、`ttc_under_1s_detected`、`evasive_direction_correct`、`dynamic_obstacle_false_negative`、`conservative_stop_triggered`
   - 流式 VLN：`vln_fast_window_tokens`、`vln_slow_memory_tokens`、`kv_cache_reuse_hit_rate`、`streaming_action_latency_ms`、`navigation_pause_count`
   - 长期对象记忆：`object_persistence_probability`、`persistence_horizon_s`、`last_seen_pose_expiry`、`reobserve_priority`、`persistence_prior_source`
   - world-model assurance：`wm_admissibility_level`、`wm_declared_envelope_id`、`wm_admissible_horizon_s`、`wm_ood_refused`、`wm_verdict_accepted_as_evidence`
   - world-model evaluator：`wm_policy_ranking_alignment`、`long_horizon_action_fidelity`、`real_sim_success_gap`、`action_encoding_id`、`wm_memory_configuration`
3. 若后续推进 `VLN -> NFM` 专题，应把 `StreamVLN` 与既有 `LiveVLN`、`CoFL-S`、`LoTIS` 放到同一低延迟 / 低层接口评估视图，并把 `7B + remote 4090 + RGB-D` 明确作为当前量产端侧反证，不单独扩张新 VLN 模块。
4. 若后续评估 world model，第一步不是训练模型，而是定义 `L0-L4` 候选证据表和少量 paired real / imagined rollout；`L0-L1` 只能支持探索，不能支持 Phase 5 安全通过。
5. 若后续推进老人看护试点，应先核对 `iCST` 与 `Co-STAR` 的 participant / dataset lineage，再定义非医疗化参与度与疲劳字段，避免一组数据重复支撑两个结论。

## 7. 主线与复杂度自检

本轮不回写主线的原因：

1. 所有论文结论仍停留在研究输入和字段候选，尚未通过 Kinbot 自有样机、家庭数据、端侧资源和安全回放验证。
2. 本轮把 world-model assurance 与 WAM / manipulation 热点拆开评估，但 `L0-L4`、`WMBench` 和对象持久性都只作为字段 / 试验候选；直接产品化仍会冲突 V1 无手臂、纯视觉和端侧优先的收敛边界。
3. 当前冻结主线仍是纯视觉、端侧优先、`12GB RAM + 32GB Flash` 默认量产线和 `5000 到 6000 元` BOM 目标。

现在的架构是不是太复杂了？

如果把本轮论文都转成新模块，答案是“是”。本轮只保留五类轻量字段：动态避障 `TTC`、流式 VLN 上下文预算、对象记忆 freshness、world-model admissibility 和 long-horizon action fidelity。它们应服务 Phase 5 离线证据链；不新增在线 world model、31B 记忆推理服务、`WMBench` 平台或 Video-LLM 导航主链路。

## 8. 来源

1. arXiv `cs.RO/new`：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent?show=2000`：[https://arxiv.org/list/cs.RO/recent?show=2000](https://arxiv.org/list/cs.RO/recent?show=2000)
3. `Time-to-Collision Based Dynamic Obstacle Avoidance Using Pretrained Vision Models for Robots in Unstructured Environments`：[https://arxiv.org/abs/2607.07885](https://arxiv.org/abs/2607.07885)
4. `StreamVLN: Streaming Vision-and-Language Navigation via SlowFast Context Modeling`：[https://arxiv.org/abs/2507.05240](https://arxiv.org/abs/2507.05240)
5. `PreSIST: Vision-Language-Informed Object Persistence Prediction in Open-World Scenes`：[https://arxiv.org/abs/2607.04057](https://arxiv.org/abs/2607.04057)
6. `Validate the Dream Before You Trust Its Verdict: Admissibility for World-Model Simulators`：[https://arxiv.org/abs/2607.07196](https://arxiv.org/abs/2607.07196)
7. `GigaWorld-1: A Roadmap to Build World Models for Robot Policy Evaluation`：[https://arxiv.org/abs/2607.02642](https://arxiv.org/abs/2607.02642)
8. `Imagined Rollouts are Kinematic, Not Dynamic: A Diagnosis of Long-Horizon World-Model Failure`：[https://arxiv.org/abs/2607.05966](https://arxiv.org/abs/2607.05966)
