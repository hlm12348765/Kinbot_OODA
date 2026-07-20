# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-06
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-06 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv API，确认本轮本地日更时官方最新 Robotics listing 为 `Friday, 5 June 2026`，合计 `82` 篇 entries；其中 new submissions `51` 篇、cross submissions `9` 篇、replacement submissions `22` 篇。本轮按“最新官方 listing + 周六未出现新批次说明 + 精筛主卡片 + 候选排除表”口径，收录形式化技能验证、示教数据质量审计、policy-in-loop 世界模型评估、本地 LLM/VLM 交互确认链路和功能性 affordance latent 相关 5 篇论文，并记录周度综合判断。

---

## 1. 检索口径

本轮检索日期：2026-06-06。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API 与论文详情页。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Friday, 5 June 2026`，合计 `82` 篇 entries；其中 new submissions `51` 篇、cross submissions `9` 篇、replacement submissions `22` 篇。
3. 官方 `cs.RO/recent` 在本轮检索时显示 `Fri, 5 Jun 2026` recent submissions `60` 篇，对应本轮 `new + cross`；本地日期为 2026-06-06，周六未出现新的 Robotics listing，因此本轮按“最新官方 listing + 当日未出现新批次说明”处理。
4. 本轮相对 2026-06-04 日更，先排除已覆盖的家庭价值冲突、选择性情景记忆、端侧摄像头 Agent、语义场景重建验证、交互式导航成本、纯视觉主动重建、动态室内语义记忆、低调用 VLN 接口和 VLA 成功 / 安全缺口评测直接重复主题。
5. `replacement` / `cross-list` 只在确实新增 Kinbot 评测项、治理项或端侧资源判断时收录。本轮主卡片中的 `What Objects Enable, Not What They Are` 来自 cross-list，收录原因是它提供功能性 affordance 不确定性与选择性发现字段；其余 cross / replacement 多进入候选排除表。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全、端侧资源、验证证据链或数据治理的判断，而不是继续增加泛 `VLA`、world model、manipulation、humanoid、自动驾驶、UAV 或纯工具链论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：技能合同验证、示教数据结构性缺陷、policy-in-loop 回放误差、执行前人工确认、功能性 affordance 不确定性和选择性发现。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 `82` 篇 entries 自动扩张主卡片数量；泛 `VLA` 压缩、world-action model、humanoid / manipulation policy、自动驾驶 world model、UAV、无线网络和几何控制论文多数不改变 Kinbot 一代家庭移动闭环。
2. `Flash-WAM`、`Let It Be Simple`、`MPCoT`、`TempoVLA` 都有端侧或推理效率信号，但仍主要围绕操作类 `VLA`；本月 VLA / WAM 资源调度、置信校准和安全缺口已多次覆盖，本轮只保留为资源专题候选。
3. `T-FunS3D` 与 `A4D` 都关注功能性理解；本轮优先收录 `A4D`，因为它直接给出 affordance uncertainty、selective discovery 和 `100x` 推理速度信号，而 `T-FunS3D` 依赖点云 / RGB-D 的 3D 功能分割更偏候选。
4. `Learning of Robot Safety Policies via Adversarial Synthetic Scenarios` 与 Kinbot 安全红队思路相关，但论文明确为 ongoing work、贡献主要是问题表述和方案架构；本轮放入候选排除表，避免把未验证框架写成 Phase 5 既定能力。

## 2. 本轮总判断

本轮真正有价值的增量不是新的大模型主控，而是五个更适合被吸收为 Kinbot Phase 5 验证字段和工程治理口径的对象：

1. **技能不能只靠运行样例证明可信**：`VASO` 把 LLM 生成的机器人技能写成语义合同，并用形式化反例驱动技能合同演化，提示 Kinbot 的技能编排应保留 temporal spec、counterexample trace 和 contract revision 留痕。
2. **示教数据清洗不能只看 action 轨迹得分**：`Auditing Demonstration Curation Metrics` 表明 action-only 指标会漏掉关键时刻做错动作这类结构性缺陷，提示 Kinbot 后续数据回放 / 模仿学习 / 人工采样必须记录 state-trajectory defect，而不是只算动作平滑度。
3. **世界模型更适合先做 policy-in-loop 评估，而不是在线主控**：`PiL-World` 把 VLA 执行和想象观察交替闭环，用于减少真实机器人逐步执行成本；对 Kinbot 最合适的落点是 Phase 5 回放 / shadow-run 误差估计。
4. **本地 LLM/VLM 链路需要显式确认和中间态可视化**：`A Conversational Framework` 将语言理解、视觉 grounding、编排和执行拆成 ROS 2 节点，并要求 operator confirmation，提示 Kinbot 的高风险命令应显式展示 intent / grounding / robot-frame 转换证据。
5. **场景理解要从“是什么”转向“能做什么”**：`A4D` 用功能性 latent space 推断物体 affordance，并在不确定时触发 affordance discovery，提示 Kinbot 对家庭物品应记录功能假设、置信度和发现原因，而不是只保存类别标签。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 泛 `VLA`、world-action model、diffusion action、humanoid / manipulation policy | 已饱和 | 只有新增家庭移动闭环、老人照护、安全审计字段、目标 SoC 实测资源边界或验证误差闭环时才进入主卡片。 |
| Phase 5 验证证据链、shadow run、replay、policy-in-loop evaluation | 接近专题成熟 | 将 `PiL-World` 与前序 `PerceptTwin`、validation provenance、real-robot benchmark 收敛为最小回放误差字段，不新增在线数字孪生主链路。 |
| 安全技能合同、形式化验证、反例驱动修订 | 值得专题跟踪 | 将 `VASO` 转成技能合同验证字段，先用于高风险技能上线门槛、离线审计和 regression case，不扩成全量形式化平台。 |
| 数据治理、示教 / 回放质量审计、结构性缺陷检测 | 值得专题跟踪 | 将 `Auditing Demonstration Curation Metrics` 转成 state-trajectory defect 和 downstream policy impact 字段，支撑后续数据闭环。 |
| 本地 LLM/VLM 编排、显式用户 / 操作员确认、可视化 grounding | 值得专题跟踪 | 将 `A Conversational Framework` 的中间态确认机制吸收到高风险家庭命令执行前确认，不因其机械臂场景改写一代本体能力。 |
| 功能性 affordance、open-vocabulary 3D functionality、功能组件定位 | 接近专题成熟 | 采用功能假设与不确定性字段，延后完整 3D 功能分割或 RGB-D / 点云依赖。 |
| VLN 双系统、导航训练技巧、碰撞训练 reset 策略 | 候选储备 | 与前序 VLN / 导航训练主题重复，只有进入 Kinbot 自建导航数据集或训练模板时再专题吸收。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 VASO、PiL-World、A4D、local LLM/VLM ROS 2 stack 和 adversarial safety scenario 都写成在线子系统，会过复杂”。建议只吸收 5 类轻量字段：`skill_contract_verification_status`、`demonstration_structural_defect_type`、`policy_in_loop_eval_error`、`operator_confirmation_required`、`affordance_uncertainty_score`。暂不新增全量形式化验证平台、在线世界模型主控、完整机械臂交互栈、3D 功能分割平台或红蓝对抗安全训练平台。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | VASO: Formally Verifiable Self-Evolving Skills for Physical AI Agents | 进入技能合同 / 安全验证专题，补充 temporal spec、formal counterexample 和 contract revision 字段。 |
| A- | Auditing Demonstration Curation Metrics: Action-Only Scorers Fail on the Structural Defects That Degrade Imitation Policies | 进入数据治理 / 回放质量专题，补充结构性缺陷、state trajectory audit 和 downstream impact 字段。 |
| B+ | PiL-World: A Chunk-Wise World Model for VLA Policy-in-the-Loop Evaluation | 进入 Phase 5 回放 / shadow-run 候选，先用于闭环评估误差估计，不扩在线 world model。 |
| B+ | A Conversational Framework for Human-Robot Collaborative Manipulation with Distributed Generative AI models | 进入本地 Agent 编排与高风险确认专题，吸收中间态可视化和 operator confirmation 机制。 |
| B+ | What Objects Enable, Not What They Are: Functional Latent Spaces for Affordance Reasoning | 进入功能性场景理解候选，转成功能假设、affordance uncertainty 和 selective discovery 字段。 |

## 3. 论文卡片

### 3.1 VASO: Formally Verifiable Self-Evolving Skills for Physical AI Agents

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.05395](https://arxiv.org/abs/2606.05395) |
| 本轮 listing 口径 | 2026-06-05 官方 listing new submission；本轮属于 2026-06-06 最新官方 listing 日更收录；abs 页显示 `Submitted on 3 Jun 2026` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | LLM-generated robot skills, semantic contracts, model checking, temporal specifications, counterexample trace, self-evolving skill contracts |

摘要要点转述：

论文指出，可复用机器人技能正在成为具身智能执行长程任务的基本单元，但现有 skill evolution 往往只通过执行反馈、单元测试、环境奖励或 LLM 自评来修补技能，这只能证明若干样例跑通过，不能证明未测试条件下的计划满足时序安全合同。作者提出 `VASO`：每个技能都有形式化接口和 planner-facing 接口，前者把状态、观测和控制命令映射到可做 model checking 的逻辑命题，后者指导可执行行为生成。系统先过滤逻辑不一致的技能合同，再验证由技能诱导的计划是否满足全局和局部时序规范；失败时把 counterexample trace 翻译成文本梯度，用来更新技能合同而不是微调模型。实验在 Clearpath Jackal 和 PX4 quadcopter 任务上达到 `97.2%` formal-spec compliance，并用少于 `100` 个优化样本优于执行反馈、prompt optimization 和 fine-tuning 基线。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`interaction_orchestration` 和 `platform_runtime` 中“技能上线前如何证明不违反安全约束”的问题。
2. Kinbot 的找人、靠近老人、夜间巡护、提醒、摄像头观察和跨房间移动都可能由可复用技能编排完成；如果只用成功样例验证，会漏掉边界条件、禁区、时段、隐私和用户授权冲突。
3. 对应 Phase 5：建议增加 `skill_contract_id`、`skill_contract_version`、`temporal_spec_id`、`formal_verification_status`、`counterexample_trace_id`、`contract_revision_reason` 和 `untested_condition_bucket` 字段。

资源消耗与部署信号：

1. `VASO` 主要增加离线验证和技能合同治理成本，不要求在线常驻大模型或新传感器。
2. 对 Kinbot 更现实的落点是高风险技能上线前验证、回归测试和 counterexample 入库，而不是每次家庭任务执行都跑 model checker。
3. 需要工程上定义 Kinbot 可验证命题集合，例如距离、速度、禁区、授权、观察开关、人体接近和任务中止条件。

优势：

1. 把“技能跑通”升级为“技能诱导计划满足时序规范”，明显强于只看执行成功率。
2. 反例可转成技能合同修订输入，适合形成 Phase 5 回归 case。
3. 不依赖微调 foundation model 权重，便于和 Kinbot 当前端侧资源线保持距离。

劣势与风险：

1. 需要先把 Kinbot 状态、观测和控制命令抽象成可验证命题，前期建模成本不低。
2. 形式化验证覆盖的是合同表达出来的约束，不会自动覆盖未建模的家庭社会规则和隐私偏好。
3. 论文实验对象与家庭服务机器人不同，需避免把 Jackal / PX4 结果直接外推为 Kinbot 已验证能力。

推荐理由：

建议作为 A- 级输入。它应进入技能合同 / 安全验证专题，帮助 Kinbot 把高风险技能上线门槛写成可审计字段；不建议把完整形式化验证平台写成一代产品交付范围。

### 3.2 Auditing Demonstration Curation Metrics: Action-Only Scorers Fail on the Structural Defects That Degrade Imitation Policies

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.05588](https://arxiv.org/abs/2606.05588) |
| 本轮 listing 口径 | 2026-06-05 官方 listing new submission；本轮属于 2026-06-06 最新官方 listing 日更收录；abs 页显示 `Submitted on 4 Jun 2026` |
| 分类 | `cs.RO`, `cs.LG` |
| 方法关键词 | demonstration curation, imitation learning, structural defects, state trajectory audit, action-only scorer failure, downstream policy impact |

摘要要点转述：

论文关注模仿学习中的示教数据清洗问题：现有许多 curation metrics 声称能自动识别低质量 demonstration，但它们各自验证协议不同，很难判断哪些指标真的能过滤会伤害策略的数据。作者构建一个可控测试台，注入已知类型的数据缺陷，并审计 `7` 个 curation metrics：一看能否区分 clean / defective demonstration，二看用该指标筛选后的数据是否真正提升 behavior cloning 成功率。实验区分两类缺陷：相关动作噪声、抖动、截断等微扰可以被多变量离群指标检测并恢复性能差距；但关键时刻执行了错误动作的结构性错误，action-only 指标全部看不见，有两个指标甚至把缺陷示教评为更高质量。只有检查 state trajectory 的指标能发现结构性错误，但最佳指标也只恢复约三分之一 downstream gap。

解决 Kinbot 的什么问题：

1. 对应 `observability_data_governance`、`world_state_memory` 和 Phase 5 数据闭环中“示教、回放和人工修正数据能不能训练 / 验证策略”的问题。
2. Kinbot 若后续收集家庭场景演示、纠错轨迹、人工接管或 shadow-run 数据，不能只看动作平滑、速度、轨迹离群度；更关键的是任务状态是否在关键节点被错误改变。
3. 对应 Phase 5：建议增加 `demonstration_defect_type`、`structural_error_key_step`、`state_trajectory_audit_passed`、`action_only_metric_score`、`curation_metric_downstream_delta` 和 `human_review_required_for_structural_defect` 字段。

资源消耗与部署信号：

1. 该论文主要增加离线数据审计和标注成本，对端侧实时资源影响低。
2. 真正成本在于需要定义 state trajectory schema 和关键任务节点，而不是额外跑一个 action scorer。
3. 可与验证 provenance TODO 合并：每条训练 / 回放数据应保留采集来源、后处理版本、缺陷类型和是否人工审核。

优势：

1. 直接指出 action-only 数据质量指标的盲区，避免把“轨迹看起来平滑”误认为“任务正确”。
2. 可低成本转成 Kinbot 数据闭环和 Phase 5 回放审计字段。
3. 对未来模仿学习、人工接管、家庭样机试点数据都适用。

劣势与风险：

1. 论文测试台规模较小，且以 behavior cloning 为主，需要结合 Kinbot 任务类型重建缺陷 taxonomy。
2. State trajectory audit 依赖状态识别质量，纯视觉状态估计不稳定时会带来误判。
3. 如果审计过细，会增加试点数据处理负担，需要先聚焦高风险和高复用任务。

推荐理由：

建议作为 A- 级输入。它应进入数据治理 / 回放质量专题，帮助 Kinbot 在 Phase 5 明确“结构性错误”比动作噪声更需要人工复核；不建议为此新增复杂数据平台，先加入最小字段和抽检流程。

### 3.3 PiL-World: A Chunk-Wise World Model for VLA Policy-in-the-Loop Evaluation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.05773](https://arxiv.org/abs/2606.05773) |
| 本轮 listing 口径 | 2026-06-05 官方 listing new submission；本轮属于 2026-06-06 最新官方 listing 日更收录；abs 页显示 `Submitted on 4 Jun 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | policy-in-the-loop evaluation, chunk-wise world model, closed-loop VLA evaluation, imagined rollout, failed trajectory learning, real-world success-rate error |

