# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-21
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-21 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 为 `Wednesday, 20 May 2026`，合计 `91` 篇 entries；其中 new submissions `46` 篇、cross submissions `13` 篇、replacement submissions `32` 篇。2026-05-21 本地日更时尚未出现新的 `Thursday, 21 May 2026` Robotics 批次，本轮采用“最新官方 listing + 当日未出现新批次说明 + 日更收录”口径，按 3-5 篇强相关论文 + 候选排除表方式，收录对 Kinbot 纯 RGB 度量 SLAM、语义导航可执行目标、长期任务状态一致性、记忆型目标导航和具身 VLM 安全评测有明确增量价值的 5 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-21。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期为 `Wednesday, 20 May 2026`，合计 `91` 篇 entries；其中 new submissions `46` 篇、cross submissions `13` 篇、replacement submissions `32` 篇。
3. 本轮检索时官方 `cs.RO/recent` 显示最新 Robotics recent 批次为 `Wed, 20 May 2026`，该日期 recent entries 为 `59` 篇，对应 new submissions 与 cross submissions，不含 replacement。
4. 本轮本地日期为 2026-05-21，官方尚未出现 `Thursday, 21 May 2026` Robotics 新批次；因此本轮按“最新官方 listing + 当日未出现新批次说明 + 日更收录”处理，不把 `2026-05-21` 写成新的官方 Robotics listing 日期。
5. 本轮先核对既有日更文档中的论文标题与 arXiv 编号，未发现本轮主卡片 `2605.19257`、`2605.19420`、`2605.19314`、`2605.19594`、`2605.19328` 已进入前序主卡片。
6. 本轮不固定凑满 `10` 篇；在 5 月中旬泛 `VLA`、world model、manipulation、自动驾驶、UAV / LiDAR 和多机器人协作主题已多次覆盖后，只保留 5 篇能改变 Kinbot Phase 5 评测字段、导航 / 记忆判断或安全治理动作的论文，其余进入候选排除表。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是继续增加泛 `VLA`、world model、灵巧操作或自动驾驶 benchmark 的数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`decision_orchestration`、`safety_compliance_authorization`、`observability_data_governance`、`platform_runtime`。
3. 是否能低成本转化为 Phase 5 验证项：纯 RGB metric SLAM、语义目标可达区域、任务阶段契约、记忆型目标重验证、具身 VLM jailbreak 安全-效用双指标。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. replacement / cross-list 仅在新增 Kinbot 评测项或治理项时收录；本轮主卡片中 `RoboJailBench` 为 `cs.CR` cross submission，纳入原因是它直接新增具身机器人 jailbreak 的安全后果分类、良性指令效用和攻击防御统一评测字段。
2. `CLUE`、`TravExplorer`、`D-CLING`、`Beyond Waypoints` 和 `MCNav` 都与语义导航相关；本轮只把能新增执行形态的 `Beyond Waypoints` 和能新增记忆复核策略的 `MCNav` 放入主卡片，避免 ObjectNav 主题重复扩张。
3. `Minimalist Visual Inertial Odometry` 对端侧资源很有启发，但会引入向下 photodiode + IMU 的硬件假设，本轮只作为资源专题候选，不改写一代本体视觉主线。
4. `SafeAlign-VLA`、`DEFLECT`、`PAPO-VLA`、`RoVLA`、`Implicit Action Chunking` 等继续证明 VLA 安全、延迟和控制平滑是活跃方向，但若没有家庭移动实机、端侧资源实测或可审计安全字段，本轮不进入主卡片。
5. 自动驾驶、UAV、quadrotor、humanoid whole-body、soft actuator 和 contact-rich manipulation 条目不改变 Kinbot 一代家庭移动机器人路线。

## 2. 本轮总判断

