# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-24
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-24 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 仍为 `Friday, 22 May 2026`，合计 `74` 篇 entries；其中 new submissions `38` 篇、cross submissions `15` 篇、replacement submissions `21` 篇。2026-05-24 本地日更时尚未出现新的周末 Robotics 批次，且同一 `2026-05-22` listing 已在 2026-05-23 覆盖主卡片与候选排除，本轮采用“同一官方 listing 饱和后的近期待补录 + 周度滚动判断”口径，只收录对 Kinbot 规划资源门控、底层执行物理可实现性和具身能力诊断评测有明确增量价值的 3 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-24。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期仍为 `Friday, 22 May 2026`，合计 `74` 篇 entries；其中 new submissions `38` 篇、cross submissions `15` 篇、replacement submissions `21` 篇。
3. 本轮检索时官方 `cs.RO/recent` 显示最新 Robotics recent 批次仍为 `Fri, 22 May 2026`，该日期 recent entries 为 `53` 篇，对应 new submissions 与 cross submissions，不含 replacement。
4. 本轮本地日期为 2026-05-24，官方尚未出现新的 `Saturday, 23 May 2026` 或 `Sunday, 24 May 2026` Robotics 批次；因此不把 `2026-05-24` 写成新的官方 Robotics listing 日期。
5. 本轮先排除 2026-05-23 主卡片已收录的 `2605.22816`、`2605.21935`、`2605.22446`、`2604.07833`，以及候选排除表中已明确处理的同一 listing 条目；本轮新增主卡片 `2605.22138`、`2605.10696`、`2510.08759` 未进入前序主卡片。
6. 本轮不固定凑满 `10` 篇，也不硬凑 `3-5` 篇；由于同一官方 listing 已连续覆盖，主卡片只保留 3 篇能改变 Kinbot 评测字段、资源门控或底层安全判断的论文，其余进入候选排除表。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是继续增加泛 `VLA`、world model、灵巧操作、自动驾驶 benchmark 或多机器人协作数量。
2. 是否能映射到 Kinbot 现有模块：`decision_orchestration`、`platform_runtime`、`safety_compliance_authorization`、`mobility_navigation`、`world_state_memory`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：规划调用门控、推理 token / 延迟预算、底层执行物理可实现性、具身 MLLM 技能级失败归因。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. replacement / cross-list 仅在新增 Kinbot 评测项或治理项时收录；本轮 `SR2AM` 为 `cs.AI` cross submission，纳入原因是它直接提供“何时调用重规划 / 模拟推理”的资源门控口径。
2. `VRA` 与 `BEAR` 均为 replacement，本轮纳入原因分别是新增底层执行物理可实现性检查和具身 MLLM 技能级诊断评测；两者只作为研究输入和 Phase 5 字段候选，不写成已确认架构变更。
3. `TRM`、`SiRA`、`EvoScene-VLA`、`SceneGraphGrounder`、`FUSE`、`FSAR` 等条目有研究价值，但与近期 world model、空间图、VLA 或运行时治理主题高度重叠，或载体偏多机器人 / LiDAR-IMU / 灵巧操作；本轮进入候选排除表。

## 2. 本轮总判断

本轮官方 Robotics listing 与 2026-05-23 完全相同，已经不能按“更多论文”推进。真正有增量的是把上一轮的自感知导航、动态记忆、预执行验证和 runtime governance 再向三个更底层的问题收敛：重规划什么时候值得花算力、运动控制命令什么时候在电压 / 执行层不可实现、具身 MLLM 失败究竟是感知、时空建模还是高层规划问题。

本轮对 Kinbot 有 3 个增量判断：

1. **规划不是越频繁越安全，而是要有调用门控和预算记录**：`SR2AM` 说明高层 agentic reasoning 可以拆成模拟规划、自调节和反应式执行三段。Kinbot 不应每个移动 / 交互动作都调用重型推理，而应记录 `planning_invocation_reason`、`planning_horizon`、`reasoning_token_budget` 和 `reactive_execution_allowed`。
2. **安全执行不能只看几何约束，还要看底层物理可实现性**：`VRA` 提醒“加速度在运动学上合法”不等于电机 / 电压层可以稳定执行。Kinbot 的底盘、升降、头部或屏幕运动都需要在低电量、温升、老化和近约束边界下记录 `actuation_feasibility_reject` 与 `constraint_near_boundary_oscillation`。
3. **具身模型评测要从任务成功率下钻到技能级失败归因**：`BEAR` 将 embodied MLLM 能力拆成 14 个 atomic skills，并指出感知瓶颈与不稳定时空建模会被传统任务级 benchmark 掩盖。Kinbot 的 Phase 5 回放应区分“看错、记错、时序错、规划错、权限错”，而不是只记录任务成功 / 失败。

