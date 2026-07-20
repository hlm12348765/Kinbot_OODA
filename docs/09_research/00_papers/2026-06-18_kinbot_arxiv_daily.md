# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-18
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-18 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API 与论文详情页，确认本轮官方 `cs.RO/new` 最新 Robotics listing 仍为 `Wednesday, 17 June 2026`，合计 `80` 篇 entries；其中 new submissions `43` 篇、cross submissions `11` 篇、replacement submissions `26` 篇。`cs.RO/recent` 顶部已出现 `Thu, 18 Jun 2026`，显示 `Total of 354 entries`，其中 `Thu, 18 Jun 2026` 为 `62` 篇 entries；本轮按仓库规则以 `cs.RO/new` 作为正式 listing 与计数口径，以 `cs.RO/recent` 作为近期待补录来源，收录人身伤害预防安全集、几何监督导航 VLA、AI sandbox 验证边界、LLM 任务规划形式化验证和空间一致语义检索 5 篇论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-06-18。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 仍为 `Wednesday, 17 June 2026`，合计 `80` 篇 entries；其中 new submissions `43` 篇、cross submissions `11` 篇、replacement submissions `26` 篇。
3. 官方 `cs.RO/recent` 顶部已出现 `Thu, 18 Jun 2026`，显示 `Total of 354 entries`，其中 `Thu, 18 Jun 2026` 为 `62` 篇 entries；该页仅用于近期待补录和重复主题复核，不作为本轮 official `new / cross / replacement` 计数口径。
4. 本轮 `cs.RO/new` 与 `cs.RO/recent` 顶部日期不一致，因此按仓库规则以 `cs.RO/new` 作为正式 Robotics listing、entries 总数与 `new / cross / replacement` 计数口径；`cs.RO/recent` 只作为顶部日期、近期待补录和重复主题复核辅助。
5. 2026-06-17 已覆盖 `Wednesday, 17 June 2026` official listing 中的 `VL-MemKnG`、`VISTA`、`Contactless Respiratory Monitoring`、`Qwen-RobotNav` 和 `Edge-TSR` 5 篇主卡片，本轮不重复收录这些主题。

筛选标准：

1. 是否改变 Kinbot 对家庭室内导航、长期记忆、安全治理、端侧资源或 Phase 5 验证证据链的判断。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`decision_orchestration`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证字段：人身伤害拒绝、碰撞 / 近碰风险、导航几何监督、任务规划约束验证、sandbox 证据边界、空间语义一致性和端侧语义检索成本。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `EffiNav`、`WalkOCC` 和拥挤环境 tour planning 有导航价值，但 ObjectNav / 占用预测 / 公共空间巡游主题近期已接近饱和；本轮只在候选排除表保留字段，不新增导航主链路。
2. `SC3-Eval`、`DREAM-Chunk`、`Mem-World`、`Recover, Discover, Plan` 等涉及 world model、action chunk 或 failure learning，但主体偏 manipulation / VLA 评测；本轮不把它们升级为 Kinbot 在线 world model 或自我改进能力。
3. `Sensor Configuration Matters`、`FAST-LIVGO`、`WalkOCC` 等含 LiDAR / GNSS / 多模态传感或四足平台设定，不能改写 Kinbot 一代纯视觉传感主线。
4. 大量 dexterous manipulation、humanoid、tactile、soft robot 和 underwater / maritime / aerial 条目与 Kinbot 一代家庭轮式本体主线距离较远，本轮进入候选排除表或不收录。

## 2. 本轮总判断

本轮真正新增的判断是：Kinbot 的 Phase 5 论文吸收应从“更多导航 / VLA / world model 方法”进一步收敛到“验证对象、拒绝边界、证据边界和语义一致性字段”。

