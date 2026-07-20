# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-14
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-14 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv API，确认本轮本地日更时官方最新 Robotics listing 仍为 `Friday, 12 June 2026`，合计 `88` 篇 entries；其中 new submissions `43` 篇、cross submissions `13` 篇、replacement submissions `32` 篇。官方 `cs.RO/recent` 顶部仍为 `Fri, 12 Jun 2026`，显示 `first 50 of 56 entries`。本轮因 2026-06-12 / 2026-06-13 已连续覆盖同一 listing，按周日无新批次说明 + 饱和后的轻量补录 + 周度综合判断口径，只收录 world model 可信预测 horizon、约束内生生成策略和紧凑动作-效果记忆 3 篇强相关论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-06-14。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 仍为 `Friday, 12 June 2026`，合计 `88` 篇 entries；其中 new submissions `43` 篇、cross submissions `13` 篇、replacement submissions `32` 篇。
3. 官方 `cs.RO/recent` 在本轮检索时顶部仍为 `Fri, 12 Jun 2026`，显示 `first 50 of 56 entries`。本地日期为 2026-06-14，官方尚未出现以 2026-06-14 为 listing 日期的新 Robotics 批次。
4. 2026-06-12 已覆盖同一 listing 的 5 篇主卡片：`Foresight`、`Embedding ISO 10218 Safety Compliance via CBF`、`Real-Time Execution with Autoregressive Policies`、`SemanticXR`、`Learning Robot Safety from Sparse Human Feedback using Conformal Prediction`。
5. 2026-06-13 已按前一日覆盖后的日更补录口径收录 3 篇主卡片：`Learning to Assist`、`GIVE`、`Lexicographic Minimum-Violation Motion Planning using Signal Temporal Logic`。
6. 本轮只把仍能新增 Kinbot 验证字段的论文升级为主卡片；`WEAVER`、`EA-WM`、`μVLA`、`MaskWAM`、`Learning What to Say to Your VLA` 等继续作为候选或排除条目，不因同一 listing 连续补录而扩张在线 `WAM / VLA` 主链路。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全、端侧资源、world model 可信度或验证证据链的判断，而不是继续增加泛 `VLA`、world model、manipulation、humanoid、自动驾驶、UAV 或纯工具链论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：预测可信 horizon、模型预测 abstain、约束内生生成、后处理修正幅度、动作-效果历史压缩、非 Markov 任务回放。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因同一 Friday listing 中仍有大量 manipulation `VLA`、world action model、humanoid、触觉策略、手术、自动驾驶或多机器人论文而继续扩张主卡片数量。
2. `Scale Buys Interpolation...` 虽为 cross submission，但它直接给出 world model 预测“能信多久”的验证口径，因此收录为主卡片；收录范围仅限离线 audit / 证据链字段。
3. `PolyFlow` 也是 cross submission，但其约束内生、projection-free、低延迟的 claim 可转成安全策略验证字段；不把 flow matching 写入 Kinbot 在线控制器基线。
4. `Action-Effect Memory Pretraining` 是 manipulation 论文，但其 compact temporal bottleneck 与 action-conditioned history 对 Kinbot 端侧记忆 / 回放字段有增量价值；不据此新增机械臂或在线 manipulation 主链路。

## 2. 本轮总判断

本轮真正新增的判断是：在同一 Robotics listing 已经连续覆盖后，剩余高价值论文不再支持“多上几个模型模块”，而支持三类更窄的验证字段。

