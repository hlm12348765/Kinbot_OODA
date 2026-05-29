# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-27
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-27 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 为 `Tuesday, 26 May 2026`，合计 `129` 篇 entries；其中 new submissions `68` 篇、cross submissions `21` 篇、replacement submissions `40` 篇。本轮按 `3-5` 篇强相关论文 + 候选排除表口径，收录端侧实时推理调度、纯视觉相对 3D 导航地图、跨日主动询问、老人认知辅助机器人和具身问答决策评测相关 5 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-27。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 Robotics listing 日期为 `Tuesday, 26 May 2026`，合计 `129` 篇 entries；其中 new submissions `68` 篇、cross submissions `21` 篇、replacement submissions `40` 篇。
3. 官方 `cs.RO/recent` 中 `Tue, 26 May 2026` 显示 `89` 篇 recent entries，对应 new submissions 与 cross submissions，不含 replacement；本轮以 `cs.RO/new` 的完整结构作为主口径。
4. 本轮先排除 2026-05-22 至 2026-05-26 主卡片已覆盖的具身拒答 / 澄清、安全置信校准、视觉深度不确定性、隐式意图导航、VLN 在线适应、多楼层可达图、运动 / 里程计置信、动态目标检测和运行时治理条目。
5. `replacement` / `cross-list` 只在新增 Kinbot 评测项、治理项或端侧资源判断时收录；本轮主卡片中仅 `MEMOR-E` 来自 cross submission，因为它直接补充老人认知辅助、照护监督、非诊断边界和个性化互动治理项。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是继续增加泛 `VLA`、manipulation、humanoid、自动驾驶或多机器人论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：端侧推理时限、相对几何导航可解释性、主动询问收益、老人照护非诊断边界、具身问答到行动决策的断点。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 `129` 篇 entries 自动扩张主卡片数量；泛 `VLA` action head、diffusion manipulation、humanoid whole-body、自动驾驶 world model、fleet / swarm 和水下 / 空中机器人继续作为低相关或饱和主题处理。
2. `WideDepth`、`Drift-Resistant Navigation World Model`、`PoseRefer`、`AgentGrounder` 等条目有技术价值，但对本轮 Kinbot 主线的新增判断弱于 5 篇主卡片，因此进入候选排除表。
3. 本轮未收 replacement 主卡片。replacement 仅在新增可落地评测项、治理项或资源判断时进入主卡片；否则保留为后续专题候选。

## 2. 本轮总判断

本轮官方 Robotics listing 从 2026-05-25 切到 `Tuesday, 26 May 2026`，论文池明显扩张。真正值得 Kinbot 吸收的不是“更多端到端模型”，而是 5 个可转成验证字段的工程判断：端侧多任务推理需要实时调度契约，纯视觉导航需要介于拓扑图和全局一致 3D 地图之间的相对几何表达，长期家庭协作需要主动询问而不是被动推断，老人认知辅助需要非诊断和照护监督边界，具身问答评测需要覆盖从感知到即时决策的断点。

本轮对 Kinbot 有 5 个增量判断：

1. **端侧 AI 任务不是单模型吞吐问题，而是动态图的时限问题**：`RED` 将动态出现的感知 / 推理任务表达为可调度 DAG，并针对多输入多输出网络的共享参数做图重构。Kinbot 的 `12GB + 32GB` 默认量产线下，需要把 `deadline_satisfaction_rate`、`dynamic_inference_graph_change`、`shared_backbone_schedulability` 和 `runtime_interference_budget` 写进 Phase 5 回放。
2. **纯视觉导航可以不在“全局一致 3D 地图”和“弱几何拓扑图”之间二选一**：`MASt3R-Nav` 用像素级相对 3D 连通性构建 `WayPixel Costmap`，保留局部几何可用性但不要求全局几何一致。Kinbot 可把它转成相对几何导航回放字段，而不是直接追加重型 3D 地图服务。
3. **家庭长期协作需要评估“什么时候问”而不是只评估“答得准不准”**：`PACT` 把跨日交互历史、当前观察和主动询问收益组合成 ask-or-act 框架，并提出 clarification utility。Kinbot 的陪伴和照护任务应把主动澄清频率、澄清收益和打扰成本纳入同一指标。
4. **老人认知辅助必须保留非诊断边界和照护者可审计解释**：`MEMOR-E` 虽然是 cross submission，但直接对应药物提醒、日程引导、记忆互动、陪伴和 caregiver oversight。Kinbot 不应把 LLM 个性化写成医疗诊断能力；更现实的落点是阶段感知互动摘要、证据可解释和人工照护确认。
5. **具身问答评测要从“看懂场景”扩展到“能否形成即时决策”**：`EQA-Decision` 将 static scene construction、spatial understanding、task dynamics reasoning 和 instant decision 放在统一 benchmark 下。Kinbot 可用它补充家庭问答、巡护解释和操作前确认的评测维度。