1. **家庭机器人安全必须覆盖人身伤害预防，而不是只看任务成功率**：`ROBOSHACKLES` 显示，现有 embodied foundation models 在安全关键场景下可能稳定生成不安全动作。Kinbot 应把人身伤害风险、间接危险和动作前拒绝能力列为独立验证项。
2. **导航 VLA 的价值在训练和评测信号，不在立即替换导航栈**：`VEGA` 说明互联网第一视角视频可通过几何监督变成导航训练 / benchmark 资产，但 Kinbot 当前更应吸收碰撞率、障碍 clearance 和几何监督来源字段，而不是引入新的在线 VLA 主模型。
3. **Phase 5 试验场必须写清证据边界**：`AI Sandboxes` 提醒，sandbox 不是天然等同真实安全，它只能支持有边界的部署主张；Kinbot 的仿真、回放和家庭样机试点应记录 fidelity、containment、observability、reproducibility 和 governance artifact 完整性。
4. **自然语言任务规划需要形式化约束闭环**：`As You Wish` 说明，LLM 可以帮助把自然语言任务转成可验证任务规格，但歧义、偏差和错误公式仍存在。Kinbot 的上层任务规划应把用户意图、约束生成、验证结果和执行计划分层留痕。
5. **空间语义一致性比单点识别更重要**：`ReSiReg` 提醒，密集 VLM embedding 可能语义噪声大、空间不一致；Kinbot 的家庭语义记忆不应只存“识别到什么”，还要记录空间一致性、patch / prototype 置信和端侧模型预算。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 人身伤害预防、拒绝学习、动作前 hazard anticipation | 值得专题跟踪 | 将 `ROBOSHACKLES` 与前序具身安全、近人安全、动作 OOD 干预门合并，形成 `human_injury_risk_class`、`pre_action_refusal_decision`、`hazard_anticipation_trace` 字段。 |
| 导航 VLA / egocentric video / 几何监督 | 值得轻量跟踪 | 吸收 `VEGA` 的几何监督、碰撞率和 obstacle clearance 字段；不新增在线导航 VLA backbone。 |
| AI sandbox / 仿真回放 / 试点证据边界 | 值得进入 Phase 5 字段候选 | 将 `AI Sandboxes` 与既有 provenance TODO 合并为最小 evidence boundary 字段；不建设完整 sandbox 平台。 |
| LLM mission planning / 形式化验证 | 值得轻量跟踪 | 记录自然语言请求、约束公式、验证结果和 plan revision；不把 LLM 规划器写成自动执行主链路。 |
| 空间一致语义检索 / compact dense VLM | 候选专题 | 吸收 `spatial_semantic_consistency_score`、`semantic_prototype_id`、`dense_vlm_model_size_m` 字段；不新建语义地图引擎。 |
| ObjectNav / depth fusion / occupancy / sidewalk navigation | 已接近饱和 | 只有新增家庭实机、纯视觉低资源或安全失败字段时进入主卡片。 |
| manipulation / humanoid / tactile / dexterous hand | 低相关或已饱和 | 除非新增家庭移动安全、健康感知、端侧资源或 Phase 5 轻量字段，否则进入候选排除表。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 safety dataset、navigation VLA、AI sandbox、LTL planner、compact dense VLM、ObjectNav、world model evaluator 和 action chunking 全部写成在线子系统，会过复杂”。建议只吸收 17 类轻量字段：`human_injury_risk_class`、`hazard_category_direct_indirect`、`pre_action_refusal_decision`、`unsafe_action_generation_rate`、`video_hazard_rollout_source`、`navigation_geometry_supervision_source`、`collision_rate_delta`、`obstacle_clearance_margin`、`goal_progress_score`、`sandbox_fidelity_level`、`sandbox_containment_boundary`、`evidence_weakest_link_score`、`formal_spec_generation_source`、`mission_ltl_verification_result`、`plan_revision_count`、`spatial_semantic_consistency_score`、`dense_vlm_model_size_m`。暂不新增在线安全合成数据平台、导航 VLA 主模型、完整 AI sandbox 平台、自动 LTL 规划器或语义地图新引擎。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | ROBOSHACKLES: A Safety Dataset for Human-Injury Prevention in Embodied Foundation Models | 进入人身伤害预防与拒绝学习专题，吸收动作前 hazard anticipation、拒绝判定和 direct / indirect harm 字段；不直接引入合成视频安全训练平台。 |
| A- | VEGA: Learning Navigation VLAs from In-the-Wild Egocentric Video with Geometric Trajectory Supervision | 进入导航数据与几何监督评测候选，吸收碰撞率、障碍 clearance 和几何监督来源字段；不替换当前导航栈。 |
| A- | AI Sandboxes: A Threat Model, Taxonomy, and Measurement Framework | 进入 Phase 5 证据边界字段候选，吸收 sandbox fidelity、containment、observability 和 weakest-link evidence 口径；不升级为完整平台交付范围。 |
| B+ | As You Wish: Mission Planning with Formal Verification using LLMs in Precision Agriculture | 进入任务规划验证候选，吸收自然语言任务到形式化约束再到执行计划的审计链；不作为自动执行主链路。 |
| B+ | ReSiReg: Towards Spatially Consistent Semantics in Language-Conditioned Robotic Tasks | 进入空间语义一致性候选，吸收 dense VLM spatial consistency 与 compact model 资源字段；不新增语义地图引擎。 |

