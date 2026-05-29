# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-20
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-20 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 为 `Tuesday, 19 May 2026`，合计 `161` 篇 entries；其中 new submissions `74` 篇、cross submissions `17` 篇、replacement submissions `70` 篇。2026-05-20 本地日更时尚未出现新的 `Wednesday, 20 May 2026` Robotics 批次，本轮采用“最新官方 listing + 当日未出现新批次说明 + 日更收录”口径，按 3-5 篇强相关论文 + 候选排除表方式，收录对 Kinbot 纯视觉空间记忆、导航长期经验、自治置信门控、家庭机器人语义安全和主动空间智能评测有明确增量价值的 5 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-20。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期为 `Tuesday, 19 May 2026`，合计 `161` 篇 entries；其中 new submissions `74` 篇、cross submissions `17` 篇、replacement submissions `70` 篇。
3. 本轮检索时官方 `cs.RO/recent` 显示最新 Robotics recent 批次为 `Tue, 19 May 2026`，该日期 recent entries 为 `91` 篇，对应 new submissions 与 cross submissions，不含 replacement。
4. 本轮本地日期为 2026-05-20，官方尚未出现 `Wednesday, 20 May 2026` Robotics 新批次；因此本轮按“最新官方 listing + 当日未出现新批次说明 + 日更收录”处理，不把 `2026-05-20` 写成新的官方 Robotics listing 日期。
5. 本轮先核对既有日更文档中的论文标题与 arXiv 编号，未发现本轮主卡片 `2605.18197`、`2605.18729`、`2605.18045`、`2605.18593`、`2605.18746` 已进入前序主卡片。
6. 本轮不固定凑满 `10` 篇；在 5 月中旬泛 `VLA`、world model、manipulation、自动驾驶、UAV / LiDAR 与多机器人协作主题已多次覆盖后，只保留 5 篇能改变 Kinbot Phase 5 评测字段或治理动作的论文，其余进入候选排除表。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是继续增加泛 `VLA`、world model、灵巧手或自动驾驶 benchmark 的数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`observability_data_governance`、`platform_runtime`、`decision_orchestration`。
3. 是否能低成本转化为 Phase 5 验证项：纯视觉 3D scene graph、导航经验抽象、act / defer 门控、语义地图对抗污染、主动探索和证伪视角选择。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. replacement / cross-list 仅在新增 Kinbot 评测项或治理项时收录；本轮主卡片中 `2605.18593` 与 `2605.18746` 分别为 `cs.CR` 与 `cs.CV` cross submission，纳入原因是它们直接新增家庭机器人语义攻击评测与主动空间智能评测字段。
2. `Policy Library CBF`、`REBAR`、`Consent Chain Degradation` 对安全治理有价值，但本轮主线更需要可落到家庭机器人 Phase 5 的具体测试字段；这些论文进入候选排除表，不新增运行时安全中台。
3. `OrbiSim`、`WorldArena 2.0`、`PH-Dreamer` 等 world model / benchmark 条目继续证明仿真和世界模型活跃，但本轮不再扩张产品级在线 world model 层。
4. `NORM-Nav`、`MORN`、`Mono-Hydra++`、`TaskGround` 等与导航或家庭推理相关，但与既有日更的导航约束、场景图和结构化任务推理主题部分重叠，本轮只作为专题候选。

## 2. 本轮总判断

本轮官方 Robotics listing 从 2026-05-18 更新到 `2026-05-19`，不是继续补录同一饱和 listing。高价值信号集中在三个方向：纯视觉空间记忆是否可以闭环到主动探索、自治系统如何判断“不该自己做”、以及开放词汇语义状态如何被物理世界中的文字污染。

本轮对 Kinbot 有 5 个增量判断：

