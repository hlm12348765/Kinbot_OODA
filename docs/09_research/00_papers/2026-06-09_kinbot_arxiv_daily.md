# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-09
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-09 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页，确认本轮本地日更时官方最新 Robotics listing 为 `Monday, 8 June 2026`，合计 `71` 篇 entries；其中 new submissions `44` 篇、cross submissions `6` 篇、replacement submissions `21` 篇。本轮按 `3-5` 篇强相关论文 + 候选排除表口径，收录语义场景覆盖、透明共享自主、任务级运行时保证、选择性强策略接管和规划对齐上下文压缩相关 5 篇论文，并记录候选排除表与周度综合判断。

---

## 1. 检索口径

本轮检索日期：2026-06-09。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Monday, 8 June 2026`，合计 `71` 篇 entries；其中 new submissions `44` 篇、cross submissions `6` 篇、replacement submissions `21` 篇。
3. 官方 `cs.RO/recent` 在本轮检索时显示最近批次包含 `Mon, 8 Jun 2026`、`Fri, 5 Jun 2026`、`Thu, 4 Jun 2026`、`Wed, 3 Jun 2026` 与 `Tue, 2 Jun 2026`；`Mon, 8 Jun 2026` recent 页面显示 `50` 篇条目。
4. 上一轮 2026-06-07 仍覆盖 `Friday, 5 June 2026` listing，并已按同一 listing 补录安全证据强度、动作 `OOD` 门控和导航训练碰撞 reset 策略。本轮是新的官方 Robotics listing，不按同一 listing 补录处理。
5. `replacement` / `cross-list` 只在确实新增 Kinbot 评测项、治理项或端侧资源判断时收录。本轮主卡片中的 `AEGIS` 是 cross-list，收录原因是它能直接转成运行时风险探针、选择性升级和强策略调用预算字段；replacement 条目均未进入主卡片。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全、端侧资源、验证证据链或数据治理的判断，而不是继续增加泛 `VLA`、world model、manipulation、humanoid、自动驾驶、UAV 或纯工具链论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：场景语义覆盖度、目标意图可见性、任务级命令拒绝、选择性强策略接管、规划相关上下文压缩。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 Monday listing 出现大量 `VLA`、manipulation、humanoid locomotion、自动驾驶和 UAV 论文而扩张主卡片数量。
2. `Robots Need More than VLA and World Models` 对研究路线判断有提醒价值，但其主张与近期多轮“泛 VLA / world model 已饱和”的结论一致，本轮不再单独作为主卡片扩展。
3. `IDDMBSE`、`Neuro-Symbolic Learning`、`STRIPS-WM`、`Beyond Waypoints`、`RhinoVLA` 和 `MatterDoor` 都有局部价值，但本轮优先保留能转成 Kinbot 轻量字段且不扩张新平台的论文。

## 2. 本轮总判断

本轮真正新增的判断不是“需要更大的 VLA”或“需要新的 world model 平台”，而是五个可以进入 Phase 5 字段包的轻量工程口径：

1. **导航 / 记忆需要记录语义覆盖是否足够，而不是只记录是否走过空间**：`SCOUT` 提示巡护、找物和家庭变化感知应把 ambiguous object revisit、semantic certainty gain 和 coverage gain 区分开。
2. **共享自主的透明度重点是目标意图可见，而不是暴露完整 belief distribution**：`What Is My Robot Thinking?` 提示 Kinbot 对老人、家属和后台坐席解释动作时，应优先说明“我以为你要我做什么 / 我准备去哪 / 为什么需要确认”，而不是把内部概率表当成透明。
3. **安全门控要覆盖任务级可完成性，而不只是底盘即刻碰撞安全**：`Mission-Level Runtime Assurance` 提示高层 Agent 命令在下发前应检查是否会跳过必要检查点、进入禁区或让后续任务不可完成。
4. **强策略 / 云端 / 后台介入应按风险探针选择性调用**：`AEGIS` 提示“什么时候升级”比“总是用更强模型”更关键；可转成 early-warning probe、handoff budget 和 kill criteria 字段。
5. **端侧长上下文不是越长越好，压缩必须与规划意图绑定**：`COMPACT-VA` 提示历史视觉 token 压缩不能只按时间衰减，应保留与 stop / yield / proceed 等决策相关的上下文；Kinbot 可迁移为巡护 / 靠近 / 等待 / 退出相关的 planning-aligned memory slice。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 泛 `VLA`、world model、world-action model、manipulation policy | 已饱和 | 只有新增家庭移动闭环、老人照护、安全审计字段、目标 SoC 实测资源边界或验证误差闭环时才进入主卡片。 |
| Phase 5 验证证据链、runtime assurance、intervention gate | 接近专题成熟 | 将近期的 safety evidence strength、mission infeasibility check、early-warning probe 和 selective escalation 收敛为最小字段包，不新增独立安全平台。 |
| 语义场景记忆、主动感知、空间覆盖度 | 值得专题跟踪 | 将 `SCOUT` 与既有动态空间记忆、语义地图不确定性论文合并为 `semantic_coverage_gap`、`revisit_reason`、`object_label_uncertainty` 字段。 |
| 透明共享自主、解释反馈、交互确认 | 值得专题跟踪 | 将目标意图可见性、反馈模态和信息粒度写入交互验证；不把完整 belief distribution 暴露作为默认产品策略。 |
| 端侧长上下文、token 压缩、工作记忆预算 | 值得专题跟踪 | 只吸收 planning-aligned compression 口径，后续需在目标 SoC 上验证 batch-1 延迟、内存峰值和决策质量。 |
| VLN waypoint、trajectory waypoint、TSDF / RGB-D 增强 | 已接近饱和 | 只在进入 Kinbot 自建导航数据集、纯视觉替代路径或目标 SoC 实测时专题吸收。 |
| replacement 论文中的隐藏空间推断、主动抓取、legged safety filter | 暂不升级 | 作为候选排除表保留，不因 revision 或邻近主题改写一代纯视觉、轮式底盘或无机械臂边界。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 SCOUT、IDDMBSE、AEGIS、COMPACT-VA、RhinoVLA、MatterDoor 和各类 runtime assurance 都写成在线子系统，会过复杂”。建议只吸收 7 类轻量字段：`semantic_coverage_gap`、`revisit_reason`、`goal_legibility_feedback`、`mission_infeasible_command`、`early_warning_probe_score`、`selective_escalation_budget`、`planning_aligned_context_budget`。暂不新增独立语义巡护大脑、完整 MBSE 工具链、在线强策略切换平台或端侧 VLA 主链路。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | SCOUT: Semantic scene COverage via Uncertainty-guided Traversal | 进入语义场景覆盖 / 记忆验证专题，吸收 semantic coverage 和 uncertainty-guided revisit 字段；不引入 RGB-D 主线。 |
| A- | Mission-Level Runtime Assurance Framework for Autonomous Driving | 进入安全执行 / 任务级 runtime assurance 字段包，补充 high-level command reject 和 mission infeasibility check。 |
| B+ | AEGIS: A Backup Reflex for Physical AI | 进入选择性强策略接管候选，吸收 early-warning probe、handoff budget 和 kill criteria，不扩张在线学习主链路。 |
| B+ | What Is My Robot Thinking? Design Considerations for Transparent and Trustworthy Shared Autonomy | 进入交互确认与目标意图可见性验证，优先验证 goal legibility feedback。 |
| B+ | Planning-aligned Token Compression for Long-Context Autonomous Driving | 进入端侧上下文预算候选，只吸收 planning-aligned compression 口径，需 Kinbot 目标 SoC 实测后再决定是否进主线。 |

## 3. 论文卡片

### 3.1 SCOUT: Semantic scene COverage via Uncertainty-guided Traversal

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.06721](https://arxiv.org/abs/2606.06721) |
| 本轮 listing 口径 | 2026-06-08 官方 listing new submission；abs 页显示 `Date: Thu Jun 4 21:13:33 2026` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | semantic scene coverage, uncertainty-guided traversal, probabilistic scene graph, active semantic exploration, open-vocabulary object label |

摘要要点转述：

论文关注长期运行机器人如何从“走过空间”升级为“知道哪些空间和物体已经被足够理解”。作者提出 `SCOUT`，把主动遍历和概率化 3D 场景图构建闭合在一个循环里：机器人维护对象几何、开放词汇标签后验和结构关系，再把这些不确定性反馈给路径选择器，让机器人在语义不确定、几何覆盖不足或路程成本之间做取舍。其核心价值不是又建一个场景图，而是把语义场景完整性变成可执行目标：某个物体标签不确定时应回看，区域缺口大时应扩展，成本过高时暂缓。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`mobility_navigation`、`observability_data_governance` 和家庭巡护中“哪些房间 / 物体 / 风险点已经看清楚”的问题。
2. Kinbot 不应只记录巡航轨迹覆盖，还要记录老人常用物品、门口障碍、药箱、充电座、夜间通道和敏感区域的语义覆盖缺口。
3. 对应 Phase 5：建议增加 `semantic_coverage_gap`、`object_label_uncertainty`、`relation_uncertainty`、`revisit_reason`、`expected_semantic_gain`、`geometric_coverage_gain` 和 `travel_cost_tradeoff` 字段。

资源消耗与部署信号：

1. 论文使用先验 2D occupancy map 和 posed RGB-D observation，不能直接当成 Kinbot 一代纯视觉主线。
2. 对 Kinbot 的可迁移点是字段和验证口径，而不是传感器配置；若后续使用双目 / 单目重建替代 RGB-D，需要单独验证不确定性质量。
3. 端侧成本主要来自场景图维护、开放词汇标签后验和 viewpoint scoring；适合先在回放 / shadow-run 中离线评估。

优势：

1. 把语义覆盖变成可度量目标，适合家庭巡护、找物和变化检测。
2. 能解释为什么机器人需要重新观察某个区域，便于交互确认和后台审计。
3. 与 Kinbot 现有纯视觉空间记忆、动态场景记忆和 Phase 5 验证字段相容。

劣势与风险：

1. RGB-D 和 3D scene graph 实现可能诱导主动传感或重平台化，不能直接写入一代主线。
2. 开放词汇标签不确定性不等于安全风险，需要与用户权限、隐私区域和场景语义分离。
3. 长期在线维护场景图可能增加端侧内存和回放数据治理负担。

推荐理由：

建议作为 A- 级输入。它应进入语义场景覆盖 / 记忆验证专题，帮助 Kinbot 从“路径覆盖”升级到“语义覆盖缺口”；不建议新增独立语义巡护大脑或引入 RGB-D 作为产品 fallback。

### 3.2 What Is My Robot Thinking? Design Considerations for Transparent and Trustworthy Shared Autonomy

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.06870](https://arxiv.org/abs/2606.06870) |
| 本轮 listing 口径 | 2026-06-08 官方 listing new submission；abs 页显示 `Date: Fri Jun 5 03:37:08 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | shared autonomy, transparency, goal legibility, visual feedback, auditory feedback, intent inference |

