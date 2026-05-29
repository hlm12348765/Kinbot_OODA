# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-28
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-28 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮本地日更时官方最新 Robotics listing 为 `Wednesday, 27 May 2026`，合计 `59` 篇 entries；其中 new submissions `31` 篇、cross submissions `9` 篇、replacement submissions `19` 篇。本轮按 `3-5` 篇强相关论文 + 候选排除表口径，收录动态瓶颈安全导航、具身工具调用能力、住宅社交导航、可解释任务规则学习和复合不确定性主动感知相关 5 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-28。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮本地日更时官方 `cs.RO/new` 尚未出现以 `Thursday, 28 May 2026` 为 listing 日期的新 Robotics 批次；官方最新 Robotics listing 为 `Wednesday, 27 May 2026`，合计 `59` 篇 entries；其中 new submissions `31` 篇、cross submissions `9` 篇、replacement submissions `19` 篇。
3. 官方 `cs.RO/recent` 中 `Wed, 27 May 2026` 显示 `40` 篇 recent entries，对应 new submissions 与 cross submissions，不含 replacement；本轮以 `cs.RO/new` 的完整结构作为主口径。
4. 本轮先排除 2026-05-22 至 2026-05-27 主卡片已覆盖的端侧实时推理调度、纯视觉深度不确定性、相对 3D 导航地图、隐式意图导航、主动询问、老人认知辅助、具身问答决策、运行时治理和 VLA / world model 饱和条目。
5. `replacement` / `cross-list` 只在新增 Kinbot 评测项、治理项或端侧资源判断时收录；本轮主卡片中仅 `Breaking the Epistemic Trap` 来自 cross submission，因为它直接补充复合不确定性与主动感知安全指标。replacement 条目均未进入主卡片。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是继续增加泛 `VLA`、manipulation、humanoid、自动驾驶或多机器人论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：动态近失效导航风险、工具调用准入、住宅社交导航反应距离、可解释任务规则、复合不确定性主动探测。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 `59` 篇 entries 自动扩张主卡片数量；泛 `VLA` 连续学习、细粒度操作监督、humanoid parkour、自动驾驶 VLM / world model、多机器人通信和农业 / 水下 / 空中机器人继续作为低相关或饱和主题处理。
2. `NightSight` 对暗光导航有资源信号，但依赖 event camera、coded aperture 和红外点投影，与 Kinbot 一代纯视觉产品主线和传感边界不完全一致，因此进入候选排除表。
3. `LAD-VF` 和 `Governed Capability Evolution` 是有价值的治理型 replacement；其中后者已在 2026-05-12 主卡片收录，前者与既有自然语言安全执行、形式化反馈和运行时治理主题相邻，本轮不以 replacement 填充主卡片。

## 2. 本轮总判断

本轮官方 Robotics listing 从 2026-05-26 切到 `Wednesday, 27 May 2026`，论文池里真正对 Kinbot 有增量的不是继续扩大 VLA 或通用 world model，而是把 Phase 5 的验证对象继续往“可记录、可解释、可回滚”的工程字段收敛：动态瓶颈中要评估近失效承诺风险，agent 工具化要评估何时调用和调用链是否可靠，住宅走廊导航要把礼貌 / 平顺 / 安全纳入远距离行为，家庭任务学习要保留可解释规则，安全主动感知要识别状态不确定性与动力学不确定性叠加后的失败。

本轮对 Kinbot 有 5 个增量判断：