1. **纯视觉空间记忆要从被动建图转向主动取证**：`RGB-only Active 3D Scene Graph Generation` 说明仅 RGB 输入也可以做主动增量 3D scene graph，并且语义驱动视角选择能显著提升对象发现。这支持 Kinbot 继续坚持纯视觉主线，但应把“是否主动重观察”纳入空间记忆评测。
2. **导航长期记忆不应只是轨迹缓存，而应抽象成可审计经验规则**：`Robo-Cortex` 的价值不在于把自进化 agent 直接放进产品，而是提醒 Kinbot 可以把成功模式、失败陷阱和局部反思写成离线可审计的导航经验库。
3. **置信门控的核心不是校准曲线，而是 act / defer 排序是否真的改变执行结果**：`Confidence-Gated Robot Autonomy` 说明不确定性只有在基础模型达到一定能力后才适合做选择性自治；细粒度语义 OOD 仍然接近随机，不能用一个置信分数替代异常识别。
4. **家庭语义地图会被真实文字标签污染**：`Typographic Attacks` 证明开放词汇感知错误会通过持久 3D 语义地图传播，最终变成错误抓取和搬运。Kinbot 即使一代不主打机械臂，也应把药品、禁区、危险物和家庭提醒中的文字贴纸 / 包装误导纳入安全测试。
5. **空间智能评测要检查证伪视角和信念修正**：`ESI-Bench` 指出很多失败来自 action blindness，即动作选择导致错误观察并级联放大。Kinbot 的空间理解评测不应只看被动识别，还应检查机器人是否会主动找证据、遇到矛盾是否修正。

周度滚动判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| RGB-only / monocular 3D scene graph 与纯视觉空间记忆 | 值得进入专题跟踪 | 将本轮 `RGB-only Active 3D Scene Graph` 与前序 `LEXI-SG`、`OpenSGA`、功能 3D scene graph、预测式时空场景图合并成“房间 / 物体 / 功能边 / 重新观察”评测专题。 |
| 不确定性门控、act / defer 和安全回退 | 值得进入 Phase 5 评测字段 | 新增 `act_defer_rank_quality`、`fallback_threshold_sensitivity`、`semantic_ood_failure` 字段；不把置信分数写成硬安全证明。 |
| 开放词汇语义地图攻击 | 值得进入安全专题 | 将 typographic attack、LLM unsafe propagation、VLM threat model 合并为“语义状态污染 -> 持久地图 -> 动作执行”离线测试。 |
| 泛 `VLA`、world model、灵巧手和高自由度操作 | 已饱和 | 只有出现端侧资源实测、家庭移动实机闭环或安全审计新增证据时才进入主卡片。 |
| robot ethics / consent / autonomy readiness | 接近专题成熟 | 保留为 `KBT-57` 与 Phase 5 治理输入，不把抽象伦理 benchmark 直接升级为产品事实。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把主动 3D scene graph、自进化导航记忆、置信门控、语义攻击防御和空间智能 benchmark 都变成在线组件，会明显过复杂”。建议只吸收为 5 个轻量动作：空间记忆主动重观察字段、导航经验离线审计库、act / defer 阈值敏感性测试、文字贴纸 / 包装语义污染测试、证伪视角选择测试。暂不新增产品级自进化 agent、在线 world model、重型安全中台或多机器人治理层。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | RGB-only Active 3D Scene Graph Generation for Indoor Mobile Robots | 转成纯视觉空间记忆专题：RGB-only scene graph、active viewpoint、fixed camera optional input、object discovery budget。 |
| A | Confidence-Gated Robot Autonomy: When Does Uncertainty Actually Help? | 转成 Phase 5 act / defer 门控评测：排序质量、阈值敏感性、base competence gate、semantic OOD 失败记录。 |
| A- | Not What You Asked For: Typographic Attacks in Household Robot Manipulation | 转成家庭语义污染安全测试：文字贴纸、包装标签、药品 / 危险物误导、持久地图污染和动作前复核。 |
| A- | ESI-Bench: Towards Embodied Spatial Intelligence that Closes the Perception-Action Loop | 转成空间智能 benchmark 候选：主动取证、证伪视角、矛盾修正、action blindness。 |
| B+ | Robo-Cortex: A Self-Evolving Embodied Agent via Dual-Grain Cognitive Memory and Autonomous Knowledge Induction | 只吸收离线导航经验库和 failure pitfall 结构，不引入在线自进化 agent。 |

