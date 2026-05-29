# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-23
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-23 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 为 `Friday, 22 May 2026`，合计 `74` 篇 entries；其中 new submissions `38` 篇、cross submissions `15` 篇、replacement submissions `21` 篇。2026-05-23 本地日更时尚未出现新的 `Saturday, 23 May 2026` Robotics 批次，本轮采用“最新官方 listing + 当日未出现新批次说明 + 日更收录”口径，按 3-5 篇强相关论文 + 候选排除表方式，收录对 Kinbot 视觉语言导航自感知、动态空间记忆、VLA / world model 预执行验证和运行时治理有明确增量价值的 4 篇论文，并给出周度综合判断。

---

## 1. 检索口径

本轮检索日期：2026-05-23。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期为 `Friday, 22 May 2026`，合计 `74` 篇 entries；其中 new submissions `38` 篇、cross submissions `15` 篇、replacement submissions `21` 篇。
3. 本轮检索时官方 `cs.RO/recent` 显示最新 Robotics recent 批次为 `Fri, 22 May 2026`，该日期 recent entries 为 `53` 篇，对应 new submissions 与 cross submissions，不含 replacement。
4. 本轮本地日期为 2026-05-23，官方尚未出现 `Saturday, 23 May 2026` Robotics 新批次；因此本轮按“最新官方 listing + 当日未出现新批次说明 + 日更收录”处理，不把 `2026-05-23` 写成新的官方 Robotics listing 日期。
5. 本轮先核对既有日更文档中的论文标题与 arXiv 编号，未发现本轮主卡片 `2605.22816`、`2605.21935`、`2605.22446`、`2604.07833` 已进入前序主卡片。
6. 本轮不固定凑满 `10` 篇；在 5 月中下旬泛 `VLA`、world model、humanoid / manipulation、自动驾驶和多机器人主题已多次覆盖后，只保留 4 篇能改变 Kinbot Phase 5 验证字段、导航 / 记忆判断或运行时治理动作的论文，其余进入候选排除表。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是继续增加泛 `VLA`、world model、灵巧操作、自动驾驶 benchmark 或多机器人协作数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`decision_orchestration`、`safety_compliance_authorization`、`observability_data_governance`、`platform_runtime`。
3. 是否能低成本转化为 Phase 5 验证项：导航任务进度自感知、动态空间记忆更新、动作候选预验证、能力准入 / 监控 / 回滚 / 人工接管。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. replacement / cross-list 仅在新增 Kinbot 评测项或治理项时收录；本轮主卡片中 `Pre-VLA` 为 `cs.CV` cross submission，纳入原因是它直接新增预执行动作验证、低质量 action chunk 过滤和 world-model rollout 成本治理口径。
2. `Harnessing Embodied Agents` 是 replacement，纳入原因是它直接新增运行时治理边界、能力准入、执行监控、回滚和人工覆盖口径，能补强 Kinbot 当前 `decision_orchestration` 与 `safety_compliance_authorization` 的 Phase 5 验证字段；但本轮只作为研究输入，不写成已确认架构变更。
3. `Steins;Gate Drive` 对云端 LLM 规划延迟和 safety contract 有启发，但载体是自动驾驶，且运行时安全仲裁已由 `Pre-VLA` 与 `Harnessing Embodied Agents` 覆盖，本轮进入候选排除表。
4. `Spatial Memory for Out-of-Vision Manipulation`、`GesVLA` 和多篇 VLA / manipulation 条目继续证明操作式 embodied model 活跃，但 Kinbot 一代是家庭移动机器人，不因跨日收录扩张到灵巧操作或全量 VLA 主控。
5. 自动驾驶风险图、branch-SMPC、parking / racing / highway planning、UAV、quadrotor、swarm、dual-arm、tactile manipulation 和 humanoid whole-body 条目不改变 Kinbot 一代家庭移动机器人路线。

## 2. 本轮总判断

本轮官方 Robotics listing 已从 2026-05-21 更新到 `2026-05-22`，不是继续补录同一饱和 listing。高价值信号集中在四个方向：视觉语言导航需要显式知道自己在任务中的位置，家庭空间记忆需要在动态变化下局部更新而不是全量重建，VLA / world model 动作候选需要执行前验证以降低物理失败和想象成本，具身 agent 的执行权要由独立 runtime 治理而不是塞回 agent prompt 内。

本轮对 Kinbot 有 4 个增量判断：