周度滚动判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 端侧推理调度、运行时干扰和实时契约 | 值得进入专题 | 将 `RED` 与前序混合关键性运行时、端侧语言模型、视觉深度不确定性合并，形成 Phase 5 端侧资源与时限回放字段包。 |
| 纯视觉导航地图表达 | 值得专题跟踪 | 将 `MASt3R-Nav` 与前序纯 RGB SLAM、动态空间记忆、可达结构图合并比较，重点看相对几何是否能降低全局一致地图压力。 |
| 主动询问、澄清与偏好欠指定 | 接近专题成熟 | 近期已有隐式意图导航、欠指定奖励澄清、具身拒答 / 澄清和 `PACT`；下一步应收敛为 ask-or-act 验证指标，不再扩张对话层概念。 |
| 老人认知辅助与健康照护交互 | 仍有增量 | `MEMOR-E` 提供非诊断、阶段感知和 caregiver oversight 口径，适合作为健康管理 / 老人看护交互治理专题候选。 |
| 泛 `VLA`、world model、humanoid、自动驾驶、multi-robot | 已饱和 | 只有新增 Kinbot 家庭移动实机闭环、端侧资源实测、安全审计字段或老人照护任务映射时才进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把实时 DAG scheduler、相对 3D 图、主动询问策略、个性化 LLM、EQA 决策模型、VLA 几何增强和导航 world model 全部写成 Kinbot 一代在线组件，会明显过复杂”。建议只吸收为 5 类验证对象：端侧推理时限字段、相对几何导航回放、主动询问收益指标、老人照护非诊断边界、具身问答决策评测。暂不新增在线模型微调、通用 world model、跨日人格学习主链路或 VLA 几何注入层。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | RED: Adaptive Real-Time DAG Scheduling for Robotic Inference under Environmental Dynamics | 进入端侧资源与运行时治理专题，转成动态推理图、deadline、共享 backbone 和干扰预算字段。 |
| A- | PACT: Proactive Asking for Continual Task Assistance in Human-Robot Collaboration | 进入家庭长期协作与澄清专题，用 clarification utility 约束“主动问”和“少打扰”的平衡。 |
| B+ | MASt3R-Nav: WayPixel Navigation in Relative 3D Maps | 作为纯视觉导航地图表达候选，评估相对 3D 连通性是否能降低全局一致地图依赖。 |
| B+ | MEMOR-E: In-Context and Fine-Tuned LLM Personalization for Alzheimer's Assistive Robotics | 作为老人认知辅助治理输入，强调非诊断摘要、照护监督和可解释证据，不改写医疗能力边界。 |
| B | Extending Embodied Question Answering from Perception to Decision | 转成具身问答到即时决策的评测维度，不直接引入新模型栈。 |

## 3. 论文卡片