1. **动态障碍风险不是碰撞瞬间才出现，而是提前被速度选择锁死**：`RCSP` 关注 mobile robot 在动态瓶颈里的 predictive near-miss commitment，用短时障碍未来、尾部风险惩罚和本地安全检查补充导航栈。Kinbot 应把 `near_miss_commitment_risk`、`future_obstacle_scenario_sampled`、`risk_tail_penalty` 和 `dynamic_bottleneck_defer_reason` 写入导航回放。
2. **具身能力工具化不能只看工具是否存在，而要测会不会正确调用**：`ETP / EmbodiedToolBench` 将感知、认知、推理和执行能力外部化为工具，并评估 tool necessity、selection、execution、tool-chain composition。Kinbot 的机器人 Agent 系统应先沉淀工具注册、准入、超时、失败回滚和调用链可审计指标，不把“工具多”写成能力强。
3. **住宅社交导航要提前让人感到安全和礼貌，而不是贴近后才避让**：`Look Further` 的住宅走廊用户研究显示，超过 8 米的 proactive lane-changing 能提升安全、平顺和礼貌感知；但盲角场景偏好不一致。Kinbot 的高端产品感需要把 `early_human_reaction_distance`、`proactive_lateral_offset`、`politeness_score` 和 `blind_corner_uncertainty` 纳入试点观察。
4. **家庭任务学习需要可解释规则，而不是只保存演示轨迹**：`ILP Task Rules` 用 inductive logic programming 从演示和先验知识中学习可解释、可复用的高层任务规则。Kinbot 可把常见家庭例程、禁区、提醒流程和照护协同转为可审计规则候选，但暂不引入开放式 LfD 在线学习。
5. **不确定性会复合放大，安全系统要知道什么时候主动探测**：`Breaking the Epistemic Trap` 指出状态估计不确定性和动力学不确定性叠加时会比单独不确定性更危险，并提出在线可计算的 `Compound Uncertainty Coefficient` 与信息寻求策略。Kinbot 可将其转成 `compound_uncertainty_score`、`active_reobserve_required` 和 `safety_constraint_tightened_reason`，不新增不可审计在线 RL。

周度滚动判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 动态导航风险、近失效承诺、社会导航提前让行 | 值得进入专题 | 将 `RCSP` 与前序风险场、动态目标检测、隐式意图导航、住宅社交导航合并，形成动态家庭通行与高端产品感回放字段包。 |
| 具身工具调用、能力外部化、运行时治理 | 值得专题跟踪 | `ETP` 与前序 runtime governance、端侧 DAG 调度、能力升级回滚应合并为工具注册 / 调用 / 回滚 / 资源契约专题。 |
| 可解释任务规则、自然语言安全执行、形式化反馈 | 接近专题成熟 | `ILP Task Rules`、`LAD-VF`、自然语言时序逻辑和安全可审计规划已形成足够输入；下一步应收敛为规则资产生命周期和人审流程。 |
| 主动感知与复合不确定性 | 仍有增量 | 将 `Compound Uncertainty Coefficient` 与前序视觉深度不确定性、置信门控、主动重观察合并，重点定义何时慢行、何时重看、何时请求人工。 |
| 泛 `VLA`、manipulation world model、humanoid whole-body、自动驾驶 VLM / world model、多机器人 fleet | 已饱和 | 只有新增 Kinbot 家庭移动实机闭环、端侧资源实测、安全审计字段或老人照护任务映射时才进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把动态风险规划器、工具协议、长期演示规则学习、复合不确定性主动 RL、形式化 LLM prompt 自动微分、VLA 连续学习和暗光事件相机都写成 Kinbot 一代在线架构，会明显过复杂”。建议只吸收为 5 类轻量验证对象：动态近失效风险字段、工具调用准入与失败回滚、住宅社交导航行为指标、可解释任务规则资产、复合不确定性触发的主动重观察 / 慢行 / 人工确认。暂不新增通用在线 RL、VLA 连续学习主链路、红外结构光暗光导航产品线或开放式工具市场。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | RCSP: Risk-Sensitive Conjectural Scenario Planning for Safe Dynamic Robot Navigation | 进入动态家庭通行安全专题，转成近失效承诺、短时障碍未来、尾部风险和本地安全检查回放字段。 |
| A- | Enabling Extensible Embodied Capabilities with Tools | 进入机器人 Agent 工具治理专题，补充工具注册、调用必要性、选择正确性、执行结果和链式回滚评测。 |
| B+ | Look Further: Socially-Compliant Navigation System in Residential Buildings | 进入住宅社交导航与高端产品感评测，优先验证提前让行、走廊侧移、盲角不确定性和用户感知。 |
| B+ | Learning Compositional Symbolic Task Rules from Demonstrations with Inductive Logic Programming | 作为家庭例程 / 照护流程可解释规则候选，先做离线规则资产，不上线开放式 LfD。 |
| B | Breaking the Epistemic Trap: Active Perception Under Compound Uncertainty | 作为主动感知安全指标候选，吸收复合不确定性和主动重观察字段，不引入在线 RL 主链路。 |

## 3. 论文卡片