摘要要点转述：

论文研究共享自主系统如何向用户呈现机器人推断到的目标和意图。作者以视觉共享自主任务做用户研究，对比反馈模态和信息丰富度，发现提供反馈能提升目标对齐并减少用户纠正；视觉反馈整体更受偏好，但信息量不是越多越好，复杂任务需要更丰富解释，简单任务则可以保持简洁。论文还指出，直接展示完整 belief distribution 并不会稳定提升信任或对齐效果，透明度的关键是让用户看懂机器人“以为自己要做什么”。

解决 Kinbot 的什么问题：

1. 对应 `interaction_orchestration`、`safety_compliance_authorization`、家属 App 和后台坐席中的“机器人该如何解释意图”的问题。
2. Kinbot 面向老人、家属和运维人员时，透明度应优先围绕目标意图、下一步动作、是否需要确认和为什么停下，而不是暴露内部概率细节。
3. 对应 Phase 5：建议增加 `goal_legibility_feedback`、`feedback_modality`、`feedback_information_level`、`correction_intervention_count`、`user_alignment_after_feedback` 和 `belief_distribution_not_exposed_by_default` 字段。

资源消耗与部署信号：

1. 该论文主要影响交互设计和验证任务，不要求新增大模型或传感器。
2. 视觉反馈可优先落在躯干内容屏 / App / 运维界面；语音反馈适合作为辅助，不建议把复杂 belief 解释塞进语音。
3. 需要在老人照护、家庭巡护、敏感房间进入、用药提醒和异常观察等场景分别验证信息粒度。