本轮官方 Robotics listing 已从 2026-05-19 更新到 `2026-05-20`，不是继续补录同一饱和 listing。高价值信号集中在五个方向：纯 RGB 定位能否给出度量一致性、语义导航目标是否必须落到可执行自由空间、长期任务是否需要显式任务状态契约、空间记忆是否需要重验证 / 重探索机制，以及具身 VLM 安全评测是否必须同时度量攻击防御与良性指令效用。

本轮对 Kinbot 有 5 个增量判断：

1. **纯视觉 SLAM 评测要从“能跑”升级到“度量尺度可信 + 动态干扰可降权”**：`PRISM-SLAM` 说明 RGB-only 路线可以通过 VFM 深度先验、贝叶斯因子图和动态场景不确定性门控追求 metric consistency。Kinbot 不应因其存在就扩大模型层，而应把 `metric_scale_drift`、`dynamic_distractor_gate`、`rgb_only_localization_failure` 加入回放验证。
2. **语义导航不能只输出 waypoint，要输出可达区域和朝向约束**：`Beyond Waypoints` 说明单点 waypoint 回归容易把目标放到物体中心或不可通行区域。Kinbot 的“去药盒旁边”“靠近门口看一下”这类指令，需要评测导航 affordance 区域、面向方向和局部规划可接入性。
3. **长程任务的主要风险正在从单技能失败转为任务状态漂移**：`ContextFlow` 将 planner stage、运行证据、记忆上下文和 executor 之间的不一致定义为 task-state misalignment。Kinbot 的巡护、提醒、找物和人工承接任务也需要显式阶段契约、证据包和 scoped update，而不是依赖大模型自由重规划。
4. **家庭空间记忆要支持“已看过区域”的重验证与重探索**：`MCNav` 的价值不在于再造一个 ObjectNav pipeline，而是把已探索区域中的候选对象做可查询记忆、目标复核、遗漏区域重探索、黑名单和 double-check。Kinbot 找药盒、钥匙、充电器等家庭物体时，应记录“曾看到但未确认”和“可能错过”的状态。
5. **具身 VLM 安全评测不能只看攻击成功率**：`RoboJailBench` 同时关注安全后果、对抗 / 良性意图区分、标准化攻击防御和效用保持。Kinbot 后续测试 App 指令、访客语音、视觉提示和坐席建议时，应把 `benign_command_utility` 与 `unsafe_instruction_refusal` 同时计入，而不是只追求更强拒答。

周度滚动判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 纯 RGB metric SLAM、单目尺度一致性与动态场景降权 | 值得进入专题跟踪 | 将本轮 `PRISM-SLAM` 与前序视觉 SLAM 退化评测、RGB-only 3D scene graph、主动重观察合并成“纯视觉定位 / 记忆一致性”验证包。 |
| ObjectNav、语义导航和目标搜索 | 接近专题成熟 | 本周多次覆盖 zero-shot ObjectNav、frontier、semantic map、context cue 和 memory-aware search；后续只在出现家庭实机闭环、可达性安全字段或资源实测时进入主卡片。 |
| 长程任务状态一致性与可审计执行链 | 值得进入 Phase 5 评测字段 | 将 `stage_contract`、`evidence_packet`、`executor_context_match`、`repair_update` 加入任务编排回放台账候选。 |
| 具身 VLM jailbreak / 指令安全 / 视觉提示攻击 | 值得进入安全专题 | 将 RoboJailBench 与前序 typographic attack、unsafe propagation、VLM threat model 合并为“视觉 / 语言 / 跨端指令污染”离线测试。 |
| 泛 `VLA`、world model、自动驾驶仿真、UAV、humanoid manipulation | 已饱和 | 只有出现端侧资源实测、家庭移动实机闭环或安全审计新增证据时才进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 PRISM-SLAM、双热力图语义导航、ContextFlow、MCNav 和 RoboJailBench 都变成在线组件，会明显过复杂”。建议只吸收为 5 个轻量验证 / 治理动作：纯 RGB 定位回放字段、语义目标可达区域评测、任务阶段契约台账、已探索区域重验证策略、具身 VLM 安全-效用双指标。暂不新增产品级在线 world model、重型自主任务中台、新传感器基线或 VLA 主控。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | PRISM-SLAM: Probabilistic Ray-Grounded Inference for Scale-aware Metric SLAM | 转成纯视觉定位专题：尺度漂移、动态干扰降权、VFM 深度不确定性、30 FPS 端侧可行性复核。 |
| A | ContextFlow: Hierarchical Task-State Alignment for Long-Horizon Embodied Agents | 转成 Phase 5 任务编排评测：stage contract、evidence packet、executor handoff、repair update。 |
| A- | RoboJailBench: Benchmarking Adversarial Attacks and Defenses in Embodied Robotic Agents | 转成安全专题：具身 jailbreak 后果分类、良性指令效用、攻击防御统一评测。 |
| A- | MCNav: Memory-Aware Dynamic Cognitive Map for Zero-shot Goal-oriented Navigation | 转成空间记忆专题：目标重验证、已探索区域重探索、黑名单、double-check。 |
| B+ | Beyond Waypoints: Dual-Heatmap Grounding for Cross-Embodiment Semantic Navigation | 转成局部导航评测：导航 affordance heatmap、facing heatmap、可达目标区域。 |

