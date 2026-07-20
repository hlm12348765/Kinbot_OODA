# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-17
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-17 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv API，确认本轮官方最新 Robotics listing 为 `Wednesday, 17 June 2026`，合计 `80` 篇 entries；其中 new submissions `43` 篇、cross submissions `11` 篇、replacement submissions `26` 篇。官方 `cs.RO/recent` 顶部为 `Tue, 16 Jun 2026`，显示 `Total of 356 entries` 且首页为 `showing first 50 of 127 entries`，本轮按 `cs.RO/new` 作为正式 listing 口径，收录长期导航证据记忆、视觉导航尺度安全、机器人端侧呼吸监测、Agentic Navigation 参数化接口和连续边缘推理资源评测 5 篇论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-06-17。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv API、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Wednesday, 17 June 2026`，合计 `80` 篇 entries；其中 new submissions `43` 篇、cross submissions `11` 篇、replacement submissions `26` 篇。
3. 官方 `cs.RO/recent` 顶部为 `Tue, 16 Jun 2026`，显示 `Total of 356 entries`，首页为 `Tue, 16 Jun 2026 (showing first 50 of 127 entries)`；该页用于复核近期待补录和重复主题，不作为本轮 entries 总数、new / cross / replacement 计数口径。
4. 本轮 `cs.RO/new` 与 `cs.RO/recent` 顶部日期不一致，因此按仓库规则以 `cs.RO/new` 作为正式 Robotics listing、entries 总数与 `new / cross / replacement` 计数口径；`cs.RO/recent` 只作为日期差异、近期待补录和重复主题复核辅助。
5. 2026-06-15 与 2026-06-16 已覆盖 `Monday, 15 June 2026` listing 及其日更补录，本轮不重复收录 `TRACE`、`ForestBack`、`Elastic Queries RL`、楼层图先验或选择性 Agent 恢复等已进入主卡片的主题。

筛选标准：

1. 是否改变 Kinbot 对家庭室内导航、长期空间记忆、安全治理、健康感知或端侧资源的判断。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`health_management`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：导航证据检索、动作尺度误配风险、呼吸信号质量、可配置视觉 token 预算、持续边缘推理热稳定性和流式性能退化。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `APOLLO`、`ERQA-Plus`、`VERITAS`、`GeneralVLA-2` 和 `Memory as a Wasting Asset` 都有候选字段价值，但本轮主卡片优先覆盖能直接改变导航、记忆、健康感知和端侧资源评测口径的论文。
2. `replacement` 条目中 `TRACE`、`CADET`、`Can Vision Foundation Models Navigate?`、`ThinkJEPA` 等主题已被近期记忆、因果审计、视觉导航和 world model 纪要覆盖；本轮未发现足以从 replacement 升级主卡片的新增 Kinbot 字段。
3. 大量 `VLA / WAM / manipulation / dexterous hand / humanoid` 条目仍有研究价值，但 Kinbot 一代不做机械臂操作主链路，本轮不因论文数量多而扩张在线 `VLA / world model` 组件。

## 2. 本轮总判断

本轮真正新增的判断是：Kinbot 的 Phase 5 论文吸收重点应进一步从“选择某个大导航模型”转为“把导航、记忆、健康感知和端侧运行转成可观测、可约束、可降级的字段”。

1. **长期导航记忆应同时保留结构化关系和片段上下文**：`VL-MemKnG` 提示，单纯依赖长上下文 `VLM` 代价高，单纯图检索又可能丢失片段连续性；Kinbot 的家庭空间记忆可把对象关系、房间 / 路径关系和片段级上下文拆成低维证据字段。
2. **视觉导航模型的归一化动作存在物理尺度风险**：`VISTA` 明确指出，归一化轨迹在不同本体尺度下会改变物理几何并增加碰撞风险；Kinbot 应在回放和实机日志中记录动作尺度、真实位移和尺度误配导致的近碰 / 碰撞。
3. **健康感知不能只写“支持非接触监测”，必须记录信号质量和场景边界**：`Contactless Respiratory Monitoring` 对 RGB、NIR、thermal、low-light 的距离、照明和姿态边界给出部署信号；Kinbot 可吸收呼吸监测验证字段，但不据此改变一代传感主线。
4. **Agentic Navigation 的价值在可配置观察策略，不在直接替换导航栈**：`Qwen-RobotNav` 提示任务模式、视觉 token 预算、相机权重和上下文策略可被外部 planner 动态配置；Kinbot 可吸收这些作为运行时观测策略字段，但不能把 2B-8B 模型或 agentic nav backbone 写成当前产品基线。
5. **端侧资源评测必须从静态 benchmark 进入持续流式运行**：`Edge-TSR` 作为 cross-list 主卡片的价值在于指出静态图像 benchmark 可能高估部署效果，真实流式推理会出现 20-30% 相对退化、热约束和持续帧率边界；这能直接补强 Kinbot 端侧资源 profiling。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| ObjectNav / 语义地图 / scene graph / floor-plan prior | 已接近饱和 | 只有新增家庭实机闭环、端侧资源实测、冲突处理或安全审计字段时进入主卡片。 |
| 长期导航证据、片段记忆和 delayed evidence | 值得专题跟踪 | 将 `VL-MemKnG` 与近期 `TRACE`、动作-效果记忆、长期情景记忆合并为 `spatiotemporal_relation_edge`、`segment_context_memory_id`、`evidence_grounded_answer_trace` 字段。 |
| 视觉导航尺度安全和跨本体部署 | 值得专题跟踪 | 将 `VISTA` 与前序本体泛化、安全 envelope、normalized action 论文合并为 `action_scale_factor`、`physical_displacement_error`、`scale_mismatch_near_collision` 字段。 |
| 健康感知 / 呼吸监测 / 非接触生命体征 | 候选专题 | 仅吸收 `respiratory_signal_quality_index`、`lighting_mode`、`distance_to_user_m`、`posture_visibility` 等验证字段；不新增 thermal / NIR / low-light 硬件基线。 |
| Agentic navigation / 上层 planner 调参 | 值得轻量跟踪 | 把任务模式、视觉 token 预算、相机权重和上下文策略记录为 runtime 字段；不新增在线 agentic navigation 大模型主链路。 |
| 连续边缘推理、热稳定性和流式退化 | 值得专题跟踪 | 将 `Edge-TSR` 与前序端侧资源论文合并成持续运行 profiling：`continuous_inference_duration_min`、`thermal_throttle_event`、`streaming_accuracy_delta`、`fps_under_load`。 |
| 泛 `VLA / WAM / manipulation / humanoid / dexterous hand` | 已饱和或低相关 | 除非新增家庭移动安全、健康感知、端侧资源或 Phase 5 轻量字段，否则进入候选排除表。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 VL-MemKnG、VISTA、机器人端侧呼吸监测、Qwen-RobotNav、Edge-TSR、APOLLO、VERITAS、GeneralVLA-2、ERQA-Plus 和 flash endurance 定价全部写成在线子系统，会过复杂”。建议只吸收 15 类轻量字段：`spatiotemporal_relation_edge`、`segment_context_memory_id`、`navigation_evidence_retrieval_top1`、`action_scale_factor`、`physical_displacement_error`、`scale_mismatch_near_collision`、`respiratory_signal_quality_index`、`posture_visibility`、`distance_to_user_m`、`navigation_task_mode`、`visual_token_budget`、`per_camera_weight`、`continuous_inference_duration_min`、`thermal_throttle_event`、`streaming_accuracy_delta`。暂不新增长期记忆大脑、归一化动作导航主模型、非接触生命体征硬件基线、Agentic Navigation 主 backbone 或持续边缘感知平台。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | VL-MemKnG: Hybrid Memory with a Spatio-Temporal Knowledge Graph for Question Answering over Long Egocentric Navigation Trajectories | 进入长期导航证据与片段记忆专题，吸收结构化关系、片段上下文和证据追踪字段；不新增长上下文视频问答在线模块。 |
| A- | VISTA: Scale-Aware Visual Navigation via Action History Conditioning | 进入视觉导航尺度安全专题，吸收动作尺度、真实位移和尺度误配碰撞字段；不直接采用新的 VNM 主模型。 |
| B+ | Contactless Respiratory Monitoring on Heterogeneous Mobile Robots | 进入健康感知验证候选，吸收呼吸信号质量、距离、照明和姿态边界字段；不改变一代传感主线。 |
| B+ | Qwen-RobotNav Technical Report | 进入 Agentic Navigation 观测策略候选，吸收任务模式、视觉 token 预算、相机权重和上下文策略字段；不冻结为产品模型选型。 |
| B+ | Beyond Benchmarks: Continuous Edge Inference for Fine-Grained Roadside Perception | 作为 cross-list 主卡片进入端侧资源 profiling，吸收持续运行、热稳定性、流式退化和 FPS under load 字段；不迁移 roadside perception 任务。 |

## 3. 论文卡片

### 3.1 VL-MemKnG: Hybrid Memory with a Spatio-Temporal Knowledge Graph for Question Answering over Long Egocentric Navigation Trajectories

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.17183](https://arxiv.org/abs/2606.17183) |
| 本轮 listing 口径 | 2026-06-17 官方 listing new submission；API 显示 `Published: 2026-06-15T18:21:14Z` |
| 分类 | `cs.RO` |
| 方法关键词 | spatio-temporal knowledge graph, segment-level contextual memory, long egocentric navigation, evidence-grounded QA, hybrid retrieval |

摘要要点转述：

论文关注长时第一视角导航轨迹上的问答：问题证据可能分散在很早以前、不同位置和不同时间片段中，单靠长上下文视觉语言模型成本高，重复查询也低效；单靠图检索又可能丢失片段连续性和上下文。作者提出 `VL-MemKnG`，在时空知识图之外加入持久的片段级上下文记忆。知识图保存对象和空间关系，片段记忆保存较宽的时间上下文，二者共同供检索和推理模块生成有证据支撑的答案。论文还扩展 `WalkieKnowledge` 为更长时的 `WalkieKnowledgeT+`，覆盖时间分散和全局聚合问题。结果显示，相比既有图方法和长上下文模型，混合记忆能提高检索准确率和证据聚合能力。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`mobility_navigation` 与 `observability_data_governance` 中“家庭空间记忆如何支持可追溯问答”的问题。
2. Kinbot 在老人家中需要回答“药盒刚才在哪里”“老人刚才经过哪个房间”“某个障碍是否新出现”等问题，不能只依赖当前帧或无限追加原始视频。
3. 对应 Phase 5：建议增加 `spatiotemporal_relation_edge`、`segment_context_memory_id`、`navigation_evidence_retrieval_top1`、`evidence_grounded_answer_trace`、`temporal_scattered_evidence_count` 和 `memory_query_cost_ms` 字段。

资源消耗与部署信号：

1. 论文明确把长上下文 `VLM` 的计算成本作为问题，因此对 Kinbot 有价值的是“结构化关系 + 片段记忆”的低维化方向。
2. 真实落地仍需评估图更新、片段摘要生成、检索 latency 和端侧存储预算；不应默认保留长时原始视频。
3. 该方法适合作为离线回放、试点日志和端侧摘要记忆的评测框架，不适合直接变成在线长视频问答模块。

优势：

1. 把长期导航记忆拆成对象关系、空间关系、片段上下文和证据链，利于审计。
2. 解决“证据跨时间分散”的问题，和 Kinbot 家庭巡护、找物、健康观察高度相关。
3. 相比无限长上下文，混合记忆更贴近端侧资源和隐私约束。

劣势与风险：

1. 论文任务是 navigation-oriented video QA，不等于完整机器人任务执行。
2. 片段摘要若错误，会在后续问答中放大，需要保留来源和置信度。
3. 图结构和上下文记忆如何过期、合并、冲突处理，仍需 Kinbot 自己定义。

推荐理由：

建议作为 A- 级输入。它应进入长期导航证据与片段记忆专题，帮助 Kinbot 把家庭记忆从“存更多视频”收敛为“存可检索、可追溯、可过期的关系和证据片段”；不建议新增长上下文视频问答在线模块。

### 3.2 VISTA: Scale-Aware Visual Navigation via Action History Conditioning

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.17294](https://arxiv.org/abs/2606.17294) |
| 本轮 listing 口径 | 2026-06-17 官方 listing new submission；API 显示 `Published: 2026-06-15T21:01:30Z` |
| 分类 | `cs.RO`, `cs.LG` |
| 方法关键词 | visual navigation foundation model, normalized action, action history conditioning, scale-aware navigation, OOD deployment |

摘要要点转述：

论文指出视觉导航基础模型常输出归一化动作，以便跨不同本体和环境泛化；但同一个归一化轨迹乘以不同尺度因子后，物理位移和路径几何会改变，可能导致导航性能下降和碰撞风险上升。作者提出用归一化动作历史和图像观测共同作为条件，让模型显式学习预测动作与真实物理位移之间的关系，并引入更强的视觉编码器以处理重复纹理和空间几何。实机零样本部署覆盖户外、森林和办公室，报告目标预测和路径跟随指标较强。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 和 `safety_compliance_authorization` 中“跨本体 / 跨速度 / 跨尺度部署时，归一化动作如何保证物理安全”的问题。
2. Kinbot 低速轮式底盘会根据地面、载荷、地毯、门槛和电量变化出现真实位移误差；模型输出若只按固定归一化尺度执行，可能在近人场景产生风险。
3. 对应 Phase 5：建议增加 `action_scale_factor`、`normalized_action_history_window`、`physical_displacement_error`、`scale_mismatch_near_collision`、`path_geometry_deviation` 和 `visual_repetition_failure_case` 字段。

资源消耗与部署信号：

1. 论文引入更强视觉编码器，端侧成本未必适合 `12GB + 32GB` 默认量产线。
2. Kinbot 当前更应吸收动作尺度和真实位移校验字段，而不是直接采用该视觉导航模型。
3. `action history conditioning` 可先作为回放分析和控制日志字段，用于评估不同地面 / 速度 / 载荷下的尺度误差。

优势：

1. 直接揭示归一化导航动作的部署安全缺口，和家庭机器人跨地面材质、跨批次底盘一致性相关。
2. 把动作历史纳入模型条件，可帮助区分“模型想走多远”和“机器人实际走了多远”。
3. 对重复纹理环境的鲁棒性与家庭走廊、白墙、相似房间有关。

劣势与风险：

1. 实验环境不等同于老人家庭室内低速避障。
2. 论文的强视觉编码器和模型结构可能增加端侧成本。
3. 不能替代底层轮速、IMU、避障和安全速度限制。

推荐理由：

建议作为 A- 级输入。它应进入视觉导航尺度安全专题，帮助 Kinbot 在 Phase 5 中显式验证动作尺度、真实位移和碰撞风险；不建议直接新增视觉导航基础模型主链路。

### 3.3 Contactless Respiratory Monitoring on Heterogeneous Mobile Robots: A Multimodal Edge-Computing Framework

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.17376](https://arxiv.org/abs/2606.17376) |
| 本轮 listing 口径 | 2026-06-17 官方 listing new submission；API 显示 `Published: 2026-06-16T00:18:46Z` |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | contactless respiratory monitoring, edge computing, signal quality index, chest ROI, heterogeneous mobile robots |

摘要要点转述：

论文研究移动机器人在不接触人体、且不同平台和照明条件下估计呼吸频率。作者提出一个端侧多模态框架：根据亮度选择 RGB、thermal、NIR 或 low-light 传感器，用人体关键点定位胸部 ROI，再用信号质量指数过滤不可靠估计。实验覆盖三类机器人平台、不同边缘计算架构、不同姿态、光照和人机距离。结果显示 RGB 在较远距离覆盖最好，NIR 和 low-light 对暗光有帮助，thermal 可靠距离更短；框架无需按平台重新调参即可泛化，但每种模态都有明确边界。

解决 Kinbot 的什么问题：

1. 对应 `health_management`、`safety_compliance_authorization` 和 `platform_runtime` 中“机器人是否能用非接触方式辅助健康观察，以及如何定义可靠边界”的问题。
2. Kinbot 首发价值排序中健康管理优先，但一代传感主线仍是纯视觉；本论文可用于补充呼吸监测验证字段，而不是直接新增 thermal / NIR / low-light 硬件。
3. 对应 Phase 5：建议增加 `respiratory_signal_quality_index`、`chest_roi_tracking_quality`、`lighting_mode`、`distance_to_user_m`、`posture_visibility`、`contactless_rr_valid_window` 和 `health_sensing_modality_boundary` 字段。

资源消耗与部署信号：

1. 论文强调 onboard edge computing，和 Kinbot 端侧处理原始敏感数据的原则一致。
2. 多模态传感器组合会增加硬件、BOM、隐私和标定复杂度；Kinbot 当前应优先在 RGB / 暗光条件下验证可用边界。
3. SQI 过滤机制比“有无呼吸估计值”更重要，应作为健康感知输出的可信度门槛。

优势：

1. 直接贴合老人看护和健康管理，且强调非接触、端侧和跨平台泛化。
2. 给出了距离、姿态、照明和模态边界，有助于设计实机试点。
3. 信号质量指数可防止低质量呼吸估计被误用为健康事实。

劣势与风险：

1. 论文场景偏应急和灾害响应，不是家庭老人长期陪伴。
2. thermal / NIR / low-light 传感器不符合当前一代纯视觉低成本主线，不能直接纳入硬件基线。
3. 呼吸频率只能作为健康观察线索，不应替代穿戴设备、医疗问诊或紧急上报规则。

推荐理由：

建议作为 B+ 级输入。它应进入健康感知验证候选，帮助 Kinbot 明确非接触生命体征的有效距离、姿态、光照和信号质量边界；不建议改变一代传感主线。

### 3.4 Qwen-RobotNav Technical Report: A Scalable Navigation Model Designed for an Agentic Navigation System

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.18112](https://arxiv.org/abs/2606.18112) |
| 本轮 listing 口径 | 2026-06-17 官方 listing new submission；API 显示 `Published: 2026-06-16T16:17:44Z` |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | agentic navigation, task mode, controllable observation parameters, visual token budget, context strategy |

摘要要点转述：

论文提出面向 Agentic Navigation 系统的可扩展导航模型。作者认为指令跟随、目标搜索、目标跟踪和自动驾驶可以共享感知规划 backbone，但它们需要不同的视觉流消费策略。为此，模型提供参数化接口：一类参数选择任务模式，一类参数控制观察方式，例如视觉 token 预算、相机权重和历史上下文编码策略。训练时对这些参数做随机化，使模型在推理时可以由上层 planner 动态切换配置，不需要改 backbone。论文使用 15.6M 样本训练，报告 2B 到 8B 参数规模的 scaling，并在多类导航 benchmark 和真实机器人上展示泛化。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`decision_orchestration` 和 `platform_runtime` 中“上层任务如何调节导航观察策略，而不是每类任务重做一个导航栈”的问题。
2. Kinbot 的巡护、找物、跟随老人、回充、夜间静默观察和异常上报，确实可能共享底层导航能力，但观察预算和上下文策略应随任务切换。
3. 对应 Phase 5：建议增加 `navigation_task_mode`、`visual_token_budget`、`per_camera_weight`、`context_strategy_switch_reason`、`planner_mode_switch_event`、`observation_budget_under_task` 和 `navigation_backbone_reconfig_success` 字段。

资源消耗与部署信号：

1. 2B-8B 模型规模对 Kinbot 默认量产线有明显压力，不能直接作为当前端侧产品基线。
2. 对 Kinbot 最有价值的是“可配置观察参数 + 上层 planner 动态切换”的接口思想，而不是具体模型权重。
3. 如果未来做端云协同导航，必须记录每次视觉 token 预算、相机权重和上下文策略切换的原因与安全结果。

优势：

1. 把导航任务模式和观察预算显式参数化，有助于统一巡护、找物、跟随和目标跟踪。
2. 与 Kinbot 多相机、纯视觉和端侧资源约束高度相关。
3. 提供了上层 Agent 调参、底层导航执行之间的接口语言。

劣势与风险：

1. 技术报告的模型规模和训练数据量远超 Kinbot 一代可直接自研或端侧部署边界。
2. benchmark 成绩不能替代家庭老人场景的安全、隐私和低速近人验证。
3. 若上层 Agent 频繁切换观察策略，可能引入不可解释和难以复现的导航行为。

推荐理由：

建议作为 B+ 级输入。它应进入 Agentic Navigation 观测策略候选，帮助 Kinbot 定义“任务模式、视觉预算、相机权重、上下文策略”这类接口字段；不建议把 `Qwen-RobotNav` 直接写成模型选型或产品基线。

### 3.5 Beyond Benchmarks: Continuous Edge Inference for Fine-Grained Roadside Perception

| 项目 | 内容 |
| --- | --- |
| arXiv | [2606.17241](https://arxiv.org/abs/2606.17241) |
| 本轮 listing 口径 | 2026-06-17 官方 listing cross submission from `cs.CV`；API 显示 `Published: 2026-06-15T19:39:55Z`；本轮因新增持续边缘推理和热稳定性评测字段而收录 |
| 分类 | `cs.CV`, `cs.RO`, `eess.SY` |
| 方法关键词 | continuous edge inference, streaming deployment degradation, temporal stabilization, thermal behavior, Jetson Orin Nano |

摘要要点转述：

论文指出，资源受限边缘硬件上的连续 AI 推理会出现静态 benchmark 看不到的问题：视频流时间不稳定、长时间运行热降频、不同工作负载下性能波动。作者实现 `Edge-TSR`，把检测、跟踪、细粒度分类和轻量时序稳定结合到 Jetson Orin Nano 上，评估静态图片测试到真实车载流式部署的差异。结果显示，静态 benchmark 会系统性高估部署效果，三个强基线在真实流式运行下出现 20-30% 相对退化；时序稳定可恢复一部分准确率，并在 55 分钟、26 km 的实际运行中保持安全热边界内的持续帧率。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`observability_data_governance` 和 `mobility_navigation` 中“端侧模型真实持续运行表现如何评估”的问题。
2. Kinbot 的家庭样机不能只跑静态图片、短视频或单轮 benchmark；需要连续巡护、长时间陪伴、夜间静默和热稳定条件下的真实流式 profiling。
3. 对应 Phase 5：建议增加 `continuous_inference_duration_min`、`streaming_accuracy_delta`、`thermal_throttle_event`、`fps_under_load`、`edge_safe_temperature_margin`、`temporal_stabilization_enabled` 和 `static_to_streaming_regression_pct` 字段。

资源消耗与部署信号：

1. 论文在 Jetson Orin Nano 上给出持续运行信号，虽然硬件和任务不同，但评测口径可迁移。
2. 对 Kinbot 最重要的是“静态 benchmark 到流式部署的退化差”，而不是 roadside perception 任务本身。
3. 该 cross-list 符合收录边界，因为它新增的是端侧资源和持续运行治理字段，而不是相邻感知任务。

优势：

1. 直接补齐端侧资源评估中的持续运行、热稳定性和流式退化盲区。
2. 提醒 Kinbot Phase 5 不能只看平均延迟和单帧准确率。
3. 时序稳定机制可作为低成本改善流式感知一致性的候选。

劣势与风险：

1. 场景是路侧交通感知，不是家庭机器人导航。
2. Jetson Orin Nano 不等同于 Kinbot 当前量产芯片线，需要重新测。
3. 论文的检测 / 分类任务与 Kinbot 交互、健康和导航闭环不同，不能直接外推准确率。

推荐理由：

建议作为 B+ 级 cross-list 输入。它应进入端侧资源 profiling 专题，帮助 Kinbot 把验证从静态 benchmark 推进到持续流式运行和热稳定性；不建议迁移 roadside perception 任务。

## 4. 候选排除表

| 论文 | arXiv | listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| Abstention-Aware Personalized Object Rearrangement via Uncertainty-Guided LLM Assistance | [2606.17309](https://arxiv.org/abs/2606.17309) | 2026-06-17 new submission | 个性化、CPU 轻量模型和不确定性触发 LLM 有价值，但任务是物品重排和可操作性判断；Kinbot 一代不做物理操作主链路，本轮只保留 `abstention_reason_code`、`selective_llm_assist` 和 `user_environment_preference_profile` 候选字段。 |
| ERQA-Plus: A Diagnostic Benchmark for Reasoning in Embodied AI | [2606.17639](https://arxiv.org/abs/2606.17639) | 2026-06-17 new submission | 具身推理 benchmark 覆盖空间、动作、社交、导航和常识，有评测价值；但本轮主卡片已覆盖更直接的导航记忆和端侧运行字段，ERQA-Plus 可作为后续 `embodied_reasoning_taxonomy` 候选，不写成 Phase 5 标准 benchmark。 |
| FLAP: FOV-Constrained Active Perception Planning for Prior-Map-Free 3D Navigation | [2606.17630](https://arxiv.org/abs/2606.17630) | 2026-06-17 new submission | 视场约束和主动感知规划对安全有启发，但对象是 UAV 的 3D 高动态轨迹；Kinbot 低速轮式家庭场景只保留 `fov_constrained_obstacle_discovery` 和 `late_obstacle_detection_risk` 字段。 |
| Visual Verification Enables Inference-time Steering and Autonomous Policy Improvement | [2606.18247](https://arxiv.org/abs/2606.18247) | 2026-06-17 new submission | `VERITAS` 的视觉 verifier 对推理时安全验证有价值，但自主 policy improvement 容易被误写成在线自我进化主线；本轮只保留 `visual_verifier_pass_fail`、`verified_rollout_source` 字段，不进入主卡片。 |
| Uncertainty Quantification for Flow-Based Vision-Language-Action Models | [2606.18043](https://arxiv.org/abs/2606.18043) | 2026-06-17 new submission | VLA 不确定性和失败检测重要，但对象仍是 flow-based manipulation VLA；近期 `latent OOD`、`query budget`、`visual verification` 已覆盖安全治理方向，本轮不新增在线 VLA 主链路。 |
| GeneralVLA-2: Geometry-Aware Reconstruction and Governed Memory for Robot Planning | [2606.17480](https://arxiv.org/abs/2606.17480) | 2026-06-17 cross submission from `cs.CV` | governed memory 的质量、置信、生命周期、冲突和 verifier 元数据有价值，但主体仍是 RGB-D manipulation / VLA planning；保留 `memory_quality_score`、`memory_conflict_state` 和 `memory_lifecycle_state` 候选字段。 |
| Memory as a Wasting Asset: Pricing Flash Endurance for Embodied Agents, and the Limits of Doing So | [2606.18144](https://arxiv.org/abs/2606.18144) | 2026-06-17 cross submission from `cs.AI` | flash endurance 定价直接触及 `32GB Flash` 资源治理，但论文仍偏理论和成本模型；本轮由 `Edge-TSR` 覆盖更实测的端侧持续运行字段，保留 `flash_write_budget`、`memory_tier_routing_reason` 候选。 |
| Extracting Semantics: LLM-Guided Automatic Population of Robot Ontology from URDF | [2606.17073](https://arxiv.org/abs/2606.17073) | 2026-06-17 new submission | LLM 从 URDF 生成机器人本体语义抽象对可解释推理有价值，但 Kinbot 当前更缺家庭场景记忆、导航安全和端侧资源验证；只保留 `robot_self_ontology_validation` 候选，不进入主卡片。 |
| ACE-Ego-0 / CAIP / EgoInfinity / Qwen-RobotManip / PearlVLA / ThinkingVLA 等 VLA 与操作学习条目 | [2606.17200](https://arxiv.org/abs/2606.17200)、[2606.17256](https://arxiv.org/abs/2606.17256)、[2606.17385](https://arxiv.org/abs/2606.17385)、[2606.17846](https://arxiv.org/abs/2606.17846)、[2606.17924](https://arxiv.org/abs/2606.17924)、[2606.17937](https://arxiv.org/abs/2606.17937) | 2026-06-17 new submissions | 数据规模、动作表征和 VLA reasoning 有研究价值，但多以 manipulation、dexterous hand 或通用操作为主；近期 VLA / WAM 已饱和，Kinbot 一代不新增物理操作主链路。 |
| Can Vision Foundation Models Navigate? Zero-Shot Real-World Evaluation and Lessons Learned | [2603.25937](https://arxiv.org/abs/2603.25937) | 2026-06-17 replacement submission | 视觉基础模型导航评估相关，但本轮 replacement 未新增足以越过 `VISTA`、`Qwen-RobotNav` 的 Kinbot 字段；继续保留为视觉导航专题背景。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 本轮论文默认仍作为 `docs/09_research/00_papers/` 下的研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。
2. 若后续处理 Phase 5 验证模板、家庭样机试点、导航回放报告、健康感知验证或端侧资源 profiling，可优先吸收本轮最小字段：`spatiotemporal_relation_edge`、`segment_context_memory_id`、`navigation_evidence_retrieval_top1`、`action_scale_factor`、`physical_displacement_error`、`scale_mismatch_near_collision`、`respiratory_signal_quality_index`、`posture_visibility`、`distance_to_user_m`、`navigation_task_mode`、`visual_token_budget`、`per_camera_weight`、`continuous_inference_duration_min`、`thermal_throttle_event`、`streaming_accuracy_delta`。
3. 不建议新增长期记忆大脑、归一化动作导航主模型、thermal / NIR / low-light 生命体征硬件基线、Agentic Navigation 主 backbone、持续边缘感知平台、在线 VLA 自我改进模块或 manipulation 数据飞轮。
4. 如果后续要专题跟踪，优先方向是“长期导航证据记忆 + 视觉导航尺度安全 + 健康感知可靠边界 + 可配置观察预算 + 连续边缘推理 profiling”的最小闭环。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent` 官方 listing：<https://arxiv.org/list/cs.RO/recent>
3. `VL-MemKnG: Hybrid Memory with a Spatio-Temporal Knowledge Graph for Question Answering over Long Egocentric Navigation Trajectories`：<https://arxiv.org/abs/2606.17183>
4. `VISTA: Scale-Aware Visual Navigation via Action History Conditioning`：<https://arxiv.org/abs/2606.17294>
5. `Contactless Respiratory Monitoring on Heterogeneous Mobile Robots`：<https://arxiv.org/abs/2606.17376>
6. `Qwen-RobotNav Technical Report`：<https://arxiv.org/abs/2606.18112>
7. `Beyond Benchmarks: Continuous Edge Inference for Fine-Grained Roadside Perception`：<https://arxiv.org/abs/2606.17241>
8. 候选排除表条目：[`APOLLO`](https://arxiv.org/abs/2606.17309)、[`ERQA-Plus`](https://arxiv.org/abs/2606.17639)、[`FLAP`](https://arxiv.org/abs/2606.17630)、[`VERITAS`](https://arxiv.org/abs/2606.18247)、[`Flow-Based VLA UQ`](https://arxiv.org/abs/2606.18043)、[`GeneralVLA-2`](https://arxiv.org/abs/2606.17480)、[`Memory as a Wasting Asset`](https://arxiv.org/abs/2606.18144)、[`URDF Ontology`](https://arxiv.org/abs/2606.17073)、[`Can Vision Foundation Models Navigate?`](https://arxiv.org/abs/2603.25937)
