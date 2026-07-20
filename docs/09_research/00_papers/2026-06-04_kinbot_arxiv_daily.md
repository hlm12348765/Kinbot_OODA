# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-04
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-04 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮刷新时官方最新 Robotics listing 为 `Thursday, 4 June 2026`，合计 `73` 篇 entries；其中 new submissions `37` 篇、cross submissions `8` 篇、replacement submissions `28` 篇。本轮按“最新官方 listing 精筛 + 近期待补录”口径，收录家庭价值冲突评测、选择性机器人情景记忆、端侧自然语言摄像头 Agent、语义场景重建验证和成本感知交互式目标导航相关 5 篇论文，并记录周度滚动判断。

---

## 1. 检索口径

本轮检索日期：2026-06-04。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Thursday, 4 June 2026`，合计 `73` 篇 entries；其中 new submissions `37` 篇、cross submissions `8` 篇、replacement submissions `28` 篇。
3. 官方 `cs.RO/recent` 在本轮检索时显示 `Thu, 4 Jun 2026` recent submissions `45` 篇，对应本轮 `new + cross`；同时仍可回看 `Wed, 3 Jun 2026` recent submissions `80` 篇。本轮保留前一轮 memory 标记的 `Wed, 3 Jun 2026` 近期待补录候选，避免在官方 listing 刷新后漏掉对 Kinbot 明确有增量的家庭价值冲突、情景记忆和端侧摄像头 Agent 条目。
4. 本轮相对 2026-06-03 日更，先排除已覆盖的纯视觉主动重建、开放词汇导航不确定性、动态室内语义记忆、低调用 VLN 接口和 `VLA` 成功 / 安全缺口评测直接重复主题。
5. `replacement` / `cross-list` 只在确实新增 Kinbot 评测项、治理项或端侧资源判断时收录。本轮主卡片中的 `Ask When It Pays` 来自 replacement，收录原因是它把“何时向用户提问”从单纯提高成功率改成成本化不确定性治理；其余 replacement 多进入候选排除表。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全、端侧资源或 Phase 5 验证组织的判断，而不是继续增加泛 `VLA`、manipulation、humanoid、自动驾驶、UAV、户外 SLAM 或纯工具链论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：价值冲突选择、记忆写入门控、端侧摄像头工具调用、执行前场景验证、澄清问题成本和用户打扰预算。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 `73` 篇 entries 自动扩张主卡片数量；泛统一 `VLA`、world-action model、humanoid、UAV、自动驾驶、地下矿区、工业编队和接触操作论文多数不改变 Kinbot 一代家庭移动闭环。
2. `WAM-Nav`、`SENTINEL`、`BPDA-GMM`、`Z-FLoc` 等有技术价值，但分别与前序视觉导航 world model、纯视觉 / 语义 SLAM 不确定性、楼层图定位专题重叠；本轮主卡片优先给家庭价值冲突、记忆写入门控、端侧感知资源和交互成本这些新增治理字段。
3. `eMEM` 与 `GN0` 分别对应具身记忆系统和 VLN 统一平台，但规模和体系化程度较重；本轮用 `Worth Remembering` 承接“什么值得记住”的最小门控信号，用 `Ask When It Pays` 承接“什么时候该问人”的导航交互信号，不继续扩张多套 memory / VLN 平台。
4. `PerceptTwin` 进入主卡片，但仅作为 Phase 5 场景级验证和 plan pre-check 输入；不因此把完整数字孪生仿真平台写成一代既定交付范围。

## 2. 本轮总判断

本轮最有价值的增量不是新的通用导航策略或更大的 `VLA`，而是五个更贴近 Kinbot 家庭部署的治理问题：

1. **家庭机器人不能只按任务成功率评价**：`RobotValues` 提醒 Kinbot 在老人照护、隐私、社交礼貌、效率和自主权冲突时，需要评估“选择哪个价值优先”，而不是只看任务是否完成或是否安全合规。
2. **长期记忆应选择性写入，而不是全量保存**：`Worth Remembering` 用 surprise-gated episodic memory 支撑未来任务引用过去事件，提示 Kinbot 的家庭长期记忆需要写入门控、保留理由和遗忘策略。
3. **端侧感知 Agent 要按工具调用链评测，而不是只看模型能力**：`SCOPE` 把自然语言摄像头 Agent 的 latency、accuracy、error modes、SLM/VLM routing 和量化 / MoE 配置作为评测对象，直接对应 Kinbot 头部 / 躯干摄像头感知任务的端侧资源口径。
4. **执行前验证应优先成为回放 / shadow-run 机制**：`PerceptTwin` 从机器人感知栈生成语义场景仿真，用于计划验证和修正，适合 Kinbot Phase 5 的场景级 plan pre-check；但它不应升级成一代在线重型数字孪生主链路。
5. **向用户提问也要有成本模型**：`Ask When It Pays` 将交互式 Instance Goal Navigation 转成成本敏感的不确定性下降问题，提示 Kinbot 对“你说的是哪个杯子”“要不要去卧室确认”这类问题应记录 query cost、信息增益和打扰预算。

周度滚动判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 泛统一 `VLA`、world model、diffusion action、humanoid / manipulation | 已饱和 | 只有新增家庭移动闭环、老人照护、安全审计字段或端侧实测资源边界时才进入主卡片。 |
| 家庭价值冲突、隐私优先级、用户自主权和社交适当性 | 值得专题跟踪 | 将 `RobotValues` 纳入 `safety_compliance_authorization` 与用户授权策略候选，形成 value-conflict 评测字段，不新增道德推理在线层。 |
| 长期记忆、事件写入门控、空间 / 时间 / 语义检索 | 接近专题成熟 | 将 `Worth Remembering`、`eMEM`、前序 `DREAM`、动态空间记忆统一收敛为记忆写入、保留、过期、追溯修正和人工确认字段。 |
| 端侧感知 Agent、摄像头工具调用、视觉模型资源预算 | 值得专题跟踪 | 用 `SCOPE` 的 latency / error mode / routing 思路补充头部摄像头与开放词汇感知回放，不扩 cloud-heavy 感知链路。 |
| 计划验证、语义场景重建、shadow run / replay | 值得专题跟踪 | 将 `PerceptTwin` 与前序 validation provenance 合并为 Phase 5 plan pre-check / replay 字段，先做离线验证。 |
| 交互式导航澄清、用户问题成本、打扰预算 | 值得专题跟踪 | 将 `Ask When It Pays` 与前序欠指定奖励澄清、主动询问论文合并，形成 query cost / information gain / weighted success 指标。 |
| 形式化风险控制、POMDP、低层 RL safety | 候选储备 | 保留为底层控制验证候选，不在本轮扩张一代在线规划架构。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 RobotValues、Worth Remembering、eMEM、SCOPE、PerceptTwin、Ask When It Pays、WAM-Nav 和形式化风险控制都写成在线模块，会明显过复杂”。建议只吸收 5 类轻量对象：价值冲突评测字段、记忆写入门控字段、端侧摄像头 Agent profiling 字段、执行前验证回放字段、交互澄清成本字段。暂不新增独立价值推理引擎、多套长期记忆系统、完整数字孪生平台、通用 `VLA` 主控或 cloud-heavy 感知 Agent。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | RobotValues: Evaluating Household Robots When Human Values Conflict | 进入家庭价值冲突 / 授权治理专题，补充隐私、自主权、社交适当性和效率冲突评测字段。 |
| A- | Worth Remembering: Surprise-Gated Robot Episodic Memory | 进入长期记忆专题，转成 surprise / novelty 写入门控、保留理由和记忆容量控制字段。 |
| A- | SCOPE: Real-Time Natural Language Camera Agent at the Edge | 进入端侧摄像头 Agent profiling 专题，验证 latency、tool routing、perception bottleneck、量化和 MoE 配置。 |
| B+ | PerceptTwin: Semantic Scene Reconstruction for Iterative LLM Planning and Verification | 进入 Phase 5 plan pre-check / shadow-run 候选，先做离线回放与安全前置验证，不扩在线平台。 |
| B+ | Ask When It Pays: Cost-Aware Open-Ended Interaction for Instance Goal Navigation | 进入交互式导航澄清专题，补充 query cost、uncertainty reduction 和 weighted success 字段。 |

## 3. 论文卡片

### 3.1 RobotValues: Evaluating Household Robots When Human Values Conflict

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.03312](https://arxiv.org/abs/2606.03312) |
| 本轮 listing 口径 | `cs.RO/recent` 的 `Wed, 3 Jun 2026` entry；本轮属于 2026-06-04 近期待补录；abs 页显示 `Submitted on 2 Jun 2026` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | household robot values, value conflict benchmark, privacy, autonomy, social appropriateness, VLM planner evaluation |

摘要要点转述：

论文指出，家庭机器人真实任务经常不是单一“完成任务”问题，而是安全、隐私、用户自主权、效率和社交适当性之间的取舍问题。作者构建 `RobotValues`，包含 `10K` 个家庭价值冲突场景，每个样本用家庭图像和多种可行动作表达不同价值优先级。评测发现，当前 VLM / robotics planner 有默认价值偏好，例如偏向安全和顺从，但对隐私优先动作选择不足；即使显式要求优先某个与模型默认偏好冲突的价值，模型也经常不能改变选择。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`interaction_orchestration` 和 `observability_data_governance` 中“家庭机器人在价值冲突时如何决策和留痕”的问题。
2. Kinbot 的老人看护、家庭巡护、健康提醒和摄像头观察会频繁遇到隐私、打扰、用户自主权、家属诉求和任务效率冲突；不能只用“任务成功 / 未碰撞”作为评测结果。
3. 对应 Phase 5：建议增加 `value_conflict_scenario_id`、`prioritized_value_claimed`、`privacy_priority_selected`、`autonomy_override_requested`、`household_stakeholder_context` 和 `value_choice_audit_reason` 字段。

资源消耗与部署信号：

1. 该论文主要提供评测集和治理指标，在线资源消耗不高，但需要将家庭任务日志标注为价值冲突类型。
2. 不建议把 VLM 单独升级为价值裁判；应把价值冲突作为安全审批 / 用户授权策略中的可审计字段。
3. 如果进入产品验证，应在端侧保留最小场景证据和选择理由，避免上传原始敏感图像。

优势：

1. 直接面向 household robots，比泛安全 benchmark 更贴近 Kinbot。
2. 把隐私、社交适当性和自主权纳入机器人评测，补足“成功率”盲区。
3. 可低成本转化为 Phase 5 场景评测清单和人工复核标签。

劣势与风险：

1. 场景由 LLM-assisted generation 和图像生成构建，仍需真实家庭数据校准。
2. 价值选择具有文化、家庭和用户偏好差异，不能简单固化成统一规则。
3. 若过度依赖模型价值偏好，可能让机器人在敏感场景中替用户做不该做的决定。

推荐理由：

建议作为 A- 级输入。它应进入家庭价值冲突 / 授权治理专题，帮助 Kinbot 把隐私、自主权、社交适当性和效率冲突写成评测字段；不建议新增独立“价值推理引擎”。

### 3.2 Worth Remembering: Surprise-Gated Robot Episodic Memory

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.03787](https://arxiv.org/abs/2606.03787) |
| 本轮 listing 口径 | `cs.RO/recent` 的 `Wed, 3 Jun 2026` entry；本轮属于 2026-06-04 近期待补录；abs 页显示 `Submitted on 2 Jun 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | episodic memory, Bayesian surprise, V-JEPA-2 latent space, 4D scene graph, event segmentation, robot question answering |

