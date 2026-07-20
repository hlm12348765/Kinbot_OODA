# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-06-28
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-06-28 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与论文详情页，确认本轮官方最新 Robotics listing 为 `Thursday, 25 June 2026`，合计 `92` 篇 entries；其中 new submissions `66` 篇、cross submissions `9` 篇、replacement submissions `17` 篇。官方 `cs.RO/recent` 顶部已到 `Fri, 26 Jun 2026`，显示 `Total of 424 entries`，其中 `Fri, 26 Jun 2026` 为 `63` 篇 entries；本轮按周日未出现当日新批次说明 + 最新官方 listing + 近期待补录 + 周度综合判断口径，收录长期导航时空记忆、长程控制记忆检索、VLA 安全诊断、低延迟证据对齐 VLM 与 VLA 测试 oracle 5 篇论文，并保留候选排除表。

---

## 1. 检索口径

本轮检索日期：2026-06-28。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面、arXiv 论文详情页与本地既有每日论文纪要。
2. 本轮刷新时官方 `cs.RO/new` 最新 Robotics listing 为 `Thursday, 25 June 2026`，合计 `92` 篇 entries；其中 new submissions `66` 篇、cross submissions `9` 篇、replacement submissions `17` 篇。
3. 官方 `cs.RO/recent` 顶部已到 `Fri, 26 Jun 2026`，显示 `Total of 424 entries`；其中 `Fri, 26 Jun 2026` 为 `63` 篇 entries。`cs.RO/recent` 用于近期待补录与重复主题复核，不作为正式 Robotics listing、entries 总数或 `new / cross / replacement` 计数口径。
4. 今天为 2026-06-28 周日，本轮检索时 arXiv 官方尚未出现 `Sunday, 28 June 2026` Robotics 新批次；本轮按“最新官方 listing + 周日未出现新批次说明 + `cs.RO/recent` 近期待补录”形成日更。
5. 上一轮自动化记忆停在 2026-06-22，已覆盖 2026-06-20 至 2026-06-22 主卡片中的导航失败预警、故障诊断、概率安全、慢 `VLM` / 快 planner、数据 provenance、RGB last-meter、长期物品位置记忆、VLA 失败解释和视觉伺服资源调度。本轮先排除这些直接重复主题，只收录能新增 Kinbot 验证字段、治理项或周度判断的论文。

筛选标准：

1. 是否改变 Kinbot 对家庭室内导航、长期记忆、安全治理、端侧资源或 Phase 5 验证证据链的判断。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`decision_orchestration`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 字段：长期导航记忆命中、检索记忆可用性、安全诊断覆盖、低延迟视觉语言一致性、测试 oracle 审计和跨模型失败复现。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `SurveilNav`、`KRVF` 和 `ReaDy-Go` 都有导航或世界表示价值，但分别依赖固定监控视角、`RGB-D` 语义体素和动态 `3DGS` 仿真；本轮只保留外部视角边界、source-aware 语义来源和动态障碍仿真字段，不改写纯视觉主线或在线地图形态。
2. `RouterVLA`、`TIDAL`、`Action ControlNet` 和 `Memory-Efficient Policy Libraries with LoRA` 都与 `VLA / policy` 资源调度相关，但近期 `VLA / WAM / action chunk` 已多次覆盖；除非新增家庭移动安全、端侧资源或失败治理字段，否则不再写成主卡片。
3. `Learning Robot Visual Navigation in Crowds via Intention-Aware Scene Representations` 有近人导航价值，但重点是拥挤人群意图表征；Kinbot 家庭场景先吸收近人意图和速度场评测字段，不新增 crowd-navigation 子系统。
4. `MANGO` 作为 `cs.SE` primary 的 cross submission 被收录，是因为它直接新增可审计测试 oracle 和多 agent 测试生成治理项；收录不意味着 Kinbot 新增在线多 agent 测试生成平台。

## 2. 本轮总判断

本轮最新 Robotics listing 的增量不是“继续扩张一个更大的在线 `VLA / world model`”，而是把 Kinbot Phase 5 证据链拆得更可验证：长程导航需要可检索、可过期、可解释的时空记忆；端侧视觉语言链路需要在低延迟下保证答案与证据同时正确；安全治理需要从单一通过率扩展到诊断覆盖、失败模式和测试 oracle。

