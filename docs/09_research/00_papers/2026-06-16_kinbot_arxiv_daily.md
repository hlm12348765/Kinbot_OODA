# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-16
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-16 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv API，确认本轮本地日更时官方最新 Robotics listing 仍为 `Monday, 15 June 2026`，合计 `79` 篇 entries；其中 new submissions `48` 篇、cross submissions `7` 篇、replacement submissions `24` 篇。官方 `cs.RO/recent` 顶部为 `Mon, 15 Jun 2026`，显示 `55 of 55 entries`，不含 replacement。本轮在 2026-06-15 已精筛覆盖同一 listing 后，按日更补录 + 周度综合判断口径收录选择性 Agent 恢复、缺失模态鲁棒预测、breadcrumb 返回导航和 VLA 查询预算调度 4 篇论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-06-16。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 仍为 `Monday, 15 June 2026`，合计 `79` 篇 entries；其中 new submissions `48` 篇、cross submissions `7` 篇、replacement submissions `24` 篇。
3. 官方 `cs.RO/recent` 顶部为 `Mon, 15 Jun 2026`，显示 `55 of 55 entries`；该页只覆盖当日 new + cross 的 recent 条目，不含 `cs.RO/new` 中的 `24` 篇 replacement，因此本轮 entries 总数、new / cross / replacement 计数以 `cs.RO/new` 为准。
4. 本地日期为 2026-06-16，官方页面尚未出现 `Tuesday, 16 June 2026` Robotics 新批次。本轮仍可形成 2026-06-16 日更，但必须写明是“最新官方 2026-06-15 listing + 当日未出现新批次说明 + 前一日已精筛覆盖后的日更补录”。
5. 2026-06-15 已收录主卡片：`AnyGoal`、`Cross-Stage Sensorimotor Perception Scheduling and Sparse Map Encoding for Efficient Edge Embodied Navigation`、`TRACE`、`Sensitivity Shaping for Latent Modeling`、`FloVerse`。本轮不重复这些主卡片，也不把昨天候选排除表中的低增量条目直接升级，除非能新增明确 Kinbot 验证字段。

筛选标准：

1. 是否改变 Kinbot 对家庭室内导航、长期记忆、安全治理、端侧资源或 Phase 5 验证字段的判断。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`、`human_service_interface`。
3. 是否能低成本转化为 Phase 5 验证项：远端 Agent 调用门控、缺失模态鲁棒预测、返回路径 fallback、VLA 查询预算、状态难度评分、传感缺失记录和本地安全过滤。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `Whole-Body Impedance MPC` 与物理接触安全相关，但对象是 floating-base humanoid / biped，且需要全身力控和关节力矩架构；本轮只保留接触扰动估计候选字段，不改变 Kinbot 一代轮式形态。
2. `EgoGuide` 对 robot-free 示教采集有价值，但主体仍是 manipulation / UMI 数据采集；Kinbot 一代不做物理操作主链路，本轮只作为家庭样机试点数据采集候选。
3. `Schrödinger's Navigator` 与零样本 ObjectNav 和遮挡推理相关，但本轮为 replacement，且昨天已经用 `AnyGoal` 与 `FloVerse` 覆盖目标相关证据地图和户型图弱先验；只保留 occlusion-aware future imagination 候选字段。
4. `CADET` 和 driving safety envelope 论文对因果审计有启发，但场景为自动驾驶；不直接升级为家庭机器人导航主卡片。

## 2. 本轮总判断

本轮真正新增的判断是：在同一 2026-06-15 listing 已覆盖导航、楼层图、记忆、latent OOD 和端侧 ObjectNav 资源后，剩余高价值增量主要集中在“运行时何时调用强 Agent / 强 VLA、传感或模态缺失时如何降级、机器人如何找到回退路径”。