### 3.1 RCSP: Risk-Sensitive Conjectural Scenario Planning for Safe Dynamic Robot Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.26348](https://arxiv.org/abs/2605.26348) |
| 本轮 listing 口径 | 2026-05-27 官方 listing new submission；abs 页显示 `Submitted on 25 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | dynamic robot navigation, predictive near-miss commitment, short-horizon obstacle futures, risk-sensitive planning, Nav2 safety layer |

摘要要点转述：

论文关注移动机器人在动态瓶颈中的近失效问题：机器人可能当前尚未碰撞，但一个看似可行的速度会让它很快进入被移动障碍封死的通道。作者提出 `RCSP`，作为一层风险敏感的 conjectural scenario planning 模块，对候选控制命令采样短时障碍未来，维护局部运动猜测的轻量 belief，并对高风险尾部进行惩罚，再通过本地安全检查执行。仿真中该方法在 MuJoCo bottleneck 任务上实现无碰撞到达，并在 ROS2 / Gazebo 中给标准 Nav2 stack 降低动态近失效；但在 DynaBARN / Jackal transfer 中，调优后的 DWA 和 TEB 在严格成功率上仍更强，说明 RCSP 更像补充性风险层，而不是通用替代导航栈。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`safety_compliance_authorization` 与 `observability_data_governance` 中“动态家庭通行如何避免被自己提前选择的动作锁死”的问题。
2. Kinbot 在走廊、门口、老人 / 宠物 / 儿童移动、家属迎面而来、窄通道会车等场景中，真正风险可能在碰撞前几秒已经形成。
3. 对应 Phase 5：建议增加 `near_miss_commitment_risk`、`future_obstacle_scenario_sampled`、`risk_tail_penalty`、`dynamic_bottleneck_defer_reason`、`local_safety_layer_intervention` 和 `strict_success_vs_secondary_safety_tradeoff` 字段。

资源消耗与部署信号：

1. 论文定位是轻量 belief、短时采样和本地安全检查，方向上比重型 world model 更贴近端侧移动机器人。
2. 方法引入额外 latency，Kinbot 需要在 `12GB RAM + 32GB Flash` 与实际 SoC 上验证规划周期、视觉感知延迟和控制闭环是否仍满足低速家庭通行要求。
3. DynaBARN / Jackal transfer 中传统方法仍有优势，说明不能把 RCSP 直接写成主导航栈替代，只能作为动态瓶颈风险回放和候选安全层。

优势：

1. 把“快要撞”提前为“当前速度是否把未来通道锁死”，比单纯碰撞检测更适合家庭走廊和门口。
2. 能低成本转成 Phase 5 回放字段，帮助解释为什么系统选择慢行、等待、退让或请求确认。
3. 与当前纯视觉主线不冲突，主要影响局部规划和安全日志。

劣势与风险：

1. 依赖对动态障碍短时未来的合理猜测，家庭中人和宠物的非理性移动会带来长尾风险。
2. 若采样和风险评估做得过重，会增加端侧规划延迟。
3. 若作为强安全层直接接管导航，可能过度保守，损伤产品平顺性。

推荐理由：

建议作为 A- 级输入。它不改变 Kinbot 导航主线，但能把动态家庭通行安全从“碰撞 / 不碰撞”推进到“是否提前形成不可逆近失效承诺”的可测指标。

### 3.2 Enabling Extensible Embodied Capabilities with Tools

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.26637](https://arxiv.org/abs/2605.26637) |
| 本轮 listing 口径 | 2026-05-27 官方 listing new submission；abs 页显示 `Submitted on 26 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | embodied tools, Embodied Tool Protocol, tool registration, tool selection, tool-chain composition, EB-Navigation |

摘要要点转述：

论文批评把感知、推理、规划和控制都压进统一参数化策略的做法，因为这些能力层级不同、异构性强，也很难可靠模块化。作者提出 capability externalization：将具身能力拆成独立优化、推理时动态调用的工具，并定义 `Embodied Tool Protocol`，覆盖工具注册、发现、调用和执行；同时整理超过 100 个经过验证的工具，构建 `EmbodiedToolBench`，评估工具增强是否改善具身任务，以及模型是否知道何时需要工具、选择哪个工具、能否正确执行和组合工具链。实验显示工具外部化在 EB-ALFRED 与 EB-Navigation 上提升明显，但对执行类能力帮助有限，且“什么时候、调用哪个、如何调用”仍是当前模型的核心短板。

解决 Kinbot 的什么问题：