1. **VLN 不能只预测下一步动作，还要记录任务进度和自我状态**：`AwareVLN` 说明导航模型如果缺少对 agent-state、instruction progress 和 scene relation 的显式理解，容易在看似端到端的推理中失去可解释性。Kinbot 的“去卧室找老人”“去药箱旁等待”“巡航确认门窗”应记录 `navigation_self_state` 与 `task_progress_stage`。
2. **空间记忆需要动态差异检测和局部更新**：`Learning to Evolve` 说明动态办公室中静态 scene graph memory 会快速失效，关键是区分短时感知扰动和真实环境变化，并只更新局部不一致区域。Kinbot 家庭重新摆放家具、移动药箱、宠物 / 家人遮挡和暗光模糊，都需要 `memory_discrepancy_score` 与 `local_memory_patch`。
3. **动作候选应先验证再执行或想象**：`Pre-VLA` 将 action chunk 的安全置信与 advantage 预测放在物理执行 / world-model rollout 之前，适合转译为 Kinbot 的预执行门控与仿真成本控制。重点不是上 VLA 主控，而是在 Phase 5 里记录 `pre_action_validity`、`resample_reason`、`wm_rollout_budget`。
4. **运行时治理应成为独立层，而不是 agent 内部自觉**：`Harnessing Embodied Agents` 强调把 policy checking、capability admission、execution monitoring、rollback 和 human override 外置为 runtime governance。Kinbot 的权限、老人安全、访客边界、坐席建议和能力升级都需要可审计的运行时边界。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 具身安全、拒答 / 澄清、运行时治理、预执行验证 | 值得进入安全专题 | 将 `The Yes-Man Syndrome`、RoboJailBench、typographic attack、`Pre-VLA` 与 runtime governance 合并为“具身指令与动作执行安全测试包”。 |
| 纯视觉导航、VLN 自感知、长期空间记忆 | 值得进入专题跟踪 | 将 `AwareVLN`、PRISM-SLAM、MCNav、LEXI-SG、MIF 合并为“纯视觉导航自感知 + 空间记忆局部更新”专题；重点做回放字段，不新增重型在线 3DGS。 |
| 视觉安全预测、风险场、主动重观察 | 接近专题成熟 | 本周已覆盖置信校准、多分量风险场、CBF 主动感知和风险地图；后续只在出现家庭移动实机、端侧资源实测或用户打扰成本字段时进入主卡片。 |
| 端侧资源、VPR token pruning、runtime verification 成本 | 值得谨慎跟踪 | 以 `12GB + 32GB` 为约束建立 profiling 表：VPR、预验证、轻量 runtime checker、空间记忆更新分别记录延迟、内存、热和失败回退。 |
| 泛 `VLA`、world model、humanoid manipulation、多机器人协作、自动驾驶专用栈 | 已饱和 | 只有出现端侧资源实测、家庭移动实机闭环、安全审计新增证据或老人照护任务映射时才进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把自感知 VLN、动态 3DGS 记忆、VLA 预验证器、runtime governance、云端 LLM 安全仲裁都变成在线组件，会明显过复杂”。建议只吸收为 4 个轻量验证 / 治理动作：导航任务进度自感知字段、空间记忆局部更新回放、动作候选预执行验证标签、运行时治理准入 / 回滚 / 人工覆盖日志。暂不新增在线 3DGS、VLA 主控、云端 LLM driver、复杂能力模块市场或多机器人协作层。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | AwareVLN: Reasoning with Self-awareness for Vision-Language Navigation | 转成 VLN / 导航回放字段：agent-state、task-progress、instruction-scene relation、自感知失败原因。 |
| A | Pre-VLA: Preemptive Runtime Verification for Reliable Vision-Language-Action and World-Model Rollouts | 转成执行前验证候选：动作安全置信、低质量 action chunk 过滤、resampling budget、world-model rollout 成本。 |
| A- | Harnessing Embodied Agents: Runtime Governance for Policy-Constrained Execution | 转成运行时治理专题输入：能力准入、策略检查、执行监控、回滚、人工覆盖和审计日志。 |
| B+ | Learning to Evolve: Multi-modal Interactive Fields for Robust Humanoid Navigation in Dynamic Environments | 转成空间记忆专题候选：动态差异检测、局部 memory patch、语义记忆压缩；不承诺在线 3DGS。 |

## 3. 论文卡片