## 3. 论文卡片

### 3.1 ROBOSHACKLES: A Safety Dataset for Human-Injury Prevention in Embodied Foundation Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.18632](https://arxiv.org/abs/2606.18632) |
| 本轮 listing 口径 | `cs.RO/recent` entry date 为 `Thu, 18 Jun 2026`；近期待补录；abs 页显示 `Submitted on 17 Jun 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | human-injury prevention, embodied foundation model safety, hazard-aware video synthesis, refusal learning, safety benchmark |

摘要要点转述：

论文关注 embodied foundation models 在执行机器人动作前是否能识别人身伤害风险。作者认为真实采集“机器人伤人”数据不安全也不合伦理，因此从真实 `DROID` 观测出发，先理解场景，再编辑出危险状态，生成时间提示，并合成机器人 rollout 视频。最终构建 `ROBOSHACKLES`，包含 `10000` 段安全关键机器人视频，覆盖直接伤害和间接伤害两类大方向。作者用拒绝式安全标准评估多个代表性模型，发现被测模型在这些安全关键场景中仍会生成不安全动作。该数据集的核心价值不是证明某个模型更好，而是把动作前 hazard anticipation 和 refusal learning 变成可规模化评测对象。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`decision_orchestration` 和 `observability_data_governance` 中“机器人在近人家庭环境中什么时候必须拒绝或降级”的问题。
2. Kinbot 的老人看护、家庭巡护、跟随和找物都可能出现间接危险，例如堵住通道、推近障碍、误触敏感物或在老人跌倒附近执行不合适动作。
3. 对应 Phase 5：建议增加 `human_injury_risk_class`、`hazard_category_direct_indirect`、`pre_action_refusal_decision`、`unsafe_action_generation_rate`、`hazard_anticipation_trace` 和 `video_hazard_rollout_source` 字段。

资源消耗与部署信号：

1. 论文的数据构建依赖视频生成和危险状态编辑，不适合直接搬到 Kinbot 端侧。
2. 对 Kinbot 更可落地的是离线 safety regression set、回放集和动作前拒绝评测，而不是在线生成危险视频。
3. 若引入类似合成安全样本，需要记录来源、编辑规则、危害类别和是否通过人工复核，避免把合成场景误作真实家庭分布。

优势：

1. 直接面向人身伤害预防，比普通任务成功率更贴近家庭机器人底线安全。
2. 把 direct harm 与 indirect harm 拆开，有助于覆盖“机器人没有撞人但造成危险条件”的场景。
3. 拒绝式评测可以嵌入 Kinbot 的动作授权、近人安全和异常上报流程。

劣势与风险：

1. 合成视频的真实度和危险覆盖面仍需要人工审查。
2. `DROID` 观测和操作型机器人数据不等同于 Kinbot 轮式家庭陪伴本体。
3. 不能把“模型会拒绝”当作唯一安全机制，仍需底层速度限制、碰撞 envelope 和硬件急停。

推荐理由：

建议作为 A- 级输入。它应进入人身伤害预防与拒绝学习专题，帮助 Kinbot 把安全验证从“是否完成任务”扩展到“是否能在危险动作前拒绝或降级”；不建议直接新增合成安全数据平台。

### 3.2 VEGA: Learning Navigation VLAs from In-the-Wild Egocentric Video with Geometric Trajectory Supervision

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.18426](https://arxiv.org/abs/2606.18426) |
| 本轮 listing 口径 | `cs.RO/recent` entry date 为 `Thu, 18 Jun 2026`；近期待补录；abs 页显示 `Submitted on 16 Jun 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | navigation VLA, egocentric video, geometric trajectory supervision, collision avoidance, obstacle clearance |