1. **world model 不能只看平均误差，要记录预测 horizon 和 abstain 条件**：`Scale Buys Interpolation...` 提示模型规模并不自动带来校准过的预测 horizon；Kinbot 若使用 world model / 预测回放，应记录某条预测在当前场景、当前结构假设下“可相信几步”。
2. **生成式策略的安全约束应优先内生，而不是事后修补**：`PolyFlow` 提示把 polytope constraints 嵌入 flow dynamics 可降低事后投影成本并减少违背；Kinbot 可把它转成“约束是否内生、是否需要后处理、后处理幅度和延迟”的验证字段。
3. **记忆价值来自动作-效果历史压缩，不是无限堆叠原始帧**：`Action-Effect Memory Pretraining` 提示在部分可观测任务中，单帧视觉不足，紧凑动作-效果历史可以同时改善性能和降低推理成本；Kinbot 可吸收为长期记忆 / 回放的低维摘要字段。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 泛 `VLA`、world action model、manipulation policy | 已饱和 | 只有新增家庭移动闭环、老人照护、安全审计、目标 SoC 实测资源或可解释验证字段时进入主卡片。 |
| world model 可信预测、horizon 与 abstain | 值得专题跟踪 | 将 `Scale Buys...` 与 `WEAVER`、`NavWAM`、`WAM` 相关论文分离处理：优先做预测可信度 audit，不新增在线 `WAM` 主链路。 |
| 安全约束内生化、约束冲突与最小违背 | 接近专题成熟 | 将 `PolyFlow` 与近期 `CBF`、`STL minimum-violation`、runtime assurance 合并成 `constraint_native_policy`、`projection_delta`、`violation_trace` 字段。 |
| 紧凑历史记忆、动作-效果因果摘要 | 值得专题跟踪 | 将 `AEM`、`μVLA`、长期情景记忆论文合并为 `action_effect_history_embedding`、`temporal_bottleneck_size`、`non_markovian_replay_case` 字段。 |
| 语言 steering、prompt red-team 与 harmlessness | 专题候选 | `Learning What to Say to Your VLA` 可进入后续语言 steering 安全候选；本轮已有 conformal warning、过早协助和手势 grounding 覆盖更直接问题。 |
| 触觉、机械手、humanoid、wet-lab、UAV / 自动驾驶 | 不进入一代主线 | 除非转成低成本安全外壳、家庭移动或 Phase 5 字段，否则只保留为研究候选。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 certified horizon monitor、constrained flow generator、action-effect memory encoder、event-aware WAM、language feedback policy、policy smoothing 和 safety case pattern 全部写成在线组件，会过复杂”。建议只吸收 10 类轻量字段：`world_model_predictable_horizon`、`prediction_certificate_scope`、`world_model_abstain_when_uncertain`、`polytope_constraint_set`、`constraint_native_generation`、`projection_delta_after_generation`、`constraint_generation_latency`、`action_effect_history_embedding`、`temporal_bottleneck_size`、`non_markovian_task_replay_case`。暂不新增在线 world model、flow matching controller、VLA steering agent、机械臂记忆系统或安全论证平台。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | Scale Buys Interpolation, Structure Buys a Horizon: Certified Predictability for Equivariant World Models | 进入 world model 可信度 / 预测 horizon 专题，吸收 predictable horizon、certificate scope、abstain 条件与 cross-validated audit 字段；不新增在线 `WAM` 主链路。 |
| B+ | PolyFlow: Safe and Efficient Polytope-Constrained Flow Matching with Constraint Embedding and Projection-free Update | 进入安全约束内生化候选，验证 constraint embedding、zero violation claim、latency 与 post-hoc projection delta；不写入实时控制器基线。 |
| B+ | Action-Effect Memory Pretraining for Robot Manipulation | 进入紧凑动作-效果记忆候选，吸收 action-conditioned history、temporal bottleneck、non-Markov replay 字段；不新增一代 manipulation 主链路。 |

## 3. 论文卡片

### 3.1 Scale Buys Interpolation, Structure Buys a Horizon: Certified Predictability for Equivariant World Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.13092](https://arxiv.org/abs/2606.13092) |
| 本轮 listing 口径 | 2026-06-12 官方 listing cross submission from `cs.LG`；本轮为 2026-06-14 对同一 listing 连续覆盖后的轻量补录；abs/API 显示 `Published: 2026-06-11` |
| 分类 | `cs.LG`, `cs.RO`, `math.DS` |
| 方法关键词 | equivariant world model, certified predictable horizon, Lyapunov spectrum, calibration audit, abstention |