### 3.1 AwareVLN: Reasoning with Self-awareness for Vision-Language Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.22816](https://arxiv.org/abs/2605.22816) |
| 本轮 listing 口径 | 2026-05-22 官方 listing new submission，日更收录；abs 页显示 `Submitted on 21 May 2026` |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | vision-language navigation, self-awareness, structural reasoning, task progress, end-to-end VLN |

摘要要点转述：

论文面向视觉语言导航，指出现有 VLM 驱动的端到端导航虽然能直接预测动作，但经常缺少对“自己在哪里、指令完成到哪一步、场景与指令关系是什么”的显式理解；另一方面，传统显式建图 + 启发式规划又常依赖额外 3D 传感器，限制大规模视觉语言预训练。作者提出 `AwareVLN`，在导航模型中加入结构化自感知推理机制，让模型在端到端数据驱动框架内学习 agent state、task-oriented progress 和 scene relation。论文还设计了基于 progress division 的自动数据引擎，用于训练这种自感知能力，并在 Habitat 多数据集上报告优于已有 VLN 方法。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 和 `decision_orchestration` 中“导航模型如何知道自己任务进度与失败原因”的问题。
2. Kinbot 的家庭任务不是简单到点导航：老人、药箱、门窗、房间、禁区和用户指令会形成多阶段目标；系统需要知道“已到哪个房间、是否找到目标、是否需要澄清或重观察”。
3. 对应 Phase 5：建议增加 `navigation_self_state`、`task_progress_stage`、`instruction_scene_relation`、`self_awareness_failure`、`progress_reset_reason` 字段。

资源消耗与部署信号：

1. 论文仍是 VLN 研究系统，不给出 Kinbot 端侧硬件延迟、内存和热预算。
2. 其核心价值是评测与日志口径：先要求导航回放能解释任务进度和自感知失败，而不是立即替换当前导航主链路。
3. 由于方法不依赖额外 3D 传感器作为前提，原则上与 Kinbot 一代纯视觉路线相容，但端侧部署需另做 profiling。

优势：

1. 直接命中 Kinbot 纯视觉导航中的可解释进度和任务状态问题。
2. 不把显式 3D 传感器作为必要前提，符合一代传感主线。
3. 可与前序 MCNav、PRISM-SLAM、ConsistNav 和 VLN 感知瓶颈形成专题链路。

劣势与风险：

1. Habitat 结果不等同于真实家庭长时运行，动态老人、宠物、反光和暗光仍需自采回放验证。
2. 端到端自感知仍可能产生看似合理但错误的解释，不能替代硬安全门槛。
3. 若把它直接写成在线主控，会扩大 VLN 模型层复杂度。

推荐理由：

建议作为 A 级输入。Kinbot 应先吸收 `AwareVLN` 的自感知评测语言，把导航任务回放从“到没到”升级到“任务进度、场景关系和失败原因是否可解释”，不改变当前导航主线。