摘要要点转述：

论文尝试从未标注的互联网第一视角导航视频中训练导航 `VLA`。这些视频能覆盖真实空间、近距离障碍和自然人类运动，但缺少机器人坐标系下的目标和可执行轨迹。`VEGA` 的做法是在训练阶段从单目视频重建局部几何，采样文本、图像或空间 waypoint 形式的导航目标，并基于几何生成避障轨迹，再用这些轨迹训练 flow-matching 导航策略。几何只在训练时使用，目标是把避障能力蒸馏到视觉策略中。论文还提出 `VEGA-Bench`，覆盖大量场景、目标和几何标注，用于评估 goal progress、collision avoidance 和 obstacle clearance。实验显示该方法在仿真和真实试验中降低碰撞并提升障碍 clearance。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 和 `platform_runtime` 中“如何从大量低成本视频获得导航训练 / 验证信号”的问题。
2. Kinbot 当前需要家庭样机试点和回放数据集，但不能指望早期就有大量机器人标注轨迹；第一视角视频和几何监督可作为离线数据增强方向。
3. 对应 Phase 5：建议增加 `navigation_geometry_supervision_source`、`goal_progress_score`、`collision_rate_delta`、`obstacle_clearance_margin`、`egocentric_video_domain_gap` 和 `geometry_used_train_only` 字段。

资源消耗与部署信号：

1. 论文的关键成本在离线几何重建、轨迹生成和 VLA 训练，不应默认进入端侧运行链路。
2. Kinbot 可吸收其 benchmark 字段和数据生成思路，用于家庭场景回放集设计。
3. 如果未来使用类似方法，应明确几何监督来自训练 / 标注流程，不等于产品运行时新增深度相机或主动传感器。

优势：

1. 能把未标注第一视角视频转成导航监督，适合早期数据不足阶段。
2. 评估指标直接包含碰撞与 clearance，比单纯成功率更安全。
3. 强调训练时几何、运行时视觉的分离，和 Kinbot 一代纯视觉产品边界相容。

劣势与风险：

1. 互联网 egocentric 视频与老人家庭、低速底盘和室内窄通道仍有明显 domain gap。
2. `VLA` 训练成本和推理稳定性不适合直接写成当前产品基线。
3. 论文的目标采样和轨迹生成质量若有偏差，会放大到导航策略。

推荐理由：

建议作为 A- 级输入。它应进入导航数据与几何监督评测候选，帮助 Kinbot 设计低成本导航回放集和碰撞 / clearance 字段；不建议替换当前导航栈或新增在线导航 `VLA` 主模型。