优势：

1. 直接支持 Kinbot “聪明、温暖、精致”的产品感，不把透明度做成技术参数展示。
2. 能降低用户反复纠正和误解机器人的概率。
3. 与高风险动作确认、人工坐席接管和家属 App 审批链路兼容。

劣势与风险：

1. 论文任务是辅助操作，不等同于家庭移动机器人全场景交互。
2. 视觉反馈偏好可能受用户年龄、视力、认知负荷和任务紧急程度影响。
3. 过多解释会打断陪伴感和自然交互，需要按风险等级分层。

推荐理由：

建议作为 B+ 级输入。它应进入交互确认与目标意图可见性验证，帮助 Kinbot 把“透明”收敛为 goal legibility，而不是把全部内部状态暴露给用户。

### 3.3 Mission-Level Runtime Assurance Framework for Autonomous Driving

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.06996](https://arxiv.org/abs/2606.06996) |
| 本轮 listing 口径 | 2026-06-08 官方 listing new submission；abs 页显示 `Date: Fri Jun 5 07:35:10 2026` |
| 分类 | `cs.RO`, `cs.DC` |
| 方法关键词 | runtime assurance, mission-level fault, high-level command rejection, mission infeasibility, fallback controller |

摘要要点转述：

论文面向自动驾驶，但其核心问题是高层命令可能在局部安全之外破坏整体任务：例如跳过必要检查点、进入限制区域，或生成后续无法完成的路线。作者构建任务级故障场景，并在命令执行前加入 runtime monitor，用于判断命令是否同时满足即时安全和任务可完成性。实验对比显示，只看平台级安全的 baseline 无法发现任务规划错误，而任务级监控能拒绝 mission-infeasible commands 并提高随机故障下的任务成功率。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`interaction_orchestration`、`mobility_navigation` 和高层 Agent 到执行层之间的命令闸门。
2. Kinbot 的高层命令可能不是“撞不撞”的问题，而是“是否跳过必要观察 / 是否进入禁区 / 是否让后续照护任务不可完成 / 是否违反家庭授权”。
3. 对应 Phase 5：建议增加 `mission_infeasible_command`、`required_checkpoint_skipped`、`restricted_area_violation_predicted`、`future_task_unreachable_after_command`、`pre_execution_command_reject` 和 `fallback_after_reject` 字段。

资源消耗与部署信号：

1. 该方法主要增加执行前的任务可行性检查，不要求新增传感器。
2. 对端侧资源的压力取决于任务模型复杂度；Kinbot 一代可先用规则 / 状态机 / 轻量图检查实现，不必引入大型在线规划器。
3. 适合与家属授权、隐私区域、夜间巡护路径和老人照护计划绑定验证。

优势：

1. 明确把“即时运动安全”和“任务级安全 / 可完成性”拆开，符合家庭机器人真实风险结构。
2. 能阻断高层 Agent 的错误命令，不把风险完全下放到底盘或避障层。
3. 适合转成 Phase 5 回放和故障注入用例。

劣势与风险：

1. 自动驾驶场景不能直接迁移为家庭室内任务，需要重新定义 Kinbot 的 checkpoint、禁区和任务完成条件。
2. 若任务级检查过于保守，可能降低陪伴交互流畅性。
3. 高层命令语义若不结构化，runtime assurance 很难审计。

推荐理由：

建议作为 A- 级输入。它应进入安全执行 / 任务级 runtime assurance 字段包，帮助 Kinbot 在执行前拒绝任务不可行或授权不合规的命令；不建议新增复杂自动驾驶式 assurance 平台。

### 3.4 AEGIS: A Backup Reflex for Physical AI

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.06660](https://arxiv.org/abs/2606.06660) |
| 本轮 listing 口径 | 2026-06-08 官方 listing cross-list from `cs.AI`；abs 页显示 `Date: Thu Jun 4 19:09:22 2026` |
| 分类 | `cs.AI`, `cs.PF`, `cs.RO` |
| 方法关键词 | AEGIS, activation probe, early-warning, gated inference switching, selective escalation, stronger policy handoff |

摘要要点转述：

论文提出 `AEGIS`，目标是在长程任务逐步走向失败前识别风险，并只在高风险步骤调用更强策略。方法使用轻量探针读取弱策略的冻结激活，判断当前步骤是否有失败前兆；触发时才把控制权切到更强策略。作者强调收益来自升级时机而不是盲目增加算力，并用预注册分析、显式 kill criteria 和配对实验验证选择性升级优于固定预算的盲升级。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`safety_compliance_authorization` 和后台 / 云端 / 强模型介入策略中的“什么时候升级”的问题。
2. Kinbot 后续如果存在端侧小模型、强策略、后台坐席或云端校验，不能默认把所有动作都送强链路；应在风险前兆明显时升级。
3. 对应 Phase 5：建议增加 `early_warning_probe_score`、`probe_precondition_cleared`、`selective_escalation_trigger`、`strong_policy_handoff_step`、`handoff_budget_used`、`blind_escalation_baseline` 和 `kill_criteria_met` 字段。

资源消耗与部署信号：

1. `AEGIS` 的思路适合端侧资源约束：常态走轻链路，风险步骤才调用强策略。
2. 论文实验是 manipulation benchmark，不能直接证明家庭移动或老人照护有效。
3. 对 Kinbot 更适合作为 shadow-run 风险探针和强链路调用预算评估，而不是直接在线接管安全关键动作。

优势：

1. 把强模型 / 强策略调用从“永久在线”改为“有证据地选择性升级”。
2. 可与本地动作 `OOD` 门控、人工确认、后台坐席接管和任务级 runtime assurance 组合。
3. 预注册、kill criteria 和 paired evaluation 口径适合 Phase 5 证据链。

劣势与风险：

1. 激活探针可解释性有限，误报 / 漏报会影响用户体验和安全边界。
2. 强策略本身也可能出错，不能把 handoff 当成自动安全保证。
3. 若接入云端强模型，还涉及延迟、隐私和网络不可用问题。

推荐理由：

建议作为 B+ 级输入。它应进入选择性强策略接管候选，帮助 Kinbot 定义风险探针和强链路调用预算；不建议把它升级为一代在线学习或强模型常开主链路。

### 3.5 Planning-aligned Token Compression for Long-Context Autonomous Driving

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.07464](https://arxiv.org/abs/2606.07464) |
| 本轮 listing 口径 | 2026-06-08 官方 listing new submission；abs 页显示 `Date: Fri Jun 5 17:16:21 2026` |
| 分类 | `cs.RO`, `cs.AI`, `cs.CV` |
| 方法关键词 | COMPACT-VA, planning-aligned token compression, working memory, bounded context, vision-action model, resource budget |

摘要要点转述：

论文指出，长上下文视觉动作模型在复杂交互中会快速超过实时算力预算；简单按时间衰减或固定规则压缩 token，可能丢掉真正影响规划的历史信息。作者提出 `COMPACT-VA`，用条件 VQ-VAE 形成有界工作记忆，并让压缩过程与规划意图绑定：训练时从未来轨迹提取规划意图，推理时由历史观测预测该意图，再把压缩记忆送入策略。实验显示，在相近 token 预算下，方法能保持关键决策信息，并带来速度和内存收益。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`world_state_memory` 和端侧长上下文预算中“哪些历史帧 / 事件 / 状态应该留下”的问题。
2. Kinbot 在巡护、靠近老人、等待用户、避让宠物、进入房间和返回充电座时，需要保留与当前规划有关的近期记忆，而不是盲目缓存全部视觉 token。
3. 对应 Phase 5：建议增加 `planning_intent_latent`、`compressed_context_budget`、`decision_critical_history_retained`、`context_compression_speedup`、`context_memory_reduction` 和 `compressed_context_failure_case` 字段。

资源消耗与部署信号：

1. 论文报告在自动驾驶任务上获得 `3.3x` speedup 与 `2.7x` memory reduction，但不能直接外推到 Kinbot 目标 SoC。
2. 对 Kinbot 的价值是“规划对齐压缩”的原则，而不是自动驾驶模型或指标本身。
3. 后续如进入主线，必须在 `12GB RAM + 32GB Flash` 默认量产线上用 batch-1 延迟、峰值内存、热功耗和决策质量验证。

优势：

1. 正面回答端侧长上下文预算问题，避免把“多存历史”误写成能力提升。
2. 与近期端侧推理冗余消除、batch-1 profiling 和强策略选择性升级主题互补。
3. 字段可以先用于回放分析，不需要立即改造在线模型。

劣势与风险：

1. 论文场景是自动驾驶，Kinbot 家庭室内任务的决策关键历史不同。
2. 压缩模型本身也消耗算力，不能只看压缩后收益。
3. 如果 planning intent 预测错误，可能系统性丢掉低频但关键的安全线索。

推荐理由：

建议作为 B+ 级输入。它应进入端侧上下文预算候选，帮助 Kinbot 以 planning-aligned memory slice 管理历史视觉 / 状态信息；不建议据此新增大规模端侧 vision-action 模型主线。

## 4. 候选排除表

| 论文 | arXiv | listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| Robots Need More than VLA and World Models | [2606.06556](https://arxiv.org/abs/2606.06556) | 2026-06-08 new submission | 研究议程与 Kinbot 近期“泛 `VLA` / world model 已饱和、应关注数据接口 / reward / 物理监督”的判断一致，但未新增可直接落入 Phase 5 的字段；作为总判断背景，不单列主卡片。 |
| IDDMBSE: Integrating Data-Driven and Model-Based Systems Engineering for Trusted Autonomous Cyber-Physical Systems | [2606.06727](https://arxiv.org/abs/2606.06727) | 2026-06-08 new submission | V-process、SysML、ROS stack 映射和 formal / data-driven / runtime verification 对 Phase 5 有启发，但工具链过重，且与既有 provenance / evidence chain TODO 重叠；后续处理验证模板时再吸收最小字段。 |
| Neuro-Symbolic Learning for Long-Horizon Task Planning Under Complex Logical Constraints | [2606.06877](https://arxiv.org/abs/2606.06877) | 2026-06-08 new submission | object-importance pruning、Repair / Restart / Rollback 对任务规划有价值，但仍偏通用 mobile manipulator 任务规划；本轮用任务级 runtime assurance 承接更直接的安全门控增量。 |
| STRIPS-WM: Learning Grounded Propositional STRIPS-style World Models from Images | [2606.06832](https://arxiv.org/abs/2606.06832) | 2026-06-08 new submission | 从图像转 symbolic operator 适合长期研究，但实验是视觉 rearrangement / manipulation；不新增一代家庭移动的 symbolic world model 主链路。 |
| Beyond Waypoints: A Trajectory-Centric Waypointing Paradigm for Vision-Language Navigation | [2606.07244](https://arxiv.org/abs/2606.07244) | 2026-06-08 new submission | 可执行 trajectory waypoint 对 VLN-CE 有价值，但 TSDF / diffusion waypoint 和 VLN 主题近期已接近饱和；暂不改写 Kinbot 纯视觉导航主线。 |
| RhinoVLA Technical Report | [2606.07383](https://arxiv.org/abs/2606.07383) | 2026-06-08 new submission | 边缘 `VLA` token 减负和 `10 Hz` 级闭环控制信号值得关注，但依赖特定 Huixi R1 SoC、操作型 policy 和统一 72D action slot；不直接进入 Kinbot `12GB + 32GB` 默认量产线。 |
| MatterDoor: Sampling Zero-shot Spatio-semantic Priors using Generative Models | [2510.11014](https://arxiv.org/abs/2510.11014) | 2026-06-08 replacement | 从门口 RGB 推断隐藏房间结构对家庭导航有启发，但 replacement 且生成式 hidden structure 风险高；不把不可见区域想象结果写入安全关键主线。 |
| Shield-Loco: Shielding Locomotion Policies with Predictive Safety Filtering | [2606.07193](https://arxiv.org/abs/2606.07193) | 2026-06-08 new submission | predictive safety filtering 对低层安全有价值，但对象是 quadruped contact sequence；Kinbot 一代轮式底盘不直接吸收。 |
| CAPE: Contrastive Action-conditioned Parallel Encoding for Embodied Planning | [2606.07304](https://arxiv.org/abs/2606.07304) | 2026-06-08 new submission | 并行预测未来 latent trajectory 可降低长 horizon planning inference 成本，但核心仍是 manipulation visual dynamics；不重复扩张 world model / action model 主卡片。 |
| Re-imagining ISO 26262 in the Age of Autonomous Vehicles | [2606.07437](https://arxiv.org/abs/2606.07437) | 2026-06-08 new submission | transferability / predictability 对 safety case 有概念价值，但汽车标准语境强；可作为后续 safety evidence 字段参考，不进入本轮主卡片。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮论文默认仍作为 `docs/09_research/00_papers/` 下的研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。
2. 若后续处理 Phase 5 验证模板、仿真 / 回放报告或样机试点证据包，可把本轮字段与既有 provenance TODO 合并考虑：`semantic_coverage_gap`、`goal_legibility_feedback`、`mission_infeasible_command`、`early_warning_probe_score`、`selective_escalation_budget`、`planning_aligned_context_budget`。
3. 不建议新增完整 `IDDMBSE` 工具链、在线语义场景图主服务、强策略常开链路或端侧大 `VLA` 主链路；当前更合理的是在验证报告中增加字段，在研发回放中做 shadow-run 和人工抽检。
4. 如果后续要专题跟踪，优先方向是“任务级 runtime assurance + 透明共享自主 + 端侧上下文预算”三者的最小闭环，而不是继续堆叠模型层。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent` 官方 listing：<https://arxiv.org/list/cs.RO/recent>
3. `SCOUT: Semantic scene COverage via Uncertainty-guided Traversal`：<https://arxiv.org/abs/2606.06721>
4. `What Is My Robot Thinking? Design Considerations for Transparent and Trustworthy Shared Autonomy`：<https://arxiv.org/abs/2606.06870>
5. `Mission-Level Runtime Assurance Framework for Autonomous Driving`：<https://arxiv.org/abs/2606.06996>
6. `AEGIS: A Backup Reflex for Physical AI`：<https://arxiv.org/abs/2606.06660>
7. `Planning-aligned Token Compression for Long-Context Autonomous Driving`：<https://arxiv.org/abs/2606.07464>
8. 候选排除表条目：[`Robots Need More than VLA and World Models`](https://arxiv.org/abs/2606.06556)、[`IDDMBSE`](https://arxiv.org/abs/2606.06727)、[`Neuro-Symbolic Learning`](https://arxiv.org/abs/2606.06877)、[`STRIPS-WM`](https://arxiv.org/abs/2606.06832)、[`Beyond Waypoints`](https://arxiv.org/abs/2606.07244)、[`RhinoVLA`](https://arxiv.org/abs/2606.07383)、[`MatterDoor`](https://arxiv.org/abs/2510.11014)、[`Shield-Loco`](https://arxiv.org/abs/2606.07193)、[`CAPE`](https://arxiv.org/abs/2606.07304)、[`Re-imagining ISO 26262`](https://arxiv.org/abs/2606.07437)