摘要要点转述：

论文讨论 world model 的一个关键部署问题：平均误差低，不等于某一次具体预测在多步 rollout 中可信。作者针对 equivariant latent world model 给出可计算的多步 predictable horizon 证书，说明在对称结构上，预测误差可以按 orbit 和 Lyapunov spectrum 分层估计，并且 approximate equivariance 会带来可证明的 horizon 限制。实验不仅验证结构化模型能恢复动力系统谱，也用该 read-out 去审计公开预训练 world model checkpoint，发现参数规模增大并不自动改善 calibration；真正可部署的是 cross-validated audit，而不是原始预测分数。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`platform_runtime` 与 `observability_data_governance` 中“world model / 回放预测能信多久”的问题。
2. Kinbot 近期论文纪要已经反复出现 `WAM / VLA / world model`，但一代主线不能把“预测看起来合理”当作执行依据；需要记录预测 horizon、适用范围和 abstain 条件。
3. 对应 Phase 5：建议增加 `world_model_predictable_horizon`、`prediction_certificate_scope`、`equivariance_assumption_flag`、`lyapunov_spectrum_audit`、`world_model_abstain_when_uncertain` 和 `cross_validated_prediction_audit` 字段。

资源消耗与部署信号：

1. 论文不是端侧部署方案，核心价值是验证口径：模型规模与参数量不等于可信预测 horizon。
2. 证书计算、spectrum 估计与 cross-validation 都可能是离线 / 回放分析，不应塞进实时 `OODA` 周期。
3. 对 Kinbot 更合理的使用方式是把 world model 预测用于 shadow evaluation、回放诊断或仿真证据链，并在不可信时明确 abstain。

优势：

1. 直接反驳“模型越大预测越可靠”的粗糙假设，符合 Kinbot 端侧资源收敛原则。
2. 把 world model 评估从平均指标推进到逐场景、逐 horizon、逐结构假设的可审计证据。
3. 可与 Phase 5 provenance TODO 对齐，避免把不可校准预测写成安全证据。

劣势与风险：

1. 理论与实验集中在 equivariant latent world model、动力系统和公开 checkpoint 审计，迁移到家庭移动机器人需要重新定义结构假设。
2. 证书本身可能难以被产品和测试团队直接理解，需要转译成“几步内可参考 / 超出即 abstain”的字段。
3. 若误用为“有证书就可自动执行”，仍会绕过底层安全和人机交互确认。

推荐理由：

建议作为 A- 级补录输入。它应进入 world model 可信度与预测 horizon 专题，帮助 Kinbot 明确 world model 只能在有证据的范围内服务于回放、审计和仿真；不建议新增在线 `WAM` 主链路。