摘要要点转述：

论文关注通用机器人如何记住未来可能被人类引用的过去事件，例如“带我去昨天发生异常的地方”。作者认为，长期部署不可能保存所有历史事件，机器人需要选择性形成情景记忆。论文用 Bayesian surprise 作为写入门控，在 V-JEPA-2 提供的语义 latent space 中计算事件的新奇程度，再将 gated episodic memory 接入 4D scene graph 空间记忆。实验显示，这种无监督、因果的记忆门控能提升机器人问答中的时间、空间和二值问题表现，并改善事件分割。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`interaction_orchestration` 和 `observability_data_governance` 中“什么事件值得长期记住”的问题。
2. Kinbot 家庭环境里，真正有用的长期记忆往往是异常、用户偏好改变、物品位置变化、跌倒风险或家庭成员明确指出的事件，而不是所有帧和所有观察。
3. 对应 Phase 5：建议增加 `episodic_memory_gate_score`、`memory_write_reason`、`bayesian_surprise_bucket`、`event_segment_id`、`future_reference_success`、`memory_retention_policy` 和 `raw_observation_not_retained` 字段。

资源消耗与部署信号：

1. surprise 计算依赖语义 latent 表征，需评估端侧模型占用、写入频率和 memory compaction 开销。
2. 对 Kinbot 更现实的落点是低频写入门控和回放标注，而不是常开保存所有视觉 latent。
3. 它能减少长期记忆膨胀，但仍需与隐私策略绑定，避免“觉得新奇”就自动长期保存敏感事件。