1. 对应 `interaction_orchestration`、`platform_runtime`、`safety_compliance_authorization` 和 `observability_data_governance` 中“机器人 Agent 系统如何接工具而不失控”的问题。
2. Kinbot 一代需要调用导航、记忆、语音、健康提醒、家属 App、后台服务和安全授权等能力；关键不是工具数量，而是调用必要性、权限、超时、失败回滚和审计链。
3. 对应 Phase 5：建议增加 `tool_necessity_recognized`、`tool_selection_correct`、`tool_execution_result`、`tool_chain_composition_depth`、`tool_timeout_or_rollback`、`tool_permission_gate` 和 `execution_tool_boundary_failed` 字段。

资源消耗与部署信号：

1. 工具化本身可以降低单一大模型承载全部能力的压力，但会增加运行时编排、接口治理和日志复杂度。
2. 论文没有给出 Kinbot 级端侧资源曲线；如果工具调用依赖云端模型或重型 VLM，仍会触发隐私、延迟和成本风险。
3. 对 Kinbot 更现实的落点是先定义工具协议、权限和回滚字段，而不是引入通用工具库或开放式插件生态。

优势：

1. 与 Kinbot 当前“多执行范式 + 安全授权 + 端侧 / 后台边界”的架构方向匹配。
2. 明确指出执行类工具仍是短板，能防止把 tool-augmented agent 误写成自动可靠执行器。
3. `tool necessity / selection / execution / composition` 四段指标可直接转成 Phase 5 回放维度。

劣势与风险：

1. 工具协议若过早泛化，会增加接口面和测试矩阵。
2. 工具链过长会放大错误传播和资源不可控风险。
3. 如果工具调用缺少权限和审计，可能绕过安全合规授权边界。

推荐理由：

建议作为 A- 级输入。它能帮助 Kinbot 把机器人 Agent 系统从“会调用很多工具”的叙事收敛为“何时可调用、如何验证、失败如何回滚”的工程契约。