## 3. 论文卡片

### 3.1 PRISM-SLAM: Probabilistic Ray-Grounded Inference for Scale-aware Metric SLAM

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.19257](https://arxiv.org/abs/2605.19257) |
| 本轮 listing 口径 | 2026-05-20 官方 listing new submission，日更收录；abs 页显示 `Submitted on 19 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | monocular SLAM, RGB-only, VFM depth prior, Bayesian factor graph, dynamic scene uncertainty gating |

摘要要点转述：

论文针对单目 SLAM 的尺度歧义和动态环境跟踪失败问题，提出 `PRISM-SLAM`。作者认为，视觉基础模型提供的零样本深度先验虽然有用，但如果直接作为确定性深度输入，会忽略预测不确定性和跨帧尺度不一致。该方法把 VFM 深度先验纳入结构化贝叶斯因子图，用 Pluecker Ray-Distance Factor 将单目观测锚定到全局一致的 metric coordinate system，并通过时间深度一致性估计 epistemic uncertainty。动态场景中的干扰物不会通过重型语义分割硬剔除，而是由 Dynamic Scene Uncertainty Gating 进行概率降权。系统采用多进程结构异步处理 VFM 推理和几何跟踪，论文报告可仅使用 RGB 输入提供 30 FPS 的 metric 输出，并在 TUM RGB-D 与 7-Scenes 上使 metric `SE(3)` ATE 接近 oracle-aligned `Sim(3)` error。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 和纯视觉主线下“单目 / RGB-only 定位是否能形成可信尺度”的问题。
2. Kinbot 家庭巡航会遇到人、宠物、反光地面、门帘和电视画面等动态干扰，不能只看静态 benchmark 的 ATE。
3. 对应 Phase 5：建议增加 `metric_scale_drift`、`rgb_only_tracking_loss`、`dynamic_distractor_gate`、`depth_prior_uncertainty`、`relocalization_after_motion` 字段。

资源消耗与部署信号：

1. 论文声称 30 FPS RGB-only metric output，但 VFM 推理和贝叶斯图优化仍需在 Kinbot `12GB + 32GB` 量产线下单独复测。
2. 更现实的吸收方式是离线回放、低频定位质量评估和失败归因，而不是把 VFM-SLAM 写成导航实时强依赖。
3. 其动态干扰降权思路比“所有动态物体都语义分割”更贴近端侧资源约束。

优势：

1. 直接命中纯视觉路线下的尺度可信与动态干扰问题。
2. 用不确定性处理 VFM 深度先验，而不是把基础模型输出当作真值。
3. 提供可转化为 Phase 5 回放指标的失败字段。

劣势与风险：

1. benchmark 不等同于真实家庭暗光、遮挡和低纹理地面。
2. VFM 资源占用、端侧热设计和长时运行稳定性未对齐 Kinbot 硬件基线。
3. 若把该类系统作为在线导航前置条件，会扩大验证复杂度。

推荐理由：

建议作为 A 级输入。Kinbot 应把它吸收为纯视觉定位专题的验证口径，重点验证尺度漂移和动态干扰，不因此新增主动深度传感器或重型在线 SLAM 组件承诺。

### 3.2 ContextFlow: Hierarchical Task-State Alignment for Long-Horizon Embodied Agents

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.19314](https://arxiv.org/abs/2605.19314) |
| 本轮 listing 口径 | 2026-05-20 官方 listing new submission，日更收录；abs 页显示 `Submitted on 19 May 2026` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | task-state alignment, stage contract, evidence packet, scoped update, auditable handoff |

摘要要点转述：

论文关注长程具身任务中越来越突出的任务状态不一致问题。随着 navigation、search、approach、manipulation 等局部 executor 变强，瓶颈从单个技能能否执行转向 planner 当前阶段、运行证据、记忆上下文和委派 executor 是否仍然支持同一个下一步决策。作者将这种失败称为 task-state misalignment，表现为 unsupported handoff、stage lock、executor-context mismatch 和无效重规划。`ContextFlow` 通过显式 stage contract 描述阶段条件，把运行观测转成 evidence packet，并用 continue、refine、transfer、promote、repair 等 scoped update 维护任务前沿一致性。核心原则是局部控制仍由 specialist executor 负责，但任务边界、证据和修复动作必须可检查、可审计。

解决 Kinbot 的什么问题：

1. 对应 `decision_orchestration`、`world_state_memory` 和 `safety_compliance_authorization` 中“长程任务执行到一半时，系统是否还知道自己为什么在做下一步”的问题。
2. Kinbot 的夜间巡护、找物、用药提醒、老人看护和人工坐席承接任务都可能出现阶段漂移：已确认的事实、当前行动和下一步委派不再一致。
3. 对应 Phase 5：建议增加 `stage_contract_satisfied`、`evidence_packet_complete`、`executor_context_match`、`handoff_supported`、`repair_update_reason` 字段。

资源消耗与部署信号：

1. 论文主要贡献是任务组织和审计结构，不必引入新大模型。
2. 可以低成本落为日志 schema、回放断点和任务状态检查器。
3. 如果把它扩张成独立“任务中台”，会增加系统层级；更合理的是作为现有 OODA / runtime baseline 的评测语言。

优势：

1. 把长程任务失败从“模型没想好”拆成可审计的不一致类型。
2. 与 Kinbot 已有 OODA、阶段门、证据台账和人工承接思路兼容。
3. 适合作为 Phase 5 的任务回放检查维度。

劣势与风险：

1. 论文仍偏框架与示例 traces，缺少 Kinbot 家庭场景实测。
2. stage contract 设计若过细，会制造大量状态字段和维护负担。
3. scoped update 需要和现有权限、隐私和用户确认规则对齐。

推荐理由：

建议作为 A 级输入。Kinbot 应吸收“任务状态一致性”评测语言，但只把它落到现有任务编排日志和回放检查，不新增独立任务中台。

### 3.3 RoboJailBench: Benchmarking Adversarial Attacks and Defenses in Embodied Robotic Agents

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.19328](https://arxiv.org/abs/2605.19328) |
| 本轮 listing 口径 | 2026-05-20 官方 listing cross submission from `cs.CR`，日更收录；abs 页显示 `Submitted on 19 May 2026` |
| 分类 | `cs.CR`, `cs.RO` |
| 方法关键词 | embodied VLM security, jailbreak benchmark, security taxonomy, intent contrast dataset, utility-security tradeoff |

摘要要点转述：

论文指出，VLM 被接入机器人和自动驾驶等物理平台后，jailbreak 攻击的风险不再只是聊天回答错误，而会影响视觉解释和自然语言命令执行。已有评测往往使用临时数据集和有限指标，强调攻击成功率，却忽略防御是否伤害正常指令执行能力。`RoboJailBench` 提出三个核心部分：基于 ISO 标准、监管规则和公开事故整理 embodied AI 安全后果分类，形成 18 类安全违规结果；构造 intent contrast dataset，将对抗目标与良性目标成对评估，以同时衡量安全和效用；提供持续演进的 attacks / defenses 标准化评估流程。论文还整合多类攻击、防御和主流 embodied VLM，用统一指标比较。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`observability_data_governance` 和 `human_service_interface` 中“机器人如何处理恶意指令、视觉提示污染和良性家庭指令”的问题。
2. Kinbot 不应只记录“拒绝危险指令”，还要记录是否误拒正常照护、提醒、巡护和家属指令。
3. 对应 Phase 5：建议新增 `unsafe_instruction_refusal`、`benign_command_utility`、`attack_surface_type`、`violation_consequence_class`、`defense_false_refusal_rate`。

资源消耗与部署信号：

1. 论文提供的是 benchmark 与测试集构造口径，不要求端侧新增模型。
2. Kinbot 可先在离线回放中覆盖视觉贴纸、访客语音、App 文本、坐席建议和跨端上下文污染。
3. 防御策略必须与用户体验平衡，避免把所有含糊指令都拒绝，损伤“温暖”的高端产品感。

优势：

1. 将 embodied AI 安全从抽象对齐拉到具体物理后果。
2. 同时衡量安全和良性效用，避免只优化拒答率。
3. 可与前序 typographic attack、unsafe action propagation 和 LLM threat model 合并为安全测试包。

劣势与风险：

1. benchmark 仍需改写成 Kinbot 的家庭权限模型和任务类型。
2. 标准化攻击防御指标不等于量产安全证明。
3. 若直接引入复杂防御层，可能增加交互摩擦和系统复杂度。

推荐理由：

建议作为 A- 级输入。Kinbot 应把它转成具身 VLM 安全-效用评测，不新增产品级安全中台，但要明确测试“危险拒绝”和“良性可用”两条线。

### 3.4 MCNav: Memory-Aware Dynamic Cognitive Map for Zero-shot Goal-oriented Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.19594](https://arxiv.org/abs/2605.19594) |
| 本轮 listing 口径 | 2026-05-20 官方 listing new submission，日更收录；abs 页显示 `Submitted on 19 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | memory-aware navigation, dynamic cognitive map, goal re-validation, missed goal re-exploration, blacklist |

摘要要点转述：

论文关注 instance-level target navigation 中“已探索区域没有被充分利用”的问题。很多零样本导航方法会建模全局环境并用 LLM 做场景理解，但策略偏向探索新区域；一旦此前经过的地方发生目标漏检或误匹配，系统容易继续向前探索而不是回头修正。`MCNav` 提出 memory-aware dynamic cognitive map，存储已探索区域中相关物体的可查询信息，并在此基础上提出两类策略：goal re-validation 会重新评估此前看到的目标候选以修正匹配失败；missed goal re-exploration 会根据上下文判断某个已探索区域是否可能漏掉目标。黑名单机制避免重复错误，double-check 机制用于高置信确认。论文在 HM3Dv1 / HM3Dv2 的多类任务上报告了较强结果，尤其提升 instance-level goal navigation。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory` 和 `mobility_navigation` 中“家庭找物任务是否能从已看过的区域中纠错”的问题。
2. Kinbot 找药盒、钥匙、遥控器、充电器或门口障碍时，不能只靠一次开放词汇识别；需要记录候选、错过概率和重观察原因。
3. 对应 Phase 5：建议增加 `goal_candidate_memory`、`revalidation_trigger`、`missed_goal_probability`、`blacklisted_false_match`、`double_check_confirmation` 字段。

资源消耗与部署信号：

1. 动态认知地图可以先做轻量对象候选表和低频回放，不需要实时大图优化。
2. 需要约束记忆数据的隐私边界，原始图像仍应端侧处理，候选语义和低分辨证据受控留存。
3. 过度重探索会增加移动时间、能耗和对家庭成员的打扰，需要设定成本阈值。

优势：

1. 直接命中家庭找物和导航记忆的纠错机制。
2. 把“已探索区域”从静态历史变成可查询、可复核的任务资源。
3. blacklist 与 double-check 可转化为简单工程字段。

劣势与风险：

1. 主要基于 HM3D 仿真，家庭真实遮挡和物体移动更复杂。
2. 若目标候选记忆质量差，重验证可能带来重复巡航。
3. 需要和用户纠正、家属 App 标注和隐私策略结合。

推荐理由：

建议作为 A- 级输入。Kinbot 应把它吸收为空间记忆专题中的“目标候选复核”机制，不新增大规模在线认知图，只补轻量候选表和回放字段。

### 3.5 Beyond Waypoints: Dual-Heatmap Grounding for Cross-Embodiment Semantic Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.19420](https://arxiv.org/abs/2605.19420) |
| 本轮 listing 口径 | 2026-05-20 官方 listing new submission，日更收录；abs 页显示 `Submitted on 19 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | semantic navigation, navigation affordance heatmap, facing heatmap, executable local goal, cross-embodiment |

摘要要点转述：

论文指出，开放式语义指令要落到机器人可执行的局部目标，不能简单回归一个确定性 waypoint。单点 waypoint 会压缩空间不确定性，常把目标落在物体中心或不可通行区域，导致局部执行失败。作者提出 dual-heatmap grounding：一个导航 affordance heatmap 表达连续可达区域，另一个 facing heatmap 表达机器人应该面向的方向约束。这两个密集输出可以作为语义势场接入下游局部规划器。论文还构建了 foundation-model-assisted synthetic data pipeline 和仿真 benchmark，并在 Jetbot、H1、Aliengo 等不同 embodiment 上验证显式 heatmap prediction 能提高 Affordance Rate。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 与 `decision_orchestration` 中“自然语言目标如何转成可执行局部导航目标”的问题。
2. Kinbot 常见指令如“靠近床边看看”“到药盒旁边”“面对门口确认一下”都需要目标区域和朝向，而不是单点坐标。
3. 对应 Phase 5：建议增加 `semantic_goal_affordance`、`target_free_space_ratio`、`facing_constraint_satisfied`、`planner_acceptance_rate` 字段。

资源消耗与部署信号：

1. 论文使用 8B 级基线和合成数据 pipeline，不能直接推断 Kinbot 端侧实时可运行。
2. 适合先转成局部目标生成评测和离线数据增强，而不是替换现有导航栈。
3. 若在线使用，应限定在低频语义目标解释，不进入底盘闭环安全控制。

优势：

1. 把语义导航输出从“目标点”改为“可达区域 + 朝向”，更贴近真实机器人执行。
2. 直接缓解目标在不可通行物体中心的问题。
3. 与 Kinbot 家庭巡护、找物和老人看护确认动作高度相关。

劣势与风险：

1. 合成数据与真实家庭长尾布局之间存在差距。
2. heatmap 输出仍需由保守局部规划和避障约束兜底。
3. 多 embodiment 结果不等于 Kinbot 形态和传感配置已验证。

推荐理由：

建议作为 B+ 级输入。Kinbot 应吸收其“语义目标可达区域”评测，不把 VLM heatmap 作为安全控制源，只作为局部规划候选输入。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| CLUE: Adaptively Prioritized Contextual Cues by Leveraging a Unified Semantic Map for Effective Zero-Shot Object-Goal Navigation | [2605.19206](https://arxiv.org/abs/2605.19206) | 2026-05-20 new submission | room cue / object cue 自适应对 ObjectNav 有价值，但与本轮 `MCNav` 和 `Beyond Waypoints` 主题重叠；作为语义导航专题候选保留。 |
| Minimalist Visual Inertial Odometry | [2605.19990](https://arxiv.org/abs/2605.19990) | 2026-05-20 new submission | 端侧资源启发很强，但依赖向下 photodiode + IMU 的额外硬件假设；本轮不改写一代纯视觉主线和 BOM。 |
| TravExplorer: Cross-Floor Embodied Exploration via Traversability-Aware 3-D Planning | [2605.19958](https://arxiv.org/abs/2605.19958) | 2026-05-20 new submission | 跨楼层、楼梯和 Unitree Go2 实验有导航专题价值，但 Kinbot 一代默认家庭平层 / 低风险室内移动，暂不扩张到跨楼层能力。 |
| CANINE: Coaching Visually Impaired Users for Interactive Navigation with a Robot Guide Dog | [2605.19501](https://arxiv.org/abs/2605.19501) | 2026-05-20 new submission | 个性化 verbal coaching 对老人 / 家属交互有启发，但产品形态是导盲机器人训练，不直接改变 Kinbot 导航或看护主线。 |
| DEFLECT: Delay-Robust Execution via Flow-matching Likelihood-Estimated Counterfactual Tuning for VLA Policies | [2605.19294](https://arxiv.org/abs/2605.19294) | 2026-05-20 new submission | 异步 VLA 延迟补偿有资源价值，但任务偏 VLA control / manipulation，本月 VLA latency 已多次覆盖；只保留为端侧推理延迟候选。 |
| SafeAlign-VLA: A Negative-Enhanced Safe Alignment Framework for Risk-Aware Autonomous Driving | [2605.19524](https://arxiv.org/abs/2605.19524) | 2026-05-20 new submission | 负样本安全对齐思路有启发，但场景是自动驾驶 NAVSIM / DeepAccident；不新增 Kinbot VLA 安全主卡片。 |
| D-CLING: Prior-Preserving Depth-Conditioned Fine-Tuning for Navigation Foundation Models | [2605.19690](https://arxiv.org/abs/2605.19690) | 2026-05-20 new submission | 导航 foundation model 微调相关，但 depth-conditioned 口径容易误读为产品传感 fallback；当前仅作为 NFM 专题候选。 |
| PAPO-VLA: Planning-Aware Policy Optimization for Vision-Language-Action Models | [2605.19580](https://arxiv.org/abs/2605.19580) | 2026-05-20 new submission | 泛 VLA policy optimization，与本月 world action model / VLA 主题高度重叠，未新增 Kinbot 家庭移动评测字段。 |
| RoVLA: Multi-Consistency Constraints for Robust Vision-Language-Action Models | [2605.19678](https://arxiv.org/abs/2605.19678) | 2026-05-20 new submission | VLA 鲁棒性方向可观察，但仍偏大一统动作模型；不进入一代产品级在线组件。 |
| CADENet: Condition-Adaptive Asynchronous Dual-Stream Enhancement Network for Adverse Weather Perception in Autonomous Driving | [2605.19837](https://arxiv.org/abs/2605.19837) | 2026-05-20 cross submission | 异步增强不阻塞检测的思路可借鉴，但数据和指标偏自动驾驶恶劣天气，且 reported F1 很低；不改写 Kinbot 室内视觉主线。 |
| Probing Embodied LLMs: When Higher Observation Fidelity Hurts Problem Solving | [2605.20072](https://arxiv.org/abs/2605.20072) | 2026-05-20 cross submission | “高保真观察不一定提升闭环问题解决”对评测解释有价值，但更适合作为 LLM 行为分析线索；本轮已有 ContextFlow 和 RoboJailBench 覆盖可审计评测。 |
| Adversarial Stress Testing of SPARK Humanoid Safety Filters | [2605.19009](https://arxiv.org/abs/2605.19009) | 2026-05-20 new submission | stress testing 思路有价值，但对象是 high-DoF humanoid safety filter；Kinbot 当前优先移动底盘和语义安全回放。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮不直接回写主线架构文档、`03_decision_log.md` 或 Linear；全部作为研究输入保留在 `docs/09_research/00_papers/`。
2. 若后续进入专题，应优先拆成 4 个轻量验证包：纯 RGB 定位一致性、语义导航可达区域、长程任务状态一致性、具身 VLM 安全-效用评测。
3. Phase 5 验证台账可候选新增字段：`metric_scale_drift`、`dynamic_distractor_gate`、`semantic_goal_affordance`、`stage_contract_satisfied`、`evidence_packet_complete`、`goal_candidate_memory`、`benign_command_utility`。
4. ObjectNav / semantic map 主题已经接近专题成熟，后续不应继续按论文数量扩张，除非新增真实家庭实机闭环、端侧资源实测或安全审计字段。
5. 对 Minimalist VIO 只保留“资源极简化测量”的研究启发，不新增 photodiode / optical mask 传感器基线。

## 6. 本轮未进入主线的原因

1. 本轮文档日期为 2026-05-21，但官方最新 Robotics listing 日期为 2026-05-20；本轮记录的是最新官方 listing 的日更收录，不代表 2026-05-21 另有新官方批次。
2. 入选论文主要提供评测字段、回放语言和安全治理测试，尚未经过 Kinbot 实机验证、供应链评估、端侧资源实测或用户体验评审。
3. 若将 VFM-SLAM、双热力图语义导航、ContextFlow、MCNav 和 RoboJailBench 直接升级为在线组件，会显著扩大系统复杂度。
4. 当前一代纯视觉、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 与 `5000 到 6000 元` BOM 冻结基线不因本轮论文改变。

## 7. 来源

1. arXiv `cs.RO/new`：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent`：<https://arxiv.org/list/cs.RO/recent>
3. PRISM-SLAM: Probabilistic Ray-Grounded Inference for Scale-aware Metric SLAM：<https://arxiv.org/abs/2605.19257>
4. ContextFlow: Hierarchical Task-State Alignment for Long-Horizon Embodied Agents：<https://arxiv.org/abs/2605.19314>
5. RoboJailBench: Benchmarking Adversarial Attacks and Defenses in Embodied Robotic Agents：<https://arxiv.org/abs/2605.19328>
6. MCNav: Memory-Aware Dynamic Cognitive Map for Zero-shot Goal-oriented Navigation：<https://arxiv.org/abs/2605.19594>
7. Beyond Waypoints: Dual-Heatmap Grounding for Cross-Embodiment Semantic Navigation：<https://arxiv.org/abs/2605.19420>
8. CLUE: Adaptively Prioritized Contextual Cues by Leveraging a Unified Semantic Map for Effective Zero-Shot Object-Goal Navigation：<https://arxiv.org/abs/2605.19206>
9. Minimalist Visual Inertial Odometry：<https://arxiv.org/abs/2605.19990>
10. TravExplorer: Cross-Floor Embodied Exploration via Traversability-Aware 3-D Planning：<https://arxiv.org/abs/2605.19958>
11. CANINE: Coaching Visually Impaired Users for Interactive Navigation with a Robot Guide Dog：<https://arxiv.org/abs/2605.19501>
12. DEFLECT: Delay-Robust Execution via Flow-matching Likelihood-Estimated Counterfactual Tuning for VLA Policies：<https://arxiv.org/abs/2605.19294>
13. CADENet: Condition-Adaptive Asynchronous Dual-Stream Enhancement Network for Adverse Weather Perception in Autonomous Driving：<https://arxiv.org/abs/2605.19837>
14. Probing Embodied LLMs: When Higher Observation Fidelity Hurts Problem Solving：<https://arxiv.org/abs/2605.20072>
