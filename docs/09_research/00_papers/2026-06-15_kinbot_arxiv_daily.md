# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-15
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-15 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv API，确认本轮本地日更时官方最新 Robotics listing 为 `Monday, 15 June 2026`，合计 `79` 篇 entries；其中 new submissions `48` 篇、cross submissions `7` 篇、replacement submissions `24` 篇。官方 `cs.RO/recent` 顶部为 `Mon, 15 Jun 2026`，显示 `first 50 of 55 entries`，该页仅覆盖当日 new + cross，不含 replacement。本轮按 `3-5` 篇强相关论文 + 候选排除表口径，收录训练-free 终身导航、楼层图先验导航、延迟证据记忆、latent dynamics OOD 安全检测和端侧 ObjectNav 资源调度 5 篇论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-06-15。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Monday, 15 June 2026`，合计 `79` 篇 entries；其中 new submissions `48` 篇、cross submissions `7` 篇、replacement submissions `24` 篇。
3. 官方 `cs.RO/recent` 顶部为 `Mon, 15 Jun 2026`，显示 `first 50 of 55 entries`；该页只展示当日 new + cross 的 recent 条目，不含 `cs.RO/new` 中的 `24` 篇 replacement，因此本轮 entries 总数、new / cross / replacement 计数以 `cs.RO/new` 为准。
4. 2026-06-12 / 2026-06-13 / 2026-06-14 已连续覆盖 `Friday, 12 June 2026` listing，本轮为新的 Monday listing，不再从上一批饱和条目中补录主卡片。
5. 本轮只把能改变 Kinbot 对导航、记忆、安全和端侧资源字段判断的论文升级为主卡片；泛 `VLA`、`WAM`、manipulation、humanoid、UAV、自动驾驶、触觉和机械手条目进入候选排除表或专题候选。

筛选标准：

1. 是否改变 Kinbot 对家庭室内导航、长期空间记忆、安全检测、端侧资源预算或 Phase 5 验证字段的判断。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：长期证据累积、楼层图先验、延迟证据回忆、latent OOD 检测、端侧语义地图延迟、峰值内存和安全跳帧。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `Occupancy-Grounded Room Segmentation` 与室内 3D scene graph 相关，但近期语义地图、ObjectNav 和 scene graph 已多次覆盖；本轮只保留为候选，不再扩张语义地图主卡片。
2. `SplatlessDF`、`WAM4D`、`μ0`、`FlowMo-WM` 等仍有 world model / mapping 价值，但本轮优先收录能直接形成 Kinbot 验证字段的导航、记忆、安全和端侧资源论文。
3. `RT-VLA`、`Output-Level Regularization`、`ReactVLA`、`PhysVLA` 等对 VLA 训练或低延迟有启发，但对象主要是自动驾驶或 manipulation，不进入一代在线主链路。
4. `Cross-Stage Sensorimotor Perception Scheduling...` 虽是 replacement，但它直接给出端侧 ObjectNav 的延迟、峰值内存、语义地图更新跳过和 Pareto operating point 字段，因此按“replacement 仅在新增 Kinbot 评测项时收录”的规则进入主卡片。

## 2. 本轮总判断

本轮真正新增的判断是：Kinbot 的 Phase 5 论文吸收重点应从“再增加一个导航 / VLA 模型”转成“给家庭导航与记忆闭环补充可测字段”。

1. **终身导航不是简单保留稠密快照，而是保留目标相关证据及其不确定性**：`AnyGoal` 提示可把 goal relevance 的均值 / 方差、探索 frontier 和开放词汇验证失败拆成字段，而不是无限堆叠 3D snapshot。
2. **家庭平面图可以作为弱先验，但不能越过实时安全执行**：`FloVerse` 提示 floor plan 对 PointNav、ObjectNav 和 ImageNav 都有帮助；Kinbot 可吸收为用户户型图 / 初始建图 / 房间先验字段，但必须记录 floor-plan alignment 置信度和与实时感知冲突的处理。
3. **记忆应覆盖“证据曾经出现过但现在不可见”的分支任务**：`TRACE` 提示 fixed-size latent memory 与 path signature 能处理 delayed-evidence；Kinbot 可把它转成药盒、门状态、老人刚才位置、已确认目标等回放字段。
4. **world model / latent dynamics 安全要测 OOD，而不是只看 rollout 好看不好看**：`Sensitivity Shaping` 提示 post-hoc support surrogate 可能漏报危险动作；Kinbot 应记录 control-induced latent sensitivity 与 OOD warning lead time。
5. **端侧导航资源评估要到模块瓶颈层，而不是只比较模型大小**：`Cross-Stage Sensorimotor...` 提示语义 mapping 可能主导每步延迟、goal prediction 可能主导峰值内存；Kinbot 应记录 perception-to-action loop 的阶段级延迟和安全跳帧影响。

周度滚动判断（本周起点）：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| ObjectNav / 语义地图 / scene graph | 接近饱和 | 只在新增真实家庭闭环、端侧资源实测、平面图冲突处理或安全审计字段时进入主卡片。 |
| 长期导航证据与目标相关不确定性 | 值得专题跟踪 | 将 `AnyGoal` 与近期 `SCOUT`、`DB-Nav`、`PSG-Nav` 合并为 `goal_relevance_mean`、`goal_relevance_variance`、`frontier_commitment_hysteresis` 字段。 |
| 楼层图 / 户型图先验 | 值得专题跟踪 | 将 `FloVerse` 转成 `floor_plan_available`、`floor_plan_alignment_confidence`、`floor_plan_sensor_conflict`、`plan_prior_override_reason` 字段。 |
| 延迟证据记忆 | 值得专题跟踪 | 将 `TRACE` 与动作-效果记忆、长期情景记忆合并为 `delayed_evidence_key`、`path_signature_key`、`memory_branch_recall_success` 字段。 |
| latent OOD / world model 安全检测 | 接近专题成熟 | 将 `Sensitivity Shaping` 与近期 world model horizon、abstain、runtime assurance 合并为 `latent_ood_score`、`control_sensitivity_probe`、`ood_warning_lead_time` 字段。 |
| 泛 `VLA / WAM / manipulation` 低延迟和微调技巧 | 已饱和 | 仅保留端侧资源、失败检测、可审计训练或目标 SoC 实测字段，不新增一代在线 VLA 主链路。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 BVM lifelong navigation、ThreeDiff floor-plan policy、TRACE memory adapter、sensitivity-shaped dynamics、SKIP+SCOUT edge navigation、RT-VLA、WAM4D、VLA seed-lottery regularizer 全部写成在线组件，会过复杂”。建议只吸收 12 类轻量字段：`goal_relevance_mean`、`goal_relevance_variance`、`frontier_commitment_hysteresis`、`floor_plan_alignment_confidence`、`floor_plan_sensor_conflict`、`delayed_evidence_key`、`path_signature_key`、`memory_branch_recall_success`、`latent_ood_score`、`control_sensitivity_probe`、`semantic_mapping_step_latency`、`peak_navigation_memory_mb`。暂不新增独立 lifelong navigation 大脑、floor-plan diffusion policy、在线 causal memory adapter、完整 latent dynamics planner 或端侧 ObjectNav 专用优化平台。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | AnyGoal: Vision-Language Guided Multi-Agent Exploration for Training-Free Lifelong Navigation | 进入长期导航证据与目标不确定性专题，吸收 Bayesian value map、goal relevance 方差、frontier commitment 和 open-vocabulary verification failure 字段；不新增多机器人主链路。 |
| A- | Cross-Stage Sensorimotor Perception Scheduling and Sparse Map Encoding for Efficient Edge Embodied Navigation | 作为 replacement 主卡片进入端侧导航资源专题，吸收阶段级延迟、峰值内存、安全跳帧和 Pareto operating point 字段；不直接采用 depth-based ObjectNav pipeline。 |
| B+ | TRACE: Trajectory-Routed Causal Memory for Delayed-Evidence Visuomotor Imitation | 进入延迟证据记忆候选，吸收 path signature、fixed-size latent memory 和 ambiguous branch recall 字段；不新增 manipulation 主链路。 |
| B+ | Sensitivity Shaping for Latent Modeling | 进入 latent OOD 与 world model 安全检测候选，吸收 control-sensitivity probe 和 OOD warning lead time 字段；不新增在线 generative dynamics planner。 |
| B+ | FloVerse: Floor Plan-Guided Multi-Modal Navigation | 进入户型图 / 楼层图先验导航候选，吸收 floor-plan alignment 与 sensor conflict 字段；不把 floor plan 当作硬地图事实。 |

## 3. 论文卡片

### 3.1 AnyGoal: Vision-Language Guided Multi-Agent Exploration for Training-Free Lifelong Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.13878](https://arxiv.org/abs/2606.13878) |
| 本轮 listing 口径 | 2026-06-15 官方 listing new submission；API 显示 `Published: 2026-06-11` |
| 分类 | `cs.RO` |
| 方法关键词 | training-free navigation, VLM frontier ranking, Bayesian value map, lifelong evidence accumulation, open-vocabulary goal verification |

摘要要点转述：

论文关注零训练迁移的长期目标导航。作者指出，端到端导航策略在未见场景、目标类别或目标模态上会显著退化；而稠密 3D snapshot memory 虽能保存历史，但维护成本高。`AnyGoal` 把 `VLM` 放在 frontier exploration 的核心位置，用共享的 2D Gaussian Bayesian Value Map 表示每个位置与目标相关的均值和方差，并在多个子任务之间持续累积证据。frontier 排序同时考虑 `VLM-as-judge` 的语义分数和 Bayesian UCB 的不确定性，实验在 GOAT-Bench unseen split 上报告双机器人系统达到较高 Subtask SR，单机器人版本也有明显增益。论文还指出，开放词汇 detector 会把主要失败模式从探索不足转移到目标验证。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 与 `world_state_memory` 中“机器人熟悉家庭后如何持续更新目标相关证据”的问题。
2. Kinbot 找药盒、充电器、血压计、常用物品时，不应只记录“走过哪里”，还要记录每个区域对目标的相关性、证据方差和是否需要复核。
3. 对应 Phase 5：建议增加 `goal_relevance_mean`、`goal_relevance_variance`、`frontier_uncertainty_bonus`、`frontier_commitment_hysteresis`、`open_vocab_goal_verification_failure` 和 `lifelong_evidence_accumulation_window` 字段。

资源消耗与部署信号：

1. 论文使用 `VLM` 和共享 Bayesian map，真实端侧成本取决于 `VLM` 调用频率、地图分辨率和目标数量。
2. Kinbot 不应照搬多机器人协同结构；更合理的是单机端侧保留低维 goal evidence map，必要时云端或离线分析辅助校准。
3. `goal_relevance_variance` 比原始视频或稠密点云更适合进入隐私受控的端侧记忆字段。

优势：

1. 把长期导航记忆从“存稠密快照”收敛到“存目标相关证据及不确定性”，与 Kinbot 端侧资源和隐私边界一致。
2. 明确区分探索失败和目标验证失败，有助于设计家庭找物的失败归因。
3. training-free 口径适合 Phase 5 先做评测字段，不需要立即训练 Kinbot 专用大模型。

劣势与风险：

1. 论文主要在 GOAT-Bench 和多机器人设定下验证，家庭单机老人看护场景仍需重测。
2. 依赖 `VLM` 评分和深度锥投影，可能与 Kinbot 一代纯视觉、低成本传感主线存在实现差距。
3. 如果把 Bayesian map 误用为地图事实，可能把开放词汇误检固化到长期记忆中。

推荐理由：

建议作为 A- 级输入。它应进入长期导航证据与目标不确定性专题，帮助 Kinbot 将“熟悉家庭”转成可查询、可复核、可降级的证据地图；不建议新增多机器人协同或在线重型 `VLM` 导航主链路。

### 3.2 Cross-Stage Sensorimotor Perception Scheduling and Sparse Map Encoding for Efficient Edge Embodied Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2405.14154](https://arxiv.org/abs/2405.14154) |
| 本轮 listing 口径 | 2026-06-15 官方 listing replacement submission；API 显示 `Published: 2024-05-23`、`Updated: 2026-06-12`；本轮因直接新增 Kinbot 端侧资源评测字段而收录 |
| 分类 | `cs.RO` |
| 方法关键词 | edge embodied navigation, ObjectNav profiling, adaptive sensorimotor scheduling, sparse map encoding, latency-memory Pareto |

摘要要点转述：

论文把端侧具身导航部署定义为系统级 co-design 问题，而不是单纯模型准确率问题。作者在 modular ObjectNav 中做 profiling，发现语义建图可能主导每步延迟，目标预测可能主导峰值内存。为此论文提出两个优化旋钮：`SKIP` 用 bounded map-impact 判断是否可以安全跳过某些 sensorimotor 更新，并用轻量 predictor 在每次 `FORWARD` 前估计影响；`SCOUT` 用 sparse convolution 处理活跃地图区域，同时保留轻量 dense context stream。实验显示 `SKIP+SCOUT` 在服务器与嵌入式平台上能形成一组质量和效率之间的 Pareto operating points，报告端到端速度、峰值内存和 SPL 的联合改善。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`mobility_navigation` 与 `observability_data_governance` 中“端侧导航到底卡在哪个阶段”的问题。
2. Kinbot 的 `12GB RAM + 32GB Flash` 默认量产线不能只按模型参数量判断可行性，必须拆开语义建图、目标预测、规划、记忆查询和安全层延迟。
3. 对应 Phase 5：建议增加 `semantic_mapping_step_latency`、`goal_prediction_peak_memory_mb`、`safe_skip_map_impact_bound`、`perception_update_skip_rate`、`navigation_quality_efficiency_point` 和 `embedded_navigation_pareto_curve` 字段。

资源消耗与部署信号：

1. 论文直接面向 edge embodied navigation，且给出延迟、峰值内存和 SPL 的联动指标，适合作为 Kinbot 端侧资源 profiling 表头。
2. 其方法中 depth-based updates 被保留，不能直接作为 Kinbot 一代纯视觉方案；应吸收 profiling 口径，而不是照搬传感 pipeline。
3. 对 Kinbot 最有价值的是“阶段级瓶颈拆解 + 安全跳过影响上界”，可用于家庭样机试点前的资源 gate。

优势：

1. 把端侧资源问题从“换小模型”推进到“哪个阶段该更新、哪个阶段可稀疏化、跳过是否安全”。
2. 适合与 Phase 5 的回放和实机日志结合，形成可操作的资源门控。
3. replacement 虽然不是新方向，但本轮摘要提供的评测字段与 Kinbot 默认量产线高度相关，符合收录边界。

劣势与风险：

1. ObjectNav benchmark 与家庭老人照护的真实任务差距仍大。
2. 依赖深度信息和语义地图更新策略，不能直接替代 Kinbot 纯视觉导航验证。
3. 如果过早工程化 `SKIP`，可能把安全关键观测误判为可跳过，需要先用回放评估误跳过风险。

推荐理由：

建议作为 A- 级 replacement 输入。它应进入端侧导航资源专题，帮助 Kinbot 建立阶段级资源画像和质量效率曲线；不建议把 `SKIP+SCOUT` 作为当前产品算法基线。

### 3.3 TRACE: Trajectory-Routed Causal Memory for Delayed-Evidence Visuomotor Imitation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.14551](https://arxiv.org/abs/2606.14551) |
| 本轮 listing 口径 | 2026-06-15 官方 listing new submission；API 显示 `Published: 2026-06-12` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | delayed evidence, causal memory, path signature, fixed-size latent memory, ambiguous branch recall |

摘要要点转述：

论文关注 delayed-evidence 任务：关键视觉证据曾经出现过，但到达决策点时已经不可见，因此当前观测不足以决定下一步动作。`TRACE` 用固定大小的 latent memory 保存任务相关视觉和机器人状态证据，例如物体身份、目标选择或路径相关状态；检索时不按原始时间或人工标签索引，而是使用 path signatures 作为顺序敏感的轨迹键。这样，当机器人到达视觉上相似但语义不同的分支点时，可以通过轨迹键找回早先看到的证据。论文强调 `TRACE` 可通过轻量 adapter 接入现有策略，不改变 backbone、action head 或 imitation objective，并在真实长程 manipulation 任务中改善分支选择和任务成功。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory` 和家庭任务回放中“现在看不到，但刚才已经确认过”的问题。
2. Kinbot 在送药提醒、找物、夜间巡护、老人刚才起身、门是否打开等场景中，会遇到早期线索消失后的分支决策。
3. 对应 Phase 5：建议增加 `delayed_evidence_key`、`path_signature_key`、`evidence_visible_at_step`、`memory_branch_recall_success`、`ambiguous_observation_branch_id` 和 `fixed_size_memory_budget` 字段。