周度滚动判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 具身安全、拒答 / 澄清、预执行验证、runtime governance | 值得进入专题 | 已连续多日出现高价值论文；下一步应合并为“指令安全 + 动作执行安全 + 运行时准入 / 回滚”测试包，而不是继续新增在线 agent 层。 |
| 规划资源门控与端侧推理预算 | 值得专题跟踪 | 将 `SR2AM` 与前序 VPR token pruning、Pre-VLA、异步 VLA 延迟条目合并，建立推理 token、延迟、内存、热和收益的 profiling 表。 |
| 底层执行物理可实现性 | 仍有增量 | `VRA` 提醒语义安全之外还要有电压 / 扭矩 / 温升 / 近约束振荡字段；适合进入底盘和运动控制 Phase 5 回放，不改变产品形态。 |
| 具身 MLLM 技能级评测 | 值得专题跟踪 | 将 `BEAR` 与 RoboJailBench、ESI-Bench、VLM-LLM navigation bottleneck 合并，形成按技能归因的失败标签体系。 |
| 泛 `VLA`、world model、3D scene graph、humanoid manipulation、多机器人协作 | 已饱和 | 只有出现家庭移动实机闭环、端侧资源实测、安全审计新增证据或老人照护任务映射时才进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把自调节规划器、world model 规划器、VRA 底层接口、BEAR-Agent 工具链、SceneGraphGrounder、FSAR 都变成在线组件，会明显过复杂”。建议只吸收为 4 类轻量字段：规划调用原因与预算、动作物理可实现性、具身技能级失败标签、同一 listing 饱和后的专题合并动作。暂不新增在线 world model 主控、能力市场、机器人内部多 agent 社会、RGB-D 场景图主链路或灵巧操作安全层。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | Dissecting Embodied Abilities in Multimodal Language Models through Skill-level Evaluation and Diagnosis | 转成 Phase 5 失败归因标签：低层感知、时空建模、空间推理、规划、指令理解、权限治理。 |
| A- | Efficient Agentic Reasoning Through Self-Regulated Simulative Planning | 转成规划资源门控字段：规划调用原因、规划深度、token / 延迟预算、是否允许反应式执行。 |
| B+ | VRA: Grounding Discrete-Time Joint Acceleration in Voltage-Constrained Actuation | 转成底层执行安全候选：电压可实现性、近约束振荡、低电量 / 温升下的动作拒绝和降级。 |

## 3. 论文卡片