优势：

1. 把记忆写入从规则列表转为可度量的 surprise / utility 信号。
2. 与前序动态空间记忆、家庭物品重定位和长期任务恢复自然合并。
3. 适合转成 Phase 5 的记忆写入、保留、遗忘和问答回放指标。

劣势与风险：

1. 论文使用 V-JEPA-2 latent 和 4D scene graph，对 Kinbot 端侧资源仍偏重。
2. surprise 不等于用户关心，必须叠加用户标注、任务上下文和隐私等级。
3. 如果没有清晰 retention policy，仍可能形成不可解释的长期记忆。

推荐理由：

建议作为 A- 级输入。它应进入长期记忆专题，帮助 Kinbot 把“为什么记住这件事”写成可审计字段；不建议新增第二套完整情景记忆平台。

### 3.3 SCOPE: Real-Time Natural Language Camera Agent at the Edge

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.02951](https://arxiv.org/abs/2606.02951) |
| 本轮 listing 口径 | `cs.RO/recent` 的 `Wed, 3 Jun 2026` entry；本轮属于 2026-06-04 近期待补录；abs 页显示 `Submitted on 1 Jun 2026` |
| 分类 | `cs.RO`, `cs.AI`, `cs.CL`, `cs.CV`, `cs.HC` |
| 方法关键词 | edge camera agent, natural language PTZ control, tool routing, latency, quantization, MoE, error modes |

摘要要点转述：

论文提出 `SCOPE`，一个面向自然语言、开放词汇 PTZ 摄像头控制和视觉场景理解的模块化 Agent。它同时支持 Blender 仿真和真实 PTZ 摄像头，在部署现场本地完成感知、规划和控制。论文发布 `536` 个任务的 benchmark，覆盖问答、单步 / 多步命令、计数、空间推理、描述和 OCR，并用执行 trace 与 LM-as-Judge 评估 latency、accuracy 和 error modes。作者测试了 `19` 种 planner-perception 组合，发现更强的小语言模型能减少幻觉和改善工具路由；当 planner 足够强后，视觉感知成为主要瓶颈。MoE 与量化在保持可用准确率的同时改善延迟和内存占用。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`interaction_orchestration` 和头部 / 躯干摄像头感知任务中的“自然语言如何调用本地视觉工具”的问题。
2. Kinbot 很多家庭任务不是让大模型直接控制底盘，而是让它低频调用摄像头观察、转头、放大、识别、计数和确认场景。
3. 对应 Phase 5：建议增加 `camera_agent_task_type`、`tool_routing_success`、`vision_bottleneck_tag`、`edge_latency_ms`、`planner_model_tier`、`perception_model_tier`、`quantization_profile` 和 `camera_agent_error_mode` 字段。

资源消耗与部署信号：

1. 论文直接以 edge deployment 为目标，对 Kinbot `12GB RAM + 32GB Flash` 默认资源线有参考价值。
2. MoE、量化、小语言模型和 VLM 组合需要在目标 SoC 上实测 memory、latency、thermal，而不能只按参数量判断。
3. 该论文聚焦 PTZ 摄像头，不等同于底盘导航；对 Kinbot 应先落在观察 / 确认 / 巡护回放任务中。

优势：

1. 给出端侧 camera-agent 的任务、trace、延迟和错误模式评测口径。
2. 区分 planner hallucination、tool routing 和 perception bottleneck，便于定位 Kinbot 失败原因。
3. 与纯视觉主线相容，不要求云端原始视频上传。

劣势与风险：

1. PTZ 控制与 Kinbot 头颈 / 躯干屏幕 / 摄像头布局并不完全一致。
2. LM-as-Judge 仍需人工抽检和真实家庭任务校准。
3. 若把 camera agent 常开，会带来隐私、功耗和热设计压力。

推荐理由：

建议作为 A- 级输入。它应进入端侧摄像头 Agent profiling 专题，帮助 Kinbot 将自然语言视觉工具调用拆成 latency、routing、perception bottleneck 和 error mode；不建议把它直接扩成全局 Agent 主控。

### 3.4 PerceptTwin: Semantic Scene Reconstruction for Iterative LLM Planning and Verification

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.04226](https://arxiv.org/abs/2606.04226) |
| 本轮 listing 口径 | 2026-06-04 官方 listing new submission；本轮属于 2026-06-04 日更收录；abs 页显示 `Submitted on 2 Jun 2026` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | semantic scene reconstruction, open-vocabulary object map, affordance prediction, LLM planning verification, interactive simulation |

摘要要点转述：

论文提出 `PerceptTwin`，用机器人感知栈产生的语义场景表示自动构建可交互仿真环境。它结合开放词汇对象地图、3D asset generation、affordance prediction 和常识条件检查，让 LLM planner 在真实执行前先在语义场景中验证、修正计划。论文还引入 LLM judge 检查计划正确性和人类偏好对齐。实验显示，`PerceptTwin` feedback 能提升 LLM planner 的计划成功和安全性，也能帮助人工发现因技能前置条件不满足导致的计划失败。

解决 Kinbot 的什么问题：

1. 对应 `observability_data_governance`、`interaction_orchestration` 和 Phase 5 验证中的“执行前如何验证计划”的问题。
2. Kinbot 的家庭巡护、找物、靠近老人、提醒和服务闭环都可能受场景状态、物品可达性、技能前置条件和用户偏好影响；仅靠语言规划容易在执行前漏掉物理约束。
3. 对应 Phase 5：建议增加 `plan_precheck_scene_id`、`semantic_scene_reconstruction_source`、`skill_precondition_failed`、`affordance_check_passed`、`plan_refined_before_execution`、`llm_judge_version` 和 `shadow_run_blocked_execution` 字段。

资源消耗与部署信号：

1. 完整交互仿真、3D asset generation 和 LLM judge 较重，不适合默认在线阻塞控制环。
2. 对 Kinbot 更现实的落点是离线回放、shadow run、关键高风险任务 pre-check 和 Phase 5 验证材料，而不是常开数字孪生平台。
3. 若未来接入产品，需要严格约束场景数据脱敏、版本留痕和验证结论不可伪装成真实执行结果。

优势：

1. 直接补强“计划执行前验证”而不是事后复盘。
2. 能把感知、技能前置条件、affordance 和人类偏好放到同一个验证链中。
3. 与近期 validation provenance / replay 字段高度互补。

劣势与风险：

1. 自动生成场景和 affordance 可能自身有误，不能作为安全唯一依据。
2. LLM judge 有偏差，需要版本、prompt 和人工抽检留痕。
3. 若直接平台化，会显著增加 Phase 5 工具链复杂度。

推荐理由：

建议作为 B+ 级输入。它应进入 Phase 5 plan pre-check / shadow-run 候选，优先转成离线验证字段；不建议把完整 `PerceptTwin` 写成一代交付范围。

### 3.5 Ask When It Pays: Cost-Aware Open-Ended Interaction for Instance Goal Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.03175](https://arxiv.org/abs/2606.03175) |
| 本轮 listing 口径 | 2026-06-04 官方 listing replacement submission；本轮属于 2026-06-04 日更收录；abs 页显示 `Submitted on 2 Jun 2026 (v1), last revised 3 Jun 2026 (v2)` |
| 分类 | `cs.CV`, `cs.RO` |
| 方法关键词 | instance goal navigation, cost-aware interaction, uncertainty reduction, question taxonomy, weighted success rate, MLLM navigator |

摘要要点转述：

论文关注 Instance Goal Navigation 中的欠指定自然语言目标，例如用户描述的是某个具体物体实例，但环境里有多个相似 distractors。作者认为，向 oracle 提问是合理机制，但现有交互式导航往往把轻量澄清和高信息路线指导同等处理，导致 agent 通过频繁提问提高成功率，却没有体现提问成本。论文将交互式 IGN 重构为成本敏感的不确定性下降问题：agent 应选择能以最低交互成本最大降低导航不确定性的问题。论文基于现有导航语料分析不同 cue 的信息增益，构建问题类型和权重，并提出 `Weighted Success Rate`，用不同 query penalty 评价交互效率。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`interaction_orchestration` 和 `world_state_memory` 中“什么时候该问用户，问什么问题才值得”的问题。
2. Kinbot 在家庭找物、巡护确认、老人提醒和服务执行中会遇到“哪个杯子”“是不是这个药盒”“要不要去卧室再确认”等欠指定目标；频繁打扰会损伤高端产品感，完全不问又会增加误执行风险。
3. 对应 Phase 5：建议增加 `query_type_id`、`query_cost_weight`、`expected_uncertainty_reduction`、`weighted_success_rate`、`user_interrupt_budget_remaining`、`clarification_avoided_due_to_cost` 和 `wrong_instance_due_to_no_query` 字段。

资源消耗与部署信号：

1. 该论文主要新增交互评测与决策口径，端侧计算负担低于重型导航模型。
2. 若用 MLLM navigator 实现选择性提问，需要测每个 decision step 的模型调用频率和响应延迟。
3. 更适合先作为策略 / 日志字段：机器人记录为什么问、为什么不问、问完是否降低了不确定性。

优势：

1. 直接将导航澄清从“能不能问”推进到“值不值得问”。
2. 解决成功率被高成本提问虚高的问题，适合 Kinbot 用户体验和运营质量评估。
3. 可与家庭物品记忆、主动询问和欠指定奖励澄清论文合并。

劣势与风险：

1. replacement 条目需要后续核对 v2 变化点，不能仅凭版本更新扩张主线。
2. oracle / 用户回答质量在真实家庭中会有噪声、延迟和情绪成本。
3. query cost 权重需要按老人、家属、夜间、紧急程度和隐私场景分层。

推荐理由：

建议作为 B+ 级输入。它应进入交互式导航澄清专题，帮助 Kinbot 把用户提问写成成本化治理对象；不建议因此新增高频 MLLM 导航主控。

## 4. 候选排除表

| 候选论文 | 类型 | 未收录原因 |
| --- | --- | --- |
| WAM-Nav: Asymmetric Latent World-Action Modeling for Unified Visual Navigation | 2026-06-04 new submission | 统一视觉导航和 sim-to-real 有价值，但 world-action / latent visual foresight 主题已接近饱和；本轮优先吸收更直接的交互成本和端侧摄像头 profiling 字段。 |
| Teaching Robots to Say 'I Don't Know': SENTINEL for Uncertainty-Aware SLAM | 2026-06-04 new submission | “拒绝污染 SLAM 输入”很有启发，但论文依赖低成本 2D LiDAR + RGB-D 交叉一致性，不符合 Kinbot 一代纯视觉产品主线；可转成视觉观测可靠性候选字段。 |
| Distribution-Free Risk-Aware Planning and Control Under Uncertainty Using Conformal Spectral Risk Control | 2026-06-04 new submission | 分布无关风险控制适合底层安全验证，但实验偏车辆避障仿真；本轮主卡片已覆盖家庭价值冲突和执行前验证，形式化 MPC 先保留为控制专题候选。 |
| BPDA-GMM: Bayesian Probabilistic Data Association via Gaussian Mixture Models for Semantic SLAM | 2026-06-04 new submission | 对语义 SLAM 中 perceptual aliasing 和 classifier error 有价值，但与前序 `PSG-Nav`、`VLM-GLoc` 和语义不确定性重复；先作为 semantic SLAM 数据关联候选。 |
| Z-FLoc: Zero-Shot Floorplan Localization via Geometric Primitives | 2026-06-04 cross submission from `cs.CV` | 楼层图零样本定位对家庭初始化有价值，但仍偏 floorplan + monocular reconstruction 匹配；当前不改变纯视觉导航主线，只保留为初始化 / 重定位候选。 |
| eMEM: A Hybrid Spatio-Temporal Memory System For Embodied Agents | `Wed, 3 Jun 2026` recent 待补录候选 | 多索引具身记忆系统和 benchmark 价值高，但体系较重；本轮用 `Worth Remembering` 承接记忆写入门控，避免同时新增完整 memory backend。 |
| GN0: Toward a Unified Paradigm for Generation, Evaluation, and Policy Learning in Visual-Language Navigation | `Wed, 3 Jun 2026` recent 待补录候选 | 3DGS VLN 数据 / 仿真 / 训练平台规模较大；与前序 VLN、Goal2Pixel、navigation dataset 主题重叠，不进入一代主线。 |
| Denoising Tells When to Replan | `Wed, 3 Jun 2026` recent 待补录候选 | adaptive replanning 对策略执行频率有价值，但主要面向 flow-based manipulation policies；可作为低层动作 chunk 资源候选，不作为 Kinbot 移动导航主卡片。 |
| Perceptual bottleneck / focus planning / 3DThinkVLA / VISTA / PHASER 等 VLM/VLA 训练与适配论文 | new / cross / replacement | 多数仍偏 manipulation、VLA training 或视觉 hallucination 减少；未新增家庭价值、导航澄清、记忆治理或端侧资源实测字段。 |
| CADET、AgenticDiffusion、MineXplore、5G edge aerial robot、autonomous driving / UAV / underground / CAV 论文 | new submissions | 系统评测或边缘计算思路有参考，但场景偏车、无人机、矿区或地下环境；不改变 Kinbot 一代家庭室内主线。 |
| COP-Q、Think Fast and Far、Semantic Constraint Synthesis 等形式化控制 / POMDP / LLM 约束论文 | new / cross submissions | 可作为底层规划与安全控制储备，但本轮没有新增 Kinbot 一代架构边界；后续若进入控制验证模板再专题吸收。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮不回写 `docs/00_governance/03_decision_log.md`：论文只新增研究输入、验证字段和专题候选，不改变当前冻结事实。
2. 不改变一代纯视觉主线：`SCOPE` 是端侧摄像头 Agent 评测输入；`SENTINEL` 的 LiDAR / RGB-D 不作为产品 fallback。
3. 不改变端侧资源线：`SCOPE` 提供 quantization / MoE / latency 参考，但仍需目标 SoC profiling。
4. 建议后续在 Phase 5 验证模板中合并字段：`value_conflict_scenario_id`、`episodic_memory_gate_score`、`camera_agent_error_mode`、`plan_precheck_scene_id`、`query_cost_weight`。
5. 周度综合判断继续收敛：导航 / 记忆 / 安全 / 端侧资源已有足够论文输入，应从“继续收更多平台论文”转向“合并字段包 + 最小回放实验 + 人工审计样例”。

## 6. 来源

1. arXiv 官方 `cs.RO/new`：https://arxiv.org/list/cs.RO/new
2. arXiv 官方 `cs.RO/recent`：https://arxiv.org/list/cs.RO/recent
3. `RobotValues: Evaluating Household Robots When Human Values Conflict`：https://arxiv.org/abs/2606.03312
4. `Worth Remembering: Surprise-Gated Robot Episodic Memory`：https://arxiv.org/abs/2606.03787
5. `SCOPE: Real-Time Natural Language Camera Agent at the Edge`：https://arxiv.org/abs/2606.02951
6. `PerceptTwin: Semantic Scene Reconstruction for Iterative LLM Planning and Verification`：https://arxiv.org/abs/2606.04226
7. `Ask When It Pays: Cost-Aware Open-Ended Interaction for Instance Goal Navigation`：https://arxiv.org/abs/2606.03175