### 3.2 PolyFlow: Safe and Efficient Polytope-Constrained Flow Matching with Constraint Embedding and Projection-free Update

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.13400](https://arxiv.org/abs/2606.13400) |
| 本轮 listing 口径 | 2026-06-12 官方 listing cross submission from `cs.LG`；本轮为 2026-06-14 对同一 listing 连续覆盖后的轻量补录；abs/API 显示 `Published: 2026-06-11` |
| 分类 | `cs.LG`, `cs.AI`, `cs.RO` |
| 方法关键词 | polytope-constrained flow matching, constraint embedding, projection-free update, zero constraint violation, low latency |

摘要要点转述：

论文关注生成式 flow model 在安全关键物理系统中的约束满足问题。常见做法是在生成后用投影或修正器把动作拉回可行域，但这种 post-hoc correction 会增加计算成本，也可能扭曲原本学到的分布。`PolyFlow` 将 polyhedral constraints 直接嵌入离散时间 flow formulation 和模型结构中，避免昂贵的迭代投影，并声称在规划与控制任务上实现零约束违背，同时保持较好的生成质量和较低推理延迟。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`platform_runtime` 与 `mobility_navigation` 中“高层策略或生成式规划如何保证不越过硬约束”的问题。
2. Kinbot 可能需要同时约束底盘速度、避障距离、禁入区域、夜间噪声、老人近身舒适距离和低电返航；若策略先生成再修补，必须记录修补幅度与残余风险。
3. 对应 Phase 5：建议增加 `polytope_constraint_set`、`constraint_native_generation`、`zero_violation_claim_check`、`projection_delta_after_generation`、`constraint_generation_latency`、`hard_constraint_violation_count` 和 `posthoc_repair_failure_case` 字段。

资源消耗与部署信号：

1. 论文强调低延迟与无需迭代 solver，但实际资源消耗仍取决于约束维度、控制频率、模型规模和目标 SoC。
2. Kinbot 不应直接采用 flow matching policy；可先把“约束内生 vs 事后修补”作为策略验证表头。
3. 若未来有生成式局部规划或行为候选生成，必须与底层安全控制、急停和人工确认链路共同验证。

优势：

1. 把安全从输出后处理前移到模型 / dynamics 结构中，符合硬约束优先的工程原则。
2. 可与 2026-06-12 `CBF`、2026-06-13 `STL minimum-violation` 形成三层口径：硬约束、冲突排序、回放 trace。
3. `projection_delta_after_generation` 是一个很实用的测试字段：如果每次都要大幅修补，说明上层策略并不可信。

劣势与风险：

1. 论文验证任务不等同于家庭移动机器人全栈，且 polyhedral constraints 无法覆盖所有语义安全和人机礼仪。
2. 约束集合由谁定义、何时更新、如何处理冲突，仍需要产品 / 安全 / 控制联合确定。
3. 过早在线化会引入新的模型验证负担，不符合当前 Phase 5 的轻量字段优先原则。

推荐理由：

建议作为 B+ 级补录输入。它应进入安全约束内生化候选，帮助 Kinbot 区分“策略天然满足约束”和“策略生成后被安全层大幅修补”；不建议新增 flow matching 控制器基线。

### 3.3 Action-Effect Memory Pretraining for Robot Manipulation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.12499](https://arxiv.org/abs/2606.12499) |
| 本轮 listing 口径 | 2026-06-12 官方 listing new submission；本轮为 2026-06-14 对同一 listing 连续覆盖后的轻量补录；abs/API 显示 `Published: 2026-06-10` |
| 分类 | `cs.RO` |
| 方法关键词 | action-effect memory, compact temporal representation, masked history modeling, partial observability, inference latency |

摘要要点转述：

论文提出 `AEM`，目标是在机器人操作任务中学习紧凑的动作-效果历史表示。作者指出，很多预训练方法只关注单帧视觉编码，但在部分可观测任务中，当前画面不足以决定下一步动作；机器人需要记住过去动作如何改变物体和环境。`AEM` 把视觉与动作特征交错输入，并通过 masked modeling 从不完整历史中恢复缺失内容，学习 action-conditioned state evolution。最终输出使用 Mamba 编码后的单个视觉 token 作为紧凑历史表示，既给下游控制提供全局上下文，也降低直接堆叠帧带来的延迟和计算成本。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`platform_runtime` 与家庭任务回放中“记忆应该保存什么”的问题。
2. Kinbot 在找物、药箱状态、门 / 抽屉开合、老人刚才是否起身、禁入区域变化等场景中，不应只保存原始视频或孤立对象快照；需要记录动作导致了什么状态变化。
3. 对应 Phase 5：建议增加 `action_effect_history_embedding`、`temporal_bottleneck_size`、`masked_history_reconstruction_error`、`non_markovian_task_replay_case`、`history_context_latency` 和 `state_change_after_action_trace` 字段。

资源消耗与部署信号：

1. 论文强调 compact representation 和降低 inference latency，对 `12GB RAM + 32GB Flash` 默认量产线有参考价值。
2. 但论文任务仍是 manipulation，不等于 Kinbot 需要新增机械臂或在线操作策略。
3. 对 Kinbot 更合理的吸收方式是先在回放 / 验证报告中记录低维 action-effect 摘要，而不是长期保存原始敏感视频。

优势：

1. 把“长期记忆”从无边界视频存档收敛到动作-效果状态变化，有助于控制隐私和存储复杂度。
2. 单向量 temporal bottleneck 为端侧资源评估提供具体表头：延迟、内存、重构误差和任务成功率。
3. 与老人家庭场景中的“刚刚发生了什么”高度相关，可支持找物、提醒和异常回放。

劣势与风险：

1. 论文核心验证是 robot manipulation，缺少家庭移动、多人动态和长期日常使用验证。
2. action-effect 表示可能漏掉用户意图、语义授权和隐私上下文，不能替代世界状态模型。
3. 如果把所有历史都编码成一个隐向量，后续可解释性和人工纠错会变弱。

推荐理由：

建议作为 B+ 级补录输入。它应进入紧凑动作-效果记忆候选，帮助 Kinbot 把记忆设计从“多存视频 / 多堆 token”转成“保存可解释状态变化和低维历史摘要”；不建议据此新增一代 manipulation 主链路。

## 4. 候选排除表

| 论文 | arXiv | listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| EA-WM: Event-Aware World Models with Task-Specification Grounding for Long-Horizon Manipulation | [2606.13053](https://arxiv.org/abs/2606.13053) | 2026-06-12 new submission；本轮轻量补录候选 | 事件级验证对 world model 很有价值，但仍以 long-horizon manipulation 为主，且近期 `WAM / world model` 已饱和；本轮已用 `Scale Buys...` 覆盖更基础的预测可信 horizon 字段。 |
| `μ`VLA: On Recurrent Memory for Partially Observable Manipulation in VLA Models | [2606.12497](https://arxiv.org/abs/2606.12497) | 2026-06-12 cross submission；本轮轻量补录候选 | recurrent memory 与 partial observability 相关，但仍是 `VLA` manipulation；本轮优先收录 `AEM`，因为其 compact temporal bottleneck 更容易转成端侧资源与回放字段。 |
| `WEAVER`, Better, Faster, Longer: An Effective World Model for Robotic Manipulation | [2606.13672](https://arxiv.org/abs/2606.13672) | 2026-06-12 new submission；本轮轻量补录候选 | policy evaluation / improvement / test-time planning 指标强，但对象仍是 manipulation world model；不因同一 listing 连续补录而新增在线 `WAM` 主链路。 |
| Learning What to Say to Your VLA: Mostly Harmless Vision Language Action Model Steering | [2606.12299](https://arxiv.org/abs/2606.12299) | `cs.RO/recent` 2026-06-10 近期待补录候选；abs/API 显示 `Published: 2026-06-10` | conformalized language steering 对提示安全有价值，但仍是 `VLA` manipulation；本轮已有 conformal safety warning、过早协助和手势 grounding 覆盖更直接的 Kinbot 风险。 |
| Redesigning Regularization for Effective Policy Smoothing | [2606.13169](https://arxiv.org/abs/2606.13169) | 2026-06-12 new submission；本轮轻量补录候选 | policy smoothing 对底盘舒适性和鲁棒性有启发，但验证对象偏 RL / quadruped；可留作运动平滑专题候选，不进入本轮主卡片。 |
| Safety Case Patterns for VLA-based driving systems: Insights from SimLingo | [2603.16013](https://arxiv.org/abs/2603.16013) | 2026-06-12 replacement submission；本轮轻量补录候选 | safety case pattern 对治理文档有价值，但场景是自动驾驶 `VLA`；replacement 不新增 Kinbot 一代验证字段，保留为安全论证材料候选。 |
| FTP-1: A Generalist Foundation Tactile Policy Across Tactile Sensors for Contact-Rich Manipulation | [2606.13102](https://arxiv.org/abs/2606.13102) | 2026-06-12 new submission；本轮轻量补录候选 | 跨触觉传感器泛化有研究价值，但 Kinbot 一代不把触觉策略作为主感知链路；可作为远期外壳触摸 / 接触安全候选。 |
| PolyFlow 以外的泛 constrained generative policy / safe offline RL 条目 | [2606.12640](https://arxiv.org/abs/2606.12640) | 2026-06-12 cross submission；本轮轻量补录候选 | individual CBF-guided diffusion 对多智能体安全有价值，但 Kinbot 一代是单机家庭场景；本轮只吸收 `PolyFlow` 的约束内生化表头，不扩张多 agent RL。 |
| Heterogeneous LiDAR Early Fusion and Learned Re-Ranking Strategy for Robust Long-Term Place Recognition | [2606.13503](https://arxiv.org/abs/2606.13503) | 2026-06-12 cross submission；本轮轻量补录候选 | long-term place recognition 相关，但依赖异构 LiDAR 与农业 / 非结构环境；不改变 Kinbot 一代纯视觉主线。 |
| LabVLA: Grounding Vision-Language-Action Models in Scientific Laboratories | [2606.13578](https://arxiv.org/abs/2606.13578) | 2026-06-12 cross submission；本轮轻量补录候选 | wet-lab robot 与 protocol execution 远离 Kinbot 家庭老人场景；不进入主卡片。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮论文默认仍作为 `docs/09_research/00_papers/` 下的研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。
2. 若后续处理 Phase 5 验证模板、仿真 / 回放证据链、家庭样机试点或端侧资源评测，可优先吸收本轮最小字段：`world_model_predictable_horizon`、`prediction_certificate_scope`、`world_model_abstain_when_uncertain`、`polytope_constraint_set`、`constraint_native_generation`、`projection_delta_after_generation`、`constraint_generation_latency`、`action_effect_history_embedding`、`temporal_bottleneck_size`、`non_markovian_task_replay_case`。
3. 不建议新增在线 world model、flow matching controller、VLA steering agent、机械臂记忆系统、完整 safety case 平台或触觉 foundation policy；当前更合理的是先把字段写入验证报告、回放分析和资源 profiling。
4. 如果后续要专题跟踪，优先方向是“world model 预测可信 horizon + 约束内生生成 / 后处理差值 + 紧凑动作-效果记忆”的最小闭环。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent` 官方 listing：<https://arxiv.org/list/cs.RO/recent>
3. `Scale Buys Interpolation, Structure Buys a Horizon: Certified Predictability for Equivariant World Models`：<https://arxiv.org/abs/2606.13092>
4. `PolyFlow: Safe and Efficient Polytope-Constrained Flow Matching with Constraint Embedding and Projection-free Update`：<https://arxiv.org/abs/2606.13400>
5. `Action-Effect Memory Pretraining for Robot Manipulation`：<https://arxiv.org/abs/2606.12499>
6. 候选排除表条目：[`EA-WM`](https://arxiv.org/abs/2606.13053)、[`μVLA`](https://arxiv.org/abs/2606.12497)、[`WEAVER`](https://arxiv.org/abs/2606.13672)、[`Learning What to Say to Your VLA`](https://arxiv.org/abs/2606.12299)、[`Redesigning Regularization`](https://arxiv.org/abs/2606.13169)、[`Safety Case Patterns`](https://arxiv.org/abs/2603.16013)、[`FTP-1`](https://arxiv.org/abs/2606.13102)、[`Individual CBF-Guided Diffusion`](https://arxiv.org/abs/2606.12640)、[`Heterogeneous LiDAR Early Fusion`](https://arxiv.org/abs/2606.13503)、[`LabVLA`](https://arxiv.org/abs/2606.13578)