### 3.1 Efficient Agentic Reasoning Through Self-Regulated Simulative Planning

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.22138](https://arxiv.org/abs/2605.22138) |
| 本轮 listing 口径 | 2026-05-22 官方 listing cross submission from `cs.AI`，同一 listing 近期待补录；abs 页显示 `Submitted on 21 May 2026` |
| 分类 | `cs.AI`, `cs.CL`, `cs.LG`, `cs.RO` |
| 方法关键词 | self-regulated planning, simulative reasoning, reactive execution, reasoning token budget, LLM world model |

摘要要点转述：

论文讨论 agent 何时应该规划、规划到多深，以及如何避免把所有任务都塞进长链式推理。作者把决策拆成三段：模拟规划负责用 world model 预测未来状态，自调节模块决定是否需要规划和规划深度，反应式执行负责细粒度动作。系统 `SR2AM` 以 LLM 作为 world model，通过有监督学习和强化学习训练规划结构，在数学、科学、表格分析和网页信息检索任务中，用 8B / 30B 模型取得接近更大模型的表现，同时减少大量 reasoning tokens；强化学习后，模型更倾向于把必要任务规划得更远，而不是把规划调用次数简单堆高。

解决 Kinbot 的什么问题：

1. 对应 `decision_orchestration` 与 `platform_runtime` 中“什么时候调用重型推理 / 重规划”的问题。
2. Kinbot 的日常巡航、避障、回充、简单回应不应都调用高成本模拟规划；但涉及老人安全、权限冲突、跨房间多阶段任务或云端知识调用时，需要显式规划与预算记录。
3. 对应 Phase 5：建议增加 `planning_invocation_reason`、`planning_horizon`、`reasoning_token_budget`、`planner_skip_reason`、`reactive_execution_allowed`、`planning_latency_ms` 字段。

资源消耗与部署信号：

1. 论文的实验任务不是家庭机器人实机闭环，不能直接证明 Kinbot 端侧规划效果。
2. 其核心价值是资源门控语言：把“是否规划、规划多深、用多少 token / 延迟”变成可记录、可回放、可对比的系统字段。
3. 对 Kinbot 一代，优先落在云端 / 端云协同高层任务与离线回放；端侧只保留轻量触发条件和超时 / 降级策略，不引入在线大 world model 主控。

优势：

1. 直接回应端侧资源和用户体验之间的矛盾，避免“每步都深度思考”的过度设计。
2. 自调节模块可以转译为 Kinbot 的策略：低风险动作走反应式，高风险 / 多阶段任务才进入显式规划。
3. 与前序 Pre-VLA、runtime governance 和 VPR token pruning 可合并成统一 profiling 表。

劣势与风险：

1. 论文以 LLM 任务为主，不覆盖真实移动、传感噪声、老人干扰和安全急停。
2. LLM-as-world-model 容易产生语言上合理但物理不可靠的未来状态。
3. 如果直接上在线模拟规划器，会扩大架构复杂度和云端依赖。

推荐理由：

建议作为 A- 级输入。Kinbot 应吸收“规划调用门控 + 规划预算记录”的方法，而不是新增一个重型通用规划 agent；本轮不改变主线架构。

### 3.2 VRA: Grounding Discrete-Time Joint Acceleration in Voltage-Constrained Actuation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.10696](https://arxiv.org/abs/2605.10696) |
| 本轮 listing 口径 | 2026-05-22 官方 listing replacement，同一 listing 近期待补录；abs 页显示 `Submitted on 11 May 2026`，`last revised 21 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | voltage-realizable acceleration, low-level actuation safety, execution-level abstraction, constraint feasibility |

摘要要点转述：

论文指出，机器人控制中常见的离散时间关节加速度约束虽然能表达位置和速度限制，但在电压受限的电机执行层，运动学上看似可行的加速度可能并不能被真实执行。作者提出 `Voltage-Realizable Acceleration`，把关节加速度接口与电压约束下的执行物理绑定，只允许控制器下发电压可实现的加速度。硬件实验覆盖电动执行器和轮腿式四足机器人，结果显示该接口可以移除不可实现加速度，在接近约束边界时减少执行振荡，并让实际执行更一致。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`platform_runtime` 与 `safety_compliance_authorization` 中“底层动作是否真的可执行”的问题。
2. Kinbot 即使不做灵巧操作，也有轮式底盘、头颈 / 屏幕姿态、可能的升降或轻量机构；在低电量、温升、老化、地毯 / 门槛和近速度边界场景中，运动命令可能语义上安全但电气 / 执行层不可实现。
3. 对应 Phase 5：建议增加 `voltage_realizable_acceleration`、`actuation_feasibility_reject`、`near_constraint_oscillation`、`low_battery_motion_derate`、`motor_thermal_derate` 字段。

资源消耗与部署信号：

1. 该论文不要求新增大模型，主要增加底层控制接口、执行器模型和约束检查。
2. 对 Kinbot 更现实的路径是先在底盘控制和运动回放中记录“运动学可行但执行层拒绝”的案例，而不是改写完整控制架构。
3. 需要电机参数、驱动电压、电流、温升和负载实测；没有这些数据时不应把 `VRA` 写成已可量产方案。

优势：

1. 把安全从语义 / 几何层下探到物理执行层，补上近期具身安全论文较少覆盖的底层约束。
2. 不冲突于 Kinbot 一代纯视觉主线，也不增加云端依赖。
3. 可以直接转成 Phase 5 的底盘与机构健康回放字段。

劣势与风险：

1. 论文实验载体包含轮腿式四足，不等同于 Kinbot 的低速轮式家庭机器人。
2. 需要较完整的执行器建模和硬件实测；早期文档阶段只能作为测试字段候选。
3. 若过早抽象为统一运动接口，可能让平台层复杂度上升。

推荐理由：

建议作为 B+ 级输入。Kinbot 应把它转成“底层动作可实现性”验证项，尤其用于低电量、温升、门槛和近约束边界场景，不因此新增产品级控制架构。

### 3.3 Dissecting Embodied Abilities in Multimodal Language Models through Skill-level Evaluation and Diagnosis

| 项目 | 内容 |
| --- | --- |
| arXiv | [2510.08759](https://arxiv.org/abs/2510.08759) |
| 本轮 listing 口径 | 2026-05-22 官方 listing replacement，同一 listing 近期待补录；abs 页显示 `Submitted on 9 Oct 2025`，`last revised 21 May 2026` |
| 分类 | `cs.CV`, `cs.RO` |
| 方法关键词 | embodied MLLM benchmark, skill-level diagnosis, perception bottleneck, spatiotemporal modeling, visual-spatial tools |

摘要要点转述：

论文认为，现有具身 MLLM benchmark 多停在任务级成功率，难以解释模型失败到底来自感知、时空理解、空间推理、规划还是交互链路。作者提出 `BEAR`，把具身任务拆成 14 个 atomic skills，覆盖 6 类能力，并构建 4469 个图像 / 视频 / 文本交织样本，对 20 个 MLLM 做分层诊断。论文发现，低层感知能力常是高层推理失败的根因，而当前模型的不稳定时空建模在传统任务级评测中容易被掩盖。作者还提出 `BEAR-Agent`，用视觉和空间推理工具增强 MLLM，在 benchmark 和仿真 / 真实机器人实验中提升表现。

解决 Kinbot 的什么问题：

1. 对应 `observability_data_governance`、`world_state_memory`、`decision_orchestration` 和 `mobility_navigation` 中“任务失败如何归因”的问题。
2. Kinbot 的老人看护、找人、找物、巡航、门窗检查和异常解释，不能只看“成功 / 失败”；需要知道失败是看错人、空间关系错、记忆过期、时间顺序错、权限判断错还是规划路径错。
3. 对应 Phase 5：建议增加 `embodied_skill_failure_type`、`perception_bottleneck_case`、`spatiotemporal_instability_case`、`spatial_reasoning_tool_used`、`high_level_planning_misattribution` 字段。

资源消耗与部署信号：

1. `BEAR` 本身是评测与诊断体系，不是 Kinbot 在线模型。
2. `BEAR-Agent` 加入视觉 / 空间推理工具后会增加推理链路复杂度；Kinbot 一代不应默认将其作为在线依赖。
3. 最现实的吸收方式是用技能级标签改造离线回放和模型评测，而不是为每个 atomic skill 新增一个在线组件。

优势：

1. 直接把“具身模型失败原因”从黑盒任务成功率拆到可行动的技能级标签。
2. 低层感知瓶颈与时空建模不稳定，正好对应 Kinbot 纯视觉导航和长期家庭记忆的核心风险。
3. 可与 RoboJailBench、ESI-Bench、VLM-LLM navigation bottleneck 和本周安全专题合并。

劣势与风险：

1. benchmark 样本和真实家庭连续运行之间仍有差距。
2. 14 个 atomic skills 若直接搬进产品架构，会造成评测体系和模块层同时膨胀。
3. 论文中的工具增强 agent 不等于端侧可部署能力，需要另做资源 profiling。

推荐理由：

建议作为 A 级输入。Kinbot 应优先吸收 `BEAR` 的技能级失败归因框架，用于 Phase 5 回放、模型选型和安全评测，不新增在线工具链主控。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| Beyond Euclidean Proximity: Repairing Latent World Models with Horizon-Matched Trajectory Reachability Metrics | [2605.22164](https://arxiv.org/abs/2605.22164) | 2026-05-22 cross submission from `cs.LG` | horizon-aware reachability metric 对 world model 规划审计有价值，但本轮已用 `SR2AM` 覆盖规划调用门控；近期 world model 主题已饱和，保留为审计候选。 |
| General Agentic Planning Through Simulative Reasoning with World Models | [2507.23773](https://arxiv.org/abs/2507.23773) | 2026-05-22 replacement | 可视为 `SR2AM` 的相邻 / 前序模拟规划思路；本轮优先收录更新、更直接涉及资源自调节的 `2605.22138`，不重复扩张 world model planning。 |
| EvoScene-VLA: Evolving Scene Beliefs Inside the Action Decoder for Chunked Robot Control | [2605.21862](https://arxiv.org/abs/2605.21862) | 2026-05-22 new submission | action-updated scene state 对记忆有启发，但任务是 VLA / manipulation；上一轮已收 `MIF` 和 `Pre-VLA`，本轮不继续新增 VLA 在线记忆层。 |
| SceneGraphGrounder: Zero-Shot 3D Visual Grounding via Structured Scene Graph Matching | [2605.21788](https://arxiv.org/abs/2605.21788) | 2026-05-22 cross submission from `cs.CV` | 结构化 3D grounding 与家庭找物相关，但依赖 RGB-D 和重建 3D scene graph；近期开放词汇场景图、功能场景图和动态记忆已多次覆盖，不改写一代纯视觉主线。 |
| Federated Single-Agent Robotics: Multi-Robot Coordination Without Intra-Robot Multi-Agent Fragmentation | [2604.11028](https://arxiv.org/abs/2604.11028) | 2026-05-22 replacement | “不要把单机器人拆成内部多 agent 社会”对复杂度治理有启发，但 Kinbot 一代不是 fleet product；本轮只吸收为复杂度自检，不进入主卡片。 |
| FUSE: A Framework for Unified State Estimation in Vehicular and Robotic SLAM Systems | [2605.18047](https://arxiv.org/abs/2605.18047) | 2026-05-22 replacement | 状态估计接口分层有工程价值，但实证是 LiDAR-IMU / vehicle SLAM；与 Kinbot 一代纯视觉路线和当前文档主线不完全一致。 |
| Safe and Steerable Geometric Motion Policies for Robotic Dexterous Manipulation | [2605.21811](https://arxiv.org/abs/2605.21811) | 2026-05-22 new submission | 安全 CBF pullback 和高层残差动作接口有理论价值，但实验是 23-DOF 灵巧手；Kinbot 一代不做灵巧操作，本轮用 `VRA` 覆盖更底层且更通用的执行可实现性。 |
| Flying Together: Human-Guided Immersive Shared Control for Aerial Robot Teams in Unknown Environments | [2605.21680](https://arxiv.org/abs/2605.21680) | 2026-05-22 new submission | VR 共享控制与远程在场感有旁路启发，但载体是无人机群和沉浸式操作员；不改变 Kinbot 家庭机器人一代的人机协同边界。 |

## 5. 对 Kinbot 的落地 / 文档建议

本轮建议只作为研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。原因是 3 篇主卡片均提供评测字段、资源预算字段或底层安全检查口径，但尚未形成需要改变一代纯视觉主线、端侧 / 云边界、传感器主线、Phase 5 门控或成本基线的稳定产品判断。

建议后续轻量落地动作：

1. 在 Phase 5 回放字段候选中补充 `planning_invocation_reason`、`planning_horizon`、`reasoning_token_budget`、`planner_skip_reason`、`planning_latency_ms`。
2. 在底盘和机构验证字段候选中补充 `voltage_realizable_acceleration`、`actuation_feasibility_reject`、`near_constraint_oscillation`、`low_battery_motion_derate`、`motor_thermal_derate`。
3. 在具身模型评测字段候选中补充 `embodied_skill_failure_type`、`perception_bottleneck_case`、`spatiotemporal_instability_case`、`spatial_reasoning_tool_used`。
4. 将 2026-05-20 至 2026-05-24 的安全 / 评测 / 资源论文合并为专题候选，而不是继续从同一 listing 扩张主卡片数量。
5. 对 replacement 类论文保持研究输入状态；若后续要写入主线，应先绑定明确 Linear 承接项和冻结条件。

本轮未进入主线的原因：这些论文主要改变“怎么测、什么时候调用重规划、怎么记录底层不可执行动作、怎么归因具身模型失败”，不改变“Kinbot 一代必须纯视觉、端侧处理敏感原始数据、12GB + 32GB 默认量产线、移动而非操作”的主线边界。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent` 官方 listing：[https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
3. `Efficient Agentic Reasoning Through Self-Regulated Simulative Planning`：[https://arxiv.org/abs/2605.22138](https://arxiv.org/abs/2605.22138)
4. `VRA: Grounding Discrete-Time Joint Acceleration in Voltage-Constrained Actuation`：[https://arxiv.org/abs/2605.10696](https://arxiv.org/abs/2605.10696)
5. `Dissecting Embodied Abilities in Multimodal Language Models through Skill-level Evaluation and Diagnosis`：[https://arxiv.org/abs/2510.08759](https://arxiv.org/abs/2510.08759)
6. `Beyond Euclidean Proximity`：[https://arxiv.org/abs/2605.22164](https://arxiv.org/abs/2605.22164)
7. `General Agentic Planning Through Simulative Reasoning with World Models`：[https://arxiv.org/abs/2507.23773](https://arxiv.org/abs/2507.23773)
8. `EvoScene-VLA`：[https://arxiv.org/abs/2605.21862](https://arxiv.org/abs/2605.21862)
9. `SceneGraphGrounder`：[https://arxiv.org/abs/2605.21788](https://arxiv.org/abs/2605.21788)
10. `Federated Single-Agent Robotics`：[https://arxiv.org/abs/2604.11028](https://arxiv.org/abs/2604.11028)
