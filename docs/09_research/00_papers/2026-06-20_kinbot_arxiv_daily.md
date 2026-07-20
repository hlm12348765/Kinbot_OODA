# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-20
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-20 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API 与论文详情页，确认本轮官方最新 Robotics listing 为 `Friday, 19 June 2026`，合计 `113` 篇 entries；其中 new submissions `66` 篇、cross submissions `5` 篇、replacement submissions `42` 篇。官方 `cs.RO/recent` 顶部同为 `Fri, 19 Jun 2026`，显示 `Total of 369 entries`，其中 `Fri, 19 Jun 2026` 为 `71` 篇 entries；本轮按周六未出现新批次说明 + 最新官方 listing 口径，收录导航失败预警、实时故障诊断、概率时序安全约束、慢 VLM / 快规划融合和机器人失败识别 5 篇论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-06-20。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Friday, 19 June 2026`，合计 `113` 篇 entries；其中 new submissions `66` 篇、cross submissions `5` 篇、replacement submissions `42` 篇。
3. 官方 `cs.RO/recent` 顶部同为 `Fri, 19 Jun 2026`，显示 `Total of 369 entries`，其中 `Fri, 19 Jun 2026` 为 `71` 篇 entries；该页只显示 `new + cross` 条目，不含 `replacement` 条目，因此本轮仍以 `cs.RO/new` 作为正式 Robotics listing、entries 总数与 `new / cross / replacement` 计数口径。
4. 今天为 2026-06-20 周六，arXiv 官方尚未出现 `Saturday, 20 June 2026` Robotics 新批次；本轮按“最新官方 listing + 周六未出现新批次说明”形成日更。
5. 2026-06-17 与 2026-06-18 已分别覆盖长期导航证据记忆、视觉导航尺度安全、机器人端侧呼吸监测、Agentic Navigation 观测策略、连续边缘推理、人身伤害预防安全集、几何监督导航 VLA、AI sandbox 证据边界、LLM 任务规划验证和空间一致语义检索等主题，本轮不重复收录这些论文。

筛选标准：

1. 是否改变 Kinbot 对家庭室内导航、记忆、安全、端侧资源、故障诊断或 Phase 5 验证证据链的判断。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`decision_orchestration`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 字段：导航失败预警、轨迹不一致、传感 / 执行器故障、概率安全约束、慢速 VLM 建议延迟、失败识别证据库和人工复核边界。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `3D Scene Graphs: Open Challenges and Future Directions` 是有价值的综述，但 3D scene graph / 语义地图主题近期已多次进入主卡片；本轮只吸收其“统一术语、节点 / 边属性、动态层级和评估协议”作为专题整理提醒，不新增语义地图主系统。
2. `MemoryWAM`、`ImageWAM`、`FlexLAM` 与 `Tri-Info` 都有资源或失败检测信号，但主体仍偏 manipulation / VLA / WAM；本轮不把它们升级为 Kinbot 在线 world action model。
3. `Fast Human Attention Prediction` 具备低算力主动感知价值，但论文实机场景是 aerial robot，且近期视觉 token 预算 / 观测策略已有 `Qwen-RobotNav` 等覆盖；本轮放入候选排除表。
4. `Autonomous Driving with Priority-Ordered STL Specifications` 与 `pdSTL` 同属形式化约束方向，但主体是自动驾驶；本轮优先收录更通用且含实机机器人实验的 `pdSTL`。
5. 大量 assembly、dexterous hand、humanoid、quadruped、underwater、aerial、autonomous driving 和 manipulation 数据增强条目与 Kinbot 一代家庭轮式本体主线距离较远，本轮只在候选排除表保留相邻字段。

## 2. 本轮总判断

本轮真正新增的判断是：Kinbot Phase 5 应把“导航与任务成功”继续下钻为“失败是否能提前看见、故障是否能安全诊断、约束是否能在不确定性下验证、慢速 VLM 是否只能做可延迟建议、失败证据是否能被检索复盘”。

1. **导航失败预警要看整段轨迹，不只看单步动作置信度**：`GroundControl` 提醒，振荡、停滞、绕远和进度非单调是可观测的轨迹级失败信号。Kinbot 应在回放和实机日志中记录进度曲线、距离目标动态、路径效率和振荡事件。
2. **故障诊断不能牺牲安全约束**：实时 active fault diagnosis 论文显示，可在安全约束下主动选择动作，让观测区分传感器 / 执行器 / 模型故障。Kinbot 可先把其收敛为故障模式候选集、诊断动作边界和安全可达证据字段。
3. **安全约束应从确定性 STL 走向概率 / belief-space 语义**：`pdSTL` 提供了在随机动力学和传感噪声下保持时序安全约束的思路。Kinbot 不需要马上引入完整优化器，但 Phase 5 的安全验证应记录约束满足概率、置信区间和保守边界。
4. **慢速 VLM 只能进入可延迟规划建议层**：`Slow Brain, Fast Planner` 说明，VLM 的 1-3 秒延迟不适合实时控制环，但可以对候选轨迹做高层选择，再由快速规划器用几何相似和时效衰减融合。Kinbot 应把大模型导航能力限制在“建议 / 排序 / 复核”层。
5. **失败识别需要证据库与上下文模板，而不是裸 VLM 判图**：`Fail-RAG` 表明，失败图像 + 上下文检索 + 指令模板能显著提高失败识别。Kinbot 的家庭试点应把失败案例沉淀为可检索证据库，配合人工复核，而不是把 VLM 输出直接当故障事实。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 导航失败预警 / trajectory-level uncertainty | 值得专题跟踪 | 将 `GroundControl` 与近期 `VISTA`、`VEGA`、视觉导航安全论文合并，形成 `navigation_progress_monotonicity`、`trajectory_oscillation_event`、`selective_risk_coverage_score` 字段。 |
| 传感器 / 执行器 / 模型故障诊断 | 值得进入 Phase 5 字段候选 | 吸收 fault-mode candidate set、diagnostic action safety envelope、diagnosis_latency_ms 和 reachable output overlap 字段；不新增复杂主动诊断控制器。 |
| 形式化时序安全 / probabilistic STL | 值得轻量跟踪 | 将 `pdSTL` 与前序 LTL / STL 规划验证论文合并，优先沉淀约束、置信、robustness bound 与 violation reason 字段。 |
| 慢 VLM / 快规划器 / latency-resilient navigation | 值得专题跟踪 | 明确 VLM 只做候选轨迹排序、风险解释和慢速复核；记录 query latency、stale suggestion age、planner fallback reason。 |
| 失败识别证据库 / RAG failure analysis | 值得轻量跟踪 | 先建设失败案例检索字段和人工复核闭环；不把 RAG + VLM 写成自动故障仲裁主链路。 |
| 3D scene graph / semantic map / ObjectNav | 已接近饱和 | 下一步应做专题整合，不继续靠每日补录扩张概念。 |
| WAM / VLA / manipulation failure detection | 已饱和或相邻 | 只有新增家庭移动安全、端侧资源、试点证据链或可迁移失败字段时进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 GroundControl、active fault diagnosis、pdSTL、slow VLM planner、Fail-RAG、3D scene graph survey、MemoryWAM、ImageWAM、FlexLAM 和 active gaze 全部写成在线子系统，会过复杂”。建议只吸收 20 类轻量字段：`distance_to_goal_innovation`、`navigation_progress_monotonicity`、`trajectory_oscillation_event`、`stagnation_duration_s`、`path_efficiency_delta`、`selective_risk_coverage_score`、`fault_mode_candidate_set`、`diagnostic_action_safety_envelope`、`reachable_output_overlap_score`、`diagnosis_latency_ms`、`belief_space_safety_bound`、`probabilistic_stl_satisfaction_interval`、`temporal_robustness_margin`、`vlm_planner_query_latency_ms`、`stale_vlm_suggestion_age_s`、`planner_score_fusion_source`、`failure_case_embedding_id`、`failure_context_template_id`、`vlm_failure_explanation_trace`、`human_review_required`。暂不新增在线导航大模型、完整主动故障诊断控制器、形式化验证平台、VLM 实时控制链路或 RAG 自动仲裁系统。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | GroundControl: Anticipating Navigation Failures in Vision-Language Agents via Trajectory-Consistent Uncertainty Estimates | 进入导航失败预警专题，吸收轨迹级不确定性、振荡 / 停滞 / 路径效率和 risk-coverage 字段；不替换当前导航栈。 |
| A- | Safe, Real-Time Active Model Discrimination and Fault Diagnosis for Nonlinear Systems via Differentiable Reachability | 进入故障诊断与安全可达字段候选，吸收故障模式、诊断动作、安全 envelope 和 50 ms 级延迟指标；不新增在线主动诊断控制器。 |
| A- | pdSTL: Probabilistic Differentiable Signal Temporal Logic for Stochastic Systems | 进入概率时序安全约束候选，吸收 belief-space satisfaction interval 与 temporal robustness 字段；不升级为完整优化平台。 |
| B+ | Slow Brain, Fast Planner: Latency-Resilient VLM-Augmented Urban Navigation | 进入慢 VLM / 快规划器接口专题，吸收 VLM 延迟、候选轨迹排序和 planner fallback 字段；不让 VLM 进入实时控制环。 |
| B+ | Fail-RAG: A Retrieval Augmented Generation Informed Framework for Robot Failure Identification | 进入失败识别证据库候选，吸收 failure embedding、上下文模板和人工复核字段；不把 RAG + VLM 当自动裁决。 |

## 3. 论文卡片

### 3.1 GroundControl: Anticipating Navigation Failures in Vision-Language Agents via Trajectory-Consistent Uncertainty Estimates

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.20479](https://arxiv.org/abs/2606.20479) |
| 本轮 listing 口径 | 2026-06-19 官方 listing new submission；`cs.RO/recent` entry date 为 `Fri, 19 Jun 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | trajectory-consistent uncertainty, navigation failure anticipation, selective risk-coverage navigation, oscillation, stagnation |