1. **远端 Agent 应是选择性恢复模块，不应进入安全关键主循环**：`Selective Agentic Recovery` 提示本地 mission loop 与安全执行必须留在端侧，远端 Agent 只在 no-progress、blocked passage 或 mission ambiguity 明确触发时介入，并且返回动作需要解析、验证、安全过滤和映射到本地 executor。
2. **缺失模态不是异常日志尾项，而应成为预测与安全评估的显式输入**：`Missing Modality` 提示训练和推理都应记录模态可用性，Kinbot 在相机遮挡、音频不可用、轮速 / IMU 异常或网络死角时，需要明确 `missing_modality_mask` 和降级后的轨迹预测置信度。
3. **返回路径 fallback 可以先做成低维 breadcrumb，而不是完整重建地图**：`ForestBack` 虽是 pedestrian PDR，但它把返航问题转成可逆 breadcrumb 节点、转弯事件和漂移误差记录；Kinbot 可吸收为离线 / 网络差 / 语义地图不可靠时的保底返回字段。
4. **端侧资源调度不只按模型大小，也要按状态难度分配查询预算**：`Elastic Queries RL` 提示 VLA / policy 的推理频率、denoising steps 和 action chunk 长度可以随状态难度变化；Kinbot 不应引入在线 VLA 主链路，但可吸收 `state_difficulty_score`、`query_budget` 和 `open_loop_execution_window` 字段。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| ObjectNav / 语义地图 / scene graph / floor-plan prior | 已接近饱和 | 只有新增家庭实机闭环、端侧资源实测、遮挡风险字段或户型图冲突处理时进入主卡片。 |
| 端云协同 Agent 恢复与本地安全执行 | 值得专题跟踪 | 将 `PMR` 与现有授权 / 回滚 / runtime assurance 论文合并，形成 `agentic_recovery_invocation_gate`、`remote_reasoning_cost`、`agent_decision_safety_filter` 字段。 |
| 传感缺失、模态缺失和降级预测 | 值得专题跟踪 | 形成 `missing_modality_mask`、`sensor_dropout_case`、`degraded_forecast_confidence`、`fallback_due_to_missing_input` 字段，用于 Phase 5 回放和实机试点。 |
| 返回路径 fallback / breadcrumb navigation | 轻量跟踪 | 先作为保底返回与失联降级验证字段，不替代纯视觉导航、全局语义地图或自主探索主线。 |
| VLA / policy 查询预算和状态难度调度 | 接近专题成熟 | 只吸收端侧资源 profiling 字段，不新增在线 VLA 操作或 manipulation 主链路。 |
| humanoid / dexterous manipulation / driving / UAV | 已饱和或低相关 | 除非能转成家庭移动安全、端侧资源、数据治理或 Phase 5 轻量字段，否则进入候选排除表。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 PMR 远端 Agent、missing-modality transformer、breadcrumb PDR、EQRL 查询调度、Whole-Body Impedance MPC、EgoGuide 示教系统、CADET 因果审计和 Schrödinger's Navigator 未来想象全部写成在线组件，会过复杂”。建议只吸收 10 类轻量字段：`agentic_recovery_invocation_gate`、`remote_reasoning_cost`、`agent_decision_safety_filter`、`missing_modality_mask`、`degraded_forecast_confidence`、`breadcrumb_node_sequence`、`return_path_reversibility`、`state_difficulty_score`、`query_budget_nfe`、`open_loop_execution_window`。暂不新增远端 Agent 主控制环、完整多模态预测 backbone、独立返航导航栈、在线 VLA 查询调度器或 humanoid 物理接触控制栈。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | Selective Agentic Recovery for UAV Autonomy with a Persistent Mission Runtime | 进入端云协同 Agent 恢复专题，吸收远端 Agent 调用门控、本地安全过滤和决策验证字段；不迁移 UAV 栈。 |
| B+ | An Attention-based Model for Robust Forecasting with Missing Modality | 进入传感缺失和降级预测专题，吸收模态可用性 mask、预测置信度和人轨迹预测降级字段；不新增重型多模态 backbone。 |
| B | ForestBack: Breadcrumb-Based Pedestrian Dead Reckoning for Infrastructure-Free Return Navigation | 进入返回路径 fallback 候选，吸收 breadcrumb 节点、转弯事件和漂移误差字段；不替代 Kinbot 主导航。 |
| B | Elastic Queries Reinforcement Learning: Self-Aware Policy Execution for VLA Models | 进入端侧资源调度候选，吸收状态难度、查询预算和 action chunk 字段；不升级为在线 VLA 主链路。 |

## 3. 论文卡片

