# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-07-05
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-07-05 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与论文详情页，确认本轮官方最新 Robotics listing 为 `Friday, 3 July 2026`，合计 `81` 篇 entries；其中 new submissions `38` 篇、cross submissions `9` 篇、replacement submissions `34` 篇。官方 `cs.RO/recent` 顶部覆盖 `Fri, 3 Jul 2026` 至 `Mon, 29 Jun 2026`，显示 `Total of 321 entries`；本轮按周日未出现当日新批次说明 + 最新官方 listing + 近期待补录 + 周度综合判断口径，收录低层语言导航接口、端侧闭环推理 runtime、视觉语言延迟攻击、家庭找物个性化边界和纯 RGB 参考轨迹导航 5 篇论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-07-05。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Friday, 3 July 2026`，合计 `81` 篇 entries；其中 new submissions `38` 篇、cross submissions `9` 篇、replacement submissions `34` 篇。
3. 官方 `cs.RO/recent` 顶部覆盖 `Fri, 3 Jul 2026` 至 `Mon, 29 Jun 2026`，显示 `Total of 321 entries`；其中 `Fri, 3 Jul 2026` 为 `47` 篇、`Thu, 2 Jul 2026` 为 `62` 篇、`Wed, 1 Jul 2026` 为 `69` 篇、`Tue, 30 Jun 2026` 为 `107` 篇、`Mon, 29 Jun 2026` 为 `36` 篇。`cs.RO/recent` 用于近期待补录与重复主题复核，不作为正式 Robotics listing、entries 总数或 `new / cross / replacement` 计数口径。
4. 今天为 2026-07-05 周日，本轮检索时 arXiv 官方尚未出现 `Sunday, 5 July 2026` Robotics 新批次；本轮按“最新官方 listing + 周日未出现新批次说明 + `cs.RO/recent` 近期待补录 + 周度综合判断”形成日更。
5. 上一轮自动化记忆停在 2026-06-28，已覆盖长期导航时空记忆、长程控制记忆检索、VLA 安全诊断、低延迟证据对齐 VLM 与 VLA 测试 oracle。本轮先排除这些直接重复主题，只收录能新增 Kinbot 验证字段、治理项或端侧资源判断的论文。

筛选标准：

1. 是否改变 Kinbot 对家庭室内导航、长期记忆、安全治理、端侧资源或 Phase 5 验证证据链的判断。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`decision_orchestration`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 字段：低层导航接口、闭环 runtime profile、视觉语言延迟攻击、家庭找物个性化边界、参考轨迹复现和跨本体视觉导航。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `VLA-Corrector`、`Transport Discrepancy as a Reliability Signal for VLA Models`、`VLSA`、`VLA-Arena`、`Guided Action Flow` 等 `VLA` 安全、action chunk 和 benchmark 条目近期已高度密集；除非直接补充 Kinbot 家庭移动安全或端侧资源字段，本轮不再扩张为主卡片。
2. `SE(2) Navigation Mesh`、`DL-SLAM`、`DL-VINS-Factory` 等几何 / SLAM 条目有工程价值，但多依赖点云、双目 / 惯导或高密度几何重建；本轮只保留 footprint、yaw 可通行性和视觉前端评测启发，不改写纯视觉产品主线。
3. `NEUROSYMLAND`、`BIFROST`、`FastBridge` 与多个 UAV / 自动驾驶 safe RL 条目有边缘部署或 sim-to-real 价值，但场景远离家庭轮式机器人，优先进入候选排除表。
4. `Episodic-to-Semantic Consolidation Without Identity Drift` 的记忆治理思想有价值，但更偏形式化 agent 身份和审计模型；本轮作为候选字段，不优先进入主卡片。

## 2. 本轮总判断

本轮不是继续扩张 Kinbot 的在线 `VLA / WAM / world model` 层，而是把 Phase 5 需要验证的“低层接口、运行时、攻击面、个性化边界和纯视觉轨迹复现”拆得更具体。

1. **语言导航开始向低层连续控制接口下沉**：`CoFL-S` 与 `LoTIS` 都提醒，Kinbot 的 VLN / NFM 不能只评估高层指令理解，还要测“局部可见区域如何变成连续轨迹”“参考轨迹在当前视角中是否被正确定位”。
2. **端侧 runtime 成为模型能力落地的硬门槛**：`Embodied.cpp` 把闭环控制、多速率执行、batch-1 延迟、内存占用和后端抽象明确为 embodied runtime 合同；这与 Kinbot `12GB + 32GB` 量产线直接相关。
3. **视觉语言安全需要纳入“延迟攻击”**：`Overthink-Triggered Slowdown Attacks` 表明，场景中文字不仅可能误导语义，还可能诱导模型过度推理并拖慢控制链路；Kinbot 需要把超时、降级和关键路径 deadline 写成验证字段。
4. **家庭找物个性化必须受隐私和收益门控约束**：`PerSim` 的价值不在于给用户打人格标签，而在于明确“什么时候值得个性化，什么时候应继续用群体先验”，避免为了找物效率过度采集家庭轨迹。
5. **周度综合判断继续收敛**：`VLA` 操作、world model、3DGS、UAV / 自动驾驶和 manipulation policy 仍是 listing 大头；对 Kinbot 真正留下来的应是字段、回放集和阶段门，不是新增在线子系统。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 低层语言导航接口 / 连续轨迹 | 值得专题跟踪 | 将 `CoFL-S`、`LoTIS` 与既有 VLN / NFM 设计合并，形成 `visible_sector_flow_success`、`reference_trajectory_alignment`、`planner_frequency_hz` 等字段候选。 |
| 端侧 embodied runtime | 值得进入端侧资源评估 | 将 `Embodied.cpp` 的 runtime contract 转化为 batch-1 延迟、闭环 jitter、峰值内存、后端 fallback 和模型 adapter 字段。 |
| LVLM 延迟攻击 / 视觉文本触发 | 值得进入安全测试 | 将 `Overthink` 场景文字触发、推理 token 上限、超时降级和关键任务 deadline violation 纳入 Phase 5 负例回放。 |
| 家庭找物个性化 | 值得字段整合 | 将 `PerSim` 的对象 rigidity 与个性化收益门控转化为找物验证字段；不新增人格画像或侵入式家庭轨迹采集。 |
| VLA manipulation / WAM / 3DGS / UAV safe RL | 接近饱和或相邻 | 保留候选表启发，不升级为 V1 产品主链路、传感主线、在线地图形态或策略编排层。 |

## 3. 推荐优先级

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | CoFL-S: Spatially Queryable Sector Flow Fields for Local Language-Conditioned Navigation | 进入 VLN / NFM 低层接口候选字段，重点验证局部可见区域、连续轨迹、planner 频率和速度控制闭环；不新增在线 `VLA` 主链路。 |
| A- | Embodied.cpp: A Portable Inference Runtime of Embodied AI Models on Heterogeneous Robots | 进入端侧 runtime 与资源 profiling 字段包，评估 batch-1 延迟、闭环 jitter、峰值内存和后端 fallback；不把具体 C++ runtime 冻结为产品选型。 |
| B+ | Overthink-Triggered Slowdown Attacks on LVLM-Based Robotic Systems | 进入安全负例和延迟攻击测试，补充视觉文本触发、reasoning token 上限、超时降级和人工接管字段。 |
| B+ | When to Personalize Household Object Search: A Rigidity-Gated Hybrid Policy | 进入家庭找物 / 长期记忆候选字段，验证对象位置刚性、个性化收益和隐私边界；不新增用户人格画像主线。 |
| B+ | Learning to Localize Reference Trajectories in Image-Space for Visual Navigation | 进入纯 RGB 参考轨迹导航专题候选，验证无标定 / 跨本体 / 手机视频示教的最小可用性；不替代现有定位与局部规划基线。 |

## 4. 论文卡片

### 4.1 CoFL-S: Spatially Queryable Sector Flow Fields for Local Language-Conditioned Navigation

- arXiv：[2607.02222](https://arxiv.org/abs/2607.02222)
- Authors：Haokun Liu, Zhaoqi Ma, Yicheng Chen, Wentao Zhang, Masaki Kitagawa, Zicen Xiong, Jinjie Li, Moju Zhao
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-07-03 官方 listing new submission；abs 页显示 submitted on 2026-07-02；属于最新官方 listing 日更收录。
- Inclusion type：daily main card

摘要转述：

论文指出，当前视觉语言导航研究常把重点放在高层指令理解、记忆和全局地图，但低层动作表示仍偏粗糙。`CoFL-S` 将局部可见扇区预测为语言条件 flow field，再通过滚动 flow field 生成连续轨迹。作者把 VLN-CE 的整段 episode 转成帧级局部监督，包含子指令、动作、轨迹和 dense flow-field 目标，并用连续时间 Habitat benchmark 对不同 planner 频率和共享速度控制器进行闭环比较。

Kinbot 问题映射：

1. 对应 `mobility_navigation` 与 `decision_orchestration` 中“自然语言导航如何落到局部连续运动，而不是只输出离散 forward / turn token”的问题。
2. 对家庭场景中的“去厨房门口等我”“绕过椅子去茶几右侧”“靠近但不要挡路”等指令，Kinbot 需要验证局部可见区域和连续轨迹之间的接口。
3. Phase 5 候选字段：`visible_sector_flow_success`、`instruction_segment_alignment`、`planner_frequency_hz`、`continuous_trajectory_smoothness`、`velocity_controller_tracking_error`、`flow_conflict_recovery_reason`。

资源消耗：

1. 低层 flow field 会增加局部视觉编码和高频 planner 推理压力，需要和 `12GB RAM + 32GB Flash` 默认量产线下的 batch-1 延迟、峰值内存和热稳定一起评估。
2. Kinbot 一代更适合先在回放 / 仿真中验证“低层接口字段”，不直接把 `CoFL-S` 写成产品导航主链路。
3. 若 planner 频率提高但低层控制 jitter 增大，应优先触发局部保守规划或停等澄清，而不是持续叠加高层模型。

优劣势：

1. 优势：把 VLN 的高层语言理解和低层连续控制之间的接口问题明确化，正好对应 Kinbot 纯视觉导航落地缺口。
2. 优势：连续时间 benchmark 有助于避免只在离散 simulator action 上过拟合。
3. 劣势：仍需对齐 Kinbot 轮式底盘、头部 / 躯干相机视角和家庭窄通道约束。
4. 风险：若直接在线引入高频 flow-field 模型，端侧资源和调试复杂度会快速上升。

推荐理由：

建议作为 A- 级研究输入。它改变的是 Kinbot 对 VLN / NFM 评估的粒度：不仅评估“理解了什么”，还评估“低层接口是否能稳定转成连续运动”。

主线边界：

本轮仅作为 Phase 5 字段候选，不回写 `03_decision_log.md` 或主线架构基线。

### 4.2 Embodied.cpp: A Portable Inference Runtime of Embodied AI Models on Heterogeneous Robots

- arXiv：[2607.02501](https://arxiv.org/abs/2607.02501)
- Authors：Ling Xu, Chuyu Han, Borui Li, Hao Wu, Shiqi Jiang, Ting Cao, Chuanyou Li, Sheng Zhong, Shuai Wang
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-07-03 官方 listing new submission；abs 页显示 submitted on 2026-07-02；属于最新官方 listing 日更收录。
- Inclusion type：daily main card

摘要转述：

论文认为，具身 AI 模型部署被模型专用 Python 栈、后端假设和机器人端 glue code 割裂，而传统 inference runtime 多面向 request-response 服务，不满足闭环控制中的多速率执行、batch-1 低延迟、异构硬件和非 token I/O 合同。`Embodied.cpp` 用 C++ runtime 抽象输入 adapter、sequence builder、backbone execution、head plugin 和 deployment adapter，并在 `VLA` 与初步 `WAM` benchmark 中展示闭环执行与内存降低收益。

Kinbot 问题映射：

1. 对应 `platform_runtime`、`decision_orchestration` 与 `observability_data_governance` 中“端侧模型能力怎样进入闭环控制，不被 Python demo 栈和单次请求延迟误导”的问题。
2. Kinbot 若后续评估 VLM-lite、导航辅助模型或候选 VLA / WAM，不应只测模型 accuracy，还要测 runtime 合同、控制周期 jitter、后端 fallback 和可观测字段。
3. Phase 5 候选字段：`runtime_contract_version`、`model_adapter_id`、`batch1_latency_ms`、`control_loop_jitter_ms`、`peak_memory_mib`、`backend_capability_map`、`fallback_runtime_mode`、`model_io_schema_hash`。

资源消耗：

1. 论文明确把 batch-1 低延迟、多速率执行和内存占用作为 runtime 目标，对 Kinbot `12GB + 32GB` 资源线有直接参考价值。
2. 但具体 runtime 选型仍需和芯片、OS、ROS 2、推理后端、热设计和调试工具链一起评估，不能由单篇论文冻结。
3. 一代产品应先形成端侧 runtime profile 表，不直接承诺上线通用 VLA / WAM runtime。

优劣势：

1. 优势：把模型部署从 demo script 拉回到闭环 runtime 合同，适合 Phase 5 端侧资源证据链。
2. 优势：能补齐 batch-1、jitter、内存和 I/O schema 等常被论文忽略的工程字段。
3. 劣势：论文示例模型和硬件不必然等同 Kinbot 量产平台。
4. 风险：若把 runtime 抽象过早平台化，会引入比 V1 需要更大的模型兼容面和维护负担。

推荐理由：

建议作为 A- 级研究输入。它改变的是 Kinbot 对“端侧模型能不能上车”的判断方式：从模型单点效果转为闭环 runtime 合同和可测资源画像。

主线边界：

本轮不指定产品 runtime 选型，仅建议进入端侧资源与模型部署验证字段候选。

### 4.3 Overthink-Triggered Slowdown Attacks on LVLM-Based Robotic Systems

- arXiv：[2607.01518](https://arxiv.org/abs/2607.01518)
- Authors：Qiang Han, Jie Wu, Bo Chen
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-07-03 官方 listing cross submission；abs 页 primary 为 `cs.CR`，submitted on 2026-07-01；收录理由是新增机器人 LVLM 延迟攻击与安全降级字段。
- Inclusion type：daily main card / cross-list safety item

摘要转述：

论文研究一种针对机器人 LVLM 的 slowdown attack：攻击者把特定可读文本放进机器人视觉场景，诱导模型进入过度推理，显著拉长推理时间。作者用三阶段流程生成和验证触发文本，并在多个 LVLM 上评估黑盒迁移。结果显示，这类触发能够放大推理延迟，物理打印文本也能造成明显 slowdown。

Kinbot 问题映射：

1. 对应 `safety_compliance_authorization`、`platform_runtime` 与 `observability_data_governance` 中“视觉语言模型在真实家庭里遇到文本、标识、屏幕或恶意贴纸时，是否会拖慢关键任务”的问题。
2. Kinbot 的药品提醒、近人移动、夜间巡护和老人看护不能让视觉语言模型无界推理；超时本身就是安全风险。
3. Phase 5 候选字段：`lvml_latency_attack_case_id`、`visual_text_trigger_detected`、`reasoning_token_cap_hit`、`critical_path_deadline_violation`、`timeout_fallback_mode`、`slowdown_attack_replay_result`、`manual_review_required`。

资源消耗：

1. 主要风险不是常规平均延迟，而是长尾延迟和关键控制路径被拖住。
2. 端侧模型验证必须记录 p95 / p99 延迟、reasoning token 上限、超时降级和任务上下文；不能只测正常样本平均响应。
3. 对高风险任务，模型超时应触发停等、保守状态或人工确认，而不是继续等待模型输出。

优劣势：

1. 优势：直接补齐视觉语言机器人安全中的“可见文本导致延迟攻击”负例，和家庭真实环境高度相关。
2. 优势：不要求引入新模型，只要求把攻击样本和超时治理纳入测试集。
3. 劣势：论文关注 LVLM 推理延迟，未覆盖 Kinbot 全链路控制器和任务编排延迟。
4. 风险：过度依赖 prompt 或文本过滤可能漏掉多语言、图片化、反光屏幕等触发形式。

推荐理由：

建议作为 B+ 级研究输入。它将安全边界从“模型是否答错”扩展到“模型是否被拖慢到影响机器人行动安全”。

主线边界：

本轮不新增在线安全模型，只建议把延迟攻击样本与超时降级字段纳入 Phase 5 候选。

### 4.4 When to Personalize Household Object Search: A Rigidity-Gated Hybrid Policy

- arXiv：[2607.00022](https://arxiv.org/abs/2607.00022)
- Authors：Xianyao Li, Yuhai Wang, Hu Xiao, Kaleb Smith, Gilbert Yang Ye, Eric Jing Du
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-07-03 官方 listing replacement submission；abs 页显示 v1 submitted on 2026-06-18，v2 last revised on 2026-07-02；收录理由是直接新增家庭找物个性化边界与隐私治理字段。
- Inclusion type：daily main card / replacement validation item

摘要转述：

论文研究服务机器人何时应该为家庭物体搜索做个性化。作者提出 `PerSim`，用对象位置“刚性”门控个性化：对位置普遍固定的物品继续使用群体频率先验，对位置随住户差异明显变化的物品才引入个性化 prior。论文用人类校准仿真生成家庭物品放置迁移，并通过用户研究和 offline objective test 验证个性化在低刚性物品上更有收益。

Kinbot 问题映射：

1. 对应 `world_state_memory`、`mobility_navigation` 与 `observability_data_governance` 中“找物是否需要记住每个家庭的习惯，以及何时不值得采集更多家庭数据”的问题。
2. Kinbot 一代找药、找遥控器、找眼镜等任务，不能默认无限制采集住户轨迹；应先判断物品位置是否刚性、个性化是否带来可测收益。
3. Phase 5 候选字段：`object_location_rigidity_score`、`personalization_enabled_reason`、`population_prior_baseline_success`、`personalized_prior_delta`、`privacy_review_required`、`resident_data_retention_scope`、`expected_search_cost_delta`。

资源消耗：

1. 个性化 prior 本身资源不重，但家庭轨迹采集、长期存储和隐私授权成本高。
2. Kinbot 更适合先使用区域级、物品级和任务结果级结构化记忆，不保存长期原始视频轨迹。
3. 若个性化收益低，应回退群体先验和用户澄清，不应为了微小搜索收益增加数据回流与存储复杂度。

优劣势：

1. 优势：问题设定直接贴近家庭服务机器人找物，能把长期记忆和隐私收益权衡变成可测字段。
2. 优势：对象刚性门控能避免“所有家庭信息都值得个性化”的过度设计。
3. 劣势：论文使用住户特征和仿真管线，Kinbot 需重新定义不敏感、可解释、可删除的家庭记忆字段。
4. 风险：若误用人格或住户画像，会冲突隐私边界和家庭接受度。

推荐理由：

建议作为 B+ 级研究输入。它改变的是 Kinbot 对家庭找物记忆的治理方式：先做收益门控，再谈个性化，不把个性化当默认能力。

主线边界：

本轮仅作为长期记忆与找物验证字段候选，不新增人格画像、长期轨迹采集或云端个性化主线。

### 4.5 Learning to Localize Reference Trajectories in Image-Space for Visual Navigation

- arXiv：[2602.18803](https://arxiv.org/abs/2602.18803)
- Authors：Finn Lukas Busch, Matti Vahs, Quantao Yang, Jesús Gerardo Ortega Peimbert, Yixi Cai, Jana Tumova, Olov Andersson
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-07-03 官方 listing replacement submission；abs 页显示 v1 submitted on 2026-02-21，v2 last revised on 2026-07-02；收录理由是新增纯 RGB 参考轨迹定位、跨本体和无标定导航验证字段。
- Inclusion type：daily main card / replacement validation item

摘要转述：

论文提出 `LoTIS`，让机器人把参考 RGB 轨迹定位到当前图像空间，而不是预测某个本体绑定的动作。这样可以不依赖相机标定、位姿或特定机器人训练，把手机视频或其他本体采集的参考轨迹转成当前视角下的图像坐标，再交给局部规划器执行。论文报告其在多种仿真和真实环境中有较高成功率，并在逆向通行等困难场景中优于基线。

Kinbot 问题映射：

1. 对应 `mobility_navigation` 与 `world_state_memory` 中“纯视觉路线如何利用低成本示教视频、跨本体数据和参考路线复现”的问题。
2. 对家庭部署，用户或测试工程师可能用手机录制“从客厅到药箱 / 厨房 / 卫生间”的参考路线；Kinbot 需要验证能否在当前视角下对齐这条路线，而不是依赖完整重建。
3. Phase 5 候选字段：`reference_trajectory_source_id`、`image_space_trajectory_alignment`、`camera_calibration_required`、`cross_embodiment_success`、`viewpoint_shift_failure_reason`、`local_planner_handoff_success`。

资源消耗：

1. 相比全局重建或在线 `3DGS`，图像空间轨迹定位更轻，但仍需测视觉编码延迟、匹配鲁棒性和局部规划交接失败。
2. 若使用用户手机视频，需要明确本地处理、脱敏、删除和授权范围。
3. 一代更适合在样机试点和回放中验证 reference trajectory 字段，不替代现有定位、避障和安全停车链路。

优劣势：

1. 优势：贴近 Kinbot 纯视觉、低成本家庭部署和跨本体数据复用需求。
2. 优势：避免直接把视觉导航绑定到单一机器人动作空间。
3. 劣势：图像空间对齐不能替代安全避障、动态障碍处理和长期地图一致性。
4. 风险：若参考视频与当前家具摆放、光照或视角差异过大，可能产生错误引导。

推荐理由：

建议作为 B+ 级研究输入。它给 Kinbot 一个轻量验证方向：不用新增主动传感器，也可以评估手机视频 / 样机视频对纯视觉导航的复用价值。

主线边界：

本轮不改写纯视觉导航架构，只建议进入 Phase 5 参考轨迹导航字段候选。

## 5. 候选排除表

| 论文 | arXiv | 未收录为主卡片原因 | 保留启发 |
| --- | --- | --- | --- |
| Adaptive Companionship for Group-Following Robots | [2607.01287](https://arxiv.org/abs/2607.01287) | 社交陪伴和群体队形变化有价值，但更偏 group-following；Kinbot V1 家庭场景优先单人 / 小家庭近身安全，不新增群体陪伴 VLM planner。 | 保留 `social_distance_violation`、`companion_position_reason`、`group_formation_change` 字段候选。 |
| The Three Dimensions of ROS 2 Middleware | [2607.01304](https://arxiv.org/abs/2607.01304) | Survey 价值高，但不是具体 Kinbot 评测项；需进入平台架构评审而非每日主卡片。 | 保留 Space / Time / State 作为 ROS 2 中间件评审维度。 |
| Neuro-Symbolic Safety Guidance for Vision-Language-Action Models via Constrained Flow Matching | [2607.01378](https://arxiv.org/abs/2607.01378) | 与近期 VLA 安全主卡片重复，且偏 manipulation trajectory correction；不新增 VLA 执行主线。 | 保留 predictive collision correction 和 symbolic constraint satisfaction 字段启发。 |
| SE(2) Navigation Mesh | [2607.01454](https://arxiv.org/abs/2607.01454) | 对地面机器人可通行性有价值，但依赖点云 / mesh 和在线几何构建；不改写 V1 纯视觉主线。 | 保留 `footprint_yaw_feasibility`、`narrow_passage_heading_constraint` 字段候选。 |
| NEUROSYMLAND | [2607.02277](https://arxiv.org/abs/2607.02277) | 边缘部署和显式安全推理有价值，但场景为 UAV landing-site assessment，距离家庭轮式机器人较远。 | 保留 probabilistic semantic scene graph、symbolic safety rule latency 字段启发。 |
| VLA-Corrector | [2607.01804](https://arxiv.org/abs/2607.01804) | action horizon detect-and-correct 与既有 VLA failure / safety 主题重复；V1 不默认上线 VLA action chunk。 | 保留 `open_loop_action_horizon_risk`、`detect_correct_trigger` 字段候选。 |
| Episodic-to-Semantic Consolidation Without Identity Drift | [2607.01988](https://arxiv.org/abs/2607.01988) | 对长期记忆治理有启发，但更偏形式化 agent 身份与审计合同，缺少家庭机器人实测闭环。 | 保留 `semantic_memory_layer_version`、`identity_hash_unchanged`、`consolidation_audit_id` 字段候选。 |
| DL-VINS-Factory | [2607.01757](https://arxiv.org/abs/2607.01757) | 视觉惯导前端 benchmark 有工程价值，但 V1 主线不以 VI-SLAM 作为产品 fallback。 | 保留 learned feature front-end 对低光 / 退化场景的离线对比字段。 |
| ACID: Action Consistency via Inverse Dynamics for Planning with World Models | [2607.02403](https://arxiv.org/abs/2607.02403) | world model planning 一周内持续饱和；本轮不扩张在线 world model 层。 | 保留 `world_model_action_consistency_residual` 作为离线评估字段。 |
| LIME: Learning Intent-aware Camera Motion from Egocentric Video | [2607.02417](https://arxiv.org/abs/2607.02417) | 主动相机运动有价值，但会牵涉头颈 / 视角策略和结构约束；需在头部方案中单独评审。 | 保留 `intent_aware_viewpoint_request`、`occlusion_reveal_success` 字段候选。 |

## 6. 对 Kinbot 的落地 / 文档建议

1. 暂不回写主线架构、`03_decision_log.md` 或 Linear；本轮只作为研究输入和 Phase 5 字段候选。
2. 后续处理 `docs/05_p4_beta_dvt/01_mvp_validation_plan.md` 或样机回放模板时，可评审是否吸收以下字段包：
   - 低层语言导航：`visible_sector_flow_success`、`planner_frequency_hz`、`reference_trajectory_alignment`、`local_planner_handoff_success`
   - 端侧 runtime：`runtime_contract_version`、`batch1_latency_ms`、`control_loop_jitter_ms`、`peak_memory_mib`、`fallback_runtime_mode`
   - 安全与攻击：`visual_text_trigger_detected`、`reasoning_token_cap_hit`、`critical_path_deadline_violation`、`timeout_fallback_mode`
   - 家庭找物记忆：`object_location_rigidity_score`、`personalization_enabled_reason`、`personalized_prior_delta`、`privacy_review_required`
3. 若后续推进 `VLN -> NFM` 专题，应优先把 `CoFL-S` 与 `LoTIS` 放进低层接口评估，而不是继续只做高层指令理解 benchmark。
4. 若后续推进端侧模型 runtime，应先形成 profile 表和设备矩阵，不直接按 `Embodied.cpp` 冻结 C++ runtime 或通用 VLA / WAM runtime。

## 7. 主线与复杂度自检

本轮不回写主线的原因：

1. 所有论文结论仍停留在研究输入和字段候选，尚未通过 Kinbot 自有样机、家庭数据、端侧资源和安全回放验证。
2. 多数论文集中在 `VLA / WAM / world model / manipulation` 相邻方向，若直接吸收为在线模块，会显著超出 V1 一代收敛策略。
3. 当前冻结主线仍是纯视觉、端侧优先、`12GB RAM + 32GB Flash` 默认量产线和 `5000 到 6000 元` BOM 目标。

现在的架构是不是太复杂了？

如果把本轮论文都转成新模块，答案是“是”。本轮只保留四类轻量字段：低层导航接口、runtime profile、延迟攻击负例和找物个性化门控。它们应服务 Phase 5 验证证据链，而不是扩张 Kinbot 在线系统层级。

## 8. 来源

1. arXiv `cs.RO/new`：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent`：[https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
3. `CoFL-S: Spatially Queryable Sector Flow Fields for Local Language-Conditioned Navigation`：[https://arxiv.org/abs/2607.02222](https://arxiv.org/abs/2607.02222)
4. `Embodied.cpp: A Portable Inference Runtime of Embodied AI Models on Heterogeneous Robots`：[https://arxiv.org/abs/2607.02501](https://arxiv.org/abs/2607.02501)
5. `Overthink-Triggered Slowdown Attacks on LVLM-Based Robotic Systems`：[https://arxiv.org/abs/2607.01518](https://arxiv.org/abs/2607.01518)
6. `When to Personalize Household Object Search: A Rigidity-Gated Hybrid Policy`：[https://arxiv.org/abs/2607.00022](https://arxiv.org/abs/2607.00022)
7. `Learning to Localize Reference Trajectories in Image-Space for Visual Navigation`：[https://arxiv.org/abs/2602.18803](https://arxiv.org/abs/2602.18803)