摘要要点转述：

论文认为视觉语言导航智能体的失败通常不是瞬间发生，而是表现为整段轨迹里的振荡、停滞、绕远、进度不稳定和路径效率下降。作者提出 `GroundControl`，用常速度 Kalman filter 建模 distance-to-goal 的期望变化，再把 innovation 统计量、进度、单调性、路径效率和振荡行为聚合成轨迹级不确定性。论文还定义 `Selective Risk-Coverage Navigation` 评估协议，用 risk-coverage 曲线、`AURC / E-AURC` 衡量不确定性分数是否能按失败风险对 episode 排序。结果显示，轨迹一致性不确定性比动作熵、conformal 和普通启发式基线更接近 oracle 的失败排序。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`safety_compliance_authorization` 和 `observability_data_governance` 中“机器人是否能在导航失败扩大前提前降级或请求帮助”的问题。
2. Kinbot 家庭导航常见失败并不一定是碰撞，可能是反复原地调整、在门口停滞、绕远、离目标越来越远或无法确认目标位置。
3. 对应 Phase 5：建议增加 `distance_to_goal_innovation`、`navigation_progress_monotonicity`、`trajectory_oscillation_event`、`stagnation_duration_s`、`path_efficiency_delta`、`selective_risk_coverage_score` 和 `navigation_failure_early_warning` 字段。