### 3.1 Selective Agentic Recovery for UAV Autonomy with a Persistent Mission Runtime

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.14219](https://arxiv.org/abs/2606.14219) |
| 本轮 listing 口径 | 2026-06-15 官方 listing new submission；API 显示 `Published: 2026-06-12` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | persistent mission runtime, selective agentic recovery, learned cognitive value of invocation, safety-filtered executor, local mission loop |

摘要要点转述：

论文研究在 UAV 自主任务中如何把外部 Agent 推理接入运行时恢复，而不是让远端推理持续控制飞行。作者提出 `Persistent Mission Runtime`，将 mission loop 和安全关键执行保持在本地，只在 blocked passage、repeated no-progress 或 mission-level ambiguity 等状态下调用外部 Agent。Agent 返回的恢复决策不会直接执行，而是先经过解析、验证、安全过滤，再映射到本地 executor 的预定义恢复技能。论文还提出 learned Cognitive Value of Invocation，用一个紧凑 admission gate 判断远端推理是否足以抵消延迟、资源成本和后端不确定性。Gazebo/PX4 400-run benchmark 中，learned-CVI 在困难 / 模糊状态下显著提升成功率，同时减少远端调用和 token 日志量。

解决 Kinbot 的什么问题：

1. 对应 `decision_orchestration`、`safety_compliance_authorization`、`platform_runtime` 和 `observability_data_governance` 中“什么时候允许云端或强 Agent 介入恢复”的问题。
2. Kinbot 在家庭中可能遇到门被挡、通道临时变化、网络不稳、任务目标含糊或局部导航长期无进展；远端 Agent 可提供恢复建议，但不能越过端侧避障、速度限制和授权边界。
3. 对应 Phase 5：建议增加 `agentic_recovery_invocation_gate`、`no_progress_event_count`、`blocked_passage_case_id`、`remote_reasoning_cost`、`agent_decision_parse_result`、`agent_decision_safety_filter`、`local_executor_mapping` 和 `recovery_success_after_agent_call` 字段。

资源消耗与部署信号：

1. 论文明确把远端 Agent 调用视为有延迟、有资源成本、有后端不确定性的稀缺动作，符合 Kinbot 端云协同和离线安全要求。
2. learned-CVI 的价值不是具体模型，而是“调用收益大于运营成本和风险时才调用”的门控口径，可迁移到家庭样机试点日志。
3. UAV/PX4 任务不能直接迁移到轮式家庭机器人，但本地 loop + safety-filtered recovery 的工程边界高度可复用。

优势：

1. 把 Agent 从主控制环中降级为 on-demand recovery module，能避免在线 Agent 直接控制安全关键动作。
2. 决策链路包含 parse、verify、safety filter 和 executor mapping，天然适合 Kinbot 的审计字段。
3. 远端调用量和 token 量被纳入评估，能连接到端云成本和响应时间治理。

劣势与风险：

1. 场景是 UAV 和仿真 benchmark，家庭室内轮式移动的恢复技能集合需要重新定义。
2. learned-CVI 仍需要训练和标注，Kinbot 初期可先用规则门控和回放统计近似。
3. 如果把外部 Agent 的建议当成高优先级命令，会破坏本地安全执行边界。

推荐理由：

建议作为 A- 级输入。它应进入端云协同 Agent 恢复专题，帮助 Kinbot 明确“云端 / 强 Agent 只在本地运行时证明值得调用时介入，并且返回结果必须经过安全过滤”；不建议迁移 UAV 控制栈或让远端 Agent 成为主控制环。

### 3.2 An Attention-based Model for Robust Forecasting with Missing Modality

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.13970](https://arxiv.org/abs/2606.13970) |
| 本轮 listing 口径 | 2026-06-15 官方 listing new submission；API 显示 `Published: 2026-06-11` |
| 分类 | `cs.RO`, `cs.LG` |
| 方法关键词 | missing modality, multimodal forecasting, CVAE, transformer, human trajectory prediction |

摘要要点转述：

论文关注真实机器人系统中多模态输入不完整的问题。现有多模态模型通常假设训练和推理阶段所有模态都可用，这在传感器遮挡、数据丢包或某些模态暂时不可用时不成立。作者提出一个可在训练和推理中处理缺失模态的注意力模型，用条件变分自编码器结合 transformer 结构，学习统一的固定维表示，并在部分输入缺失时近似完整多模态表征。论文在五个多模态数据集和两类机器人学习任务上评估，包括人类轨迹预测和机器人 manipulation forecasting，报告其相对既有融合方法在缺失输入下更稳健。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`safety_compliance_authorization` 和 `world_state_memory` 中“传感或模态临时不可用时，预测和安全判断如何降级”的问题。
2. Kinbot 一代虽坚持纯视觉主线，但实际仍会遇到摄像头遮挡、暗光、麦克风不可用、IMU / 轮速异常、网络死角和用户 App 上下文缺失。
3. 对应 Phase 5：建议增加 `missing_modality_mask`、`sensor_dropout_case`、`modality_available_at_inference`、`degraded_forecast_confidence`、`human_trajectory_prediction_under_dropout`、`fallback_due_to_missing_input` 和 `forecast_recovery_after_modality_return` 字段。

资源消耗与部署信号：

1. CVAE + transformer 表示不是轻量规则，需要评估端侧延迟和内存；Kinbot 初期不应直接新增该 backbone。
2. 更适合先作为回放 / 数据模板字段，记录缺失模态条件下的预测置信度变化和安全决策是否降级。
3. 由于论文强调统一固定维表示，可作为未来端侧轻量融合模型的候选方向，但不能替代当前纯视觉导航验证。

优势：

1. 把“传感缺失”从异常备注提升为模型输入条件，适合 Phase 5 试点中系统化复盘。
2. 覆盖人类轨迹预测，和 Kinbot 家庭中老人、访客、儿童绕行安全有直接关联。
3. 训练和推理都考虑缺失模态，比只在测试阶段做 dropout 更接近真实部署。

劣势与风险：

1. 摘要未给出 Kinbot 目标硬件上的推理资源数据，无法直接判断 `12GB + 32GB` 量产线成本。
2. manipulation forecasting 结果不能直接外推到家庭移动安全。
3. 如果用模型补全结果替代真实观测，可能掩盖关键传感失败，需要保留缺失标记和置信度。

推荐理由：

建议作为 B+ 级输入。它应进入传感缺失和降级预测专题，帮助 Kinbot 在回放、试点和安全报告中显式记录“哪些输入缺失、预测置信度如何下降、是否触发降级动作”；不建议新增重型多模态预测 backbone。

### 3.3 ForestBack: Breadcrumb-Based Pedestrian Dead Reckoning for Infrastructure-Free Return Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.14421](https://arxiv.org/abs/2606.14421) |
| 本轮 listing 口径 | 2026-06-15 官方 listing new submission；API 显示 `Published: 2026-06-12` |
| 分类 | `cs.RO`, `cs.HC`, `eess.SP` |
| 方法关键词 | breadcrumb navigation, pedestrian dead reckoning, return path, infrastructure-free navigation, turn-event detection |

摘要要点转述：

论文面向 GPS、Wi-Fi、蓝牙信标或预装基础设施不可用时的返回导航问题。`ForestBack` 将用户行走路线记录为可逆 breadcrumb 节点序列，并基于加速度步伐检测、自适应步长估计、磁力计辅助航向、气压高度修正和双向路径重建生成反向路径引导。实验使用室内绕障路线、五个检查点、36 次行走试验和 42,474 条时间序列样本，报告相比传统 PDR 降低平均 RMSE 和最终位置误差，转弯事件检测一致性接近 99.90%。论文重点不是构建完整地图，而是在基础设施缺失时保留可回退路径。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 和 `platform_runtime` 中“主导航不可靠、网络不佳或语义地图失效时如何保底返回”的问题。
2. Kinbot 在首次探索、夜间巡护、临时遮挡、网络死角或语义定位失败时，需要一个不依赖云端和复杂地图的低维 return fallback。
3. 对应 Phase 5：建议增加 `breadcrumb_node_sequence`、`return_path_reversibility`、`turn_event_detected`、`dead_reckoning_drift_m`、`fallback_return_mode`、`infrastructure_free_return_success` 和 `return_path_user_intervention` 字段。

资源消耗与部署信号：

1. 方法主要使用 IMU、磁力计、气压计和轻量时序处理，资源成本低；但 Kinbot 一代主线仍应以纯视觉导航和轮式里程计为核心。
2. breadcrumb 可以作为低维日志或 fallback 字段，不需要保存原始视频或完整稠密地图。
3. 家庭室内磁场干扰、轮式里程计误差和门槛 / 地毯打滑需要重新实测。

优势：

1. 把“走不回去”问题转成可复盘的低维路径节点和转弯事件，适合试点记录。
2. 不依赖外部基础设施，符合家庭网络和信号死角假设。
3. 适合作为主导航之外的保底机制，而不是新主线。

劣势与风险：

1. 论文对象是 pedestrian PDR，不是轮式机器人闭环控制。
2. 使用磁力计和气压计并不等同于 Kinbot 一代需要新增硬件；应优先复用 IMU、轮速和视觉定位日志。
3. breadcrumb 只能帮助返回，不解决开放词汇目标搜索、动态障碍和长期语义记忆。

推荐理由：

建议作为 B 级输入。它应进入返回路径 fallback 候选，帮助 Kinbot 在 Phase 5 验证模板中记录“当主导航不可靠时是否仍能安全返回”；不建议把 pedestrian PDR 直接升级为机器人主导航方案。

### 3.4 Elastic Queries Reinforcement Learning: Self-Aware Policy Execution for VLA Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.14375](https://arxiv.org/abs/2606.14375) |
| 本轮 listing 口径 | 2026-06-15 官方 listing new submission；API 显示 `Published: 2026-06-12` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | elastic policy query, VLA inference budget, state difficulty, critic disagreement, action chunk length |

摘要要点转述：

论文指出，VLA 模型通常按固定推理和重规划周期执行，但机器人状态难度并不均匀：接触丰富、观测不确定或控制临界状态需要更多计算和更频繁反馈，简单状态可以使用更少推理步骤和更长 open-loop action chunk。作者提出 `Elastic Queries Reinforcement Learning`，在不微调底层 VLA 的前提下，用轻量 latent-schedule adaptor 联合选择 latent input、denoising budget 和 action chunk length。方法用 critic ensemble disagreement 提取状态难度信号，并把可变 chunk 执行建模为 query-level macro-action RL，在仿真和真实 manipulation 中降低 amortized inference cost，同时保持或改善任务成功率。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime` 和 `mobility_navigation` 中“端侧推理预算应如何随任务难度变化”的问题。
2. Kinbot 未来即使不引入在线 VLA 操作主链路，也会面对导航、交互、视觉识别和安全评估的动态推理预算分配。
3. 对应 Phase 5：建议增加 `state_difficulty_score`、`critic_disagreement_proxy`、`query_budget_nfe`、`action_chunk_length`、`open_loop_execution_window`、`compute_saving_under_easy_state` 和 `extra_query_due_to_safety_state` 字段。

资源消耗与部署信号：

1. 论文目标是减少 amortized inference cost，和 Kinbot `12GB + 32GB` 默认资源线相关。
2. 但 EQRL 本身依赖 VLA、denoising steps 和 RL 训练，不适合作为当前一代在线机制。
3. Kinbot 可先把“状态难度驱动的推理频率”作为资源 profiling 字段，而不是引入完整查询调度器。

优势：

1. 提供了比固定频率推理更细的资源治理语言：难状态多算，简单状态少算。
2. `critic disagreement` 可启发 Kinbot 记录不确定性触发的额外视觉 / 规划 /安全评估。
3. 不要求微调底层 VLA，这一点对未来模型供应商和端侧部署边界有参考价值。

劣势与风险：

1. 验证对象是 manipulation VLA，不等于 Kinbot 家庭移动和陪伴交互。
2. RL 调度器本身会增加训练、验证和安全证明复杂度。
3. 如果把 action chunk 放得过长，家庭近人安全可能被 open-loop 执行拖累，需要安全状态强制短 chunk。

推荐理由：

建议作为 B 级输入。它应进入端侧资源调度候选，帮助 Kinbot 把资源评估从平均延迟扩展到状态难度、额外查询原因和 open-loop 窗口；不建议新增在线 VLA 查询调度器。

## 4. 候选排除表

| 论文 | arXiv | listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| Whole-Body Impedance Model Predictive Control for Safe Physical Human--Robot Interaction on Floating-Base Platforms | [2606.14617](https://arxiv.org/abs/2606.14617) | 2026-06-15 new submission | 安全 pHRI 与接触扰动估计有价值，但对象是 floating-base biped / humanoid 全身力控；Kinbot 一代轮式形态不需要引入全身 impedance MPC，只保留 `contact_disturbance_estimate` 和 `physical_contact_safety_margin` 候选字段。 |
| EgoGuide: Egocentric Guidance for Efficient Robot-Free Demonstration Collection and Learning | [2606.14665](https://arxiv.org/abs/2606.14665) | 2026-06-15 new submission | robot-free 示教采集对数据效率有启发，但重点是 UMI-style manipulation 和 wrist/head camera 数据；Kinbot 当前不做物理操作主链路，保留为家庭试点数据采集候选。 |
| CADET: Physics-Grounded Causal Auditing and Training-Free Deconfounding of End-to-End Driving Planners | [2606.14438](https://arxiv.org/abs/2606.14438) | 2026-06-15 new submission | training-free causal audit 对发现 spurious cue 有治理价值，但场景是自动驾驶规划；本轮只保留 `spurious_cue_audit_case` 候选，不进入家庭移动机器人主卡片。 |
| Schrödinger's Navigator: Imagining an Ensemble of Futures for Zero-Shot Object Navigation | [2512.21201](https://arxiv.org/abs/2512.21201) | 2026-06-15 replacement submission | 零样本 ObjectNav 和遮挡下多未来想象相关，但本轮是 replacement，且与 2026-06-15 `AnyGoal`、`FloVerse` 的目标证据 / 户型图先验主题重叠；保留 `occlusion_imagined_future_count` 和 `future_aware_value_map` 候选字段。 |
| Causal Object-Centric Models for Planning with Monte Carlo Tree Search | [2606.14418](https://arxiv.org/abs/2606.14418) | 2026-06-15 cross submission from `cs.AI` | object-causal attention 对任务相关实体筛选有启发，但验证以 RL benchmark、ManiSkill、Robosuite 和 VizDoom 为主；未新增 Kinbot 家庭导航、记忆或安全字段。 |
| BIM-Loc: BIM-Integrated Discrepancy-Aware LiDAR-based Indoor Localization | [2606.14237](https://arxiv.org/abs/2606.14237) | 2026-06-15 new submission | BIM + LiDAR localization 对室内定位有工程价值，但依赖建筑信息模型和激光雷达；不符合 Kinbot 一代纯视觉产品主线，保留为对照基线。 |
| Robust Fall Recovery for Armless Bipedal-Wheeled Robots Via Force-Guided Learning | [2606.14270](https://arxiv.org/abs/2606.14270) | 2026-06-15 new submission | bipedal-wheeled fall recovery 与安全恢复相关，但 Kinbot 当前低速轮式底盘不以跌倒恢复作为主风险；仅保留 `self_recovery_after_tip_event` 远期候选。 |
| Low-Burden LLM-Based Preference Learning: Personalizing Assistive Robots from Natural Language Feedback for Users with Paralysis | [2604.01463](https://arxiv.org/abs/2604.01463) | 2026-06-15 replacement submission；2026-06-15 已列入候选排除表 | 低负担自然语言偏好学习与老人辅助有相邻价值，但本轮没有新增足以从排除项升级为主卡片的导航、记忆、安全或端侧资源字段；继续保留为交互偏好治理候选。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮论文默认仍作为 `docs/09_research/00_papers/` 下的研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。
2. 若后续处理 Phase 5 验证模板、家庭样机试点、导航回放报告或端侧资源 profiling，可优先吸收本轮最小字段：`agentic_recovery_invocation_gate`、`remote_reasoning_cost`、`agent_decision_safety_filter`、`missing_modality_mask`、`degraded_forecast_confidence`、`breadcrumb_node_sequence`、`return_path_reversibility`、`state_difficulty_score`、`query_budget_nfe`、`open_loop_execution_window`。
3. 不建议新增远端 Agent 主控制环、完整多模态预测 backbone、独立返航导航栈、在线 VLA 查询调度器、humanoid 全身物理接触控制栈、LiDAR/BIM 定位基线或 robot-free manipulation 示教主链路。
4. 如果后续要专题跟踪，优先方向是“本地安全执行 + 选择性远端恢复 + 缺失模态降级预测 + 低维返回路径 fallback + 状态难度驱动资源 profiling”的最小闭环。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent` 官方 listing：<https://arxiv.org/list/cs.RO/recent>
3. `Selective Agentic Recovery for UAV Autonomy with a Persistent Mission Runtime`：<https://arxiv.org/abs/2606.14219>
4. `An Attention-based Model for Robust Forecasting with Missing Modality`：<https://arxiv.org/abs/2606.13970>
5. `ForestBack: Breadcrumb-Based Pedestrian Dead Reckoning for Infrastructure-Free Return Navigation`：<https://arxiv.org/abs/2606.14421>
6. `Elastic Queries Reinforcement Learning: Self-Aware Policy Execution for VLA Models`：<https://arxiv.org/abs/2606.14375>
7. 候选排除表条目：[`Whole-Body Impedance MPC`](https://arxiv.org/abs/2606.14617)、[`EgoGuide`](https://arxiv.org/abs/2606.14665)、[`CADET`](https://arxiv.org/abs/2606.14438)、[`Schrödinger's Navigator`](https://arxiv.org/abs/2512.21201)、[`Causal Object-Centric Models`](https://arxiv.org/abs/2606.14418)、[`BIM-Loc`](https://arxiv.org/abs/2606.14237)、[`Robust Fall Recovery`](https://arxiv.org/abs/2606.14270)、[`Low-Burden LLM-Based Preference Learning`](https://arxiv.org/abs/2604.01463)