### 3.1 RED: Adaptive Real-Time DAG Scheduling for Robotic Inference under Environmental Dynamics

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.24044](https://arxiv.org/abs/2605.24044) |
| 本轮 listing 口径 | 2026-05-26 官方 listing new submission；abs 页显示 `Submitted on 21 May 2026` |
| 分类 | `cs.RO`, `cs.SE`, `eess.SY` |
| 方法关键词 | real-time scheduling, robotic inference, dynamic DAG, MIMONet, Jetson, resource-constrained runtime |

摘要要点转述：

论文关注动态机器人环境下的多任务神经网络推理调度。真实机器人运行时会不断出现新任务、任务依赖会变化、总体 workload 图也会重组，导致资源受限平台上的实时性和 deadline satisfaction 下降。作者提出 `RED`，把多任务推理表示为会随环境变化的 DAG，通过 deadline-aware scheduler 为中间节点分配子 deadline，并处理不可预测条件引发的异步推理。论文还针对多输入多输出网络 `MIMONet` 的共享参数特性做 workload refinement 和 graph reconstruction，使共享 backbone 在降低内存压力的同时保持可调度。实验在 NVIDIA Jetson 系列和 Apple M 系列平台上覆盖导航相关 workload，报告吞吐、deadline 满足、抗干扰、适应性和运行时开销的提升。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`mobility_navigation` 与 `observability_data_governance` 中“端侧 AI 任务变多后如何保证实时性”的问题。
2. Kinbot 一代会同时跑视觉感知、导航、交互、健康提醒、异常检测和日志回放；瓶颈不只是某个模型大小，而是动态任务图在端侧资源下是否按时完成。
3. 对应 Phase 5：建议增加 `dynamic_inference_graph_change`、`deadline_satisfaction_rate`、`sub_deadline_violation_node`、`shared_backbone_schedulability`、`runtime_interference_source` 和 `inference_overload_degradation_action` 字段。

资源消耗与部署信号：

1. 论文明确面向 Jetson family 和 Apple M-series，并讨论资源受限平台，比只报告云端模型指标更接近 Kinbot 端侧资源约束。
2. `MIMONet` 共享参数可以降低内存压力，但也会把多个任务的时延耦合到同一 backbone；Kinbot 需要验证共享 backbone 是否带来关键任务互相挤占。
3. 论文结果不能直接写成 Kinbot 实机指标，仍需在 `12GB RAM + 32GB Flash` 默认量产线和实际 SoC 上做 deadline、热、功耗和后台任务干扰回放。

优势：

1. 直接补足 Kinbot 端侧运行时治理缺口：从模型吞吐转向 deadline、动态图和干扰预算。
2. 与 Phase 5 验证高度兼容，能低成本转成日志字段和回放指标。
3. 不要求新增传感器或改变纯视觉主线，只影响端侧任务编排和可观测性。

劣势与风险：

1. 调度框架依赖对任务图、执行时间和依赖关系的建模，真实家庭场景中的尾延迟和 I/O 抖动可能更复杂。
2. 如果系统过早引入复杂 DAG 编排，会增加平台运行时和调试成本。
3. `MIMONet` 共享参数方向需要与 Kinbot 模型选型配套，不能孤立采用。

推荐理由：

建议作为 A- 级输入。它不改变 Kinbot 架构边界，但能把“端侧资源够不够”从粗粒度 BOM / 算力讨论推进到可测的 runtime contract。

### 3.2 MASt3R-Nav: WayPixel Navigation in Relative 3D Maps

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.24111](https://arxiv.org/abs/2605.24111) |
| 本轮 listing 口径 | 2026-05-26 官方 listing new submission；abs 页显示 `Submitted on 22 May 2026` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | visual navigation, relative 3D map, pixel correspondence, WayPixel Costmap, topological-geometric representation |

摘要要点转述：

论文指出机器人导航能力很大程度取决于世界表示方式：传统 3D 地图依赖全局一致几何，构建和维护成本高；图像或物体相对的拓扑图虽然轻量，但几何能力弱，常停留在 teach-and-repeat。作者提出 `MASt3R-Nav`，用图像序列中像素对应关系和每对图像的相对 3D 坐标系构建像素级连通图，不要求全局几何一致。系统进一步稀疏化 intra-image pixel connectivity，得到 `WayPixel Costmap`，并训练以该 costmap 为条件的控制器预测轨迹 rollout。实验覆盖仿真中的四类导航任务和真实世界演示，显示密集像素级相对几何比图像级或物体级条件变量更适合控制预测。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 与 `world_state_memory` 中“纯视觉路线下地图应保留多少几何”的问题。
2. Kinbot 一代不希望因全局一致 3D 地图而拉高算力和维护复杂度，也不能只依赖弱几何拓扑导致导航解释能力不足。
3. 对应 Phase 5：建议增加 `relative_3d_connectivity_confidence`、`waypixel_costmap_quality`、`local_geometry_failure_reason`、`global_map_consistency_not_required` 和 `trajectory_rollout_condition_source` 字段。

资源消耗与部署信号：

1. 论文方向上规避了全局一致几何维护，但像素级连通图和 3D grounded image matching 本身仍可能消耗较多视觉计算资源。
2. 对 Kinbot 更现实的用法是先作为离线回放和仿真评测表达，比较其与现有拓扑图、局部 costmap、视觉 SLAM 回放字段的互补性。
3. 需验证低光、反光、重复纹理、近距离遮挡和家庭动态物体下像素对应稳定性，不能直接替代当前导航基线。

优势：

1. 为纯视觉导航提供一个介于全局 3D 地图和弱拓扑图之间的候选表达。
2. `WayPixel Costmap` 能把相对几何转成控制器可用条件，比单纯视觉描述更接近底盘执行。
3. 与 Kinbot 门槛、狭窄通道、家具间隙和局部绕障的回放诊断有映射价值。

劣势与风险：

1. 像素级地图如果进入在线主链路，可能拉高计算、内存和调试复杂度。
2. 论文没有解决 Kinbot 的隐私治理、长期地图生命周期和多用户家庭变化问题。
3. 如果与已有 world state schema 叠加不当，会新增一层地图实体和接口面。

推荐理由：

建议作为 B+ 级输入。它值得进入纯视觉导航地图表达专题，但当前只作为回放 / 仿真候选，不改写一代导航主链路。

### 3.3 PACT: Proactive Asking for Continual Task Assistance in Human-Robot Collaboration

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.24350](https://arxiv.org/abs/2605.24350) |
| 本轮 listing 口径 | 2026-05-26 官方 listing new submission；abs 页显示 `Submitted on 23 May 2026` |
| 分类 | `cs.RO`, `cs.HC` |
| 方法关键词 | proactive asking, continual assistance, human-robot collaboration, cross-day history, clarification utility |

摘要要点转述：

论文研究长期人机协作中的主动询问问题。机器人在跨日协作时既有当前不完整观察，也有逐步积累的交互历史；但用户习惯、偏好和日常流程一开始未知，单纯被动推断再行动会低效且容易出错。作者提出 `PACT`，一个 ask-or-act 框架，用当前观察和历史交互评估上下文是否足够，如果不够就先请求澄清。论文的主要实现使用强化学习，也评估了其他实例化方式，并提出 `clarification utility` 指标，用于衡量辅助准确性与澄清请求频率之间的权衡。多日具身协作实验显示，相比被动推断，主动询问能提升辅助准确性和澄清收益。

解决 Kinbot 的什么问题：

1. 对应 `interaction_orchestration`、`world_state_memory` 与 `safety_compliance_authorization` 中“什么时候该问用户”的问题。
2. Kinbot 家庭场景中很多任务依赖跨日习惯，例如药物位置、提醒时机、家属偏好、老人作息和隐私区域；被动推断容易带来误操作或打扰。
3. 对应 Phase 5：建议增加 `ask_or_act_decision`、`context_sufficiency_score`、`clarification_utility`、`clarification_burden_count`、`cross_day_history_used` 和 `post_answer_success_delta` 字段。

资源消耗与部署信号：

1. 论文核心是决策框架和评测指标，不要求引入大型在线模型；适合先转成规则 / 轻量策略的验证指标。
2. 若使用强化学习实例化，需要谨慎处理家庭数据隐私、探索风险和策略回滚；Kinbot 一代不应直接上线不可审计的在线 RL。
3. 历史交互使用必须遵守原始敏感数据端侧处理和受控回流边界，尤其是老人健康、家庭作息和隐私区域。

优势：

1. 直接服务 Kinbot “聪明、温暖”的交互产品感，同时能落到可测指标，而不是泛化为大模型陪聊。
2. 与前序隐式意图导航、欠指定偏好澄清和具身拒答 / 澄清形成闭环。
3. `clarification utility` 可以约束“问得太少导致错”和“问得太多导致烦”的双重风险。

劣势与风险：

1. 论文实验环境与真实家庭长期协作仍有距离，尤其是家庭成员多、偏好冲突和老人认知变化场景。
2. 如果把跨日历史无限累积，会引发隐私、过期、冲突和删除权问题。
3. 主动询问策略一旦设计不好，会损伤陪伴体验和高端产品感。

推荐理由：

建议作为 A- 级输入。它能把 Kinbot 长期家庭协作的核心问题从“多记一点”转成“何时确认、为何确认、确认是否值得”的可验证口径。

### 3.4 MEMOR-E: In-Context and Fine-Tuned LLM Personalization for Alzheimer's Assistive Robotics

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.23941](https://arxiv.org/abs/2605.23941) |
| 本轮 listing 口径 | 2026-05-26 官方 listing cross submission from `cs.AI`；abs 页显示 `Submitted on 28 Apr 2026`。因新增老人认知辅助、照护监督和非诊断治理项，本轮进入主卡片 |
| 分类 | `cs.AI`, `cs.RO` |
| 方法关键词 | Alzheimer's assistive robotics, LLM personalization, caregiver oversight, non-diagnostic summaries, explainable AI |

摘要要点转述：

论文面向阿尔茨海默病患者的社交辅助机器人，提出 `MEMOR-E`：一个带平板交互界面的移动四足机器人，用于药物提醒、日程引导、记忆导向互动和陪伴。作者评估了微调 LLM 模拟不同阶段认知行为、解释标准神经心理语言任务回答的可行性，数据包括 235 名患者音频转写和合成健康对照。论文还研究了 in-context learning：由第二个 LLM 生成领域和严重程度相关的认知错误摘要。结果强调，系统生成的是阶段感知、非诊断的认知摘要，并通过可解释 AI 将模型输出转成照护者可读证据，支持可信人机互动和 caregiver oversight。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 一代价值排序中的 `健康管理` 与 `老人看护`，以及 `interaction_orchestration`、`observability_data_governance`、`safety_compliance_authorization`。
2. Kinbot 需要处理老人记忆、提醒、陪伴和家属协同，但不能把 LLM 个性化误写成医疗诊断或独立临床判断。
3. 对应 Phase 5：建议增加 `non_diagnostic_cognitive_summary`、`caregiver_review_required`、`evidence_snippet_for_caregiver`、`health_interaction_boundary`、`memory_prompt_source` 和 `medical_claim_blocked_reason` 字段。

资源消耗与部署信号：

1. 论文使用 fine-tuned LLM 与 ICL，端侧部署成本不明确；Kinbot 一代不应默认把认知阶段模拟模型放到本体在线运行。
2. 更现实的落地方式是端侧记录结构化互动摘要，由受控后台或人工照护流程生成非诊断总结，并保持用户 / 家属授权。
3. 患者音频转写、认知摘要和照护建议属于高敏数据，必须维持原始敏感数据端侧处理和受控回流边界。

优势：

1. 与 Kinbot 健康管理、陪伴交互和老人看护价值排序高度相关。
2. 明确提出非诊断摘要和照护者监督，能防止产品叙事越界。
3. 适合为 Phase 5 试点定义“机器人可提示 / 可总结 / 必须转人工”的边界。

劣势与风险：

1. 医疗和认知辅助属于高风险场景，论文结果不能直接作为产品有效性或临床能力证明。
2. 四足机器人和平板交互形态与 Kinbot 当前本体 / 躯干屏路线不同，不能照搬形态。
3. LLM 生成的认知摘要存在幻觉、偏差和过度解释风险，必须有人审和证据链约束。

推荐理由：

建议作为 B+ 级输入。它不改变 Kinbot 当前医疗边界，但应进入老人认知辅助治理专题，用来收敛非诊断、照护监督和隐私字段。

### 3.5 Extending Embodied Question Answering from Perception to Decision

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.25813](https://arxiv.org/abs/2605.25813) |
| 本轮 listing 口径 | 2026-05-26 官方 listing new submission；abs 页显示 `Submitted on 25 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | embodied question answering, decision benchmark, spatial reasoning, task dynamics, VLM evaluation |

摘要要点转述：

论文指出现有 Embodied Question Answering benchmark 往往碎片化，只覆盖空间理解、程序推理等局部能力，缺少统一的大规模评测框架。作者提出 `EQA-Decision`，将具身推理拆为四个互补维度：静态场景构建、空间理解、任务动态推理和即时决策。数据集包含超过 400 万个问答对，并带有层级标注，覆盖多样具身场景。作者还提出 `RoboDecision` 基线模型，用于统一评估感知、推理和行动级决策。实验显示，该 benchmark 能评估并增强 VLM 在空间和交互推理上的能力，为具身智能研究提供更综合的评测基础。

解决 Kinbot 的什么问题：

1. 对应 `interaction_orchestration`、`world_state_memory`、`mobility_navigation` 与 `safety_compliance_authorization` 中“机器人回答问题后是否知道下一步该怎么做”的问题。
2. Kinbot 家庭巡护、健康提醒和帮助类任务不能只回答“看到了什么”，还要判断“现在是否该行动、是否要确认、是否存在风险”。
3. 对应 Phase 5：建议增加 `eqa_reasoning_type`、`spatial_answer_grounding`、`task_dynamics_reasoning_success`、`instant_decision_correctness` 和 `answer_to_action_boundary` 字段。

资源消耗与部署信号：

1. 论文主要提供 dataset / benchmark 和基线模型，不提供 Kinbot 端侧部署路径。
2. 对 Kinbot 更现实的价值是构造离线评测任务，而不是直接引入 `RoboDecision` 模型。
3. 若将问答扩展到决策，必须接入安全授权和操作确认边界，避免 VLM 回答直接驱动高风险动作。

优势：

1. 将具身问答从感知问题扩展到任务动态和即时决策，贴近 Kinbot 真实家庭交互。
2. 四类 reasoning dimension 可以帮助定位失败来源，适合写入评测集设计。
3. 与 PACT 的 ask-or-act、IntentionNav 的隐式意图评测形成互补。

劣势与风险：

1. 数据集规模很大，但与 Kinbot 家庭场景、老人健康任务和中文交互仍有 domain gap。
2. benchmark 增强不等于产品能力达标，需要与实机回放、用户确认和安全门控结合。
3. 如果把 EQA 决策模型作为在线控制器，会扩大模型层和风险面。

推荐理由：

建议作为 B 级输入。它适合作为 Kinbot 具身问答评测维度，不应触发新的在线模型主链路。

## 4. 候选排除表

| 论文 | arXiv | 类型 | 未收录原因 |
| --- | --- | --- | --- |
| RePlan-Bot: Multi-Level Replanning for Embodied Instruction Following | [2605.25851](https://arxiv.org/abs/2605.25851) | new | 长程指令跟随和多级 replanning 有价值，但 Kinbot 近期已经覆盖运行时治理、预执行验证和任务物理可实现性；本轮只保留为后续 EIF 失败归因候选，暂不新增在线 LLM auditor。 |
| WideDepth: Millimeter-Accurate Benchmark for Fisheye Depth Estimation | [2605.24074](https://arxiv.org/abs/2605.24074) | cross | 对鱼眼 / 广角深度评测有价值，但当前头部主双目方案尚未确认采用鱼眼作为一代关键配置；本轮不因 cross-list 改写视觉传感主线。 |
| PoseRefer: Pathway-Local Parameters for Semantically Grounded Reference Resolution | [2605.24622](https://arxiv.org/abs/2605.24622) | new | “手势 + 语言 + 场景几何”的指代消解贴近家庭交互，但论文更像可靠性诊断小样本研究，当前 top-1 指标仍低；先作为多模态交互评测候选。 |
| Understanding the Impact of Geometric Foundation Models on Vision-Language-Action Models | [2605.24642](https://arxiv.org/abs/2605.24642) | cross | 对 VLA 几何缺口分析有启发，但本轮不扩张 manipulation / VLA 主链路；只有后续出现 Kinbot 移动导航端侧几何资源实测时再专题吸收。 |
| Drift-Resistant Navigation World Model with Anchored Epipolar Guidance | [2605.24761](https://arxiv.org/abs/2605.24761) | cross | 减少导航 world model 的感知和几何漂移有研究价值，但生成式 rollout 仍偏重，且 world model 主题近期已饱和；暂不作为一代在线导航依赖。 |
| AgentGrounder: Zero-Shot 3D Visual Pointcloud Grounding using Multimodal Language Models | [2605.25901](https://arxiv.org/abs/2605.25901) | cross | selective retrieval 和几何推理可借鉴，但依赖 colored point clouds 与离线 object lookup table；Kinbot 一代纯视觉地图与隐私边界尚不支持直接纳入。 |
| Elevator-LIO: Robust LiDAR-Inertial Odometry for Multi-Floor Navigation under Elevator-Induced Non-Inertial Motion | [2605.24495](https://arxiv.org/abs/2605.24495) | new | 解决电梯跨楼层 LiDAR-inertial odometry，和 Kinbot 一代纯视觉、非跨楼层产品边界不一致；保留为未来商用楼宇机器人参考。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮不回写主线架构、`03_decision_log.md` 或 Linear。5 篇主卡片均为研究输入，尚未改变一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线或 `5000 到 6000 元` 当前冻结 BOM 目标。
2. 建议在后续 Phase 5 验证字段包中吸收 5 类字段：端侧推理时限、相对几何导航回放、主动询问收益、老人认知辅助非诊断边界、具身问答到即时决策的断点。
3. `PACT`、`MEMOR-E` 与前序欠指定澄清 / 具身拒答论文应合并成“家庭长期协作 ask-or-act 与照护边界”专题，避免继续分散成多个对话层概念。
4. `RED` 与前序端侧资源论文应合并成“运行时契约 + 端侧资源回放”专题，优先输出日志字段和验收指标，而不是先设计复杂 runtime 中间层。

## 6. 来源

- arXiv `cs.RO/new` official listing: [https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
- arXiv `cs.RO/recent` official listing: [https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
- `RED`: [https://arxiv.org/abs/2605.24044](https://arxiv.org/abs/2605.24044)
- `MASt3R-Nav`: [https://arxiv.org/abs/2605.24111](https://arxiv.org/abs/2605.24111)
- `PACT`: [https://arxiv.org/abs/2605.24350](https://arxiv.org/abs/2605.24350)
- `MEMOR-E`: [https://arxiv.org/abs/2605.23941](https://arxiv.org/abs/2605.23941)
- `EQA-Decision`: [https://arxiv.org/abs/2605.25813](https://arxiv.org/abs/2605.25813)
- 候选排除表条目：[`RePlan-Bot`](https://arxiv.org/abs/2605.25851)、[`WideDepth`](https://arxiv.org/abs/2605.24074)、[`PoseRefer`](https://arxiv.org/abs/2605.24622)、[`Geometric Foundation Models for VLA`](https://arxiv.org/abs/2605.24642)、[`Drift-Resistant Navigation World Model`](https://arxiv.org/abs/2605.24761)、[`AgentGrounder`](https://arxiv.org/abs/2605.25901)、[`Elevator-LIO`](https://arxiv.org/abs/2605.24495)