摘要要点转述：

论文指出，VLA policy 在真实机器人任务中是闭环运行的：观察场景、执行 action chunk，再基于执行后的新观察继续决策。但很多 world model 只沿着预采集轨迹做 open-loop prediction，不能评估“策略执行一步后场景变了，下一步策略如何反应”。`PiL-World` 针对这个缺口提出 chunk-wise world model：给定当前观察和 VLA 输出的动作轨迹，生成与 rollout 一致、且可作为策略下一步输入的多视角未来观察。系统在 VLA inference 和 world-model prediction 之间交替，减少每一步都要真实机器人执行的成本；同时学习成功示教和失败执行轨迹，使想象 rollout 更接近真实 policy distribution。在三个真实双臂任务上，它把真实 rollout 成功率和闭环 world-model 估计成功率之间的误差从 `63.2%` 降到 `12.0%`。

解决 Kinbot 的什么问题：

1. 对应 `observability_data_governance`、`interaction_orchestration` 和 Phase 5 验证中的“如何用回放 / shadow-run 估计真实执行风险”的问题。
2. Kinbot 的家庭巡护、靠近用户、找物确认和提醒任务都不适合每个策略版本都完整实机跑大量场景；需要能估计 policy-in-loop 误差的离线验证机制。
3. 对应 Phase 5：建议增加 `policy_in_loop_eval_id`、`imagined_rollout_step`、`world_model_observation_error`、`real_vs_sim_success_gap`、`failed_trajectory_included`、`shadow_run_acceptance_threshold` 和 `execution_blocked_by_replay` 字段。