1. **导航记忆开始从对象位置扩展到时空关系和任务历史**：`RAVEN` 与 `HALO` 都指向同一结论：家庭机器人不能只记录“最后看到的对象坐标”，还要记录任务阶段、交互历史、视觉证据、动作上下文和检索命中 / 失效状态。
2. **安全 benchmark 要从 pass/fail 变成诊断字段**：`ForesightSafety-VLA` 和 `MANGO` 的共同价值是把失败、安全约束、测试 oracle 和多场景回归变成可审计字段；它们不要求 Kinbot 一代上线 `VLA` 主链路。
3. **端侧资源判断应绑定“证据正确性”**：低延迟 `VLM` 论文提醒，Kinbot 不能只测 `latency_ms` 和 `tokens/s`；家庭任务中还要测回答是否与视觉证据一致、是否能及时拒绝不确定判断。
4. **周度综合判断继续收敛**：`VLA`、world model、3D scene graph、manipulation policy 和自动驾驶式导航论文仍多，但多数只提供相邻技术启发。对 Kinbot 真正值得留下的是字段、回放集和阶段门，而不是新增在线子系统。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 长程导航时空记忆 / 可检索历史 | 值得专题跟踪 | 将 `RAVEN` 与此前长期导航证据、对象位置动态、情景记忆论文合并，形成 `spatiotemporal_memory_event_id`、`memory_retrieval_hit_rate`、`memory_staleness_reason`、`navigation_history_context_window` 字段候选。 |
| 记忆增强策略 / 长程控制 | 值得轻量跟踪 | 将 `HALO` 的 memory retrieval 和 forgetting robustness 转化为回放评估字段，不新增端侧大记忆库或行为克隆主链路。 |
| VLA 安全诊断 / 测试 oracle | 值得字段整合 | 将 `ForesightSafety-VLA` 与 `MANGO` 合并到 Phase 5 安全评测候选：失败模式、危险场景覆盖、oracle disagreement、测试生成 provenance 和人工复核标记。 |
| 低延迟视觉语言链路 | 值得进入端侧资源评估 | 在 `latency_ms`、`memory_peak_mb` 外补 `visual_evidence_correct`、`answer_correct`、`reject_uncertain` 字段，避免只优化速度。 |
| 固定监控、`RGB-D` 语义体素、动态 `3DGS` 仿真、VLA policy router | 相邻或已接近饱和 | 保留候选字段，不升级为 V1 产品主链路、传感主线、在线地图形态或 policy orchestration 层。 |

## 3. 推荐优先级

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | RAVEN: Long-Horizon Reasoning & Navigation with a Visuo-Spatio-Temporal Memory | 进入长期导航记忆专题，吸收时空事件记忆、历史上下文检索和导航任务成功 / 失败回放字段；不新增在线大模型导航主链路。 |
| A- | HALO: Memory Retrieval in Visuomotor Policies for Long-Horizon Robot Control | 进入记忆检索鲁棒性候选字段，评估长程任务中记忆命中、遗忘、上下文窗口和控制漂移；不引入行为克隆主链路。 |
| B+ | ForesightSafety-VLA: A Unified Diagnostic Safety Benchmark for Vision-Language-Action Models | 进入安全诊断字段候选，吸收危险场景覆盖、失败模式标签、VLA 安全 gap 与人工复核字段；不把 `VLA` 写成 Kinbot 一代执行主线。 |
| B+ | Toward Low-Latency Vision-Language Models with Doubly-Correct Predictions in Egocentric Visual Understanding | 进入端侧视觉语言资源评估，补充回答正确 + 视觉证据正确的双重验收；不新增云端实时视觉问答链路。 |
| B+ | MANGO: Automated Multi-Agent Test Oracle Generation for Vision Language Action Model Testing | 进入测试 oracle / QA 治理候选，吸收自动生成测试、oracle disagreement 和 provenance 字段；不新增在线多 agent 测试生成平台。 |

## 4. 论文卡片

### 4.1 RAVEN: Long-Horizon Reasoning & Navigation with a Visuo-Spatio-Temporal Memory