资源消耗与部署信号：

1. 论文核心是轨迹统计和 Kalman filter，不要求新增大模型或传感器，适合先作为日志后处理与回放评估字段。
2. 若进入在线运行，只应作为低频风险监控和降级触发信号，不替代底层避障与安全速度限制。
3. Kinbot 需要把 distance-to-goal、局部目标、路径效率和振荡事件标准化，否则不同任务之间难以比较。

优势：

1. 把导航失败从“最终是否成功”拆成提前可观测的轨迹动态。
2. 评估协议独立于具体任务成功率，适合比较不同导航模型或版本。
3. 适合与家庭样机试点回放、异常上报和远程复核闭环结合。

劣势与风险：

1. 论文基于 benchmark episode，家庭环境中的目标定义、局部路线和多人动态干扰更复杂。
2. 需要可靠的局部目标或距离代理信号；若目标本身不清晰，指标会被污染。
3. 轨迹不一致只能提示风险，不能解释所有感知、地图或执行失败根因。

推荐理由：

建议作为 A- 级输入。它应进入导航失败预警专题，帮助 Kinbot 把 Phase 5 导航验证从成功率扩展到“是否能提前发现振荡、停滞和效率异常”；不建议替换当前导航栈。

### 3.2 Safe, Real-Time Active Model Discrimination and Fault Diagnosis for Nonlinear Systems via Differentiable Reachability

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.19590](https://arxiv.org/abs/2606.19590) |
| 本轮 listing 口径 | 2026-06-19 官方 listing new submission；`cs.RO/recent` entry date 为 `Fri, 19 Jun 2026` |
| 分类 | `cs.RO`, `eess.SY` |
| 方法关键词 | active fault diagnosis, differentiable reachability, model discrimination, actuator fault, sensor fault, formal safety |

摘要要点转述：

论文研究不确定非线性系统中的实时主动故障诊断。系统先给定一组候选模型，覆盖正常模式以及传感器、执行器等故障模式；再求解一个 output-feedback、time-varying policy optimization 问题，使机器人在有限时间窗口内既满足状态 / 输入安全约束，又主动产生足以区分候选模型的观测。作者用 reachable state / output set 的区间过近似表达安全与可诊断性，并把不同候选模型输出集合的重叠程度做成可微目标，用 JAX 和 differentiable reachability 在线优化。实验覆盖仿真无人机、战斗机模型、硬件差速机器人和四足导航，报告可在 50 ms 内完成较可靠的模型区分。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`safety_compliance_authorization` 和 `observability_data_governance` 中“机器人出现异常时如何区分传感器、执行器、控制模型或环境扰动”的问题。
2. Kinbot 家庭样机可能遇到底盘打滑、轮速异常、相机遮挡、IMU 漂移、局部规划无效或电机响应异常；这些不应只靠日志事后猜测。
3. 对应 Phase 5：建议增加 `fault_mode_candidate_set`、`diagnostic_action_safety_envelope`、`reachable_output_overlap_score`、`diagnosis_latency_ms`、`active_diagnosis_allowed` 和 `fault_discrimination_result` 字段。

资源消耗与部署信号：

1. 论文方法含在线优化与 reachable set 计算，直接端侧部署可能偏重。
2. Kinbot 可先把它用于离线故障回放、故障注入实验和诊断字段设计；在线阶段只保留低风险诊断动作和安全 envelope。
3. 50 ms 级别是很有价值的参考延迟，但 Kinbot 不应在没有充分实机验证前让主动诊断动作介入近人场景。

优势：

1. 同时处理“主动诊断”和“安全约束”，避免为诊断而制造危险动作。
2. 覆盖传感器和执行器故障，和 Kinbot 样机期故障排查高度相关。
3. 硬件差速机器人案例与 Kinbot 轮式底盘有一定迁移价值。

劣势与风险：

1. 需要事先定义合理候选故障模型，家庭机器人真实故障可能更混杂。
2. 可达集过近似和模型误差会影响诊断可信度。
3. 完整在线优化链路会增加运行时复杂度和验证负担。

推荐理由：

建议作为 A- 级输入。它应进入故障诊断与安全可达字段候选，帮助 Kinbot Phase 5 把“异常发生了”变成“候选故障、诊断动作、安全边界和判定延迟都有记录”；不建议新增完整在线主动故障诊断控制器。

### 3.3 pdSTL: Probabilistic Differentiable Signal Temporal Logic for Stochastic Systems

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.19561](https://arxiv.org/abs/2606.19561) |
| 本轮 listing 口径 | 2026-06-19 官方 listing new submission；`cs.RO/recent` entry date 为 `Fri, 19 Jun 2026` |
| 分类 | `cs.RO`, `eess.SY` |
| 方法关键词 | probabilistic STL, differentiable monitoring, belief trajectory, temporal robustness, stochastic safety |

摘要要点转述：

论文关注随机动力学和传感噪声下的时序安全约束。传统 Signal Temporal Logic 有利于表达“始终保持距离”“最终到达目标”“一段时间内不进入危险区”等约束，但确定性 robustness 度量不一定能处理 belief-space 不确定性。作者提出 `pdSTL`，把概率语义和可微 robustness 统一到 belief trajectory 上，用 interval-valued probabilistic semantics 传播保守满足界，并把 STL operator 展开成类似 recurrent / LSTM 的线性时间可微监控结构。实验覆盖仿真避障、变道和真实 Crazyflie 飞行扰动，显示相较 deterministic differentiable STL，在真实不确定性下能更好维持安全 margin。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`decision_orchestration` 和 `observability_data_governance` 中“安全规则在噪声和不确定性下是否仍满足”的问题。
2. Kinbot 在老人家庭场景中需要处理不确定的人体位置、遮挡、动态障碍、暗光视觉置信和执行误差，不能只记录 deterministic pass / fail。
3. 对应 Phase 5：建议增加 `probabilistic_stl_satisfaction_interval`、`belief_space_safety_bound`、`temporal_robustness_margin`、`sensing_noise_assumption`、`constraint_violation_probability` 和 `safety_margin_under_uncertainty` 字段。

资源消耗与部署信号：

1. 论文重点在可微监控与优化，不一定要进入 Kinbot 端侧实时闭环。
2. Kinbot 可以先在回放 / 仿真 / 高风险任务模板中使用概率约束字段，避免把每个低风险动作都形式化。
3. 如果未来接入在线约束监控，需要限定约束数量、更新频率和 fallback 策略，防止控制链路过重。

优势：

1. 将 STL 从确定性轨迹扩展到不确定 belief trajectory，适合家庭真实噪声。
2. 保留可微性，有利于后续离线优化、回放评分和策略对比。
3. 可把安全验证从硬阈值扩展到置信区间和保守边界。

劣势与风险：

1. 论文实验平台与 Kinbot 家庭轮式场景不同，需要重新定义约束模板。
2. 概率假设若不透明，可能给出看似严格但实际错误的满足界。
3. 过度形式化会增加 Phase 5 模板成本，应先覆盖近人安全、禁区、速度和任务中止等关键约束。

推荐理由：

建议作为 A- 级输入。它应进入概率时序安全约束候选，帮助 Kinbot 把安全规则从 deterministic checklist 升级为带置信和保守边界的验证字段；不建议升级为完整在线形式化优化平台。

### 3.4 Slow Brain, Fast Planner: Latency-Resilient VLM-Augmented Urban Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.20458](https://arxiv.org/abs/2606.20458) |
| 本轮 listing 口径 | 2026-06-19 官方 listing new submission；`cs.RO/recent` entry date 为 `Fri, 19 Jun 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | VLM-augmented navigation, planner score fusion, latency-resilient control, candidate trajectory selection, fallback |

摘要要点转述：

论文研究城市人行道导航中“快规划器能实时生成候选轨迹，但打分器在复杂场景里选错轨迹”的问题，例如走向草地、朝行人方向走或方向选择错误。作者没有用端到端 VLA 替代规划器，而是让 VLM 在候选轨迹集合里选一个 index，再通过训练-free 的 trajectory-level fusion layer 把这个慢速建议和原规划器输出融合。由于 VLM 查询通常需要 1-3 秒，系统用几何相似和指数衰减把过时建议转化为实时打分信号。论文在约 2000 个真实复杂场景和仿真延迟设置下验证，显示 VLM 对候选轨迹选择有帮助，融合层在最多 5 秒延迟下仍保持较高成功率。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`decision_orchestration` 和 `platform_runtime` 中“大模型能否参与导航，以及应放在哪个层级”的问题。
2. Kinbot 家庭场景也会遇到局部规划器有多个候选路线、但需要语义判断的情况，例如是否绕开老人、是否穿过狭窄通道、是否靠近隐私区域。
3. 对应 Phase 5：建议增加 `vlm_planner_query_latency_ms`、`stale_vlm_suggestion_age_s`、`planner_candidate_index`、`planner_score_fusion_source`、`planner_fallback_reason` 和 `semantic_route_preference_trace` 字段。

资源消耗与部署信号：

1. 论文明确承认 VLM 延迟，不让 VLM 直接进入 5-20 Hz 控制环，这与 Kinbot 的端侧资源和安全边界相容。
2. Kinbot 可将 VLM 用作低频候选排序、风险解释或远程复核，不应让其直接生成底盘控制。
3. 如果 VLM 来自云端，还需记录网络延迟、建议过期时间、fallback 是否触发和是否含敏感图像回传。

优势：

1. 给出了慢速语义理解与快速几何规划之间的清晰接口。
2. 把 VLM 输出限制为候选轨迹选择，降低不可控动作空间。
3. 延迟衰减和 fallback 思路适合 Kinbot 端云协同和弱网家庭环境。

劣势与风险：

1. 论文场景是校园 / 人行道，不是家庭室内低速近人环境。
2. 候选轨迹集合质量仍决定安全下限；VLM 只能选，不负责生成安全可行动作。
3. VLM 语义判断可能受视觉遮挡、隐私区域和家庭规则影响，需要人工配置边界。

推荐理由：

建议作为 B+ 级输入。它应进入慢 VLM / 快规划器接口专题，帮助 Kinbot 固化“大模型只能做可延迟建议与排序”的工程边界；不建议让 VLM 进入实时控制环。

### 3.5 Fail-RAG: A Retrieval Augmented Generation Informed Framework for Robot Failure Identification

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.19598](https://arxiv.org/abs/2606.19598) |
| 本轮 listing 口径 | 2026-06-19 官方 listing new submission；`cs.RO/recent` entry date 为 `Fri, 19 Jun 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | robot failure identification, retrieval augmented generation, VLM, failure database, context template |

摘要要点转述：

论文面向仓储机器人 unexpected event / failure detection。作者指出规则检测容易被动态环境和任务变化击穿，因此提出 `Fail-RAG`：将失败图像和上下文信息嵌入后，与失败数据库做相似度检索，再让 VLM 按预设 instruction template 分析失败并输出细节。实验覆盖仿真和实体机器人，包含固定机械臂与移动操作平台的多类仓储任务。结果显示，相比直接使用 off-the-shelf VLM，`Fail-RAG` 在五类机器人操作失败检测上平均提升约 25 个百分点。

解决 Kinbot 的什么问题：

1. 对应 `observability_data_governance`、`platform_runtime` 和 `safety_compliance_authorization` 中“家庭样机试点失败如何被识别、归档、检索和复盘”的问题。
2. Kinbot 的失败可能包括找不到目标、误识别物品、路线卡死、靠近禁区、未能完成提醒、用户拒绝或设备异常；这些需要形成可检索的失败案例库。
3. 对应 Phase 5：建议增加 `failure_case_embedding_id`、`failure_context_template_id`、`retrieved_failure_case_topk`、`vlm_failure_explanation_trace`、`human_review_required` 和 `failure_taxonomy_label` 字段。

资源消耗与部署信号：

1. RAG + VLM 可作为离线分析、试点复盘和人工坐席辅助，不应放入底层安全闭环。
2. 失败图像和上下文可能包含家庭隐私，默认应端侧脱敏、受控回流或只回流结构化摘要。
3. 失败库质量会直接影响判断质量，需要版本、来源、人工复核和过期机制。

优势：

1. 比裸 VLM 判图更可审计，因为有检索证据和上下文模板。
2. 适合把样机期失败沉淀为可复用案例，而不是散落在日志里。
3. 可与人工复核、远程支持和研发缺陷台账连接。

劣势与风险：

1. 仓储任务与家庭陪伴 / 健康 / 安全任务差异较大。
2. 如果失败数据库偏窄，RAG 可能把新问题误归类到旧案例。
3. 不能把 VLM 解释当作故障事实，关键安全结论仍需人工或结构化传感证据确认。

推荐理由：

建议作为 B+ 级输入。它应进入失败识别证据库候选，帮助 Kinbot Phase 5 建立“失败样本、检索证据、VLM 解释和人工复核”的闭环字段；不建议把 RAG + VLM 写成自动故障裁决系统。

## 4. 候选排除表

| 论文 | arXiv | 本轮 listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| 3D Scene Graphs: Open Challenges and Future Directions | [2606.19383](https://arxiv.org/abs/2606.19383) | 2026-06-19 new submission | 综述价值高，但 3D scene graph / 语义地图主题近期已接近饱和；本轮只保留 `scene_graph_schema_definition`、`dynamic_relation_update`、`task_level_graph_eval` 作为专题整理字段。 |
| Fast Human Attention Prediction for Fixation-guided Active Perception in Autonomous Navigation | [2606.20491](https://arxiv.org/abs/2606.20491) | 2026-06-19 new submission | `0.61 GFLOPs` 和 scanpath 低算力主动感知有价值，但实机场景是 aerial robot，且近期视觉 token 预算 / 观测策略已覆盖；保留 `fixation_budget_gflops`、`active_perception_roi_trace` 字段。 |
| Autonomous Driving with Priority-Ordered STL Specifications Under Multimodal Uncertainty | [2606.20336](https://arxiv.org/abs/2606.20336) | 2026-06-19 new submission | 优先级 STL 对冲突约束有价值，但主体是自动驾驶；本轮由更通用的 `pdSTL` 主卡片覆盖形式化约束方向，保留 `constraint_priority_order` 字段。 |
| MemoryWAM: Efficient World Action Modeling with Persistent Memory | [2606.20562](https://arxiv.org/abs/2606.20562) | 2026-06-19 recent / new submission | 持久记忆和 gist token 对长程决策有启发，但主体是 manipulation WAM，且近期长期记忆与 WAM 已多次覆盖；不新增在线 WAM。 |
| ImageWAM: Do World Action Models Really Need Video Generation, or Just Image Editing? | [2606.19531](https://arxiv.org/abs/2606.19531) | 2026-06-19 cross submission from `cs.CV` | 用 image editing KV cache 降低 WAM FLOPs / latency 有资源价值，但仍偏 manipulation action prediction；只保留 `world_action_context_cache_cost` 候选字段。 |
| FlexLAM: Resolving the Bottleneck Trade-off in Latent Action Learning | [2606.19408](https://arxiv.org/abs/2606.19408) | 2026-06-19 cross submission from `cs.LG` | variable-length latent action 对 token budget 有启发，但 action-free video / latent action 主题已饱和；不因 cross-list 扩张在线 latent action 层。 |
| One Demo is Worth a Thousand Trajectories: Action-View Augmentation for Visuomotor Policies | [2606.19586](https://arxiv.org/abs/2606.19586) | 2026-06-19 new submission | 3DGS + trajectory optimization 的数据增强对 manipulation 有价值，但 Kinbot 一代不做机械臂操作主链路；不进入主卡片。 |
| Physical Atari: A Robust and Accessible Platform for Real-time Reinforcement Learning on Robots | [2606.19357](https://arxiv.org/abs/2606.19357) | 2026-06-19 new submission | 低成本实机 RL benchmark 和长期无故障运行有工程启发，但任务平台与家庭机器人差距较大；可作为实验台架设计参考，不改变主线。 |
| SCAN-Planner: Spatial Collision-Aware Local Planning for Route-Guided Long-Range Quadruped Navigation | [2606.19555](https://arxiv.org/abs/2606.19555) | 2026-06-19 new submission | 3D occupancy 和 quadruped footprint 对复杂地形有价值，但依赖四足 / 3D occupancy 设定，不改写 Kinbot 纯视觉轮式导航主线。 |
| Learning Category-level Last-meter Navigation from RGB Demonstrations of a Single-instance | [2512.11173](https://arxiv.org/abs/2512.11173) | 2026-06-19 replacement | RGB-only last-meter object positioning 与纯视觉接近，但主体是 mobile manipulation 精定位；作为未来找物 / 对齐评测候选，不进入本轮主卡片。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮不建议回写主线架构或决策日志；这些论文仍属于 Phase 5 研究输入。
2. 建议后续 Phase 5 验证模板评审时，把今天收敛出的 20 类字段与既有 provenance、导航、记忆、安全、端侧资源字段合并去重，形成“最小可执行字段包”，而不是新增平台。
3. 建议把导航失败预警、故障诊断和失败识别证据库列为下一轮 A 档论文整合评审的候选专题，因为它们更接近家庭样机试点的真实闭环问题。
4. 不建议因本轮论文新增在线 `VLA / WAM`、完整形式化验证平台、RAG 自动裁决系统、主动故障诊断控制器或非纯视觉传感主线。

## 6. 来源

1. arXiv `cs.RO/new`：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent`：<https://arxiv.org/list/cs.RO/recent>
3. GroundControl：<https://arxiv.org/abs/2606.20479>
4. Safe, Real-Time Active Model Discrimination and Fault Diagnosis：<https://arxiv.org/abs/2606.19590>
5. pdSTL：<https://arxiv.org/abs/2606.19561>
6. Slow Brain, Fast Planner：<https://arxiv.org/abs/2606.20458>
7. Fail-RAG：<https://arxiv.org/abs/2606.19598>
8. 3D Scene Graphs：<https://arxiv.org/abs/2606.19383>
9. Fast Human Attention Prediction：<https://arxiv.org/abs/2606.20491>
10. Autonomous Driving with Priority-Ordered STL Specifications：<https://arxiv.org/abs/2606.20336>