## 3. 论文卡片

### 3.1 RGB-only Active 3D Scene Graph Generation for Indoor Mobile Robots

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.18197](https://arxiv.org/abs/2605.18197) |
| 本轮 listing 口径 | 2026-05-19 官方 listing new submission，日更收录；abs 页显示 `Submitted on 18 May 2026` |
| 分类 | `cs.RO`, `cs.AI`, `cs.CV` |
| 方法关键词 | RGB-only scene graph, active exploration, semantic viewpoint selection, indoor mobile robot |

摘要要点转述：

论文针对 3D scene graph 生成过度依赖 LiDAR / RGB-D 的问题，提出只用 RGB 观测主动增量构建 3D 场景图。方法将对象语义、几何估计、多视角信息和关系上下文放在统一结构里，并让机器人根据已经构建的图选择下一步观察视角，而不是只沿预设轨迹被动采集。实验显示，在 Replica 上 RGB-only pipeline 可以接近使用真值深度的基线；在 ReplicaCAD 主动探索中，语义驱动视角选择在相同探索预算下发现的对象数量超过几何 frontier baseline 的两倍。论文还讨论固定外部 RGB 摄像头可与机器人 onboard 相机合并到同一表示中，用来初始化和补充场景理解。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`mobility_navigation` 和纯视觉路线下“没有深度相机 / LiDAR 作为产品 fallback 时，空间记忆是否还能形成可用 3D 关系”的问题。
2. Kinbot 家庭巡航不能只被动记录“看到过什么”，还需要决定“是否应该换角度重新观察”，尤其是药盒、门口障碍、小件物体和遮挡物。
3. 对应 Phase 5：空间记忆评测应增加 `active_reobserve_success`、`object_discovery_per_meter`、`semantic_viewpoint_gain`、`rgb_only_graph_consistency` 和 `fixed_camera_assist_optional` 字段。

资源消耗与部署信号：

1. 论文证明 RGB-only 主线有评测价值，但不等于端侧实时构建完整 3D scene graph 已经满足 Kinbot `12GB + 32GB` 量产线。
2. 更现实的吸收方式是低频空间记忆更新、离线回放评测和主动重观察策略，而不是把每帧导航都依赖全量 3D graph。
3. 固定外部摄像头只能作为可选家庭环境输入研究，不能改写一代机器人本体纯视觉主线和隐私边界。

优势：

1. 直接命中 Kinbot 纯视觉空间记忆和主动探索的结合点。
2. 将语义图从被动 perception 输出变成 action selection 的依据，贴近家庭找物和巡护。
3. 明确避免深度传感器依赖，与 Kinbot 当前传感主线一致。

劣势与风险：

1. 数据集和仿真环境不等同于真实家庭暗光、反光和遮挡条件。
2. 3D graph 的几何误差、实例混淆和跨天一致性仍需单独验证。
3. 若把外部摄像头作为默认输入，会触碰隐私、安装成本和售后复杂度。

推荐理由：

建议作为 A 级输入。Kinbot 应将其吸收为空间记忆专题的核心评测线：不是新增主动传感器，而是在纯视觉主线上增加主动重观察和语义增益评估。

### 3.2 Confidence-Gated Robot Autonomy: When Does Uncertainty Actually Help?

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.18045](https://arxiv.org/abs/2605.18045) |
| 本轮 listing 口径 | 2026-05-19 官方 listing new submission，日更收录；abs 页显示 `Submitted on 18 May 2026` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | uncertainty gating, act/defer, fallback policy, threshold sensitivity, embodied simulation |

摘要要点转述：

论文研究机器人常见的 threshold-gated autonomy：系统根据预测不确定性决定自己执行，还是交给 fallback policy。作者指出，传统校准指标和 AUROC 不一定能回答“这个不确定性是否真的改变 act / defer 决策”。论文改用 Spearman rank correlation、paired bootstrap equivalence testing 和 act/defer agreement 来评估不确定性排序。实验显示，当基础模型能力低于某个 competence regime 时，不确定性对错误排序弱且不稳定；当基础能力足够时，softmax heuristic、MC Dropout 和 ensemble 的门控行为接近，阈值选择反而更影响执行结果。论文还指出，时间协变量漂移下排序可能保持稳定，但细粒度语义 OOD 检测仍接近随机。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`decision_orchestration` 和 `platform_runtime` 中“什么时候机器人应该自己做，什么时候应该降级、询问或交给人工”的问题。
2. Kinbot 的家庭安全、用药提醒、夜间巡护和老人看护不能只使用一个模型置信度决定是否执行高影响动作。
3. 对应 Phase 5：需要把 act / defer 作为可测决策，而不是只检查感知模型是否校准。

资源消耗与部署信号：

1. 论文不要求引入新大模型，主要贡献是评测口径和阈值敏感性分析。
2. 适合端侧低成本落地：记录置信排序、阈值、fallback 触发、人工确认结果和事后误差。
3. 不能用不确定性分数替代语义 OOD、权限边界或硬安全规则；高风险动作仍需规则和人工确认兜底。

优势：

1. 直接把不确定性评估连接到机器人执行结果。
2. 提醒 Kinbot 不应迷信复杂 uncertainty estimator，阈值策略和基础模型能力更关键。
3. 可低成本纳入 Phase 5 验证台账。

劣势与风险：

1. 论文实验主要是活动识别和 embodied simulation，不覆盖 Kinbot 全部家庭任务。
2. 结论可能受任务类型和基础模型能力影响，需要在 Kinbot 自有任务上复测。
3. 对语义新奇和罕见危险场景的识别能力不足，不能单独承担安全职责。

推荐理由：

建议作为 A 级输入。Kinbot 应把 `act_defer_rank_quality` 和 `threshold_sensitivity` 加入 Phase 5 决策门控评测，并明确“不确定性只辅助降级，不替代安全规则”。

### 3.3 Not What You Asked For: Typographic Attacks in Household Robot Manipulation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.18593](https://arxiv.org/abs/2605.18593) |
| 本轮 listing 口径 | 2026-05-19 官方 listing cross submission from `cs.CR`，日更收录；abs 页显示 `Submitted on 18 May 2026` |
| 分类 | `cs.CR`, `cs.AI`, `cs.RO` |
| 方法关键词 | typographic attack, household robot, open-vocabulary perception, persistent semantic map, kinetic failure |

摘要要点转述：

论文研究开放词汇家庭机器人在完整 Sense-Plan-Act 链路中受到文字攻击的风险。作者指出，CLIP 等 VLM 的共享嵌入空间虽然带来开放词汇能力，但也容易让场景中的印刷文字覆盖真实视觉判断。论文在 Habitat / HomeRobot 仿真中评估带有对抗贴纸的 household manipulation pipeline：几何 grounding 仍由 DETIC 维持，但冻结 CLIP encoder 会被文字贴纸误导。在 59 个可归因 episode 中，整体攻击成功率达到 67.8%，在完全成功 episode 中达到 70.0%。更关键的是，感知错误会写入持久 3D 语义地图，并最终导致机器人抓取和搬运错误物体。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`world_state_memory` 和 `observability_data_governance` 中“开放词汇语义状态能否被家庭环境中的文字污染”的问题。
2. Kinbot 一代不应把包装文字、便签、屏幕字幕、药品外盒或孩子贴纸直接当成安全可靠的物体语义。
3. 即使一代不主打机械臂，家庭提醒、药品识别、危险物告警、老人看护和巡护上报也会受同类语义污染影响。

资源消耗与部署信号：

1. 论文提供的是安全测试范式，不要求增加端侧模型。
2. Kinbot 可低成本构造离线回放：同一物体加无害文字、误导文字、品牌包装和遮挡文字，检查语义地图是否被持久污染。
3. 高风险物体识别需要多证据确认：视觉外观、位置上下文、用户确认、历史记忆和低置信复核，不能只靠开放词汇标签。

优势：

1. 直接命中家庭机器人和开放词汇感知安全。
2. 将攻击影响从“识别错了”推进到“持久地图污染和物理动作失败”。
3. 可转化为明确的 Phase 5 安全回放用例。

劣势与风险：

1. 实验基于仿真和 HomeRobot manipulation，不等同于 Kinbot 的移动巡护任务。
2. 攻击成功率受 pipeline 设计和对象类别影响，需在 Kinbot 自有感知栈上复验。
3. 若防御方案过重，可能引入大量人工确认，损伤陪伴交互体验。

推荐理由：

建议作为 A- 级输入。Kinbot 应新增“语义地图污染”安全测试，重点覆盖药品、危险物、隐私区域、家属提醒和执行前复核，不因此引入重型安全中台。

### 3.4 ESI-Bench: Towards Embodied Spatial Intelligence that Closes the Perception-Action Loop

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.18746](https://arxiv.org/abs/2605.18746) |
| 本轮 listing 口径 | 2026-05-19 官方 listing cross submission from `cs.CV`，日更收录；abs 页显示 `Submitted on 18 May 2026` |
| 分类 | `cs.CV`, `cs.AI`, `cs.CL`, `cs.LG`, `cs.RO` |
| 方法关键词 | embodied spatial intelligence, perception-action loop, active exploration, action blindness, metacognition |

摘要要点转述：

论文提出 `ESI-Bench`，把空间智能从被动观察改写为 perception-action loop：智能体需要决定部署感知、移动和操作能力，并通过行动获得任务相关证据。Benchmark 基于 OmniGibson，覆盖 10 类任务和 29 个子类，关注遮挡、动态、容器关系和功能性等仅靠单次被动观测难以解决的问题。作者评估多种 MLLM 后发现，主动探索明显优于被动观察，但随机多视角可能因为消耗更多图像却没有明确目的而加入噪声。许多失败不是感知本身太弱，而是动作选择错误导致观察质量差，再引发级联推理错误。论文还指出，模型常在证据不足时过早高置信提交答案，而人类更会寻找证伪视角并在矛盾下修正信念。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 和 `decision_orchestration` 中“机器人是否知道下一步该看哪里”的问题。
2. Kinbot 家庭场景经常需要通过移动身体、调整头部、绕开遮挡或重新观察来确认药盒、门窗、跌倒风险和物体状态。
3. 对应 Phase 5：空间智能评测应包含 `falsifying_viewpoint_request`、`belief_revision_after_conflict`、`active_evidence_gain` 和 `action_blindness_failure`。

资源消耗与部署信号：

1. Benchmark 本身不等于产品组件，最现实价值是评测模板。
2. 主动探索会增加移动时间、能耗和打扰用户的风险，因此 Kinbot 需要把动作成本纳入证据增益评估。
3. 不建议把 OmniGibson benchmark 直接写成主线依赖，应抽取适合家庭巡护和找物任务的轻量子集。

优势：

1. 将空间理解、导航动作和证据质量放在同一评测框架中。
2. 明确指出随机多视角不是答案，主动取证必须有目的。
3. 与 Kinbot 的纯视觉导航、空间记忆和老人看护确认任务高度相关。

劣势与风险：

1. Benchmark 规模较大，直接复现成本高。
2. 任务覆盖 manipulation，Kinbot 一代不宜把高自由度操作作为主线。
3. 过度主动探索可能影响家庭陪伴体验，需要动作频率和时机约束。

推荐理由：

建议作为 A- 级输入。Kinbot 应吸收其“证伪视角 + 信念修正 + action blindness”评测语言，用轻量家庭子集验证空间智能，而不是引入完整 benchmark 平台。

### 3.5 Robo-Cortex: A Self-Evolving Embodied Agent via Dual-Grain Cognitive Memory and Autonomous Knowledge Induction

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.18729](https://arxiv.org/abs/2605.18729) |
| 本轮 listing 口径 | 2026-05-19 官方 listing new submission，日更收录；abs 页显示 `Submitted on 18 May 2026` |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | cognitive memory, navigation heuristic library, reflection-adaptation loop, imagine-then-verify |

摘要要点转述：

论文针对具身智能在未见环境导航中容易出现的“经验遗忘”问题，提出 `Robo-Cortex` 自进化框架。核心是 Autonomous Knowledge Induction：从多模态轨迹中抽象成功模式和失败陷阱，形成自然语言 Navigation Heuristic Library。系统还包含双粒度认知记忆：短期反思记忆用于实时局部进展分析，长期原则记忆用于把历史轨迹提炼成可复用的指导和警示原则。为避免盲目执行，框架加入 imagine-then-verify loop，用世界模型模拟可能结果，再由 VLM evaluator 检查行动计划。实验覆盖 IGNav、AR、AEQA，并报告在任务成功率和探索效率上优于基线，另有初步真实机器人实验。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`mobility_navigation` 和 `decision_orchestration` 中“家庭长期部署后，机器人如何复用经验而不是只缓存轨迹”的问题。
2. Kinbot 需要记住“哪些角落容易遮挡”“夜间哪里容易误判”“老人常把药盒放在哪里”之类经验，但必须可审计、可回滚、可解释。
3. 对应 Phase 5：可设计 `navigation_heuristic_candidate`、`failure_pitfall`、`experience_source`、`human_verified`、`rollback_condition` 字段。

资源消耗与部署信号：

1. 论文中的世界模型、VLM evaluator 和自进化循环不适合直接进入一代端侧在线闭环。
2. 适合吸收为离线经验提炼和人工审核机制，而不是自动改写导航策略。
3. 若未来专题复现，需要严格记录端侧延迟、云端依赖、隐私数据边界和用户可撤销机制。

优势：

1. 把长期导航经验从轨迹级缓存提升为原则级记忆。
2. 同时记录成功模式和失败陷阱，适合形成审计台账。
3. 与 Kinbot 的家庭长期陪伴和个性化空间习惯学习相关。

劣势与风险：

1. 自进化 agent 容易扩大运行时复杂度和治理风险。
2. 自然语言启发式可能过度泛化，导致错误经验迁移。
3. Imagine-then-verify 依赖世界模型和 VLM 评估器，端侧资源和安全边界不清晰。

推荐理由：

建议作为 B+ 级输入。Kinbot 应只吸收“导航经验库 + 失败陷阱 + 人工审核 / 回滚”的结构，不把自进化闭环升级为一代产品事实。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| MORN: Metacognitive Object-Goal Regulation for Resource-Rational Long-Horizon Navigation | [2605.16932](https://arxiv.org/abs/2605.16932) | 2026-05-19 new submission | 与本轮 `Robo-Cortex` 和前序 zero-shot object navigation / ConsistNav 主题重叠；可作为导航元认知专题候选，但本轮不再扩张主卡片。 |
| NORM-Nav: Zero-Shot Mobile Robot Navigation with Natural Language Behavioral Constraints | [2605.16979](https://arxiv.org/abs/2605.16979) | 2026-05-19 new submission | 行为约束对家庭导航有价值，但与前序自然语言安全执行、社会导航和导航约束条目重复；进入专题候选。 |
| Mono-Hydra++: Real-Time Monocular Scene Graph Construction with Multi-Task Learning for 3D Indoor Mapping | [2605.17661](https://arxiv.org/abs/2605.17661) | 2026-05-19 new submission | 与本轮 RGB-only active scene graph 方向相近；本轮优先收录更贴近主动视角选择的 `2605.18197`。 |
| TaskGround: Structured Executable Task Inference for Full-Scene Household Reasoning | [2605.18109](https://arxiv.org/abs/2605.18109) | 2026-05-19 cross submission from `cs.AI` | 家庭推理相关，但本轮已有空间记忆、安全和主动取证主卡片；后续如涉及家庭任务 DSL 或可执行任务图再补录。 |
| REBAR: Reference Ethical Benchmark for Autonomy Readiness | [2605.18423](https://arxiv.org/abs/2605.18423) | 2026-05-19 new submission | 伦理合规量化框架有治理价值，但当前过抽象；保留为 `KBT-57` / Phase 5 治理候选，不新增主线指标体系。 |
| Consent Chain Degradation in Embodied Multi-Agent Systems | [2605.16300](https://arxiv.org/abs/2605.16300) | 2026-05-19 cross submission from `cs.CY` | 与 2026-05-19 unsafe action propagation 已覆盖的权限传播风险相邻；本轮不重复收录，只保留为多主体授权治理候选。 |
| Policy Library CBF: Finite-Horizon Safety at Runtime via Parallel Rollouts | [2605.16588](https://arxiv.org/abs/2605.16588) | 2026-05-19 new submission | 安全过滤有价值，但更偏控制理论和 quadrotor / vehicle 示例；Kinbot 当前优先吸收 act / defer 门控和安全测试字段。 |
| OrbiSim: World Models as Differentiable Physics Engines for Embodied Intelligence | [2605.16395](https://arxiv.org/abs/2605.16395) | 2026-05-19 new submission | world model / differentiable simulator 继续活跃，但与前序 world model 主题高度重复；不新增在线 world model 层。 |
| WorldArena 2.0: Extending Embodied World Model Benchmarking on Modality, Functionality and Platform | [2605.17912](https://arxiv.org/abs/2605.17912) | 2026-05-19 new submission | benchmark 有研究价值，但本轮优先收录更能改变 Kinbot 主动空间智能评测的 `ESI-Bench`。 |
| Active Defense Against False Data Injection Attacks in Robotic Manipulators | [2605.17950](https://arxiv.org/abs/2605.17950) | 2026-05-19 new submission | 安全主题相关，但对象是 manipulator false data injection；本轮优先收录更贴近家庭语义状态污染的 typographic attack。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮不直接回写主线架构文档、`03_decision_log.md` 或 Linear；全部作为研究输入保留在 `docs/09_research/00_papers/`。
2. 若后续进入专题，应优先拆成 4 个轻量验证包：纯视觉主动场景图、act / defer 门控、语义地图污染、主动取证与信念修正。
3. Phase 5 验证台账可候选新增字段：`active_reobserve_success`、`semantic_viewpoint_gain`、`act_defer_rank_quality`、`threshold_sensitivity`、`semantic_map_poisoning`、`belief_revision_after_conflict`。
4. 对 `Robo-Cortex` 只保留离线经验抽象和失败陷阱台账，不形成在线自进化能力承诺。
5. 本轮未进入主线的原因：论文结论仍停留在研究输入和评测字段层，尚未构成对 Kinbot 一代纯视觉主线、端侧资源基线、BOM 或 Phase 5 门控事实的稳定变更。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent` 官方 listing：[https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
3. RGB-only Active 3D Scene Graph Generation for Indoor Mobile Robots：[https://arxiv.org/abs/2605.18197](https://arxiv.org/abs/2605.18197)
4. Confidence-Gated Robot Autonomy: When Does Uncertainty Actually Help?：[https://arxiv.org/abs/2605.18045](https://arxiv.org/abs/2605.18045)
5. Not What You Asked For: Typographic Attacks in Household Robot Manipulation：[https://arxiv.org/abs/2605.18593](https://arxiv.org/abs/2605.18593)
6. ESI-Bench: Towards Embodied Spatial Intelligence that Closes the Perception-Action Loop：[https://arxiv.org/abs/2605.18746](https://arxiv.org/abs/2605.18746)
7. Robo-Cortex: A Self-Evolving Embodied Agent via Dual-Grain Cognitive Memory and Autonomous Knowledge Induction：[https://arxiv.org/abs/2605.18729](https://arxiv.org/abs/2605.18729)
