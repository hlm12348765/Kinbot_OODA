# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-21
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-21 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API 与论文详情页，确认本轮官方最新 Robotics listing 仍为 `Friday, 19 June 2026`，合计 `113` 篇 entries；其中 new submissions `66` 篇、cross submissions `5` 篇、replacement submissions `42` 篇。官方 `cs.RO/recent` 顶部同为 `Fri, 19 Jun 2026`，显示 `Total of 369 entries`，其中 `Fri, 19 Jun 2026` 为 `71` 篇 entries；本轮按周日未出现新批次说明 + 同一 listing 前一日已精筛覆盖后的日更补录 + 周度综合判断口径，补录数据标准 / provenance、RGB last-meter 精定位和局部安全导航 3 篇论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-06-21。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 仍为 `Friday, 19 June 2026`，合计 `113` 篇 entries；其中 new submissions `66` 篇、cross submissions `5` 篇、replacement submissions `42` 篇。
3. 官方 `cs.RO/recent` 顶部同为 `Fri, 19 Jun 2026`，显示 `Total of 369 entries`；其中 `Fri, 19 Jun 2026` 为 `71` 篇 entries、`Thu, 18 Jun 2026` 为 `62` 篇 entries、`Wed, 17 Jun 2026` 为 `54` 篇 entries、`Tue, 16 Jun 2026` 为 `127` 篇 entries、`Mon, 15 Jun 2026` 为 `55` 篇 entries。该页只显示 `new + cross` 条目，不含 `replacement` 条目，因此本轮仍以 `cs.RO/new` 作为正式 Robotics listing、entries 总数与 `new / cross / replacement` 计数口径。
4. 今天为 2026-06-21 周日，arXiv 官方尚未出现 `Sunday, 21 June 2026` Robotics 新批次；本轮按“最新官方 listing + 周日未出现新批次说明”形成日更。
5. 2026-06-20 已覆盖同一 2026-06-19 listing 的 `GroundControl`、`Safe, Real-Time Active Model Discrimination and Fault Diagnosis`、`pdSTL`、`Slow Brain, Fast Planner` 和 `Fail-RAG` 5 篇主卡片，并已将 `3D Scene Graphs`、`Fast Human Attention Prediction`、priority-ordered STL、`MemoryWAM`、`ImageWAM`、`FlexLAM`、`Physical Atari`、`SCAN-Planner`、RGB last-meter navigation 等放入候选排除表。本轮先排除上述直接重复主题，只补录能新增 Kinbot 字段、验证项或周度判断的论文。

筛选标准：

1. 是否改变 Kinbot 对家庭室内导航、记忆、安全、端侧资源或 Phase 5 验证证据链的判断。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`decision_orchestration`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 字段：数据 provenance、执行 trace、坐标 / 时间同步、last-meter 对齐、纯视觉目标朝向、局部安全 fallback、开放空间 heading 和障碍 clearance envelope。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `VOiLA`、`DIFF-IPPO`、`A Smart-Scheduled Hybrid EKF-FGO State Estimation` 和 counterfactual relevance modelling 都有规划 / 资源调度价值，但分别偏 GPU 并行 POMDP、无人机开放词汇搜索、SLAM 优化调度和自动驾驶感知筛选；本轮不把它们写成 Kinbot 在线规划、语义搜索或感知调度主链路。
2. `Playful Agentic Robot Learning`、`Bring My Cup!` 和 `DiffusionVS` 都涉及可复用技能、个性化视觉记忆或视觉伺服鲁棒性，但主体仍偏操作 / VLA / manipulation；Kinbot 一代不新增物理操作主链路。
3. `Formal Verification of Learned Multi-Agent Communication Policies` 对策略抽象验证有启发，但对象是多无人机协同；本轮由前一日 `pdSTL` 和 active fault diagnosis 覆盖更直接的安全验证字段，不再新增形式化验证平台。

## 2. 本轮总判断