### 3.3 AI Sandboxes: A Threat Model, Taxonomy, and Measurement Framework

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.18532](https://arxiv.org/abs/2606.18532) |
| 本轮 listing 口径 | `cs.RO/recent` entry date 为 `Thu, 18 Jun 2026`；近期待补录；abs 页显示 `Submitted on 16 Jun 2026` |
| 分类 | `cs.CR`, `cs.AI`, `cs.RO`, `cs.SE` |
| 方法关键词 | AI sandbox, assurance, cyber-physical threat model, evidence boundary, fidelity, reproducibility |

摘要要点转述：

论文把 AI sandbox 定义为带有隔离、仿真、观测、监督和证据捕获能力的受控环境，并特别讨论物理 AI、AIoT 和 cyber-physical 系统。作者强调，sandbox 测试结果只能支持有边界的部署主张，因为系统可能通过物理过程、网络设备和人类操作员产生失败。论文形式化了 sandbox 边界，提出 weakest-link 规则来组合不同维度的证据，并区分不同 sandbox 类型。它还给出 cyber-physical threat model，把对验证装置本身的攻击也纳入风险，最后用 fidelity、controllability、observability、containment、reproducibility 和 governance artifacts 等维度构成度量框架。

解决 Kinbot 的什么问题：

1. 对应 `observability_data_governance`、`platform_runtime` 和 `safety_compliance_authorization` 中“仿真、回放和家庭样机试点的证据能证明什么、不能证明什么”的问题。
2. Kinbot Phase 5 已多次出现 provenance 与 evidence lineage TODO，本论文提供了更清晰的证据边界语言。
3. 对应 Phase 5：建议增加 `sandbox_fidelity_level`、`sandbox_containment_boundary`、`sandbox_observability_coverage`、`sandbox_reproducibility_score`、`governance_artifact_complete`、`evidence_weakest_link_score` 和 `bounded_deployment_claim` 字段。

资源消耗与部署信号：

1. 论文是方法论和测量框架，不要求新增端侧模型。
2. 对 Kinbot 的主要成本是试验模板、元数据字段和证据链管理，而不是硬件 BOM。
3. 如果把它升级为完整 sandbox 平台，会明显超出当前 Phase 5 最小验证模板范围，应先字段化吸收。

优势：

1. 直接补齐“验证证据是否足以支持部署判断”的治理口径。
2. weakest-link 规则适合防止某个强指标掩盖数据、场景、隔离或复现性短板。
3. 将验证装置本身纳入威胁模型，适合机器人端云系统和家庭试点。

劣势与风险：

1. 论文偏框架化，需要 Kinbot 自己收敛成最小字段，不能照搬为平台需求。
2. 若字段过多，Phase 5 模板会变重，反而降低执行效率。
3. 不能用 sandbox 结果替代真实家庭样机试点。

推荐理由：

建议作为 A- 级输入。它应进入 Phase 5 证据边界字段候选，帮助 Kinbot 把仿真、回放和实机试点的证据边界写清楚；不建议新增完整 AI sandbox 平台交付范围。

### 3.4 As You Wish: Mission Planning with Formal Verification using LLMs in Precision Agriculture

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.18519](https://arxiv.org/abs/2606.18519) |
| 本轮 listing 口径 | `cs.RO/recent` entry date 为 `Thu, 18 Jun 2026`；近期待补录；abs 页显示 `Submitted on 16 Jun 2026` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | LLM mission planning, linear temporal logic, formal verification, natural language ambiguity, feedback loops |

摘要要点转述：

论文基于作者此前的农业机器人 LLM 任务规划系统，进一步处理自然语言任务描述的歧义问题。系统让 LLM 从自然语言生成任务规格，并引入线性时序逻辑用于验证任务规划是否满足用户规格。架构中包含多个反馈循环，并用不同商业 LLM 分别承担规格生成与验证子任务，以降低单一模型偏差。实验重点不是证明 LLM 可以无约束自动规划，而是分析 LLM 生成形式化公式的能力边界，以及 verification loop 如何修正任务规划中的错误。

解决 Kinbot 的什么问题：

1. 对应 `decision_orchestration`、`safety_compliance_authorization` 和 `observability_data_governance` 中“用户自然语言任务如何变成可审计、可验证、可执行计划”的问题。
2. Kinbot 家庭任务如“晚上看看老人有没有起夜”“帮我确认药有没有吃”“别打扰但有异常叫我”都带歧义和安全约束，不能直接交给 LLM 生成动作序列。
3. 对应 Phase 5：建议增加 `natural_language_mission_input`、`formal_spec_generation_source`、`mission_ltl_verification_result`、`verification_feedback_loop_count`、`plan_revision_count` 和 `execution_constraint_violation_reason` 字段。

资源消耗与部署信号：

1. 形式化验证本身可在云端、开发工具链或离线评测中运行，不必进入低延迟端侧控制环。
2. 多 LLM 交叉生成和验证会增加调用成本与不确定性，适合任务规划审核，不适合作为每个底层动作的实时依赖。
3. Kinbot 可先把 LTL / 约束验证作为高风险任务模板和回放审计工具。

优势：

1. 把自然语言意图、形式化规格和验证结果分层，利于审计。
2. 反馈循环能暴露 LLM 规格生成失败，而不是把错误计划静默下发。
3. 适合高风险家庭任务的事前约束检查和事后复盘。

劣势与风险：

1. 农业任务规划与家庭老人看护在语义、隐私和实时性上不同。
2. LLM 生成的形式化公式本身可能错误，仍需要模板约束和人工校验。
3. 过度形式化会拖慢普通低风险任务，不宜一刀切。

推荐理由：

建议作为 B+ 级输入。它应进入任务规划验证候选，帮助 Kinbot 定义自然语言任务到形式化约束再到执行计划的审计链；不建议把 LLM 规划器升级为自动执行主链路。

### 3.5 ReSiReg: Towards Spatially Consistent Semantics in Language-Conditioned Robotic Tasks

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.19088](https://arxiv.org/abs/2606.19088) |
| 本轮 listing 口径 | `cs.RO/recent` entry date 为 `Thu, 18 Jun 2026`；近期待补录；abs 页显示 `Submitted on 17 Jun 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | dense VLM, spatial consistency, language-grounded retrieval, visual prototypes, compact model |

摘要要点转述：

论文指出，VLM 的 dense embedding 虽能支持机器人按自然语言找目标，但语义噪声较大、空间一致性不足，难以直接支撑机器人同时理解语义和 3D 空间。作者提出 `ReSiReg`，利用 VLM 中更具空间一致性的中间层特征重建 dense language-grounded retrieval 表示。方法会把中间表示聚成视觉原型，生成原型级语言描述，再用这些原型的软组合重建 patch 级语言 embedding。论文在开放词汇分割和 3D mapping 上评估，并展示真实机器人场景中的空间一致 target activation；同时提供约 `25M` 参数的紧凑 dense VLM，资源信号较明确。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`mobility_navigation` 和 `platform_runtime` 中“家庭语义地图如何避免语义漂移和 patch 级噪声”的问题。
2. Kinbot 需要稳定理解“药盒在桌上”“门口有新障碍”“老人常用杯子在厨房”等空间语义事实，不能只依赖单帧识别标签。
3. 对应 Phase 5：建议增加 `spatial_semantic_consistency_score`、`semantic_prototype_id`、`patch_language_retrieval_confidence`、`dense_vlm_model_size_m`、`semantic_activation_spread` 和 `map_semantic_noise_case` 字段。

资源消耗与部署信号：

1. 论文提供紧凑模型方向，对 `12GB RAM + 32GB Flash` 默认线比大 VLM 更友好。
2. 真实落地仍需评估连续视频、家庭照明、遮挡、镜面 / 透明物体和端侧延迟。
3. Kinbot 可先把空间一致性作为语义地图质量指标，而不是直接更换 perception backbone。

优势：

1. 聚焦空间一致语义，而不是单点识别准确率，贴近机器人地图和导航需求。
2. visual prototype 方式有助于解释语义激活来源。
3. 紧凑模型给出端侧资源候选方向。

劣势与风险：

1. 论文展示场景偏语言条件任务和 manipulation，家庭长期语义记忆仍需单独验证。
2. 空间一致性提升不等于物理可达、可抓取或可安全接近。
3. 需要与 Kinbot 的纯视觉定位、房间拓扑和对象生命周期字段对齐。

推荐理由：

建议作为 B+ 级输入。它应进入空间语义一致性候选，帮助 Kinbot 把家庭语义记忆质量从“识别是否正确”扩展到“语义在空间上是否稳定、可追溯、端侧可承受”；不建议新增独立语义地图引擎。

## 4. 候选排除表

| 论文 | arXiv | 本轮口径 | 未收录原因 |
| --- | --- | --- | --- |
| EffiNav: Fusing Depth and Vision-Language for Efficient Object Goal Navigation | [2606.18634](https://arxiv.org/abs/2606.18634) | `cs.RO/recent` 2026-06-18 近期待补录 | ObjectNav、路径效率和物理机器人验证有价值，但 depth + vision-language fusion 与 GOAT / HM3D / OVON 主题近期已接近饱和；保留 `frontier_revisit_ratio`、`path_efficiency_delta`、`memory_augmented_objnav_eval` 候选字段，不进入主卡片。 |
| Monocular 3D Occupancy Perception for Robots on Sidewalks via Hybrid 2D-3D Learning | [2606.19122](https://arxiv.org/abs/2606.19122) | `cs.RO/recent` 2026-06-18 近期待补录 | 单目 3D occupancy 与安全导航相关，但数据和场景偏 sidewalk，且训练依赖 LiDAR-RGB paired data；不改写 Kinbot 纯视觉家庭室内主线，只保留 `monocular_occupancy_failure_case` 候选。 |
| Congestion-Aware Robot Tour Planning in Crowded Environments | [2606.19031](https://arxiv.org/abs/2606.19031) | `cs.RO/recent` 2026-06-18 近期待补录 | 拥挤人群中的概率 tour planning 对服务机器人有参考价值，但场景是商场 / 博物馆级公共空间；Kinbot 家庭近人安全更偏低速窄空间，保留 `human_congestion_cost` 与 `crowd_replan_trigger` 候选。 |
| Learning to Annotate Delayed and False AEB Events | [2606.19186](https://arxiv.org/abs/2606.19186) | `cs.RO/recent` 2026-06-18 近期待补录 | 延迟 / 误触发安全事件标注对 Kinbot 近碰、误报、漏报日志有价值，但论文主体是车辆 AEB 生产系统；保留 `delayed_false_trigger_annotation`、`rare_safety_event_recall` 候选。 |
| SC3-Eval: Evaluating Robot Foundation Models via Self-Consistent Video Generation | [2606.18610](https://arxiv.org/abs/2606.18610) | `cs.RO/recent` 2026-06-18 近期待补录 | 自一致视频生成可补充 policy evaluator，但主体是 manipulation policy 和视频 world model；本轮已由 `AI Sandboxes` 覆盖更基础的验证边界口径，只保留 `generated_rollout_consistency_check` 候选。 |
| Stealthy World Model Manipulation via Data Poisoning | [2606.18697](https://arxiv.org/abs/2606.18697) | `cs.RO/recent` 2026-06-18 近期待补录 | 训练轨迹投毒对未来 world model / 持续学习安全重要，但 Kinbot 当前不冻结在线 world model 自更新；保留 `world_model_update_poisoning_check`、`trajectory_source_attestation` 候选。 |
| DREAM-Chunk: Reactive Action Chunking with Latent World Model | [2606.18589](https://arxiv.org/abs/2606.18589) | `cs.RO/recent` 2026-06-18 近期待补录 | action chunking 的 test-time reactivity 有价值，但任务偏 manipulation / VLA，且增加测试时计算；保留 `chunk_reactivity_check`、`test_time_compute_budget` 候选。 |
| Does VLA Even Know the Basics? Measuring Commonsense and World Knowledge Retention in Vision-Language-Action Models | [2606.19297](https://arxiv.org/abs/2606.19297) | `cs.RO/recent` 2026-06-18 近期待补录 | action-grounded commonsense benchmark 有诊断意义，但 tabletop 物体放置与 Kinbot 一代主任务不直接对应；保留 `action_grounded_knowledge_probe` 候选，不新增 VLA 常识 benchmark 主项。 |
| Sensor Configuration Matters: A Systematic Evaluation of Multimodal SLAM on Quadruped Robots | [2606.19067](https://arxiv.org/abs/2606.19067) | `cs.RO/recent` 2026-06-18 近期待补录 | 传感器配置对 SLAM 鲁棒性影响有工程参考，但平台是四足，且涉及 LiDAR / VIO / 多模态组合；本轮不改变 Kinbot 纯视觉主线，只保留 `camera_shutter_slam_failure`、`stereo_vs_mono_tracking_loss` 候选。 |
| OneCanvas: 3D Scene Understanding via Panoramic Reprojection | [2606.19253](https://arxiv.org/abs/2606.19253) | `cs.RO/recent` 2026-06-18 近期待补录 | 统一 panoramic canvas 对 3D spatial reasoning 有价值，但依赖 depth 和 camera pose 聚合，且训练计算仍偏研究；本轮由 `ReSiReg` 覆盖更直接的空间语义一致性字段。 |
| Recover, Discover, Plan: Learning Skills and Concepts from Robot Failures | [2606.18328](https://arxiv.org/abs/2606.18328) | `cs.RO/recent` 2026-06-18 近期待补录 | failure recovery 到抽象概念学习有前瞻价值，但实验偏 simulated domains 和 non-prehensile manipulation；保留 `failure_abstraction_candidate`、`recovery_to_prevention_trace` 候选。 |
| Zero-Shot Long-Horizon Dexterous Manipulation / Do as I Do / Mem-World / Motion-Focused Latent Action 等人手与操作学习条目 | 多篇 | `cs.RO/recent` 2026-06-18 近期待补录 | 这些论文对机械臂、手部操作和 VLA manipulation 数据有研究价值，但 Kinbot 一代不做机械臂操作主链路；除非新增家庭移动安全、端侧资源或验证治理字段，否则不进入主卡片。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮不回写主线架构、`03_decision_log.md` 或 Linear；所有结论暂作为研究输入。
2. 若后续处理 Phase 5 验证模板，可评审是否吸收以下最小字段包：`human_injury_risk_class`、`pre_action_refusal_decision`、`navigation_geometry_supervision_source`、`collision_rate_delta`、`sandbox_fidelity_level`、`evidence_weakest_link_score`、`mission_ltl_verification_result`、`spatial_semantic_consistency_score`。
3. 若后续处理家庭样机试点回放，应把 `ROBOSHACKLES` 的人身伤害风险类别与 `VEGA` 的碰撞 / clearance 指标结合，避免只记录导航成功率。
4. 若后续处理验证证据链 provenance，可把 `AI Sandboxes` 作为字段级候选参考，但不得在用户确认或阶段门评审前把完整 sandbox 平台写成既定交付范围。
5. 若后续处理任务规划或 Agent 工具调用，应把 `As You Wish` 的形式化验证链路作为高风险任务候选流程，而不是对全部日常交互强制套用。

## 6. 来源

1. arXiv official `cs.RO/new` listing: <https://arxiv.org/list/cs.RO/new>
2. arXiv official `cs.RO/recent` listing: <https://arxiv.org/list/cs.RO/recent>
3. `ROBOSHACKLES`: <https://arxiv.org/abs/2606.18632>
4. `VEGA`: <https://arxiv.org/abs/2606.18426>
5. `AI Sandboxes`: <https://arxiv.org/abs/2606.18532>
6. `As You Wish`: <https://arxiv.org/abs/2606.18519>
7. `ReSiReg`: <https://arxiv.org/abs/2606.19088>
8. 候选排除表条目：[`EffiNav`](https://arxiv.org/abs/2606.18634)、[`WalkOCC`](https://arxiv.org/abs/2606.19122)、[`Congestion-Aware Robot Tour Planning`](https://arxiv.org/abs/2606.19031)、[`Delayed and False AEB Events`](https://arxiv.org/abs/2606.19186)、[`SC3-Eval`](https://arxiv.org/abs/2606.18610)、[`SWAAP`](https://arxiv.org/abs/2606.18697)、[`DREAM-Chunk`](https://arxiv.org/abs/2606.18589)、[`Act2Answer`](https://arxiv.org/abs/2606.19297)、[`Sensor Configuration Matters`](https://arxiv.org/abs/2606.19067)、[`OneCanvas`](https://arxiv.org/abs/2606.19253)、[`Recover, Discover, Plan`](https://arxiv.org/abs/2606.18328)