- arXiv：[2606.25206](https://arxiv.org/abs/2606.25206)
- Authors：Yixun Hu, Zhicheng Zheng, Lihan Zha, Chunwei Xing, Rajdeep Singh, Omar Hossain, Antonio Loquercio, Dhruv Shah
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-06-25 官方 listing new submission；属于最新官方 listing 日更收录。
- Inclusion type：daily main card

摘要转述：

论文提出一个面向长时程机器人问答与导航的 agentic memory 系统，将视觉 embedding、位姿和时间一起写入可检索记忆，并把检索结果 grounding 到空间地图中。作者强调，直接保存视觉 embedding 可以避免图像转文本 caption 的信息损失，并支持语义、空间和时间检索。论文在仿真和真实视频问答 benchmark 上优于 caption-based memory，并在 Unitree Go1 上展示大室内环境的自然语言目标导航。

Kinbot 问题映射：

1. 对应 `mobility_navigation` 与 `world_state_memory` 中“家庭空间长期变化、目标被移动、用户指令跨时间上下文”的问题。
2. 对找药、找物、夜间巡护、老人看护回访等任务，Kinbot 需要记住“上次在哪里看到、何时看到、当时任务是什么、是否已被用户移动或取走”。
3. Phase 5 候选字段：`spatiotemporal_memory_event_id`、`navigation_history_context_window`、`memory_retrieval_hit_rate`、`memory_staleness_reason`、`historical_observation_confidence`、`route_decision_memory_reference`。

资源消耗：

1. 长期视觉时空记忆如果直接保存原始图像，会冲突端侧隐私和 `32GB Flash` 边界。
2. Kinbot 一代更适合先保存结构化事件、低维视觉描述、房间 / 区域标签、时间段和结果摘要，原始视频仅按受控调试窗口处理。
3. 需要测 `memory_store_growth_mb_per_day`、检索延迟和记忆压缩后的任务成功率，不应直接新增大规模在线记忆库。

优劣势：

1. 优势：问题设定直接贴近长时程家庭导航，能把导航、记忆和任务历史连接起来。
2. 优势：适合和此前 dynamic ObjectNav、对象位置多峰分布、情景记忆论文整合成一组 Phase 5 字段。
3. 劣势：论文系统复杂，若照搬会显著扩张地图、记忆和推理层。
4. 风险：长期家庭记忆涉及隐私、可删除、可解释和家庭成员授权，必须先走字段级候选。

推荐理由：

建议作为 A- 级研究输入。它改变的是 Kinbot 对“导航记忆”的表述方式：从单点对象位置扩展为时空事件证据链；不建议新增在线大模型导航系统，也不改写纯视觉主线。

主线边界：

本轮仅作为研究输入进入 Phase 5 字段候选，不回写 `03_decision_log.md` 或主线架构基线。

### 4.2 HALO: Memory Retrieval in Visuomotor Policies for Long-Horizon Robot Control

- arXiv：[2606.25136](https://arxiv.org/abs/2606.25136)
- Authors：Rutav Shah, Yisu Li, Femi Bello, Yuke Zhu, Roberto Martín-Martín
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-06-25 官方 listing new submission；属于最新官方 listing 日更收录。
- Inclusion type：daily main card

摘要转述：

论文关注部分可观测家庭环境中的长时程控制记忆。作者指出，机器人需要回忆物品被放在哪里、伙伴已完成什么任务、设备何时被打开等历史信息；直接让 imitation policy 对长上下文做 attention 容易学到伪相关，也会因为闭环预测误差导致记忆漂移。`HALO` 用 VLM priors 生成与记忆相关的问答监督，引导策略检索任务相关历史，并用 sparse attention 只访问最相关片段，支持最长约 8 分钟历史经验的长程控制。

Kinbot 问题映射：

1. 对应 `decision_orchestration`、`world_state_memory` 和 `platform_runtime` 中“任务执行跨多个房间、多个动作和多个用户交互后，如何避免忘记原目标或关键约束”的问题。
2. Kinbot 的找药、巡护、提醒确认和陪伴对话都可能跨越多个阶段；中途被打断后，需要恢复任务上下文而不是重新规划整个系统。
3. Phase 5 候选字段：`task_context_retrieval_hit`、`retrieved_memory_age_s`、`retrieval_reason_code`、`forgetting_failure_label`、`interruption_resume_success`、`long_horizon_context_budget`。

资源消耗：

1. 记忆检索会增加存储、索引和推理延迟；端侧部署必须限制上下文窗口、检索频率和可保留事件类型。
2. 一代更适合先以任务日志回放和少量结构化记忆做验证，不把行为克隆策略和长记忆策略直接放进产品链路。
3. 可用轻量事件摘要替代原始视频 token，减少隐私和 Flash 占用。

优劣势：

1. 优势：把“长任务失败”具体拆成可测的遗忘、检索和恢复问题。
2. 优势：与 Kinbot 的任务中断恢复、用户插话后续接、巡护续跑高度相关。
3. 劣势：论文更偏 visuomotor policy，对轮式家庭机器人导航和无机械臂 V1 的迁移需裁剪。
4. 风险：若为了提高成功率持续扩大上下文，会快速推高端侧内存、存储和隐私成本。

推荐理由：

建议作为 A- 级研究输入。它应进入“长程任务记忆 / 中断恢复”验证字段包；不建议引入新的行为克隆控制主链路，也不把长期记忆写成无限制原始数据存储。

主线边界：

本轮仅保留为 Phase 5 字段候选，不改变当前任务编排和端侧资源冻结线。

### 4.3 ForesightSafety-VLA: A Unified Diagnostic Safety Benchmark for Vision-Language-Action Models

- arXiv：[2606.27079](https://arxiv.org/abs/2606.27079)
- Authors：Mingyang Lyu, Yinqian Sun, Yiyang Jia, Sicheng Shen, Moquan Sha, Huangrui Li, Feifei Zhao, Yi Zeng
- Source：arXiv `cs.RO/recent`
- 本轮 listing 口径：`cs.RO/recent` 2026-06-26 entry；属于近期待补录，不属于 2026-06-25 官方 `cs.RO/new` 计数口径。
- Inclusion type：near-term supplement

摘要转述：

论文提出一个面向 `VLA` 模型的统一安全诊断 benchmark，目标不是只给出总体成功率，而是把安全作为主要评估对象。作者定义了覆盖物理交互安全、指令侧安全和感知侧安全的 13 类 taxonomy，并从场景结构、语言命令和视觉观察三个维度控制变化，用累计安全成本、风险暴露时间和安全 / 不安全成功失败四象限拆解失败来源。它的价值在于把安全评估从单一任务成功率推进到过程级风险、失败模式和诊断覆盖。

Kinbot 问题映射：

1. 对应 `safety_compliance_authorization` 与 `observability_data_governance` 中“样机试点如何证明模型没有在危险指令、近人移动、药品相关任务或不确定视觉证据下做出高风险动作”的问题。
2. Kinbot 一代不默认上线 `VLA` 操作主链路，但仍需要安全 benchmark 的字段思路：危险场景、误解场景、拒绝 / 澄清、人工确认和失败模式归档。
3. Phase 5 候选字段：`safety_scenario_category`、`unsafe_action_risk_label`、`instruction_visual_conflict_detected`、`clarification_required_reason`、`human_confirmation_gate`、`diagnostic_coverage_rate`。

资源消耗：

1. 该论文主要提供 benchmark 和诊断口径，资源消耗来自评测集构建、回放执行和日志分析，而不是端侧在线推理本身。
2. 对 Kinbot 更适合在离线回放、仿真和家庭样机试点验收中使用；在线阶段只吸收低频安全门控字段。
3. 若纳入 `VLA` 测试，必须明确它只评估候选策略或未来能力，不代表 V1 产品新增 `VLA` 执行主链路。

优劣势：

1. 优势：把 `VLA` 安全拆成诊断维度，适合补强 Phase 5 安全证据链。
2. 优势：能和药品、老人、近人移动、家庭隐私等 Kinbot 高风险场景形成映射。
3. 劣势：若 benchmark 偏 manipulation 或公开机器人任务，需重做家庭机器人场景裁剪。
4. 风险：安全 benchmark 容易被误写成安全保证；必须保留覆盖边界、未覆盖场景和人工复核状态。

推荐理由：

建议作为 B+ 级研究输入。它的主要价值是安全诊断字段和场景覆盖清单，而不是引入 `VLA`；可与 2026-06-20 的故障诊断、概率安全和失败证据库合并。

主线边界：

本轮不回写主线架构，不新增 `VLA` 安全裁决器，只建议进入 Phase 5 安全评测字段候选。

### 4.4 Toward Low-Latency Vision-Language Models with Doubly-Correct Predictions in Egocentric Visual Understanding

- arXiv：[2606.25160](https://arxiv.org/abs/2606.25160)
- Authors：Qitong Wang, Fan Du, Pranav Maneriker, Jihui Jin, Christopher Rasmussen
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-06-25 官方 listing new submission；属于最新官方 listing 日更收录。
- Inclusion type：daily main card

摘要转述：

论文研究低延迟视觉语言模型在第一视角视觉理解中的可靠性。作者指出，很多系统只追求更快输出，但在机器人或穿戴式第一视角场景中，答案正确还不够，模型还必须基于正确的视觉证据做出判断。论文围绕 doubly-correct prediction 评估：既要回答正确，也要证据定位或视觉依据正确。作者提出面向低延迟 `VLM` 的方法与评估方式，用于在实时约束下平衡响应速度和视觉证据一致性。

Kinbot 问题映射：

1. 对应 `platform_runtime`、`decision_orchestration` 和 `observability_data_governance` 中“端侧视觉语言能力不能只看响应速度，还要证明答案来自正确视觉证据”的问题。
2. Kinbot 在药品识别、用户状态询问、物品确认和巡护异常说明时，错误 grounding 比慢几百毫秒更危险。
3. Phase 5 候选字段：`vlm_latency_ms`、`visual_evidence_correct`、`answer_correct`、`doubly_correct_rate`、`uncertain_visual_grounding_reject`、`egocentric_context_window_size`。

资源消耗：

1. 论文直接关注低延迟，但 Kinbot 仍需在 `12GB RAM + 32GB Flash` 线下测峰值内存、热稳定、低光输入和 batch-1 延迟。
2. 对 V1 更适合作为端侧 VLM / VLM-lite 验证字段，不应扩展为云端实时视觉问答链路。
3. 如果证据正确率下降，应优先触发澄清、二次观察或人工确认，而不是追求更快回答。

优劣势：

1. 优势：把端侧视觉语言能力从“快”升级为“快且证据正确”，对家庭安全任务非常关键。
2. 优势：可直接进入样机验收表，与 `latency_ms`、`false_positive`、`manual_review_required` 同时记录。
3. 劣势：egocentric benchmark 与 Kinbot 轮式头部 / 躯干相机视角仍需对齐。
4. 风险：若只采用公开数据集指标，可能低估家庭夜间、遮挡、反光、老人姿态等场景难度。

推荐理由：

建议作为 B+ 级研究输入。它应补强端侧资源评估口径：延迟、内存和正确率之外，还要检查视觉证据是否正确；不建议新增实时云端视觉语言服务主链路。

主线边界：

本轮仅进入端侧资源与证据一致性字段候选，不改写量产资源冻结线。

### 4.5 MANGO: Automated Multi-Agent Test Oracle Generation for Vision Language Action Model Testing

- arXiv：[2606.24815](https://arxiv.org/abs/2606.24815)
- Authors：Pablo Valle, Shaukat Ali, Aitor Arrieta, Lionel Briand
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-06-25 官方 listing cross submission；属于 cross submission 主卡片，收录理由是新增 Kinbot 测试 oracle 与治理字段。
- Inclusion type：daily main card / cross-list governance item

摘要转述：

论文针对 `VLA` 模型测试中的 oracle 缺失问题：机器人模型输出的动作和中间判断很难用传统断言判断正确与否。作者提出 `MANGO`，用多 agent 协作自动生成测试 oracle，辅助构造、审查和解释 `VLA` 测试结果。论文重点在测试生成、oracle 质量、模型行为评估和软件工程治理，而不是提出新的机器人控制策略。

Kinbot 问题映射：

1. 对应 `observability_data_governance`、`safety_compliance_authorization` 和 `platform_runtime` 中“Phase 5 如何低成本生成可复查测试、如何知道某次模型行为应该判为失败或待人工复核”的问题。
2. Kinbot 的导航、药品、陪伴和巡护任务都存在自然语言输入 + 视觉状态 + 动作结果的复杂组合，单靠人工写测试覆盖不足。
3. Phase 5 候选字段：`test_oracle_generation_method`、`oracle_disagreement_rate`、`oracle_human_review_required`、`generated_test_provenance_id`、`scenario_mutation_source`、`model_behavior_assertion_type`。

资源消耗：

1. `MANGO` 的成本主要在离线测试生成和评审，不应放入机器人实时执行链路。
2. 对 Kinbot 更适合用于回放集、仿真集和版本回归测试，生成候选 oracle 后仍需人工确认高风险场景。
3. 若用于云端研发平台，必须记录生成来源、模型版本、prompt 版本和人工确认状态，避免 oracle 自己不可审计。

优劣势：

1. 优势：补上复杂模型测试中的“谁来判断这次行为是否正确”的治理缺口。
2. 优势：适合与 Phase 5 provenance、fair metadata 和回放证据链字段合并。
3. 劣势：论文 primary 是 `cs.SE`，机器人场景迁移需自己定义家庭任务 oracle 模板。
4. 风险：多 agent 生成 oracle 可能自信地产生错误测试标准，必须保留人工复核和版本化。

推荐理由：

建议作为 B+ 级研究输入。它值得进入测试治理候选，而不是产品在线模块；尤其适合和家庭样机试点的场景回放、失败案例和人工审核流程绑定。

主线边界：

本轮不新增在线多 agent 测试平台，不修改主线事实源，只保留为 Phase 5 测试 oracle 字段候选。

## 5. 候选排除表

| 论文 | arXiv | 本轮 listing 口径 | 未收录原因 |
| --- | --- | --- | --- |
| SurveilNav: Collaborative Object Goal Navigation with Robot and Surveillance System | [2606.25119](https://arxiv.org/abs/2606.25119) | 2026-06-25 new submission | 机器人 + 固定监控系统协同找物对家庭多视角有启发，但与 Kinbot 一代“原始敏感数据端侧处理、不过度依赖固定摄像头”的边界冲突；保留 `external_view_optional_assist` 和隐私授权字段，不进入主卡片。 |
| ReaDy-Go: Real-to-Dynamic 3DGS and Occupancy Prediction from Static Scene for Robot Navigation | [2602.11575](https://arxiv.org/abs/2602.11575) | 2026-06-25 replacement | 动态障碍仿真对导航验证有价值，但本轮为 replacement，且 `3DGS` 仿真主题已多次覆盖；保留 `dynamic_obstacle_sim_source`、`sim_to_real_occupancy_gap` 字段，不扩张仿真平台。 |
| KRVF: A Source-Aware Semantic Voxel World Representation for Edge Mobile Manipulation | [2606.26321](https://arxiv.org/abs/2606.26321) | `cs.RO/recent` 2026-06-26 entry | source-aware 语义体素和边缘表示与 provenance 相关，但依赖 `RGB-D` 和 manipulation 场景；只保留 `semantic_source_id`、`voxel_freshness` 候选字段，不改写纯视觉地图主线。 |
| Learning Robot Visual Navigation in Crowds via Intention-Aware Scene Representations | [2606.26047](https://arxiv.org/abs/2606.26047) | 2026-06-25 new submission | 人群意图表征对近人安全有价值，但重点是拥挤公共场景；Kinbot 家庭场景先保留 `near_person_intention_state`、`crowd_density_mismatch` 字段，不新增 crowd navigation 子系统。 |
| RouterVLA: Turning Smoke Tests into Supervision for Heterogeneous VLA Selection | [2606.27355](https://arxiv.org/abs/2606.27355) | `cs.RO/recent` 2026-06-26 entry | smoke test 路由可启发模型选择治理，但仍是多 `VLA` policy pool；Kinbot 一代没有在线 policy router，暂只保留 `smoke_test_policy_selection_score`。 |
| TIDAL: Temporally Interleaved Diffusion and Action Loop for High-Frequency VLA Control | [2601.14945](https://arxiv.org/abs/2601.14945) | 2026-06-25 replacement | 高频 `VLA` 推理和 action cache 有端侧资源启发，但对象仍是 manipulation VLA 且为 replacement；本轮不收主卡片。 |
| Action ControlNet: A Lightweight Delay-Aware Adapter for Smooth Asynchronous Control in Vision-Language-Action Models | [2606.25985](https://arxiv.org/abs/2606.25985) | 2026-06-25 new submission | delay-aware adapter 对异步执行有启发，但仍是 manipulation VLA 和 action chunk 平滑；近期端侧延迟与 action chunk 已多次覆盖，本轮只保留 `async_handoff_jitter` 字段。 |
| Memory-Efficient Policy Libraries with Low-Rank Adaptation in Reinforcement Learning | [2606.25700](https://arxiv.org/abs/2606.25700) | 2026-06-25 cross submission | LoRA policy library 对多策略存储有资源价值，但 Kinbot 当前没有大规模 RL policy library；只保留模型资产压缩启发。 |

## 6. 对 Kinbot 的落地 / 文档建议

1. 本轮不建议回写主线架构或决策日志；这些论文仍属于 Phase 5 研究输入。
2. 建议把 `RAVEN`、`HALO` 与前序 `FlowMaps`、长期导航证据记忆、情景记忆论文合并成“长程导航与任务记忆字段包”，重点区分事件记忆、对象记忆、任务中断恢复和检索失败。
3. 建议把 `ForesightSafety-VLA`、`MANGO` 与 2026-06-20 的故障诊断、概率安全、失败案例库合并成“安全诊断与测试 oracle 字段包”，避免每篇论文单独新增验证体系。
4. 建议把低延迟 `VLM` 论文纳入端侧资源 profiling：端侧视觉语言能力验收不只看延迟和峰值内存，还要记录视觉证据正确率、拒绝不确定判断和人工复核触发。
5. 不建议因本轮论文新增固定监控协同系统、`RGB-D` 语义体素地图、动态 `3DGS` 仿真平台、在线 `VLA` policy router、`VLA` 安全裁决器或多 agent 测试生成产品模块。

## 7. 复杂度自检与本轮未进入主线说明

现在的架构是不是太复杂了？如果把本轮所有论文都写成在线模块，答案会是“是”。本轮建议只吸收字段和回放评估，不新增系统层概念。

保留的候选字段：

1. 长程导航记忆：`spatiotemporal_memory_event_id`、`navigation_history_context_window`、`memory_retrieval_hit_rate`、`memory_staleness_reason`、`task_context_retrieval_hit`、`interruption_resume_success`。
2. 安全诊断与测试：`safety_scenario_category`、`unsafe_action_risk_label`、`diagnostic_coverage_rate`、`test_oracle_generation_method`、`oracle_disagreement_rate`、`generated_test_provenance_id`。
3. 端侧视觉语言资源：`vlm_latency_ms`、`visual_evidence_correct`、`answer_correct`、`doubly_correct_rate`、`uncertain_visual_grounding_reject`。

本轮未进入主线的原因：

1. 本轮论文只提供研究输入和 Phase 5 字段候选，尚未经过用户确认或阶段门评审。
2. 现有主线仍是纯视觉、一代无机械臂主链路、端侧敏感数据处理和 `12GB RAM + 32GB Flash` 默认资源线。
3. 多数 `VLA / world model / policy` 论文对 Kinbot 的价值是验证字段和失败治理，不是产品在线子系统。

## 8. 来源

1. arXiv `cs.RO/new`：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent`：<https://arxiv.org/list/cs.RO/recent>
3. RAVEN：<https://arxiv.org/abs/2606.25206>
4. HALO：<https://arxiv.org/abs/2606.25136>
5. ForesightSafety-VLA：<https://arxiv.org/abs/2606.27079>
6. Toward Low-Latency Vision-Language Models with Doubly-Correct Predictions：<https://arxiv.org/abs/2606.25160>
7. MANGO：<https://arxiv.org/abs/2606.24815>
8. SurveilNav：<https://arxiv.org/abs/2606.25119>
9. ReaDy-Go：<https://arxiv.org/abs/2602.11575>
10. KRVF：<https://arxiv.org/abs/2606.26321>
11. Learning Robot Visual Navigation in Crowds：<https://arxiv.org/abs/2606.26047>
12. RouterVLA：<https://arxiv.org/abs/2606.27355>
13. TIDAL：<https://arxiv.org/abs/2601.14945>
14. Action ControlNet：<https://arxiv.org/abs/2606.25985>
15. Memory-Efficient Policy Libraries with LoRA：<https://arxiv.org/abs/2606.25700>