### 3.3 Look Further: Socially-Compliant Navigation System in Residential Buildings

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.26710](https://arxiv.org/abs/2605.26710) |
| 本轮 listing 口径 | 2026-05-27 官方 listing new submission；abs 页显示 `Submitted on 26 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | socially-compliant navigation, residential hallway, proactive lane changing, human perception, HRI user study |

摘要要点转述：

论文研究住宅楼走廊里的移动机器人社交导航。传统社会导航常在机器人接近人的个人空间后再减速、停止或避障，而作者认为反应距离本身会影响用户对机器人安全、平顺和礼貌的感知。论文提出 `Proactive Lane-Changing` 行为：当机器人在走廊中迎面遇到人时，在超过 8 米的位置就从走廊中央横向移到侧边，提前释放意图和空间。42 名参与者的用户研究显示，在直走廊迎面相遇场景中，这种提前侧移相较减速、停止和近距离反应避障，在安全、平顺、礼貌三个目标上都有显著改善；但盲角交叉场景中不同模式并无统一优势，用户偏好多样。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`interaction_orchestration` 与“聪明、温暖、精致”的高端产品感问题。
2. Kinbot 家庭和养老场景里，老人、家属和宠物不只关心机器人是否不会撞人，也关心机器人是否提前表达意图、是否让人不紧张、是否显得有礼貌。
3. 对应 Phase 5：建议增加 `early_human_reaction_distance`、`proactive_lateral_offset`、`social_navigation_politeness_score`、`smoothness_perception_score`、`blind_corner_uncertainty` 和 `human_preference_divergence` 字段。

资源消耗与部署信号：

1. 方法主要是导航行为策略，不依赖大模型或新增传感器；端侧资源压力低。
2. 需要可靠的人体检测、走廊可通行宽度判断和运动意图预测；若视觉检测不稳定，提前侧移可能误触发。
3. 家庭室内空间比住宅楼走廊更窄、杂物更多，Kinbot 必须验证最小通道宽度、侧移幅度和礼貌行为是否与安全避障冲突。

优势：

1. 直接把导航行为与用户感知连接起来，适合 Kinbot 高端产品感评测。
2. 提前侧移比“贴近后急停”更符合老人场景的舒适性和可预测性。
3. 不改变纯视觉和端侧边界，可以先作为试点行为 AB 测试。

劣势与风险：

1. 研究场景是走廊式住宅楼，不等于真实家庭客厅、卧室、厨房和门口混合空间。
2. 盲角场景偏好不一致，说明不能把单一社交导航模式写成通用最优。
3. 如果过度提前让行，可能降低效率或造成绕行不自然。

推荐理由：

建议作为 B+ 级输入。它补足 Kinbot 评测中容易缺失的“人感知到的安全和平顺”，但当前只进入试点指标，不改写导航主算法。

### 3.4 Learning Compositional Symbolic Task Rules from Demonstrations with Inductive Logic Programming

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.26828](https://arxiv.org/abs/2605.26828) |
| 本轮 listing 口径 | 2026-05-27 官方 listing new submission；abs 页显示 `Submitted on 26 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | learning from demonstration, inductive logic programming, symbolic task rules, interpretable task structure, reusable abstractions |

摘要要点转述：

论文关注从演示中学习任务时，不应只学习低层动作轨迹，还应学习能够解释行为的高层任务结构。作者用 inductive logic programming 表示和学习机器人任务，将复杂任务拆为不同本体层级上的简单学习目标，并结合演示和先验领域知识推断符号规则；较低层学到的规则可被更高层任务复用。实验在合成积木装配场景中验证，学到的抽象规则具备可解释性，并能泛化到更难、包含未见对象的保留任务。作者将该结果定位为 task-level LfD 的初步证据。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`interaction_orchestration` 与 `safety_compliance_authorization` 中“家庭例程和照护流程如何被解释、复用和审计”的问题。
2. Kinbot 会遇到药物提醒、巡护路线、禁区规则、老人作息、家属确认流程等长期任务；这些内容不宜只沉淀为黑箱轨迹或自由文本记忆。
3. 对应 Phase 5：建议增加 `learned_task_rule_candidate`、`rule_source_demonstration_id`、`domain_prior_used`、`rule_reuse_level`、`rule_human_review_required` 和 `rule_conflict_detected` 字段。

资源消耗与部署信号：

1. ILP 规则学习不是重型在线大模型方向，更适合离线或半人工的规则资产整理。
2. 合成积木场景与 Kinbot 家庭照护任务差距大，不能直接迁移为开放式家庭技能学习。
3. 若规则学习在线化，需要处理错误演示、家庭成员偏好冲突、规则过期和删除权。

优势：

1. 强调可解释、可复用和人可读，符合 Kinbot 家庭安全与照护边界。
2. 可与自然语言安全执行、形式化反馈和任务规则资产生命周期专题合并。
3. 不要求改变传感器或端侧算力主线。

劣势与风险：

1. 论文证据仍是初步和合成场景，距离真实家庭部署较远。
2. 规则抽象过多会造成维护成本，过少又无法覆盖真实任务变化。
3. 如果把演示自动升级为规则，可能把用户偶然行为误写成稳定偏好。

推荐理由：

建议作为 B+ 级输入。它适合为 Kinbot 的家庭例程和照护流程建立可解释规则资产候选，但只应从离线回放和人审开始。

### 3.5 Breaking the Epistemic Trap: Active Perception Under Compound Uncertainty

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.26627](https://arxiv.org/abs/2605.26627) |
| 本轮 listing 口径 | 2026-05-27 官方 listing cross submission from `eess.SY`；abs 页显示 `Submitted on 26 May 2026`。因新增复合不确定性与主动感知安全指标，本轮进入主卡片 |
| 分类 | `eess.SY`, `cs.RO` |
| 方法关键词 | active perception, compound uncertainty, epistemic trap, Compound Uncertainty Coefficient, regime-adaptive safety constraints |

摘要要点转述：

论文讨论安全关键系统在陌生条件下的失败，不把问题归结为单一的动力学变化或观测不完整，而是强调二者的耦合：agent 不知道真实状态就难以学习动力学，不知道动力学又难以估计状态，形成 `Epistemic Trap`。作者用模拟 locomotion 作为 proof-of-concept，显示状态和动力学不确定性叠加时的性能退化明显大于单独加入其中一种不确定性。论文提出 `Adaptive Safety Architecture`，包括在线可计算的 `Compound Uncertainty Coefficient`、基于互信息的信息寻求策略，以及随不确定性耦合增强而收紧的安全约束，主张安全系统应从被动鲁棒转向主动探测。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory`、`safety_compliance_authorization` 与 `observability_data_governance` 中“系统何时应该主动重看、慢行或转人工”的问题。
2. Kinbot 在低光、遮挡、地面反光、家具移动、轮滑、老人突然移动等场景中，视觉状态不确定和运动模型不确定常同时出现；单一置信分数可能低估风险。
3. 对应 Phase 5：建议增加 `compound_uncertainty_score`、`state_dynamics_coupling_detected`、`active_reobserve_required`、`information_gain_action_taken`、`safety_constraint_tightened_reason` 和 `human_confirmation_required_due_to_uncertainty` 字段。

资源消耗与部署信号：

1. 论文是方法框架与 proof-of-concept，不提供 Kinbot 端侧部署曲线。
2. `Compound Uncertainty Coefficient` 方向适合先作为日志和回放分析字段，而不是在线 RL 控制器。
3. 若引入主动探测行为，会增加时间成本和打扰成本，需要与用户体验、导航效率和安全门控一起评估。

优势：

1. 能解释为什么“视觉不准 + 运动模型不准”比单独任一问题更危险。
2. 与 Kinbot 已跟踪的深度不确定性、置信门控、主动重观察和安全降级形成闭环。
3. 提供了从被动鲁棒到主动获取信息的评测语言。

劣势与风险：

1. 证据主要来自模拟 locomotion，距离家庭机器人真实导航仍远。
2. 如果把主动探测策略做成在线 RL，审计和安全证明成本会变高。
3. 不确定性指标过多会让 Phase 5 回放体系膨胀，需要合并到少数关键字段。

推荐理由：

建议作为 B 级输入。它适合补充 Kinbot 对复合不确定性的安全解释，但当前只作为回放和门控指标候选，不新增在线学习主链路。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| Provably Safe Motion Planning Under Unknown Disturbances | [2605.26625](https://arxiv.org/abs/2605.26625) | 2026-05-27 new submission | chance-constrained planning 和 Wasserstein ambiguity tube 对安全规划有价值，但本轮已由 `RCSP` 覆盖更贴近动态家庭瓶颈的风险判断；该文偏理论和通用 motion planning，暂作为安全规划专题候选。 |
| NightSight: Passive Computation for Navigation in Dark Using Events | [2605.26330](https://arxiv.org/abs/2605.26330) | 2026-05-27 new submission | Jetson Orin Nano `20 Hz`、暗光深度 `2.5m` 信号对夜间闭环有启发，但依赖 event camera、coded aperture 与红外点投影；与 Kinbot 一代纯视觉产品主线和传感边界不完全一致，不作为当前主卡片。 |
| LAD-VF: LLM-Automatic Differentiation Enables Fine-Tuning-Free Robot Planning from Formal Methods Feedback | [2509.18384](https://arxiv.org/abs/2509.18384) | 2026-05-27 replacement | 形式化验证反馈和 auditable prompts 对自然语言安全执行有价值，但属于 replacement，且近期已覆盖自然语言时序逻辑、安全可审计规划和 runtime governance；先作为规则 / prompt 治理专题候选。 |
| Governed Capability Evolution: Lifecycle-Time Compatibility Checking and Rollback for AI-Component-Based Systems | [2604.08059](https://arxiv.org/abs/2604.08059) | 2026-05-27 replacement | AI 能力升级、shadow deployment、rollback 与 Kinbot 高度相关，但已在 2026-05-12 主卡片收录；本轮不重复。 |
| LocateAnything: Fast and High-Quality Vision-Language Grounding with Parallel Box Decoding | [2605.27365](https://arxiv.org/abs/2605.27365) | 2026-05-27 cross submission from `cs.CV` | 并行 box decoding 对视觉 grounding 速度有资源启发，但数据规模和通用 VLM 方向偏大；未直接新增 Kinbot 家庭移动、老人照护或安全回放字段。 |
| FineVLA: Fine-Grained Instruction Alignment for Steerable Vision-Language-Action Policies | [2605.27284](https://arxiv.org/abs/2605.27284) | 2026-05-27 new submission | 细粒度 action-aligned supervision 对操作式 VLA 有价值，但核心仍是 manipulation / dual-arm；Kinbot 一代不扩张灵巧操作或 VLA 主控。 |
| Can VLA Models Learn from Real-World Data Continually without Forgetting? | [2605.26820](https://arxiv.org/abs/2605.26820) | 2026-05-27 new submission | 真实 VLA 连续学习和灾难性遗忘重要，但任务是操作演示；与 Kinbot 一代导航、健康提醒和安全治理的新增判断弱，且 VLA 主题近期已饱和。 |
| SOLE-R1: Video-Language Reasoning as the Sole Reward for On-Robot Reinforcement Learning | [2603.28730](https://arxiv.org/abs/2603.28730) | 2026-05-27 replacement | 视频语言 rewarder 和抗 reward hacking 对机器人学习有研究价值，但 replacement 且仍是在线 RL / manipulation 训练框架；不进入一代家庭样机在线能力。 |
| Riding the Shifting Potential: When Reactive Control Suffices for Multi-Goal Behavior | [2605.27314](https://arxiv.org/abs/2605.27314) | 2026-05-27 new submission | 通过图式 world model 和 nullspace projection 处理多目标冲突有规划启发，但本轮 `RCSP` 与住宅社交导航对 Kinbot 动态通行更直接；暂作为局部规划理论候选。 |
| Towards Real-World Identification of Fatigued Muscle Groups via Musculoskeletal Simulation | [2605.26151](https://arxiv.org/abs/2605.26151) | 2026-05-27 cross submission from `physics.med-ph` | 接触less fatigue 识别与健康管理相邻，但当前是肌肉疲劳诊断研究；Kinbot 一代不能扩展医疗诊断能力，只保留为远期非诊断健康观察参考。 |

## 5. 对 Kinbot 的落地 / 文档建议

本轮建议只作为研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。原因是 5 篇主卡片只新增 Phase 5 回放字段、专题候选和评测语言，没有形成需要改变一代纯视觉主线、端侧 / 云边界、传感器主线、成本基线或 Phase 5 门控的稳定产品判断。

建议后续轻量落地动作：

1. 在动态导航与社交通行回放字段候选中补充 `near_miss_commitment_risk`、`future_obstacle_scenario_sampled`、`early_human_reaction_distance`、`proactive_lateral_offset`、`blind_corner_uncertainty`。
2. 在机器人 Agent 工具治理字段候选中补充 `tool_necessity_recognized`、`tool_selection_correct`、`tool_execution_result`、`tool_chain_composition_depth`、`tool_timeout_or_rollback`、`tool_permission_gate`。
3. 在任务规则与家庭长期记忆专题中补充 `learned_task_rule_candidate`、`domain_prior_used`、`rule_human_review_required`、`rule_conflict_detected`，并明确规则资产不得由单次演示自动冻结。
4. 在纯视觉安全与主动感知专题中补充 `compound_uncertainty_score`、`state_dynamics_coupling_detected`、`active_reobserve_required`、`safety_constraint_tightened_reason`，并把它们合并到少数关键回放字段，避免指标膨胀。

本轮未进入主线的原因：这些论文主要改变“怎么记录动态风险、工具调用、社交导航感知、任务规则和复合不确定性”，不改变“Kinbot 一代必须纯视觉、端侧处理敏感原始数据、12GB + 32GB 默认量产线、移动而非操作”的主线边界。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent` 官方 listing：[https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
3. `RCSP: Risk-Sensitive Conjectural Scenario Planning for Safe Dynamic Robot Navigation`：[https://arxiv.org/abs/2605.26348](https://arxiv.org/abs/2605.26348)
4. `Enabling Extensible Embodied Capabilities with Tools`：[https://arxiv.org/abs/2605.26637](https://arxiv.org/abs/2605.26637)
5. `Look Further: Socially-Compliant Navigation System in Residential Buildings`：[https://arxiv.org/abs/2605.26710](https://arxiv.org/abs/2605.26710)
6. `Learning Compositional Symbolic Task Rules from Demonstrations with Inductive Logic Programming`：[https://arxiv.org/abs/2605.26828](https://arxiv.org/abs/2605.26828)
7. `Breaking the Epistemic Trap: Active Perception Under Compound Uncertainty`：[https://arxiv.org/abs/2605.26627](https://arxiv.org/abs/2605.26627)
8. 候选排除表条目：[`Provably Safe Motion Planning`](https://arxiv.org/abs/2605.26625)、[`NightSight`](https://arxiv.org/abs/2605.26330)、[`LAD-VF`](https://arxiv.org/abs/2509.18384)、[`Governed Capability Evolution`](https://arxiv.org/abs/2604.08059)、[`LocateAnything`](https://arxiv.org/abs/2605.27365)、[`FineVLA`](https://arxiv.org/abs/2605.27284)、[`VLA Continual Learning`](https://arxiv.org/abs/2605.26820)、[`SOLE-R1`](https://arxiv.org/abs/2603.28730)、[`Riding the Shifting Potential`](https://arxiv.org/abs/2605.27314)、[`Fatigued Muscle Groups`](https://arxiv.org/abs/2605.26151)
