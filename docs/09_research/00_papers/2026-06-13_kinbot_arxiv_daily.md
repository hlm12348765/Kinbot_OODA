# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-13
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-13 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv API，确认本轮本地日更时官方最新 Robotics listing 仍为 `Friday, 12 June 2026`，合计 `88` 篇 entries；其中 new submissions `43` 篇、cross submissions `13` 篇、replacement submissions `32` 篇。本轮因前一日已覆盖同一 listing 的 5 篇主卡片，按日更补录 + 周度综合判断口径，只收录隐式协作辅助时机、手势 grounding 和约束冲突最小违背规划 3 篇强相关论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-06-13。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 仍为 `Friday, 12 June 2026`，合计 `88` 篇 entries；其中 new submissions `43` 篇、cross submissions `13` 篇、replacement submissions `32` 篇。
3. 官方 `cs.RO/recent` 在本轮检索时显示 `Total of 341 entries`，顶部为 `Fri, 12 Jun 2026`，页面显示 `showing first 50 of 56 entries`；该 `56` 篇对应 Friday listing 的 new + cross 条目，不含 replacement。
4. 本地日期为 2026-06-13，官方尚未出现以 2026-06-13 为 listing 日期的新 Robotics 批次。本轮不是 6 月 13 日新批次，而是对 2026-06-12 官方 listing 的前一日覆盖后补录。
5. 前一轮 2026-06-12 已收录 `Foresight`、`Embedding ISO 10218 Safety Compliance via CBF`、`Real-Time Execution with Autoregressive Policies`、`SemanticXR`、`Learning Robot Safety from Sparse Human Feedback using Conformal Prediction` 5 篇主卡片，并将 `Learning to Assist`、`Trajectory-Level Redirection Attacks`、`SPARC`、`NavWAM` 等列入候选排除表。
6. 本轮只把“前一日未进入主卡片、但能新增 Kinbot 字段”的论文升级为补录主卡片。`Learning to Assist` 虽在 2026-06-12 候选排除表中出现，但本轮重新审视后，其 action chunk 泄漏导致过早协助的 failure mode 可直接转成老人家庭协作验证字段，因此作为补录主卡片收录；同时明确不新增一代机械臂协作或在线 `VLA` 主链路。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全、端侧资源、交互时机或验证证据链的判断，而不是继续增加泛 `VLA`、world model、manipulation、humanoid、自动驾驶、UAV 或纯工具链论文数量。
2. 是否能映射到 Kinbot 现有模块：`interaction_orchestration`、`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：过早协助检测、手势 / 指向消歧、约束冲突优先级、最小违背规划 trace、用户准备状态 gate。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因同一 Friday listing 中仍有大量 manipulation `VLA`、world action model、humanoid、手术、自动驾驶或多机器人论文而继续扩张主卡片数量。
2. `Bounding Boxes as Goals`、`GIVE` 都涉及语言 / 空间 grounding；本轮优先收录 `GIVE`，因为 Kinbot 家庭交互中“用户用手指、点、挥手、比划”的消歧价值更直接。`Bounding Boxes as Goals` 保留为对象目标 grounding 专题候选。
3. `Low cost... touch sensitive fiber` 对低成本触觉和接触安全有价值，但不能因此改写一代纯视觉导航主线；可作为外壳触摸、接触边缘或辅助交互硬件候选。
4. `SCALE`、`SERF`、`Active Semantic Perception` 与不确定性、长期空间记忆和语义探索相关，但同类主题近期已多次覆盖；除非后续能补目标 SoC 资源、家庭场景回放或验证字段，否则不再主卡片化。

## 2. 本轮总判断

本轮真正新增的判断不是“同一 listing 再补几个机器人模型”，而是三个容易进入 Phase 5 的工程字段簇：

1. **协作辅助要验证“不要过早帮忙”**：`Learning to Assist` 提示长 horizon action chunk 可能跨越隐含任务阶段，导致机器人在人还没准备好时提前递工具或提前介入。Kinbot 在老人辅助、药箱交接、物品提醒和家属协作场景中，也需要记录用户准备状态和协助触发时机。
2. **家庭交互需要把手势当作指令 grounding 输入，而不是只靠文本**：`GIVE` 提示自然语言常常伴随手指方向、手势轨迹和非语言提示；当用户说“拿那个”“去那边”“别碰这里”时，Kinbot 应把手势目标、语义描述和视觉对象消歧写进验证链，而不是默认要求用户说完整结构化命令。
3. **约束冲突时要有可解释的最小违背策略**：`Lexicographic Minimum-Violation Motion Planning...` 提示当安全、任务、舒适、时间或避障约束不能全部满足时，应按优先级最小化违背并保留 trace。Kinbot 可吸收为 Phase 5 的约束冲突回放字段，不把它升级为完整形式化规划主链路。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 泛 `VLA`、world action model、manipulation policy | 已饱和 | 只有新增家庭移动闭环、老人照护、安全审计、目标 SoC 实测资源或可解释验证字段时进入主卡片。 |
| 交互意图 grounding：语言、手势、指向、对象目标 | 值得专题跟踪 | 将 `GIVE` 与 `Bounding Boxes as Goals` 合并为 `gesture_grounding_trace`、`deictic_target_resolution`、`target_object_disambiguation` 字段；先做验证集，不新增在线大模型主链路。 |
| 协作辅助时机与用户准备状态 | 值得专题跟踪 | 将 `Learning to Assist` 转成 `premature_assistive_action`、`human_readiness_gate`、`assistive_action_steering` 字段，覆盖药箱交接、物品递送、陪伴提醒和家属协作。 |
| 约束冲突、安全优先级与最小违背 | 接近专题成熟 | 将 `Lexicographic Minimum-Violation` 与近期 CBF、runtime assurance、STL / safety case 论文合并为 `constraint_priority_order`、`minimum_violation_trace`、`fallback_when_constraints_conflict` 字段。 |
| 端侧资源、测试时算力、single-pass uncertainty | 接近专题成熟 | `SCALE` 可作为 runtime 不确定性候选，但已有 `DIRECT`、实时自回归策略和测试时算力路由覆盖；不新增并行 runtime 层。 |
| 长期空间记忆、语义探索、移动操作地图 | 接近饱和 | `SERF`、`Active Semantic Perception` 保留为回放候选；若不能压缩为对象级记忆、失败探索或 semantic false-positive 字段，不进入主线。 |
| 低成本触觉、接触安全、可修复传感材料 | 专题候选 | 仅作为硬件 / 结构 / 外壳触摸候选，不改变一代导航传感主线，不替代视觉安全验证。 |
| VLA / 神经控制器红队安全 | 专题候选 | `Trajectory-Level Redirection Attacks` 与 `Trojan Attacks...` 进入后续安全红队 backlog；当前不回写主线，但应在系统测试规划中保留威胁模型候选。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把隐式协作 `VLA`、手势 `VLA`、lexicographic STL solver、低成本触觉、long-horizon feature map 和神经控制器红队全部写成在线子系统，会过复杂”。建议只吸收 9 类轻量字段：`premature_assistive_action`、`human_readiness_gate`、`assistive_action_steering`、`gesture_grounding_trace`、`deictic_target_resolution`、`target_object_disambiguation`、`constraint_priority_order`、`minimum_violation_trace`、`fallback_when_constraints_conflict`。暂不新增在线协作 VLA 主链路、完整手势控制系统、形式化规划主链路、触觉硬件基线或安全红队平台。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | Learning to Assist: Collaborative VLAs for Implicit Human-Robot Collaboration | 进入协作辅助时机验证专题，优先吸收 action chunk horizon、premature assistance 和 human readiness gate 字段；不升级为一代机械臂协作主链路。 |
| A- | GIVE: Grounding Human Gestures in Vision-Language-Action Models | 进入多模态交互 grounding 专题，补充手势 / 指向 / 语义双通道消歧字段；不把 `VLA` 作为默认执行控制器。 |
| B+ | Lexicographic Minimum-Violation Motion Planning using Signal Temporal Logic | 进入安全约束冲突与回放证据链候选，吸收 priority order、STL violation trace 和最小违背 fallback 字段；不新增完整形式化规划平台。 |

## 3. 论文卡片

### 3.1 Learning to Assist: Collaborative VLAs for Implicit Human-Robot Collaboration

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.12475](https://arxiv.org/abs/2606.12475) |
| 本轮 listing 口径 | 2026-06-12 官方 listing new submission；本轮为 2026-06-13 对同一 listing 的日更补录；abs/API 显示 `Published: 2026-06-10` |
| 分类 | `cs.RO` |
| 方法关键词 | implicit HRC, collaborative VLA, action chunk leakage, premature assistance, inference-time steering |

摘要要点转述：

论文研究隐式人机协作中，端到端 `VLA` 策略能否在没有手工 pipeline 的情况下承担协作操作。作者评估两个代表性 `VLA` 模型后发现，长 horizon action-chunking policy 会出现一种关键 failure mode：示教数据里的动作块跨过了潜在任务阶段，导致策略在当前阶段提前执行下一阶段协助动作。真实协作中，这会表现为机器人在人还没准备好时提前递工具或提前介入。作者提出 inference-time steering 方法，在不明显损害策略表现的前提下抑制过早协助，并通过 16 人用户实验验证，较长执行 horizon 在加 steering 后能提高协作速度并减少失败。

解决 Kinbot 的什么问题：

1. 对应 `interaction_orchestration`、`safety_compliance_authorization` 与老人 / 家属协作场景中的“什么时候该帮忙、什么时候该等一等”。
2. Kinbot 在药箱打开、物品提醒、老人起身、家属交接、陪伴打断和异常巡护中，都可能出现“机器人猜对了任务但介入太早”的产品风险。
3. 对应 Phase 5：建议增加 `premature_assistive_action`、`latent_task_transition`、`action_chunk_horizon`、`human_readiness_gate`、`assistive_action_steering`、`handover_before_ready_rate` 和 `collaboration_failure_rate` 字段。

资源消耗与部署信号：

1. 论文仍以 collaborative manipulation `VLA` 为主体，不能直接推导为 Kinbot 一代需要机械臂协作或在线 `VLA` 控制。
2. 其高价值部分是 failure mode 与验证字段：长 horizon 策略虽然提升效率，但也可能降低交互时机安全。
3. 对 Kinbot 更合理的使用方式是把用户准备状态、协作阶段边界和提前介入率加入回放 / 样机试点评测，而不是新增端到端协作策略。

优势：

1. 把“机器人主动帮忙”拆成可测的时机问题，贴合老人家庭产品感。
2. action chunk leakage 是可复现、可记录的模型 / 策略风险，不只是主观体验问题。
3. 可与 Kinbot 的高端产品感复核结合：聪明不是抢做，而是在合适时机做合适动作。

劣势与风险：

1. 任务以装配 / manipulation 为主，不覆盖 Kinbot 当前一代核心移动、陪伴和安全巡护闭环。
2. inference-time steering 的可靠性需要结合具体模型与任务阶段定义，不能作为通用安全兜底。
3. 用户准备状态在家庭中常由语音、姿态、距离和上下文共同决定，需要自建数据和人工标注。

推荐理由：

建议作为 A- 级补录输入。它应进入协作辅助时机验证专题，帮助 Kinbot 明确“过早协助”这一类体验与安全交叉风险；不建议据此新增在线协作 `VLA` 主链路或机械臂协作假设。

### 3.2 GIVE: Grounding Human Gestures in Vision-Language-Action Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.13435](https://arxiv.org/abs/2606.13435) |
| 本轮 listing 口径 | 2026-06-12 官方 listing new submission；本轮为 2026-06-13 对同一 listing 的日更补录；abs/API 显示 `Published: 2026-06-11` |
| 分类 | `cs.RO` |
| 方法关键词 | gesture grounding, HRI, visual-semantic enhancement, fingertip ray, underspecified instruction |

摘要要点转述：

论文指出当前很多 `VLA` 模型把机器人任务视为纯文本驱动，但真实人机交互中，用户经常用手势、指向、手部轨迹和语言共同表达意图。只看文本会导致“那个”“这里”“放那边”等欠指定指令无法稳定落到目标物体或空间位置。`GIVE` 在不改模型架构的前提下增加两条 gesture grounding 路径：视觉路径把手部骨架和指尖射线叠加到机器人观测中，帮助定位对象；语义路径把手势和任务指令转成高层描述，帮助模型理解动态交互意图。真实 HRI 实验中，论文报告目标识别与任务成功率相对 baseline 有明显提升。

解决 Kinbot 的什么问题：

1. 对应 `interaction_orchestration`、`world_state_memory` 与 `mobility_navigation` 中“用户不说完整目标，只用手指或手势补充”的问题。
2. Kinbot 家庭场景中，老人或家属很可能说“拿那个”“别去那边”“停这里”“看这里”“药放这边”，并伴随指向、挥手或遮挡动作。
3. 对应 Phase 5：建议增加 `gesture_grounding_trace`、`fingertip_ray_target`、`gesture_semantic_description`、`deictic_target_resolution`、`target_object_disambiguation`、`ambiguous_instruction_with_gesture` 和 `gesture_language_conflict_flag` 字段。

资源消耗与部署信号：

1. 方法需要手部姿态 / 指尖方向估计和语义描述生成，在线部署会增加视觉 pipeline 与时序同步成本。
2. Kinbot 不应把它直接升级为 `VLA` 控制器；更合适的是先做交互输入消歧和验证集字段。
3. 在纯视觉路线下，手势 grounding 仍需覆盖低光、遮挡、老人手部动作幅度小、坐姿、轮椅和多人场景。

优势：

1. 直接补足文本交互的欠指定问题，适合家庭高频自然交互。
2. 视觉 + 语义双通道可以把“用户指哪里”留成可审计 trace，而不是只得到模型最终动作。
3. 可与对象级记忆、家庭找物和安全禁入区域结合。

劣势与风险：

1. 论文目标仍偏 manipulation `VLA`，不等于 Kinbot 移动导航或老人照护全栈。
2. 手势识别错误可能比语音误解更隐蔽，必须有确认、拒绝和冲突处理机制。
3. 对隐私和家庭视频处理边界有要求，原始视觉仍应端侧处理。

推荐理由：

建议作为 A- 级补录输入。它应进入多模态交互 grounding 专题，帮助 Kinbot 把手势 / 指向 / 语义消歧变成 Phase 5 验证字段；不建议据此新增在线 `VLA` 执行动作主链路。

### 3.3 Lexicographic Minimum-Violation Motion Planning using Signal Temporal Logic

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.20428](https://arxiv.org/abs/2604.20428) |
| 本轮 listing 口径 | 2026-06-12 官方 listing replacement submission；本轮为 2026-06-13 对同一 listing 的日更补录；abs/API 显示 `Published: 2026-04-22`，`Updated: 2026-06-11` |
| 分类 | `cs.RO` |
| 方法关键词 | signal temporal logic, lexicographic priority, minimum-violation planning, MPPI, constraint conflict |

摘要要点转述：

论文关注多约束运动规划中的条件冲突：车辆或机器人执行任务时，安全、任务进度、道路规则、舒适性和时间要求不一定能同时满足。最低违背规划的目标不是假设所有约束都可行，而是在冲突出现时按优先级尽量少违反高优先级约束，并保持系统继续运行。作者用 Signal Temporal Logic 表达规格和违背程度，再把多目标 lexicographic optimization 转成单目标标量优化，通过非均匀量化和 bit-shifting 降低计算负担，并扩展 deterministic MPPI 求解器。论文还提出同时考虑空间和时间违背的 predicate-robustness 度量。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`mobility_navigation` 和 `platform_runtime` 中“安全、任务、舒适、用户命令冲突时怎么解释和回放”的问题。
2. Kinbot 可能遇到用户要求靠近老人、避开宠物、限时提醒、夜间安静、药箱交接、低电回充等互相冲突的约束；不能只记录最终动作成功或失败。
3. 对应 Phase 5：建议增加 `constraint_priority_order`、`minimum_violation_score`、`stl_violation_trace`、`hard_soft_constraint_conflict`、`predicate_robustness_value`、`fallback_when_constraints_conflict` 和 `user_visible_refusal_reason` 字段。

资源消耗与部署信号：

1. 论文方法是规划 / 优化层技术，实际资源消耗取决于 horizon、采样数、约束数量和控制频率；不能直接写入 Kinbot 实时控制基线。
2. 对 Kinbot 更现实的吸收方式是先做回放分析与验证报告字段：当任务失败时说明哪个约束被保护、哪个软约束被放弃。
3. replacement 论文只作为研究输入，不因更新而改变当前主线架构。

优势：

1. 给“安全优先但不僵死”提供了可解释语言，适合老人家庭复杂场景。
2. 与近期 `CBF`、runtime assurance、conformal warning、安全证据链论文互补：一个定义控制屏障，一个定义冲突时如何排序和留痕。
3. 可帮助把“机器人为什么不执行用户命令”转成可审计、可复盘的证据。

劣势与风险：

1. 论文场景偏自动驾驶 / autonomous vehicle 规划，需要迁移到低速家庭机器人。
2. STL 规格和优先级本身需要产品、法务、安全和体验共同定义，否则 formalism 会变成空壳。
3. 若在线求解过重，会影响 `OODA` 周期与端侧资源。

推荐理由：

建议作为 B+ 级补录输入。它应进入安全约束冲突与回放证据链候选，帮助 Kinbot 在“约束不能全部满足”时保留优先级与最小违背 trace；不建议新增完整形式化规划平台或把 replacement 结论写成主线事实。

## 4. 候选排除表

| 论文 | arXiv | listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| Bounding Boxes as Goals: Language-Conditioned Grasping via Neuro-Symbolic Planning | [2606.12910](https://arxiv.org/abs/2606.12910) | 2026-06-12 new submission；本轮日更补录候选 | household / industrial 自然语言 grounding 有价值，但任务是 tabletop grasping；本轮已用 `GIVE` 覆盖更贴近 Kinbot 的手势 / 指向消歧，本文保留为对象目标 grounding 专题候选。 |
| Low cost, easily manufactured, highly flexible strain and touch sensitive fiber for robotics applications | [2606.13352](https://arxiv.org/abs/2606.13352) | 2026-06-12 new submission；本轮日更补录候选 | 低成本触觉与接触交互对外壳、碰撞边缘和近场触发有启发，但属于硬件材料候选；不改变一代纯视觉导航主线，不写入主卡片。 |
| SCALE: Self-uncertainty Conditioned Adaptive Looking and Execution for Vision-Language-Action Models | [2602.04208](https://arxiv.org/abs/2602.04208) | 2026-06-12 replacement submission；本轮日更补录候选 | single-pass self-uncertainty 对端侧资源有价值，但 `DIRECT`、实时自回归策略和测试时算力路由已覆盖类似 runtime 字段；本轮不因 replacement 重复扩张。 |
| SERF: Spatiotemporal Environment and Robot Feature Map for Long-Horizon Mobile Manipulation | [2606.12956](https://arxiv.org/abs/2606.12956) | 2026-06-12 new submission；本轮日更补录候选 | household mobile manipulation benchmark 相关，但引入 map tokens、VLA 和移动操作组合复杂度较高；仅作为长期空间记忆 / 回放候选，不进入一代主卡片。 |
| DARRMS -- An Efficient Algorithm for Dynamic Attention Radius in Resource-Constrained Multi-Agent Systems | [2606.12614](https://arxiv.org/abs/2606.12614) | 2026-06-12 new submission；本轮日更补录候选 | resource-constrained attention radius 概念可借鉴，但论文是多智能体系统；Kinbot 一代单机家庭场景暂不需要多 agent attention radius 模块。 |
| Trajectory-Level Redirection Attacks on Vision-Language-Action Models | [2606.12978](https://arxiv.org/abs/2606.12978) | 2026-06-12 new submission；前一轮已列候选排除 | prompt-only 轨迹重定向对红队测试有价值，但仍是 manipulation `VLA`；保留为安全红队 backlog，不新增主卡片。 |
| Active Semantic Perception | [2510.05430](https://arxiv.org/abs/2510.05430) | 2026-06-12 replacement submission；本轮日更补录候选 | scene graph + LLM 语义探索与室内空间记忆相关，但语义地图 / 主动探索近期已接近饱和；除非后续验证模板需要 scene graph information gain 字段，否则不收。 |
| Trojan Attacks on Neural Network Controllers for Robotic Systems | [2602.05121](https://arxiv.org/abs/2602.05121) | 2026-06-12 replacement submission；本轮日更补录候选 | 神经控制器供应链 / 后门风险重要，但本轮日更重点是交互时机和约束冲突；该文进入系统安全红队专题候选，不改写当前控制器基线。 |
| SPARC: Reliable Spatial Annotations from Robot Demonstrations at Scale | [2606.13497](https://arxiv.org/abs/2606.13497) | 2026-06-12 new submission；前一轮已列候选排除 | 可靠空间标注与 calibration 有数据治理价值，但对象集中在示教 / manipulation；除非后续写数据标注质量专题，否则不重复收录。 |
| NavWAM: A Navigation World Action Model for Goal-Conditioned Visual Navigation | [2606.13494](https://arxiv.org/abs/2606.13494) | 2026-06-12 new submission；前一轮已列候选排除 | 视觉导航 world action model 与 Kinbot 导航相关，但近期 `WAM / VLA / world model` 主题已饱和；不因同一 listing 补录而新增在线 `WAM` 主链路。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮论文默认仍作为 `docs/09_research/00_papers/` 下的研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。
2. 若后续处理 Phase 5 验证模板、家庭样机试点、交互回放或安全约束报告，可优先吸收本轮最小字段：`premature_assistive_action`、`human_readiness_gate`、`assistive_action_steering`、`gesture_grounding_trace`、`deictic_target_resolution`、`target_object_disambiguation`、`constraint_priority_order`、`minimum_violation_trace`、`fallback_when_constraints_conflict`。
3. 不建议新增在线协作 `VLA` 主链路、完整手势控制系统、形式化规划主链路、触觉硬件基线、长期移动操作 feature map 或安全红队平台；当前更合理的是先把字段写入验证报告、回放分析和样机观测约束。
4. 如果后续要专题跟踪，优先方向是“协作辅助时机 + 手势 / 指向 grounding + 约束冲突最小违背”的轻量闭环。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent` 官方 listing：<https://arxiv.org/list/cs.RO/recent>
3. `Learning to Assist: Collaborative VLAs for Implicit Human-Robot Collaboration`：<https://arxiv.org/abs/2606.12475>
4. `GIVE: Grounding Human Gestures in Vision-Language-Action Models`：<https://arxiv.org/abs/2606.13435>
5. `Lexicographic Minimum-Violation Motion Planning using Signal Temporal Logic`：<https://arxiv.org/abs/2604.20428>
6. 候选排除表条目：[`Bounding Boxes as Goals`](https://arxiv.org/abs/2606.12910)、[`Low cost... touch sensitive fiber`](https://arxiv.org/abs/2606.13352)、[`SCALE`](https://arxiv.org/abs/2602.04208)、[`SERF`](https://arxiv.org/abs/2606.12956)、[`DARRMS`](https://arxiv.org/abs/2606.12614)、[`Trajectory-Level Redirection Attacks`](https://arxiv.org/abs/2606.12978)、[`Active Semantic Perception`](https://arxiv.org/abs/2510.05430)、[`Trojan Attacks on Neural Network Controllers`](https://arxiv.org/abs/2602.05121)、[`SPARC`](https://arxiv.org/abs/2606.13497)、[`NavWAM`](https://arxiv.org/abs/2606.13494)