本轮真正新增的判断不是“再加一批模型”，而是：同一 2026-06-19 listing 已接近饱和后，Kinbot 更应把 Phase 5 字段包收敛到可复用数据标准、纯视觉 last-meter 对齐指标和简单局部安全 fallback，而不是继续扩张 `VLA / WAM / POMDP / diffusion planner` 在线组件。

1. **Physical AI 数据要保留身体、动作、任务、场景、执行 trace 和结果之间的关系**：数据标准论文提醒，机器人数据不是孤立样本。Kinbot 家庭试点若不记录本体配置、任务语义、坐标系、时间同步、校准、执行结果和版本，后续很难跨样机复盘。
2. **RGB last-meter 对齐值得从排除表升级为轻量验证项**：前一日把 `Learning Category-level Last-meter Navigation` 放入候选排除表，是因为主体偏 mobile manipulation；本轮重新审视后发现它提供 `edge-alignment` 和 `object-alignment` 两个纯视觉精定位评估项，可迁移到 Kinbot “靠近充电桩 / 靠近用户 / 面向目标区域 / 找物前对齐”的验证，而不必引入机械臂主线。
3. **局部安全 fallback 应保持简单、可证明边界清晰**：`Safe Local Navigation for Ackermann-Steered Robots` 不适配 Kinbot 底盘形态本身，但“无全局目标时沿最大开放空间 heading、构造左右 bounding line、最大化障碍 clearance”的 fallback 思路，适合作为底层安全策略的字段化参考。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| Phase 5 数据标准 / provenance / traceability | 值得进入字段候选 | 将 `robot_body_config_id`、`task_scene_action_outcome_trace`、`coordinate_frame_contract`、`time_sync_quality`、`calibration_version`、`dataset_lineage_id` 合并到验证字段包候选；不建设独立数据标准平台。 |
| 纯视觉 last-meter 对齐 | 值得轻量专题跟踪 | 将 `edge_alignment_success`、`object_alignment_success`、`target_facing_error_deg`、`last_meter_rgb_only` 作为导航收口验证项；不新增 mobile manipulation 主链路。 |
| 局部安全 fallback / open-space navigation | 值得轻量跟踪 | 将 `open_space_heading_candidate`、`left_right_clearance_bound`、`clearance_margin_min`、`global_goal_absent_fallback` 作为低速近人导航 fallback 字段。 |
| 导航失败预警、故障诊断、概率安全、慢 VLM / 快 planner、失败证据库 | 已在 2026-06-20 主卡片覆盖 | 下一步做字段去重与专题整合，不继续从同一 listing 扩张新概念。 |
| 3D scene graph / semantic map / ObjectNav | 已接近饱和 | 下一步应做专题整合，不继续靠每日补录扩大语义地图层。 |
| WAM / VLA / manipulation / humanoid skill datasets | 已饱和或相邻 | 只有新增家庭移动安全、端侧资源、试点证据链或可迁移失败字段时进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把数据标准、last-meter RGB navigation、局部安全导航、VOiLA、DIFF-IPPO、counterfactual relevance、agentic play、personalized VLA、DiffusionVS 和 multi-agent verification 全部写成在线系统，会明显过复杂”。建议只吸收 14 类轻量字段：`robot_body_config_id`、`task_scene_action_outcome_trace`、`coordinate_frame_contract`、`time_sync_quality`、`calibration_version`、`dataset_lineage_id`、`edge_alignment_success`、`object_alignment_success`、`target_facing_error_deg`、`last_meter_rgb_only`、`open_space_heading_candidate`、`left_right_clearance_bound`、`clearance_margin_min`、`global_goal_absent_fallback`。暂不新增在线 POMDP planner、diffusion global planner、VLA 个性化操作链路、自主技能库、完整数据标准平台或多智能体形式化验证系统。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | Data Standards for Humanoid Robotics: The Missing Infrastructure for Physical AI | 进入 Phase 5 数据 provenance 与 traceability 字段候选，吸收本体 / 动作 / 任务 / 场景 / trace / outcome / version 关系；不改写主线为 humanoid 数据标准项目。 |
| B+ | Learning Category-level Last-meter Navigation from RGB Demonstrations of a Single-instance | 从前一日候选排除表升级为补录主卡片，吸收纯 RGB last-meter 对齐评估项；不引入 mobile manipulation 或机械臂主链路。 |
| B | Safe Local Navigation for Ackermann-Steered Robots in Unmapped Environments | 作为局部安全 fallback 字段参考，吸收 open-space heading 和 clearance bound；不替换 Kinbot 底盘规划器。 |