### 3.2 Learning to Evolve: Multi-modal Interactive Fields for Robust Humanoid Navigation in Dynamic Environments

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.21935](https://arxiv.org/abs/2605.21935) |
| 本轮 listing 口径 | 2026-05-22 官方 listing new submission，日更收录；abs 页显示 `Submitted on 21 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | dynamic spatial memory, semantic 3DGS, discrepancy detection, local memory update, feature distillation |

摘要要点转述：

论文提出 `MIF`，用于动态环境下的 humanoid navigation 和安全交互。作者认为传统语义地图 / scene graph memory 往往假设相机轨迹稳定、环境静态或对象几何粗糙，难以应对机器人运动带来的视觉模糊、环境变化和操作前几何安全约束。`MIF` 将不确定性感知的 3D Gaussian Splatting、拓扑空间记忆和任务驱动几何重建组合成闭环感知-适应管线，并用 discrepancy detection score 区分运动造成的短时假变化与真实持久变化，只更新局部不一致区域。论文在 Unitree-G1 动态办公室中报告，相比静态 scene graph memory，非静态环境重定位成功率从 12% 提升到 94%，并通过特征蒸馏降低语义记忆占用。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory` 与 `mobility_navigation` 中“长期家庭空间记忆如何在家具移动、遮挡和视觉扰动下更新”的问题。
2. Kinbot 不是 humanoid，但家庭空间也会持续变化：药箱位置、椅子、门、地垫、宠物、临时杂物和老人活动会让静态地图快速过期。
3. 对应 Phase 5：建议增加 `memory_discrepancy_score`、`transient_vs_persistent_change`、`local_memory_patch`、`semantic_memory_footprint`、`relocalization_after_change` 字段。

资源消耗与部署信号：

1. 论文依赖 3DGS 和多场结构，不能直接写入 Kinbot 一代在线闭环。
2. 可吸收的是动态差异检测、局部更新和语义记忆压缩，不是完整 humanoid / 3DGS 运行系统。
3. 特征蒸馏与局部更新值得进入端侧资源 profiling，但必须在 `12GB + 32GB` 线下测延迟、内存、热和重定位收益。

优势：

1. 明确处理动态场景中静态记忆失效的问题。
2. 强调局部更新而非全量重建，符合家庭长期运行的复杂度约束。
3. 语义记忆压缩为 Kinbot 的端侧空间记忆资源线提供可测指标。

劣势与风险：

1. 载体是 humanoid 和操作前安全，不等同于低速轮式家庭机器人。
2. 在线 3DGS 和动态语义记忆的端侧成本不明。
3. 若引入过多 field / memory 层，可能让主线架构过重。

推荐理由：

建议作为 B+ 级输入。Kinbot 应把它转成空间记忆专题候选：重点验证动态差异检测、局部记忆更新和语义记忆占用，不新增在线 3DGS 或 humanoid 操作链路。

### 3.3 Pre-VLA: Preemptive Runtime Verification for Reliable Vision-Language-Action and World-Model Rollouts

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.22446](https://arxiv.org/abs/2605.22446) |
| 本轮 listing 口径 | 2026-05-22 官方 listing cross submission from `cs.CV`，日更收录；abs 页显示 `Submitted on 21 May 2026` |
| 分类 | `cs.CV`, `cs.AI`, `cs.RO` |
| 方法关键词 | preemptive runtime verification, action validity, safety confidence, advantage score, adaptive resampling |

摘要要点转述：

论文关注大 VLA 模型和生成式 world model 在长程具身任务中的执行风险：低质量动作会造成物理失败，也会让 world-model rollout 产生无意义渲染成本和错误累积。作者提出 `Pre-VLA`，在物理执行或 world model 想象之前先评估候选 action chunk 的有效性。系统使用高效多模态 backbone、modality-aware pooling 和轻量双分支头，同时预测 safety confidence 与 critic-derived advantage score；训练时结合 focal classification、advantage regression 和 soft-threshold calibration；部署时通过 dual-mode preemptive resampling scheduler 过滤低质量动作，并在有限计算预算内触发自适应重采样。论文在 LIBERO benchmark 上报告了闭环成功率提升、执行步数减少和平均每个 action chunk 183.9 ms 的前向验证时间。

解决 Kinbot 的什么问题：

1. 对应 `decision_orchestration`、`safety_compliance_authorization` 和 `platform_runtime` 中“动作候选在执行前是否可靠”的问题。
2. Kinbot 当前不应把 VLA 当作一代主控，但在未来服务能力、找物、重观察或伴生系统联动中，仍会出现高层动作候选；这些候选需要在执行前被轻量验证。
3. 对应 Phase 5：建议增加 `pre_action_validity`、`action_safety_confidence`、`candidate_advantage_score`、`resample_reason`、`wm_rollout_budget`、`verification_latency_ms` 字段。

资源消耗与部署信号：

1. 论文给出的 183.9 ms 是其 benchmark 和模型设置下的验证成本，不能直接套到 Kinbot 端侧。
2. 可先作为离线 / shadow 评估：在回放中比较“直接执行候选动作”和“预验证后重采样”的失败率、延迟和计算预算。
3. 端侧落地应优先从规则 + 小模型 checker 开始，不引入完整 VLA 主控。

优势：

1. 将 action validity 放在执行前，而不是等物理失败后再恢复。
2. 同时关注物理动作和 world-model rollout 成本，贴合 Kinbot 对安全与端侧资源的双重约束。
3. 可与前序拒答 / 澄清、安全置信校准、runtime monitoring 合并成 Phase 5 执行安全字段。

劣势与风险：

1. 实验任务偏 manipulation benchmark，不等同于 Kinbot 家庭移动导航。
2. 额外验证器本身会带来延迟和调度复杂度。
3. 若把它作为在线强依赖，可能造成“每步都要审核”的体验和实时性压力。

推荐理由：

建议作为 A 级输入。Kinbot 应吸收 `Pre-VLA` 的预执行验证思想，把它变成 Phase 5 候选动作审核与资源预算字段；不因此新增一代 VLA 主控。

### 3.4 Harnessing Embodied Agents: Runtime Governance for Policy-Constrained Execution

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.07833](https://arxiv.org/abs/2604.07833) |
| 本轮 listing 口径 | 2026-05-22 官方 listing replacement，日更收录；abs 页显示 `Submitted on 9 Apr 2026`，`last revised 21 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | runtime governance, policy-constrained execution, capability admission, rollback, human override |

摘要要点转述：

论文将具身 agent 从“被动推理系统”升级为“有执行权的行动系统”后，提出核心问题：执行权如何在运行时被治理。作者认为现有方法常把安全、恢复和策略逻辑塞进 agent loop 内，导致控制难以标准化、审计和适配。论文提出 policy-constrained execution 框架，将 agent cognition 与 execution oversight 分离，把 governance 外置为专门 runtime layer，负责 policy checking、capability admission、execution monitoring、rollback handling 和 human override。论文形式化 embodied agent、Embodied Capability Modules 与 runtime governance layer 的边界，并在 1000 次随机仿真实验中报告未授权动作拦截、运行时漂移下 unsafe continuation 降低和合规恢复成功率提升。

解决 Kinbot 的什么问题：

1. 对应 `decision_orchestration`、`safety_compliance_authorization`、`observability_data_governance` 和 `human_service_interface` 中“谁有权让机器人执行动作、何时停止、谁能覆盖”的问题。
2. Kinbot 会面对老人本人、子女、访客、保姆、坐席、App、云服务和本体自治之间的权限边界；不能只依赖 agent 自己理解规则。
3. 对应 Phase 5：建议增加 `capability_admission_decision`、`policy_check_result`、`runtime_drift_detected`、`rollback_trigger`、`human_override_channel`、`audit_event_id` 字段。

资源消耗与部署信号：

1. 该论文主要是系统治理框架，不要求端侧新增大模型。
2. 对 Kinbot 更现实的落地是 runtime 日志、策略检查器和能力准入表，而不是完整 ECM 能力市场。
3. replacement 条目不应直接写成已确认决策；需先作为安全专题输入，后续若回写主线应绑定 Linear 评审项。

优势：

1. 将运行时治理作为系统层问题，符合 Kinbot 对安全、合规和授权的最高优先级。
2. policy checking、capability admission、rollback 和 human override 与当前 Phase 5 验证闭环高度匹配。
3. 不要求改变纯视觉或端侧原始数据处理主线。

劣势与风险：

1. 论文仿真任务与 Kinbot 家庭真实任务不同，不能凭指标直接承诺量产安全。
2. ECM 概念若展开过多，会引入新抽象层和治理复杂度。
3. 运行时治理需要与产品体验平衡，避免让老人感受到频繁拦截和冷冰冰的审批。

推荐理由：

建议作为 A- 级输入。Kinbot 应吸收“agent cognition 与 execution oversight 分离”的原则，把能力准入、策略检查、回滚和人工覆盖写入验证字段；暂不新增完整 ECM 架构层。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| Steins;Gate Drive: Semantic Safety Arbitration over Structured Futures for Latency-Decoupled LLM Planning | [2605.22456](https://arxiv.org/abs/2605.22456) | new submission | 云端 LLM 延迟解耦、安全合同和 abort condition 对 Kinbot 云端建议链有启发，但载体是自动驾驶；本轮主卡片已由 `Pre-VLA` 与 runtime governance 覆盖执行前验证和安全仲裁，不再新增 cloud LLM planner 概念。 |
| Spatial Memory for Out-of-Vision Manipulation in Vision-Language-Action | [2605.22283](https://arxiv.org/abs/2605.22283) | new submission | out-of-view spatial memory 与找物有价值，但任务是双臂 / 操作式 VLA，5 月已多次覆盖空间记忆和 VLA；本轮由 `AwareVLN` 与 `MIF` 覆盖更贴近移动导航的记忆判断。 |
| GesVLA: Gesture-Aware Vision-Language-Action Model Embedded Representations | [2605.22812](https://arxiv.org/abs/2605.22812) | new submission | 手势作为并行指令模态与 Kinbot 交互相关，但论文核心仍是 manipulation VLA 和目标 grounding；本轮筛选口径优先导航、记忆、安全、端侧资源，暂不进入主卡片。 |
| Learning A Unified Risk Map for Autonomous Driving in Partially Observable Environments | [2605.22189](https://arxiv.org/abs/2605.22189) | new submission | 部分可观测风险地图与 Kinbot 安全相关，但场景是自动驾驶，且 2026-05-22 已收 `MC-Risk` 覆盖多分量风险场；本轮不重复扩张风险图主题。 |
| Branch-Stochastic Model Predictive Control for Motion Planning under Multi-Modal Uncertainty with Scenario Clustering | [2605.22600](https://arxiv.org/abs/2605.22600) | new submission | 多模态不确定性下的 branch-SMPC 可启发动态人 / 宠物避让，但任务是 highway driving；与本周风险场、CBF、可达安全和局部规划主题重叠。 |
| Real-Time Auto-Optimization in Unknown Environments via Structure-Exploiting Dual Control for Exploration and Exploitation | [2605.22431](https://arxiv.org/abs/2605.22431) | new submission | 结构化 dual control 的微秒级计算对端侧调参有资源启发，但实验是车辆巡航 auto-optimization，不直接新增 Kinbot 家庭导航、记忆或安全字段。 |
| Scout-Assisted Planning for Heterogeneous Robot Teams under Partially Known Environments | [2605.22693](https://arxiv.org/abs/2605.22693) | new submission | information-gain action pruning 对主动重观察有旁路价值，但框架是 UAV scout + UGV team，与 Kinbot 单机器人一代边界不一致。 |
| Learning Without Losing Identity: Capability Evolution for Embodied Agents | [2604.07799](https://arxiv.org/abs/2604.07799) | replacement | capability evolution 与长期能力升级有关，但本轮已用 `Harnessing Embodied Agents` 覆盖更直接的运行时治理；且 2026-05-12 已收相邻 capability evolution / rollback 主题，不重复扩张 ECM 概念。 |

## 5. 对 Kinbot 的落地 / 文档建议

本轮建议只作为研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。原因是 4 篇论文均提供评测字段、专题候选或治理口径，但尚未形成需要改变一代纯视觉主线、端侧 / 云边界、传感器主线、Phase 5 门控或成本基线的稳定产品判断。

建议后续轻量落地动作：

1. 在 Phase 5 回放字段候选中补充 `navigation_self_state`、`task_progress_stage`、`memory_discrepancy_score`、`local_memory_patch`、`pre_action_validity`、`capability_admission_decision`、`rollback_trigger`。
2. 把 `AwareVLN` 与前序 MCNav、PRISM-SLAM、ConsistNav 合并，形成“导航自感知与任务进度解释”小测试包。
3. 把 `MIF` 与 LEXI-SG、Robo-Cortex、VPR token pruning 合并，形成“纯视觉空间记忆局部更新 + 资源占用”专题，不承诺在线 3DGS。
4. 把 `Pre-VLA` 与 `The Yes-Man Syndrome`、RoboJailBench、typographic attack 和 runtime governance 合并，形成“拒答 / 澄清 / 预执行验证 / 回滚”安全测试包。
5. 对 replacement 类治理论文保持研究输入状态；若后续要写入主线，应先绑定明确 Linear 承接项和冻结条件。

本轮未进入主线的原因：这些论文主要改变“怎么测、怎么记录、怎么做离线 / shadow 评估和运行时治理”，不改变“Kinbot 一代必须纯视觉、端侧处理敏感原始数据、12GB + 32GB 默认量产线、移动而非操作”的主线边界。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent` 官方 listing：[https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
3. `AwareVLN: Reasoning with Self-awareness for Vision-Language Navigation`：[https://arxiv.org/abs/2605.22816](https://arxiv.org/abs/2605.22816)
4. `Learning to Evolve: Multi-modal Interactive Fields for Robust Humanoid Navigation in Dynamic Environments`：[https://arxiv.org/abs/2605.21935](https://arxiv.org/abs/2605.21935)
5. `Pre-VLA: Preemptive Runtime Verification for Reliable Vision-Language-Action and World-Model Rollouts`：[https://arxiv.org/abs/2605.22446](https://arxiv.org/abs/2605.22446)
6. `Harnessing Embodied Agents: Runtime Governance for Policy-Constrained Execution`：[https://arxiv.org/abs/2604.07833](https://arxiv.org/abs/2604.07833)