资源消耗与部署信号：

1. 完整视频生成 world model 资源开销重，不适合 Kinbot 一代在线常驻执行链。
2. 更现实的落点是离线回放、关键任务版本发布前评估和试点样机 shadow-run。
3. 需要明确 imagined observation 不能替代真实证据，只能作为风险筛查和实验优先级排序。

优势：

1. 从 open-loop prediction 推进到 closed-loop policy-in-loop evaluation，直接命中验证误差问题。
2. 学习失败轨迹，符合 Kinbot Phase 5 对失败样例和边界条件的需求。
3. 提供可量化指标：真实成功率与评估成功率之间的 gap。

劣势与风险：

1. 实验是双臂操作任务，不能直接外推到家庭移动导航。
2. 世界模型自身误差可能在长程任务中累积，必须保留版本和人工抽检。
3. 若被误用为在线决策依据，会显著增加端侧资源和安全风险。

推荐理由：

建议作为 B+ 级输入。它应进入 Phase 5 回放 / shadow-run 候选，帮助 Kinbot 定义 policy-in-loop 评估误差；不建议新增在线 world model 主控。

### 3.4 A Conversational Framework for Human-Robot Collaborative Manipulation with Distributed Generative AI models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.06061](https://arxiv.org/abs/2606.06061) |
| 本轮 listing 口径 | 2026-06-05 官方 listing new submission；本轮属于 2026-06-06 最新官方 listing 日更收录；abs 页显示 `Submitted on 4 Jun 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | local LLM, local VLM, ROS 2 nodes, conversational HRI, visual grounding, operator confirmation, distributed execution stack |

摘要要点转述：

论文提出一个用于人机协作操作的分布式对话框架，把本地语言模型、本地视觉语言模型和基于 ROS 2 的执行栈连接起来。语言理解、视觉 grounding、编排和运动执行分别作为 ROS 2 节点运行，支持分布式硬件部署并保持响应式控制闭环。系统把自由文本命令转为 pick、place、handover 等结构化动作请求，再用 VLM 输出图像空间目标，并通过深度和标定转成机器人坐标系目标。关键设计是 web dashboard 暴露中间意图和 grounding overlay，包括 pixel、depth 和 robot-frame，并在任何运动执行前要求显式 operator confirmation。实验在 Franka FR3 平台上评估不同场景歧义程度下的可靠性和延迟，并比较多种 LLM/VLM 配置。

解决 Kinbot 的什么问题：

1. 对应 `interaction_orchestration`、`platform_runtime` 和 `safety_compliance_authorization` 中“自然语言命令如何转成可审计执行链”的问题。
2. Kinbot 一代不做机械臂，但仍会有高风险家庭命令：靠近老人、进入卧室、开启摄像头观察、确认药盒、夜间巡护和通知家属；这些任务也需要 intent、grounding、坐标 / 目标转换和执行前确认。
3. 对应 Phase 5：建议增加 `local_llm_node_version`、`vlm_grounding_overlay_id`、`intent_to_action_request_id`、`operator_confirmation_required`、`operator_confirmation_result`、`grounding_ambiguity_level` 和 `execution_after_confirmation_only` 字段。

资源消耗与部署信号：

1. 论文明确使用 local LLM / VLM 和分布式节点，对 Kinbot 端侧 / 本地网络部署有参考意义，但需重新测目标 SoC 的内存、延迟和热设计。
2. VLM grounding 使用 depth 和 calibration，Kinbot 一代不能因此引入 RGB-D fallback；应转成纯视觉 grounding 可视化与置信度字段。
3. Web dashboard 更适合研发 / 试点验证，不应直接照搬成消费者 UI。

优势：

1. 中间态可视化和执行前确认非常适合 Kinbot 高风险任务治理。
2. 节点拆分清晰，便于定位语言理解、视觉 grounding、编排或执行失败来源。
3. 本地模型口径与 Kinbot 原始敏感数据端侧处理原则兼容。

劣势与风险：

1. 操作机械臂场景与 Kinbot 一代家庭移动 / 交互任务不完全一致。
2. 使用 depth / calibration 的目标转换不能直接搬到纯视觉产品主线。
3. 如果所有任务都要求显式确认，会影响体验；需要按风险等级触发。

推荐理由：

建议作为 B+ 级输入。它应进入本地 Agent 编排与高风险确认专题，重点吸收“中间态可视化 + 显式确认 + 节点化错误定位”；不建议因此扩张机械臂能力或消费者端复杂控制台。

### 3.5 What Objects Enable, Not What They Are: Functional Latent Spaces for Affordance Reasoning

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.05533](https://arxiv.org/abs/2606.05533) |
| 本轮 listing 口径 | 2026-06-05 官方 listing cross submission from `cs.LG`；本轮属于 2026-06-06 最新官方 listing 日更收录；abs 页显示 `Submitted on 4 Jun 2026` |
| 分类 | `cs.LG`, `cs.AI`, `cs.CV`, `cs.RO` |
| 方法关键词 | functional latent space, affordance reasoning, selective affordance discovery, uncertainty, planning with object functionality, fast inference |

摘要要点转述：

论文认为，机器人规划不能只知道物体“看起来像什么”，还需要知道物体“能支持什么功能”，例如某个对象是否可移动、可作为支撑、可打开或可容纳。现有 appearance-based latent space 容易按外观聚类，面对新物体或新交互时泛化弱。作者提出 `A4D`，把视觉观察映射到围绕 affordance 组织的功能性 latent space，并用视觉观察到 affordance 的距离推断物体功能；当现有 affordance 不足时，系统用不确定性触发 selective affordance discovery，扩展 latent space。实验显示，`A4D` 对既有 affordance 的推断准确率达到 `94%`，比现有方法高 `15` 个百分点以上；新 affordance 推断用少于 `10%` 原始训练数据把准确率从 `70%` 提升到 `90%` 以上，并带来 `100x` 推理速度提升。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`mobility_navigation` 和 `interaction_orchestration` 中“家庭物品不只按类别记忆，还要按功能和可交互性理解”的问题。
2. Kinbot 找物、避让、提示、巡护和服务闭环需要知道“这个箱子能不能移开”“这个椅子能不能作为障碍绕行”“这个门把手是否可操作”“这个物体是否可能承载药品”等功能假设。
3. 对应 Phase 5：建议增加 `affordance_hypothesis_id`、`affordance_uncertainty_score`、`functionality_latent_distance`、`selective_discovery_triggered`、`appearance_label_conflicts_with_function` 和 `functional_observation_source` 字段。

资源消耗与部署信号：

1. 论文给出 `100x` 推理速度提升信号，说明功能性 latent 不一定必须重型在线推理；但具体模型和硬件仍需 Kinbot SoC profiling。
2. 适合先做低频场景理解、离线标注和记忆字段，而不是在底盘控制环中高频调用。
3. Cross-list 条目不能直接改写 Kinbot 产品主线；应作为功能性理解候选字段。

优势：

1. 从类别识别转向功能推断，贴近家庭机器人真实任务。
2. 不确定性触发 discovery 的机制与 Kinbot 主动询问、人工确认和记忆写入门控可合并。
3. 可降低“看起来像但不能用”或“类别未知但功能明确”的规划失败。

劣势与风险：

1. 论文任务仍偏规划 / affordance benchmark，需用家庭物品和纯视觉输入重新验证。
2. 功能推断错误可能导致危险动作，必须和执行前确认、风险等级绑定。
3. 如果扩成完整 functional world model，会增加 `world_state_memory` 复杂度。

推荐理由：

建议作为 B+ 级输入。它应进入功能性场景理解候选，帮助 Kinbot 从 object label 扩展到 function hypothesis 和 uncertainty；不建议新增完整功能性世界模型。

## 4. 候选排除表

| 候选论文 | 类型 | 未收录原因 |
| --- | --- | --- |
| Learning of Robot Safety Policies via Adversarial Synthetic Scenarios | 2026-06-05 new submission | 安全红队 / 蓝队场景生成与 Kinbot Phase 5 有关系，但论文明确是 ongoing work，贡献主要是问题表述和方案架构；先作为安全场景生成候选，不写成既定验证能力。 |
| Flash-WAM: Modality-Aware Distillation for World Action Models | 2026-06-05 cross submission from `cs.LG` | `8.1s -> 348ms` 的 WAM 推理压缩资源信号很强，但硬件是 NVIDIA L40S，任务偏 manipulation / humanoid；本月 VLA/WAM 资源主题已饱和，先作为端侧推理专题候选。 |
| Let It Be Simple: One-Step Action Generation for Vision-Language-Action Models | 2026-06-05 cross submission from `cs.CV` | 一步动作生成可降低 VLA 解码成本，但仍偏操作 policy 与 LIBERO 评测；未新增 Kinbot 家庭移动、记忆、安全或数据治理字段。 |
| MPCoT: Reward-Guided Multi-Path Latent Reasoning for Test-Time Scalable Vision-Language-Action | 2026-06-05 new submission | Test-time latent reasoning 对高不确定控制有价值，但核心仍是 VLA 操作能力扩展；本轮不继续扩泛 VLA 主卡片。 |
| TempoVLA: Learning Speed-Controllable Vision-Language-Action Policies | 2026-06-05 new submission | 动态速度控制对安全执行有启发，但仍围绕 manipulation VLA；可转成“高风险阶段减速”候选，不改 Kinbot 一代控制架构。 |
| T-FunS3D: Task-Driven Hierarchical Open-Vocabulary 3D Functionality Segmentation | 2026-06-05 cross submission from `cs.CV` | 功能组件定位相关，但依赖 3D point cloud 与 posed RGB-D images；本轮用 `A4D` 承接功能性 affordance 不确定性，避免把 RGB-D / 点云管线写成产品 fallback。 |
| SEDualVLN: A Spatially-Enhanced Dual-System for Vision-Language Navigation | 2026-06-05 replacement submission | VLN fast-slow dual system 和 top-down 3D map 有研究价值，但 replacement 且与前序 VLN、Goal2Pixel、低调用接口和导航数据集主题重叠；除非进入 Kinbot 自建 VLN 数据设计，不重复主卡片。 |
| Do We Really Need Immediate Resets? Rethinking Collision Handling for Efficient Robot Navigation | 2026-06-05 replacement submission | 多碰撞 reset budget 对导航训练效率有启发，但属于 replacement，且是训练策略而非产品级安全准则；先作为导航训练模板候选。 |
| ActiveMimic: Egocentric Video Pretraining with Active Perception | 2026-06-05 new submission | 主动感知和人类第一视角视频预训练可观察，但偏 manipulation pretraining；Kinbot 不因此扩张采集链路或 head camera 在线学习。 |
| Discrete-WAM、WLA model、autonomous driving world model 论文 | new submissions | 主要面向自动驾驶或统一 world-action 模型；与 Kinbot 家庭室内移动一代主线距离较远，且本月 world model 主题已明显饱和。 |
| Safe Embodied AI survey、OSCAR benchmark、IKEA assembly / DexFuture / dexterous manipulation 论文 | new submissions | 对通用安全和操作研究有参考，但缺少直接的 Kinbot 家庭移动、老人看护、端侧资源或 Phase 5 字段增量。 |
| Uncertainty-Aware Adaptive Sensor Fusion for Autonomous Navigation | 2026-06-05 new submission | 不确定性感知 VIO / IMU fusion 有导航价值，但实验资源标注 A100，且依赖视觉惯性融合；不改变 Kinbot 一代纯视觉主线。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮不回写 `docs/00_governance/03_decision_log.md`：论文只新增研究输入、验证字段和专题候选，不改变当前冻结事实。
2. 不改变一代纯视觉主线：`T-FunS3D`、对话操作框架中的 depth / calibration、以及 VIO / IMU fusion 论文都不能作为传感 fallback。
3. 不改变端侧资源线：`Flash-WAM` 和 `A4D` 提供速度信号，但仍需目标 SoC profiling，不能按 L40S 或 benchmark 结果推导 Kinbot 默认配置。
4. 建议后续在 Phase 5 验证模板中合并字段：`skill_contract_verification_status`、`demonstration_structural_defect_type`、`policy_in_loop_eval_error`、`operator_confirmation_required`、`affordance_uncertainty_score`。
5. 周度综合判断继续收敛：导航 / 记忆 / 安全 / 端侧资源已有足够论文输入，应从“继续收更多模型论文”转向“合并字段包 + 最小回放实验 + 人工审计样例 + 目标 SoC profiling”。

## 6. 来源

1. arXiv 官方 `cs.RO/new`：https://arxiv.org/list/cs.RO/new
2. arXiv 官方 `cs.RO/recent`：https://arxiv.org/list/cs.RO/recent
3. arXiv API 查询：https://export.arxiv.org/api/query?id_list=2606.05395,2606.05588,2606.05773,2606.06061,2606.05533
4. `VASO: Formally Verifiable Self-Evolving Skills for Physical AI Agents`：https://arxiv.org/abs/2606.05395
5. `Auditing Demonstration Curation Metrics: Action-Only Scorers Fail on the Structural Defects That Degrade Imitation Policies`：https://arxiv.org/abs/2606.05588
6. `PiL-World: A Chunk-Wise World Model for VLA Policy-in-the-Loop Evaluation`：https://arxiv.org/abs/2606.05773
7. `A Conversational Framework for Human-Robot Collaborative Manipulation with Distributed Generative AI models`：https://arxiv.org/abs/2606.06061
8. `What Objects Enable, Not What They Are: Functional Latent Spaces for Affordance Reasoning`：https://arxiv.org/abs/2606.05533