资源消耗与部署信号：

1. 固定大小 latent memory 与轻量 adapter 对端侧部署友好，但真实内存、延迟和可解释性需要 Kinbot 场景重测。
2. 论文不要求保存原始视觉线索本身，这与原始敏感数据端侧处理和最小化留存原则相容。
3. 对 Kinbot 更合适的落地方式是先在回放报告中记录 path signature 和 delayed evidence，不直接改在线控制策略。

优势：

1. 明确补上“短历史 / 当前帧不够”的家庭服务任务缺口。
2. 轨迹键比纯时间索引更适合家庭空间路径和任务分支。
3. 可与动作-效果记忆、长期情景记忆结合，形成可控的低维记忆字段。

劣势与风险：

1. 原论文验证对象仍偏 manipulation，不等于 Kinbot 需要新增机械臂或操作策略。
2. latent memory 可能难以被用户、测试人员和安全审计直接解释。
3. 如果检索错分支，机器人可能把旧证据误用于新场景，需要加入过期时间和证据复核。

推荐理由：

建议作为 B+ 级输入。它应进入延迟证据记忆候选，帮助 Kinbot 把长期记忆从“存更多帧”转成“存可检索的分支证据”；不建议新增一代 manipulation 主链路。

### 3.4 Sensitivity Shaping for Latent Modeling

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.14585](https://arxiv.org/abs/2606.14585) |
| 本轮 listing 口径 | 2026-06-15 官方 listing new submission；API 显示 `Published: 2026-06-12` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | generative dynamics model, OOD transition detection, control sensitivity regularization, support surrogate, safe closed-loop planning |

摘要要点转述：

论文指出，生成式 dynamics model 用于规划时，安全部署的关键不是只预测未来状态，而是能否可靠识别 policy-induced out-of-distribution transitions。现有方法常把 dynamics 模型固定后再加 post-hoc support surrogate，但如果模型对关键控制动作局部不敏感，unsupported action 可能生成看似正常的 latent prediction，从而压制 OOD 信号，真实预测误差却很大。论文提出 support-conditioned control-sensitivity regularization，在高支持区域保持模型对控制输入变化的局部响应，同时限制弱支持区域的外推不稳定。实验覆盖视觉避障、manipulation 和真实机器人导航，报告 OOD 检测和闭环规划安全性改善。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`mobility_navigation` 与 `platform_runtime` 中“模型预测看起来正常但实际已越界”的问题。
2. Kinbot 若使用 world model、latent planner 或回放预测，不能只看 rollout 像不像，还要看控制动作变化是否能触发足够敏感的风险信号。
3. 对应 Phase 5：建议增加 `latent_ood_score`、`control_sensitivity_probe`、`unsupported_action_flag`、`ood_warning_lead_time`、`posthoc_surrogate_failure_case` 和 `closed_loop_ood_intervention` 字段。

资源消耗与部署信号：

1. 论文方法涉及训练期 regularization，不是即插即用的端侧 runtime guard。
2. Kinbot 可先把 control-sensitivity probe 作为回放 / 仿真评测，而不是在线加入完整 generative dynamics planner。
3. 若未来有端侧轻量 world model，需要额外测 OOD 检测延迟、误报率和漏报率。

优势：

1. 直接指出 post-hoc OOD surrogate 的漏检风险，和近期 world model horizon / abstain 主题互补。
2. 覆盖真实机器人导航实验，比纯 manipulation world model 更接近 Kinbot 移动场景。
3. 可转成明确的安全验证字段，不需要立即改变主线架构。

劣势与风险：

1. 训练期方法迁移到 Kinbot 自有模型需要数据和模型结构配合。
2. OOD 分数的阈值、提前量和误报成本需要结合家庭安全等级重新定义。
3. 不能替代底层避障、速度限制、急停和授权控制。

推荐理由：

建议作为 B+ 级输入。它应进入 latent OOD 与 world model 安全检测候选，补齐“看似合理预测也可能漏报危险动作”的验证项；不建议新增在线 generative dynamics planner。

### 3.5 FloVerse: Floor Plan-Guided Multi-Modal Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.14267](https://arxiv.org/abs/2606.14267) |
| 本轮 listing 口径 | 2026-06-15 官方 listing new submission；API 显示 `Published: 2026-06-12` |
| 分类 | `cs.RO` |
| 方法关键词 | floor-plan-guided navigation, PointNav, ObjectNav, ImageNav, masked-modality modeling, depth-based trajectory refinement |

摘要要点转述：

论文把 floor plan 作为紧凑空间先验，用于提升 unseen scenes 中的导航效率。作者提出 `FloVerse` 任务，把 PointNav、ObjectNav 和 ImageNav 统一到楼层图引导的多模态导航框架下，并构建 `FloVerse-1.6K` 数据集，包含来自 HM3D 和 Gibson 的 1.6K 场景、对应 floor plans、专家轨迹和 RGBD 帧。方法 `ThreeDiff` 包含 planner、基于 diffusion 的多模态目标推理模块和 depth-based trajectory refiner。实验显示 floor-plan prior 能提升多种目标模态下的导航表现，模型也能隐式捕捉平面图空间信息。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 与 `world_state_memory` 中“家庭户型图、初始建图和用户提供空间信息如何进入导航”的问题。
2. Kinbot 用户可能提供户型图、App 标注房间或首次探索得到平面图；这些信息可作为弱先验提高找物、巡护和返航效率。
3. 对应 Phase 5：建议增加 `floor_plan_available`、`floor_plan_alignment_confidence`、`floor_plan_sensor_conflict`、`plan_prior_override_reason`、`goal_modality_type` 和 `floor_plan_relocalization_failure` 字段。

资源消耗与部署信号：

1. 原方法包含 diffusion goal-reasoning 和 RGBD 数据，不适合直接进入 `12GB + 32GB` 默认量产线。
2. 对 Kinbot 有价值的是 floor plan 作为低成本先验的验证口径，而不是 `ThreeDiff` 模型本体。
3. 需要测平面图过期、家具移动、门关闭、房间重命名和实时障碍冲突时的降级行为。

优势：

1. 把家庭户型图从静态 App 资料转成可测导航先验。
2. 同时覆盖 PointNav、ObjectNav 和 ImageNav，有助于统一导航任务字段。
3. 可降低初始探索盲目性，适合老人家庭中减少无意义巡游。

劣势与风险：

1. floor plan 容易过期或与真实家具布局冲突，不能作为硬安全事实。
2. 原论文依赖 RGBD 和仿真数据集，迁移到纯视觉家庭样机需要验证。
3. diffusion 模块可能引入端侧延迟和不可解释性，不适合当前直接产品化。

推荐理由：

建议作为 B+ 级输入。它应进入户型图 / 楼层图先验导航候选，帮助 Kinbot 明确“平面图可作为弱先验，但实时感知和安全约束优先”；不建议引入 floor-plan diffusion policy。

## 4. 候选排除表

| 论文 | arXiv | listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| Occupancy-Grounded Room Segmentation for Hierarchical 3D Scene Graphs | [2606.13727](https://arxiv.org/abs/2606.13727) | 2026-06-15 new submission | 房间层 3D scene graph 与家庭语义地图相关，但近期 ObjectNav / scene graph / 语义覆盖主题已接近饱和；论文也明确 wall-accurate room boundaries 仍是开放问题，本轮只保留 `room_polygon_footprint` 候选字段。 |
| `$μ_0$: A Scalable 3D Interaction-Trace World Model` | [2606.13769](https://arxiv.org/abs/2606.13769) | 2026-06-15 new submission | 3D interaction trace 有助于 WAM 表征，但对象仍是 cross-embodiment manipulation；近期 WAM / VLA 已饱和，不新增在线 world action model。 |
| FlowMo-WM: A World Model with Object Momentum and Hidden Ambient Drift | [2606.13817](https://arxiv.org/abs/2606.13817) | 2026-06-15 new submission | hidden drift 对 world model 很有启发，但场景偏水面载具和外部流场；Kinbot 家庭室内更需要地面动态障碍、家具变化和人类活动扰动字段。 |
| Output-Level Regularization Eliminates the Seed Lottery in Single-GPU VLA Fine-Tuning | [2606.13856](https://arxiv.org/abs/2606.13856) | 2026-06-15 new submission | seed lottery 和 output collapse 对训练治理有价值，但对象是 `VLA-JEPA` manipulation fine-tuning；本轮不新增 VLA 训练主线，可保留 `catastrophic_seed_audit` 作为模型治理候选。 |
| SplatlessDF: Continuous Distance Field Mapping with Non-Splatting Gaussians | [2606.13990](https://arxiv.org/abs/2606.13990) | 2026-06-15 new submission | 连续 distance field 对导航地图有价值，但仍是表示方法论文；未直接给出 Kinbot 纯视觉、端侧资源或家庭安全字段，保留为 mapping representation 候选。 |
| Guided Diffusion with Distilled Vision-Language Reliability for Aerial Navigation | [2606.13883](https://arxiv.org/abs/2606.13883) | 2026-06-15 new submission | reliability heatmap 很有价值，但场景是 UAV，方法依赖 depth / diffusion planner；本轮由 `Sensitivity Shaping` 覆盖更通用的 OOD 安全检测字段。 |
| When and How Severely: Scenario-Specific Safety Envelopes for Driving VLAs | [2606.14238](https://arxiv.org/abs/2606.14238) | 2026-06-15 new submission | 场景特定安全 envelope 与 SOTIF 口径有治理价值，但对象是自动驾驶 VLA；保留 `scenario_specific_failure_threshold` 候选，不进入家庭机器人主卡片。 |
| RT-VLA: Real-Time Vision-Language-Action Models via Knowledge Distillation | [2606.14010](https://arxiv.org/abs/2606.14010) | 2026-06-15 cross submission from `cs.CV` | 低延迟 VLA 蒸馏和离线解释有端侧启发，但场景是自动驾驶，且 cross-list；本轮不扩张在线 VLA 主链路。 |
| WAM4D: Fast 4D World Action Model via Spatial Register Tokens | [2606.14048](https://arxiv.org/abs/2606.14048) | 2026-06-15 cross submission from `cs.CV` | 4D WAM 空间一致性有研究价值，但仍是 manipulation WAM；近期 world model / WAM 已饱和，不进入主卡片。 |
| PhysVLA: Towards Physically-Grounded VLA for Embodied Robotic Manipulation | [2606.13886](https://arxiv.org/abs/2606.13886) | 2026-06-15 new submission | 物理约束 runtime wrapper 对安全有启发，但验证对象是机械臂 manipulation；Kinbot 一代不做物理操作主链路。 |
| What Robots Do Matters More Than What They Look Like: Task Context Shapes Trust in Educational HRI | [2606.14602](https://arxiv.org/abs/2606.14602) | 2026-06-15 new submission | “任务上下文比外观更影响信任”对产品体验有启发，但场景是教育 HRI，不能直接改写 Kinbot 高端产品感或交互主线。 |
| Low-Burden LLM-Based Preference Learning: Personalizing Assistive Robots from Natural Language Feedback for Users with Paralysis | [2604.01463](https://arxiv.org/abs/2604.01463) | 2026-06-15 replacement submission | 低负担自然语言偏好学习与老人辅助有相邻价值，但本轮是 replacement，且重点在 paralysis assistive manipulation；保留为交互偏好治理候选，不进入导航 / 记忆 / 安全 / 资源主卡片。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮论文默认仍作为 `docs/09_research/00_papers/` 下的研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。
2. 若后续处理 Phase 5 验证模板、家庭样机试点、导航回放报告或端侧资源 profiling，可优先吸收本轮最小字段：`goal_relevance_mean`、`goal_relevance_variance`、`frontier_commitment_hysteresis`、`floor_plan_alignment_confidence`、`floor_plan_sensor_conflict`、`delayed_evidence_key`、`path_signature_key`、`memory_branch_recall_success`、`latent_ood_score`、`control_sensitivity_probe`、`semantic_mapping_step_latency`、`peak_navigation_memory_mb`。
3. 不建议新增独立 lifelong navigation 大脑、floor-plan diffusion policy、在线 causal memory adapter、完整 latent dynamics planner、端侧 ObjectNav 优化平台、在线 `VLA / WAM` 主链路或多机器人协同主链路。
4. 如果后续要专题跟踪，优先方向是“目标相关证据地图 + 户型图弱先验冲突处理 + 延迟证据记忆 + latent OOD 安全检测 + 阶段级端侧资源画像”的最小闭环。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent` 官方 listing：<https://arxiv.org/list/cs.RO/recent>
3. `AnyGoal: Vision-Language Guided Multi-Agent Exploration for Training-Free Lifelong Navigation`：<https://arxiv.org/abs/2606.13878>
4. `Cross-Stage Sensorimotor Perception Scheduling and Sparse Map Encoding for Efficient Edge Embodied Navigation`：<https://arxiv.org/abs/2405.14154>
5. `TRACE: Trajectory-Routed Causal Memory for Delayed-Evidence Visuomotor Imitation`：<https://arxiv.org/abs/2606.14551>
6. `Sensitivity Shaping for Latent Modeling`：<https://arxiv.org/abs/2606.14585>
7. `FloVerse: Floor Plan-Guided Multi-Modal Navigation`：<https://arxiv.org/abs/2606.14267>
8. 候选排除表条目：[`Occupancy-Grounded Room Segmentation`](https://arxiv.org/abs/2606.13727)、[`μ0`](https://arxiv.org/abs/2606.13769)、[`FlowMo-WM`](https://arxiv.org/abs/2606.13817)、[`Output-Level Regularization`](https://arxiv.org/abs/2606.13856)、[`SplatlessDF`](https://arxiv.org/abs/2606.13990)、[`Guided Diffusion with Distilled Vision-Language Reliability`](https://arxiv.org/abs/2606.13883)、[`Driving VLA Safety Envelopes`](https://arxiv.org/abs/2606.14238)、[`RT-VLA`](https://arxiv.org/abs/2606.14010)、[`WAM4D`](https://arxiv.org/abs/2606.14048)、[`PhysVLA`](https://arxiv.org/abs/2606.13886)、[`Task Context Shapes Trust`](https://arxiv.org/abs/2606.14602)、[`Low-Burden LLM-Based Preference Learning`](https://arxiv.org/abs/2604.01463)