## 3. 论文卡片

### 3.1 Data Standards for Humanoid Robotics: The Missing Infrastructure for Physical AI

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.19769](https://arxiv.org/abs/2606.19769) |
| 本轮 listing 口径 | 2026-06-19 官方 listing new submission；`cs.RO/recent` entry date 为 `Fri, 19 Jun 2026`；属于同一 listing 前一日已精筛覆盖后的日更补录 |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | Physical AI data standard, metadata, provenance, traceability, embodied interaction data, lifecycle management |

摘要要点转述：

论文从 `ISO/WD 26264-1` 人形机器人数据集通用要求出发，强调机器人数据不能被当作孤立的图片、轨迹或日志样本，而要保留机器人身体、动作、任务、场景、执行 trace 和结果之间的关系。作者认为 physical AI 数据复用的核心前提是物理一致性：时间戳、坐标系、标定、运动学、单位和同步假设必须可检查。论文还把瓶颈从“数据不够”扩展到“高成本采集后无法跨机器人、任务、组织和时间累积”，因此建议标准层提供生命周期、元数据、provenance、质量、版本和可追溯性基础设施，能力层再定义 manipulation、locomotion、HRI、cognition 等领域语法。

解决 Kinbot 的什么问题：

1. 对应 `observability_data_governance`、`platform_runtime`、`mobility_navigation` 和 `safety_compliance_authorization` 中“家庭样机试点数据如何可复盘、可比对、可迁移”的问题。
2. Kinbot 即将进入家庭样机和 Phase 5 验证，如果只保存视频、截图或散落日志，而不记录本体配置、任务定义、坐标系、标定版本、执行结果和后处理版本，后续无法判断问题来自模型、数据、场景、硬件差异还是标注口径。
3. 对应 Phase 5：建议增加 `robot_body_config_id`、`task_scene_action_outcome_trace`、`coordinate_frame_contract`、`time_sync_quality`、`calibration_version`、`dataset_lineage_id`、`quality_gate_result` 和 `traceability_scope` 字段。

资源消耗与部署信号：

1. 该论文不是模型部署方案，主要增加数据结构和流程约束；资源消耗体现在日志 schema、字段填报、数据索引和版本管理成本。
2. 对 Kinbot 来说，优先级不是一次性建设完整数据标准平台，而是在 Phase 5 验证模板中补齐最小 provenance 字段。
3. 家庭隐私数据仍应端侧处理或只回流结构化摘要；标准化不能成为扩大敏感原始数据回流的理由。

优势：

1. 与 AGENTS 中近期 TODO 的 provenance / 最小元数据字段方向高度一致。
2. 直接服务跨样机、跨版本、跨场景的验证复盘，避免试点数据成为一次性材料。
3. 能把“实验结果”拆成可审计的身体、动作、任务、场景、trace 和 outcome 关系。

劣势与风险：

1. 论文以 humanoid 数据标准为背景，Kinbot 需要裁剪到轮式家庭机器人和一代纯视觉主线。
2. 如果过度标准化，会拖慢试点迭代，并把研发团队推向表单维护。
3. 标准字段必须服务具体决策，否则会变成低价值元数据堆积。

推荐理由：

建议作为 A- 级输入。它应进入 Phase 5 数据 provenance 与 traceability 字段候选，帮助 Kinbot 把样机验证从“有日志”升级为“身体、任务、场景、执行 trace 和结果可追溯”；不建议新增完整数据标准平台或改写主线为 humanoid 数据工程项目。

### 3.2 Learning Category-level Last-meter Navigation from RGB Demonstrations of a Single-instance

| 项目 | 内容 |
| --- | --- |
| arXiv | [2512.11173](https://arxiv.org/abs/2512.11173) |
| 本轮 listing 口径 | 2026-06-19 官方 listing replacement submission；abs 页 `Submitted on 11 Dec 2025`、`last revised 18 Jun 2026`；本轮从 2026-06-20 候选排除表转为补录主卡片 |
| 分类 | `cs.RO` |
| 方法关键词 | RGB-only last-meter navigation, category-level generalization, object alignment, edge alignment, visual grounding |

摘要要点转述：

论文关注移动操作前的最后一米精定位：普通 RGB 导航通常只能达到米级接近，无法保证机器人底座处在后续操作所需的位置与朝向。作者提出一个 object-centric imitation learning 框架，只使用 onboard RGB 观测、目标图像和目标文本提示，让语言驱动 segmentation 与 spatial score-matrix decoder 共同完成目标 grounding 与相对位姿推理。论文声称只用一个类别中的单实例真实数据，也能泛化到未见过的同类别目标，并在不同光照和背景下评估。除成功率外，论文还定义 `edge-alignment` 和 `object-alignment` 两个指标，报告未见目标上的 edge-alignment 成功率为 `74.58%`，object-alignment 成功率为 `89.42%`。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 和 `world_state_memory` 中“机器人到达目标附近后，是否能以正确朝向和距离完成最后一米收口”的问题。
2. Kinbot 一代即使不做机械臂，也需要处理靠近充电桩、面向用户、停在药箱 / 桌边前、对准需要观察的目标区域、找物后给用户确认等 last-meter 对齐问题。
3. 对应 Phase 5：建议增加 `last_meter_rgb_only`、`edge_alignment_success`、`object_alignment_success`、`target_facing_error_deg`、`relative_pose_grounding_confidence` 和 `single_instance_category_generalization` 字段。

资源消耗与部署信号：

1. 论文只依赖 RGB 观测、目标图像和文本提示，符合 Kinbot 纯视觉方向；但多视角输入和 segmentation / score-matrix decoder 仍需要端侧资源评估。
2. 对 Kinbot 的首要价值是评估指标和回放标注方式，而不是直接复用其 imitation policy。
3. 作为 replacement 条目收录的理由是它新增了可迁移评测项；不应因为该论文而新增 mobile manipulation 或机械臂路线。

优势：

1. 解决了“导航成功但最后朝向不对 / 停位不准”的实际工程问题。
2. 指标清晰，可直接变成回放评测和实机验收项。
3. 纯 RGB 设定与 Kinbot 一代纯视觉主线相容。

劣势与风险：

1. 论文主体仍是 mobile manipulation，Kinbot 需要裁剪到不带机械臂的一代任务。
2. 单实例泛化在真实家庭物体、遮挡、反光、暗光和用户移动场景下仍需验证。
3. 若把它扩张为通用 object manipulation policy，会偏离当前产品边界。

推荐理由：

建议作为 B+ 级补录。它从前一日候选排除表升级的理由是：`edge-alignment` 与 `object-alignment` 能补上 Kinbot last-meter 精定位验证缺口；不建议引入 mobile manipulation 或机械臂主链路。

### 3.3 Safe Local Navigation for Ackermann-Steered Robots in Unmapped Environments

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.19672](https://arxiv.org/abs/2606.19672) |
| 本轮 listing 口径 | 2026-06-19 官方 listing new submission；`cs.RO/recent` entry date 为 `Fri, 19 Jun 2026`；属于同一 listing 前一日已精筛覆盖后的日更补录 |
| 分类 | `cs.RO` |
| 方法关键词 | safe local navigation, unmapped environment, open-space heading, bounding lines, obstacle clearance, fallback |

摘要要点转述：

论文提出面向 Ackermann 转向移动机器人的局部安全导航控制框架，场景是假设没有全局目标且环境未建图。系统基于局部障碍检测，先选择前方最大开放空间方向作为 safest heading，再在车辆左右侧构造 bounding lines，通过凸二次优化最大化车辆与障碍之间的 clearance。控制器随后调节车辆与一侧或两侧 bounding line 的距离，从而沿局部参考路径前进。论文还加入保持平行与平滑变化的可选约束，并报告相比若干探索式 planner，可生成更安全路径且计算时间更短。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 和 `safety_compliance_authorization` 中“全局目标暂时不可用、地图不可信或高层 planner 超时时，底层如何保持低速安全移动 / 停靠”的问题。
2. Kinbot 家庭场景可能出现局部地图失效、目标点丢失、用户临时阻挡、狭窄通道被改造、网络或大模型建议过期等情况，此时需要一个简单、可解释、低算力的 fallback。
3. 对应 Phase 5：建议增加 `global_goal_absent_fallback`、`open_space_heading_candidate`、`left_right_clearance_bound`、`clearance_margin_min`、`bounding_line_smoothness` 和 `fallback_stop_reason` 字段。

资源消耗与部署信号：

1. 方法是几何 / 优化控制框架，不要求新增大模型；计算上比复杂探索式 planner 更轻。
2. 论文面向 Ackermann 车辆，不直接适配 Kinbot 轮式底盘，需要将 steering 模型替换为差速 / 全向底盘约束。
3. 该思路只适合作为近人低速 fallback 或验证字段，不应替代正式导航栈和碰撞安全策略。

优势：

1. 处理“无全局目标也要安全”的边界场景，和家庭机器人降级策略相关。
2. 输出边界清晰：开放空间方向、左右 clearance、平滑约束和停止原因都可记录。
3. 与前一日 `GroundControl` 的轨迹失败预警互补，一个偏提前识别失败，一个偏局部安全兜底。

劣势与风险：

1. Ackermann 转向假设与 Kinbot 底盘不同，不能直接移植控制律。
2. 只依赖局部障碍检测，无法解决语义禁区、用户意图和长程任务目标。
3. 如果 fallback 没有限速、停止和人工确认边界，可能被误用为“无地图自主探索”。

推荐理由：

建议作为 B 级输入。它应作为局部安全 fallback 字段参考，帮助 Kinbot 在高层导航不可用时保持可解释的低速安全边界；不建议替换 Kinbot 正式导航栈。

## 4. 候选排除表

| 论文 | arXiv | 本轮 listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| VOiLA: Vectorized Online Planning with Learned Diffusion Model for POMDP Agents | [2606.19729](https://arxiv.org/abs/2606.19729) | 2026-06-19 new submission | POMDP、belief update 和采样蒸馏有研究价值，但依赖 GPU 并行在线规划，且会把 Kinbot Phase 5 推向复杂 planner；本轮只保留 `belief_update_compute_budget`、`learned_model_sim_to_real_gap` 候选字段。 |
| DIFF-IPPO: Diffusion-Based Informative Path Planning with Open-Vocabulary Belief Maps | [2606.16780](https://arxiv.org/abs/2606.16780) | 2026-06-19 replacement | 开放词汇 belief map 与 object search 相邻，但实验是无人机搜索救援和 diffusion trajectory generation；不新增 Kinbot 在线 diffusion global planner，只保留 `open_vocab_belief_map_quality` 候选。 |
| A Smart-Scheduled Hybrid (SSH) EKF-FGO State Estimation | [2606.16057](https://arxiv.org/abs/2606.16057) | 2026-06-19 replacement | 优化调度与端侧状态估计资源权衡相关，但论文是 planar SLAM 调度实验；本轮由数据标准和局部 fallback 覆盖更直接的 Phase 5 字段，保留 `estimation_optimization_schedule` 候选。 |
| Self-Supervised Relevance Modelling in Autonomous Driving via Counterfactual Analysis | [2606.10688](https://arxiv.org/abs/2606.10688) | 2026-06-19 replacement | 毫秒级对象 relevance 对视觉 token / 感知算力预算有启发，但主体是自动驾驶感知 pipeline；近期 Qwen-RobotNav、active perception 和端侧资源论文已覆盖，不新增感知筛选主模块。 |
| Playful Agentic Robot Learning | [2606.19419](https://arxiv.org/abs/2606.19419) | 2026-06-19 new submission | 自主 play、代码策略和技能库对 Agent 有前瞻价值，但会引入在线自学习和操作技能扩张；Kinbot 一代不把自主技能发现写成主线，只保留 `skill_library_provenance` 候选。 |
| Bring My Cup! Personalizing Vision-Language-Action Models with Visual Attentive Prompting | [2512.20014](https://arxiv.org/abs/2512.20014) | 2026-06-19 replacement | 个性化视觉记忆对家庭物品识别有价值，但主体是 VLA 操作和 tabletop manipulation；只保留 `personal_object_reference_image`、`visual_attention_prompt_trace` 候选字段，不进入主卡片。 |
| DiffusionVS: A Generative Framework for Robust Visual Servoing Based on Diffusion Policy | [2606.19397](https://arxiv.org/abs/2606.19397) | 2026-06-19 new submission | 视觉伺服鲁棒性和在线数据扩展有价值，但偏 tag-corner visual servoing 与 manipulation / camera motion；本轮不引入 diffusion visual servoing。 |
| Formal Verification of Learned Multi-Agent Communication Policies via Decision Tree Distillation | [2606.19632](https://arxiv.org/abs/2606.19632) | 2026-06-19 new submission | 决策树蒸馏 + PRISM 验证有治理价值，但对象是多无人机协同通信策略；前一日 `pdSTL` 已覆盖更贴近 Kinbot 的概率时序安全字段，本轮不新增多智能体验证链路。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮不建议回写主线架构或决策日志；这些论文仍属于 Phase 5 研究输入。
2. 建议后续 Phase 5 验证模板评审时，把 `Data Standards` 的 provenance 字段与前序 TODO 中的 `validation_artifact_id`、`scenario_config_hash`、`sim_runtime_version`、`postprocess_version`、`evidence_lineage_complete`、`fair_metadata_complete` 合并去重，形成最小字段集合。
3. 建议把 last-meter 对齐从“导航成功率”中拆出来，作为纯视觉导航收口小专题：先评估充电桩、用户正面停靠、目标物观察位和窄空间停靠，不引入机械臂任务。
4. 建议把局部安全 fallback 收敛为“高层不可用时低速停靠 / 退出 / 请求帮助”的字段和策略，不写成无地图自主探索能力。
5. 不建议因本轮论文新增在线 `POMDP / diffusion planner / VLA / WAM`、完整数据标准平台、自主技能库、机械臂操作主线或多智能体形式化验证平台。

## 6. 来源

1. arXiv `cs.RO/new`：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent`：<https://arxiv.org/list/cs.RO/recent>
3. Data Standards for Humanoid Robotics：<https://arxiv.org/abs/2606.19769>
4. Learning Category-level Last-meter Navigation：<https://arxiv.org/abs/2512.11173>
5. Safe Local Navigation for Ackermann-Steered Robots：<https://arxiv.org/abs/2606.19672>
6. VOiLA：<https://arxiv.org/abs/2606.19729>
7. DIFF-IPPO：<https://arxiv.org/abs/2606.16780>
8. A Smart-Scheduled Hybrid EKF-FGO State Estimation：<https://arxiv.org/abs/2606.16057>
9. Self-Supervised Relevance Modelling：<https://arxiv.org/abs/2606.10688>
10. Playful Agentic Robot Learning：<https://arxiv.org/abs/2606.19419>
11. Bring My Cup!：<https://arxiv.org/abs/2512.20014>
12. DiffusionVS：<https://arxiv.org/abs/2606.19397>
13. Formal Verification of Learned Multi-Agent Communication Policies：<https://arxiv.org/abs/2606.19632>
