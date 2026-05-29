# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-29
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-29 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮本地日更时官方最新 Robotics listing 为 `Thursday, 28 May 2026`，合计 `85` 篇 entries；其中 new submissions `54` 篇、cross submissions `6` 篇、replacement submissions `25` 篇。本轮按 `3-5` 篇强相关论文 + 候选排除表口径，收录零样本视觉语言导航闭环、视觉地点识别安全拒绝、家庭物品归属记忆与主动询问、动态不确定性安全控制、低延迟端侧路径规划相关 5 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-29。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮本地日更时官方 `cs.RO/new` 尚未出现以 `Friday, 29 May 2026` 为 listing 日期的新 Robotics 批次；官方最新 Robotics listing 为 `Thursday, 28 May 2026`，合计 `85` 篇 entries；其中 new submissions `54` 篇、cross submissions `6` 篇、replacement submissions `25` 篇。
3. 官方 `cs.RO/recent` 中 `Thu, 28 May 2026` 显示 `60` 篇 recent entries，对应 new submissions 与 cross submissions，不含 replacement；本轮以 `cs.RO/new` 的完整结构作为主口径。
4. 本轮先排除 2026-05-23 至 2026-05-28 主卡片已覆盖的动态瓶颈风险、工具调用治理、住宅社交导航、任务规则学习、复合不确定性、端侧实时调度、相对 3D 导航地图、主动询问和老人认知辅助等相邻主题。
5. `replacement` / `cross-list` 只在新增 Kinbot 评测项、治理项或端侧资源判断时收录；本轮主卡片均来自 `new submission`，replacement 与 cross submission 均进入候选排除表或暂不收录。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是继续增加泛 `VLA`、manipulation、humanoid、自动驾驶或多机器人论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否能低成本转化为 Phase 5 验证项：零样本导航失败恢复、地点识别拒绝阈值、家庭物品归属确认、动态不确定性安全边界、端侧规划延迟与搜索空间压缩。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮不因 `85` 篇 entries 自动扩张主卡片数量；泛 `VLA` action head、manipulation、humanoid whole-body、自动驾驶 world model、fleet / swarm、UAV / underwater 机器人继续作为低相关或饱和主题处理。
2. `POINav` 对最后几米到达有直接导航价值，但依赖 `3DGS` 训练场景和商场 / 车站等公共空间数据；本轮已用 `Uni-LaViRA` 覆盖更贴近零样本家庭导航闭环的记忆和回退机制，`POINav` 暂入候选排除表。
3. `ICAN-Deploy` 的 identity-stable canary 对软件部署治理有价值，但它更像工程运维策略，未直接新增导航、记忆、安全或端侧资源评测字段；本轮不以治理论文填充主卡片。
4. `EventShiftFlow` 的 FPGA / event camera 资源信号很强，但事件相机与 Kinbot 一代纯视觉产品主线不一致；本轮只保留“极低存储流式视觉前端”的远期启发。

## 2. 本轮总判断

本轮官方 Robotics listing 从 2026-05-27 更新到 `Thursday, 28 May 2026`，新论文池不再只是继续堆叠 VLA / world model，而是对 Kinbot 有四类更具体的工程提醒：导航系统需要把“走错后如何恢复”写成能力，不只看一次性到达；纯视觉定位需要显式接受 / 拒绝和风险校准；家庭长期记忆不应只记“物体在哪”，还要记“是谁的、是否需要问”；动态安全控制和路径规划要把不确定性、延迟和搜索空间压缩纳入端侧验证。

本轮对 Kinbot 有 5 个增量判断：

1. **零样本导航要评估走错后的自我恢复，而不是只评估首条路径是否成功**：`Uni-LaViRA` 将 `TopoMetric Decision Memory`、回溯和多智能体动作翻译结合起来，提示 Kinbot 在 VLN / NFM 专题中增加 `navigation_backtrack_triggered`、`decision_memory_node_reused`、`wrong_turn_recovered` 和 `language_action_translation_failed` 字段。
2. **视觉地点识别必须有安全拒绝机制**：`SAFEVPR` 用 conformal prediction 为视觉地点识别提供 accept / reject 决策和 false match 风险控制。Kinbot 纯视觉定位不能只上报 top-1 place match，应记录 `vpr_accept_reject_state`、`false_match_risk_bound`、`localization_abstained_reason` 和 `reobserve_required_due_to_vpr_uncertainty`。
3. **家庭物品记忆要从位置扩展到归属与询问策略**：`Whose Is This? / COIN` 把物体归属识别建成 identity-aware long-horizon manipulation 任务，并用不确定性感知提问减少误操作。Kinbot 一代不做操作臂，但家庭物品、药品、眼镜、钥匙和遥控器提醒同样需要 `object_owner_hypothesis`、`ownership_confidence` 和 `clarification_question_asked`。
4. **动态不确定性安全不能只看名义轨迹**：`Chance-Constrained MPPI` 将 perception-driven risk assessment、RSS 约束和 state-dependent uncertainty calibration 加入采样控制。Kinbot 可把它收敛成 `chance_constraint_violation_risk`、`rss_margin_dynamic_obstacle`、`uncertainty_calibration_state` 与 `safety_speed_cap_reason`。
5. **端侧路径规划要把搜索空间压缩作为可测资源指标**：`CP-RPN` 用连通性保持的区域提议网络为采样规划减少搜索空间，并报告更低规划时间。Kinbot 不应直接引入复杂网络主规划器，但可以把 `planning_search_region_ratio`、`planner_latency_p95`、`connectivity_preserved` 和 `narrow_passage_failure_case` 写成端侧规划 profiling 字段。

周度综合判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 纯视觉导航恢复、视觉地点识别拒绝、最后几米到达 | 值得进入专题 | 将 `Uni-LaViRA`、`SAFEVPR`、前序 `MASt3R-Nav`、`PRISM-SLAM`、`MCNav` 和 `POINav` 候选合并，形成纯视觉导航“定位置信 + 失败恢复 + 到达判定”专题。 |
| 家庭长期记忆、物品归属、主动询问 | 值得专题跟踪 | 将 `COIN` 与前序主动询问、家庭例程规则、老人认知辅助合并，重点定义记忆写入、归属置信、人审确认和家属可见边界。 |
| 动态安全、社会导航、复合不确定性 | 接近专题成熟 | `Chance-Constrained MPPI` 与前序 `RCSP`、复合不确定性、住宅社交导航、动态目标检测已经足够支撑 Phase 5 动态通行回放字段包。 |
| 端侧路径规划与推理调度 | 仍有增量 | `CP-RPN`、前序端侧 DAG 调度、VLA latency、edge GEMM 共同说明需要 profiling 表，而不是新增重型在线 world model。 |
| 泛 `VLA` 操作、humanoid whole-body、自动驾驶专用 world model、多机器人 fleet / swarm | 已饱和 | 只有新增 Kinbot 家庭移动实机闭环、端侧资源实测、安全审计字段或老人照护任务映射时才进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把零样本导航 agent、conformal VPR、物品归属长期记忆、chance-constrained stochastic control、区域提议网络、canary 部署和 event camera 前端都写成 Kinbot 一代在线架构，会明显过复杂”。建议只吸收为 5 类轻量验证对象：导航失败恢复字段、VPR 拒绝 / 重观察字段、物品归属与主动询问字段、动态不确定性安全边界字段、端侧规划延迟和搜索空间 profiling。暂不新增通用多智能体导航框架、开放式家庭物品操作、事件相机产品线或重型随机控制主链路。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | Uni-LaViRA: A Unified Language-Vision-Robot Actions Translation and Navigation Framework for Long-Horizon Outdoor Vision-and-Language Navigation | 进入 VLN / NFM 专题，补充决策记忆、走错恢复、回溯触发和语言动作翻译失败字段。 |
| A- | SAFEVPR: Accurate and Safe Visual Place Recognition with Probabilistic Conformal Prediction | 进入纯视觉定位安全专题，转成 VPR 接受 / 拒绝、false match 风险和主动重观察评测。 |
| B+ | Whose Is This? Identity-Aware Object Recognition via Question Answering | 进入家庭长期记忆与主动询问专题，补充物品归属、置信和澄清问题字段。 |
| B+ | Chance-Constrained Model Predictive Path Integral Control for Safe Robot Navigation Under Dynamic Uncertainty | 进入动态通行安全专题，吸收 chance constraint、RSS margin 和不确定性校准字段。 |
| B | Accelerating Robot Path Planning via Connectivity-Preserving Region Proposal Network | 作为端侧规划资源候选，优先转为 planner latency、搜索空间压缩和窄通道失败 case profiling。 |

## 3. 论文卡片

### 3.1 Uni-LaViRA: A Unified Language-Vision-Robot Actions Translation and Navigation Framework for Long-Horizon Outdoor Vision-and-Language Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.27582](https://arxiv.org/abs/2605.27582) |
| 本轮 listing 口径 | 2026-05-28 官方 listing new submission；abs 页显示 `Submitted on 26 May 2026` |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | zero-shot VLN, language-vision-action translation, topometric decision memory, backtracking, multi-agent navigation |

摘要要点转述：

论文面向长程户外视觉语言导航，批评传统方法依赖任务专用训练和固定动作空间，难以直接迁移到新环境。作者提出 `Uni-LaViRA`，把语言指令、视觉观察和机器人动作统一到一个多智能体推理框架中：一个 agent 负责多模态语义理解，一个 agent 负责路径选择和动作翻译，并用 `TopoMetric Decision Memory` 存储导航过程中的决策节点、空间关系和失败恢复线索。系统支持零样本导航和显式回溯，避免在长程任务中因为一次错误转向而持续漂移。论文在多个真实户外场景中验证了成功率和导航效率提升，但核心实验仍是户外 VLN，不等同于 Kinbot 家庭低速、窄空间、强隐私场景。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 与 `interaction_orchestration` 中“自然语言导航走错后如何恢复”的问题。
2. Kinbot 家庭任务会包含“去卧室门口看看”“到药箱旁提醒”“绕过客厅杂物去老人身边”等长程指令；失败恢复比一次性路径规划更重要。
3. 对应 Phase 5：建议增加 `navigation_backtrack_triggered`、`decision_memory_node_reused`、`wrong_turn_recovered`、`language_action_translation_failed`、`instruction_landmark_disambiguated` 和 `navigation_memory_evicted` 字段。

资源消耗与部署信号：

1. 论文使用多智能体和多模态推理，端侧资源压力可能高于 Kinbot 一代默认量产线。
2. `TopoMetric Decision Memory` 的思想可轻量化为导航回放图和关键决策节点，不必引入完整多 agent 在线框架。
3. 对 Kinbot 更现实的落点是离线评测和回放字段：记录何时识别地标、何时怀疑走错、何时回退，而不是把大模型导航 agent 直接上车。

优势：

1. 直接补齐长程 VLN 的失败恢复和可解释决策记忆。
2. 与 Kinbot 当前纯视觉、语言指令、空间记忆专题高度相关。
3. 能把“导航成功率”扩展为“错误是否可恢复、恢复成本多少”的评测。

劣势与风险：

1. 实验偏户外场景，家庭窄空间、遮挡和隐私限制需要重新验证。
2. 多 agent 推理可能增加延迟、日志复杂度和调试成本。
3. 如果过早引入在线 LLM 导航决策，安全授权和可审计性压力会明显上升。

推荐理由：

建议作为 A- 级输入。它不改变 Kinbot 一代导航主线，但应该进入 VLN / NFM 专题，用于定义“走错、回退、再定位、继续执行”的最小可测闭环。

### 3.2 SAFEVPR: Accurate and Safe Visual Place Recognition with Probabilistic Conformal Prediction

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.28048](https://arxiv.org/abs/2605.28048) |
| 本轮 listing 口径 | 2026-05-28 官方 listing new submission；abs 页显示 `Submitted on 27 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | visual place recognition, conformal prediction, accept / reject, false positive control, localization safety |

摘要要点转述：

论文关注视觉地点识别在机器人定位中的安全问题。普通 `VPR` 往往给出最相似地点，但在外观变化、动态遮挡、照明变化或视角差异下，错误匹配会直接把机器人定位到错误位置。`SAFEVPR` 将 probabilistic conformal prediction 引入地点识别，为候选匹配给出可校准的不确定性集合，并允许系统在置信不足时拒绝定位，而不是强行输出 top-1。论文强调这种方式能在保持识别准确率的同时控制错误匹配风险，为机器人导航提供“何时不该相信定位结果”的安全接口。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 与 `safety_compliance_authorization` 中“纯视觉定位不确定时如何停下来或重看”的问题。
2. Kinbot 家庭环境存在重复门、相似柜体、光照变化、家具移动和遮挡；false place match 比短时定位丢失更危险，因为系统可能自信地走向错误区域。
3. 对应 Phase 5：建议增加 `vpr_accept_reject_state`、`false_match_risk_bound`、`localization_abstained_reason`、`reobserve_required_due_to_vpr_uncertainty`、`place_match_candidate_set_size` 和 `visual_localization_safety_gate` 字段。

资源消耗与部署信号：

1. conformal prediction 可以作为现有 VPR 输出后的校准层，方向上比重型 3D 重建或在线 world model 更轻。
2. 需要保留校准集、风险阈值和分场景统计，Kinbot 需要明确哪些数据只端侧处理、哪些统计可脱敏回流。
3. 在端侧部署时要评估额外候选集合计算、阈值更新和主动重观察动作对导航延迟的影响。

优势：

1. 将视觉定位从“总要给一个答案”改为“可以安全拒绝”，非常贴近家庭机器人安全。
2. 与一代纯视觉主线一致，不要求新增主动传感器。
3. 可直接转成 Phase 5 VPR 安全门控和回放指标。

劣势与风险：

1. conformal 风险保证依赖校准分布，家庭个性化环境变化会挑战阈值稳定性。
2. 如果拒绝过于频繁，会造成机器人停顿、重看或请求确认过多，影响高端产品感。
3. 论文不直接解决重新定位后的路径恢复，需要与导航记忆和回退机制合并验证。

推荐理由：

建议作为 A- 级输入。它应进入纯视觉定位安全专题，优先用于定义“定位不可信时如何拒绝、重看、慢行或转人工”的最小闭环。

### 3.3 Whose Is This? Identity-Aware Object Recognition via Question Answering

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.28087](https://arxiv.org/abs/2605.28087) |
| 本轮 listing 口径 | 2026-05-28 官方 listing new submission；abs 页显示 `Submitted on 27 May 2026` |
| 分类 | `cs.RO`, `cs.AI`, `cs.CV` |
| 方法关键词 | identity-aware object recognition, embodied question answering, uncertainty-guided clarification, household object ownership, long-horizon manipulation |

摘要要点转述：

论文提出一个家庭物品归属识别问题：机器人不只要知道物体类别和位置，还要知道物体属于谁、是否应当询问、询问谁以及如何避免把别人的物品错误操作。作者构建 `COIN` 基准，把 identity-aware object recognition 转化为具身问答任务，并评估 VLM / VLA 系统在多房间、多人物、多物品场景中的归属推理。论文强调不确定性感知的提问策略可以降低错误归属和误操作风险。虽然论文任务落在 long-horizon manipulation，但其核心价值是把家庭语义记忆从“空间状态”推进到“人与物的社会关系”。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`interaction_orchestration`、`safety_compliance_authorization` 中“家庭物品、药品和个人偏好如何归属、确认和审计”的问题。
2. Kinbot 一代即使不做抓取，也会遇到“这是爷爷的药盒吗”“遥控器是谁常用的”“这副眼镜是否需要提醒拿走”等任务；归属错误会造成体验和安全风险。
3. 对应 Phase 5：建议增加 `object_owner_hypothesis`、`ownership_confidence`、`ownership_evidence_source`、`clarification_question_asked`、`owner_confirmation_required` 和 `wrong_owner_risk` 字段。

资源消耗与部署信号：

1. identity-aware QA 可能依赖 VLM 和长期记忆检索，端侧资源和隐私压力明显高于普通物体检测。
2. Kinbot 可以先做轻量规则：只在药品、个人物品、权限动作和家属可见信息上启用归属确认，不做泛化物品社交推理。
3. 所有人物身份、物品归属和问答记录都涉及敏感家庭数据，默认应端侧处理，并只回流非隐私结构化统计。

优势：

1. 把家庭机器人记忆从“哪里有什么”扩展到“属于谁、该不该问”，与真实家庭场景贴合。
2. 与前序主动询问、老人认知辅助、任务规则学习形成互补。
3. 能直接变成高风险物品和个人物品的确认策略。

劣势与风险：

1. 论文偏操作型机器人任务，Kinbot 一代不能扩张成物品抓取或复杂家务承诺。
2. 家庭成员身份、物品归属和使用习惯可能变化，错误固化会带来隐私和信任问题。
3. VLM 问答若缺少证据溯源，容易产生看似合理但不可审计的归属判断。

推荐理由：

建议作为 B+ 级输入。它应进入家庭长期记忆和主动询问专题，重点吸收“归属置信不足时问谁、问什么、记录什么”，而不是扩张一代操作能力。

### 3.4 Chance-Constrained Model Predictive Path Integral Control for Safe Robot Navigation Under Dynamic Uncertainty

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.28330](https://arxiv.org/abs/2605.28330) |
| 本轮 listing 口径 | 2026-05-28 官方 listing new submission；abs 页显示 `Submitted on 27 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | chance-constrained MPPI, dynamic uncertainty, perception-driven risk assessment, RSS constraints, safe navigation |

摘要要点转述：

论文面向动态环境中的安全导航，把采样式 `MPPI` 控制与 chance constraints 结合起来，要求机器人不仅优化名义轨迹，还要显式控制碰撞概率和动态障碍下的安全距离。作者引入 perception-driven risk assessment、责任敏感安全约束和 state-dependent uncertainty calibration，使规划器能够根据障碍物状态和感知不确定性调整安全边界。论文在动态障碍导航任务中验证该方法能在安全性和效率之间取得更稳健折中。对 Kinbot 来说，价值不在于直接替换局部规划器，而在于把动态不确定性、安全距离和速度上限转成可记录字段。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 与 `safety_compliance_authorization` 中“动态人 / 宠物 / 家具移动下如何给出可解释安全速度”的问题。
2. Kinbot 家庭低速导航需要知道什么时候该慢行、等待、绕行或请求用户让路；名义轨迹最短并不等于产品上最安全。
3. 对应 Phase 5：建议增加 `chance_constraint_violation_risk`、`rss_margin_dynamic_obstacle`、`uncertainty_calibration_state`、`safety_speed_cap_reason`、`dynamic_obstacle_risk_source` 和 `nominal_vs_safe_trajectory_delta` 字段。

资源消耗与部署信号：

1. `MPPI` 采样控制本身可能带来端侧计算压力；Kinbot 不应在没有 profiling 的情况下把它写成一代主规划器。
2. 论文提出的风险评估和校准字段可先进入回放和仿真验证，不必完整迁移控制算法。
3. 与前序 `RCSP` 一样，本轮应将其作为动态通行安全字段来源，而非新增并列规划栈。

优势：

1. 显式处理动态不确定性下的碰撞概率和安全距离，比单纯避障阈值更可审计。
2. 可与住宅社交导航、近失效承诺风险和复合不确定性合并。
3. 能帮助解释“为什么机器人突然变慢或停止”。

劣势与风险：

1. 计算成本、参数调优和采样稳定性需要端侧实测。
2. 对家庭中非理性移动的人和宠物，短时不确定性模型仍可能不足。
3. 如果安全边界过保守，可能造成频繁停顿，损伤用户感知。

推荐理由：

建议作为 B+ 级输入。它不应直接改写导航主栈，但应补入动态通行安全专题，用于定义 chance constraint、RSS margin 和速度上限的回放字段。

### 3.5 Accelerating Robot Path Planning via Connectivity-Preserving Region Proposal Network

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.28362](https://arxiv.org/abs/2605.28362) |
| 本轮 listing 口径 | 2026-05-28 官方 listing new submission；abs 页显示 `Submitted on 27 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | robot path planning, region proposal network, connectivity preservation, search space reduction, planner latency |

摘要要点转述：

论文关注采样式路径规划在复杂环境中的搜索空间过大问题。作者提出 `CP-RPN`，先从环境中预测对路径连通性关键的区域，再把采样集中到这些区域附近，以减少无效搜索并保持通路连通。论文报告在仿真和真实移动平台实验中，规划时间平均降低到约 `0.11s`，搜索区域减少约 `60.13%`，成功率超过 `90%`。这类方法对 Kinbot 的启发是：端侧规划优化不一定要依赖更大模型，也可以通过结构化缩小搜索空间来换取延迟和功耗收益。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 与 `platform_runtime` 中“低成本 SoC 上路径规划如何保持低延迟”的问题。
2. Kinbot 家庭导航有窄通道、桌椅腿、地毯边界、临时杂物等结构，规划器需要快速识别真正影响通行的区域。
3. 对应 Phase 5：建议增加 `planning_search_region_ratio`、`planner_latency_p50_p95`、`connectivity_preserved`、`narrow_passage_failure_case`、`region_proposal_missed_corridor` 和 `planner_fallback_triggered` 字段。

资源消耗与部署信号：

1. 论文报告的低规划时间有端侧吸引力，但神经网络前处理、地图输入和部署平台细节需要复核。
2. 若 region proposal 漏掉窄通道或安全边界，可能造成规划器自信地忽略关键空间。
3. Kinbot 更适合先做 profiling 与对照实验：传统规划器、拓扑约束、区域提议三者对延迟、成功率和失败类型的影响。

优势：

1. 将端侧资源问题转成可量化的搜索区域和规划延迟，而不是只谈模型大小。
2. 对家庭窄空间路径规划有直接类比价值。
3. 可以与现有局部 / 全局规划器做离线对照，不必直接替换主栈。

劣势与风险：

1. 区域提议网络本身可能引入训练数据依赖和失效盲区。
2. 对动态障碍、人和宠物的在线变化覆盖不足，需要与安全层联动。
3. 论文成功率和延迟指标需要在 Kinbot 目标 SoC、视觉地图和家庭场景下重测。

推荐理由：

建议作为 B 级输入。它适合进入端侧规划资源候选，重点沉淀搜索空间压缩和 planner latency profiling，不新增一代在线神经规划主链路。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| POINav: Benchmarking and Enhancing Final-Meters Arrival in Real-World Vision-and-Language Navigation | [2605.28237](https://arxiv.org/abs/2605.28237) | 2026-05-28 new submission | 最后几米到达与 Kinbot 家庭导航相关，但实验依赖 `3DGS` 和公共商业空间；本轮已由 `Uni-LaViRA` 覆盖更基础的零样本导航记忆和失败恢复，POINav 作为到达判定专题候选。 |
| ICAN-Deploy: Safety-Critical Deployment in Embodied Agents via Identity-Stable Canary Invariants | [2605.28097](https://arxiv.org/abs/2605.28097) | 2026-05-28 new submission | canary invariants、OTA guard 和 deployment rollback 对 Phase 5 治理有启发，但本轮重点是导航、记忆、安全和端侧资源评测字段；暂不以工程运维治理论文进入主卡片。 |
| EventShiftFlow: Scalable, Self-Supervised Event Optical Flow Using Spatial Event Shifting | [2605.28312](https://arxiv.org/abs/2605.28312) | 2026-05-28 new submission | `FPGA`、小于 `2KB` 存储和微瓦级资源信号很强，但依赖 event camera；Kinbot 一代纯视觉主线不因该文增加事件相机，只保留为远期低功耗视觉前端参考。 |
| Probabilistic Guarantees for Polytopic Uncertainty Quantification in Learned Landmark-based SLAM | [2605.28172](https://arxiv.org/abs/2605.28172) | 2026-05-28 new submission | SLAM 不确定性保证有价值，但核心是 learned landmark 与多面体不确定性表达；本轮 `SAFEVPR` 更直接覆盖纯视觉地点识别的接受 / 拒绝安全门。 |
| COTRATE: A Terrain Traversability Criterion Learned from Physical and Visual Consistency | [2605.28442](https://arxiv.org/abs/2605.28442) | 2026-05-28 new submission | 视觉与物理一致性的可通行性学习有导航价值，但偏户外地形和 wheeled robot rough terrain；Kinbot 一代家庭平层移动不扩张到野外 traversability。 |
| How Vision-Language-Action Models Fail Differently | [2605.28726](https://arxiv.org/abs/2605.28726) | 2026-05-28 new submission | VLA 失败类型分析对操作策略监控有价值，但本月 VLA / manipulation 已明显饱和，且未新增 Kinbot 家庭移动或安全回放字段。 |
| ProgVLA: Progressive Vision-Language-Action Model for Generalist Manipulation Policy | [2605.27987](https://arxiv.org/abs/2605.27987) | 2026-05-28 new submission | progressive VLA 和 compact manipulation policy 方向可观察，但核心仍是操作主链路；Kinbot 一代不新增机械臂或泛操作能力。 |
| RSBM: A Benchmark for Visual Navigation with Fewer Steps | [2604.05673](https://arxiv.org/abs/2604.05673) | 2026-05-28 replacement | 减少导航步数有评测价值，但属于 replacement，且本轮主卡片已覆盖导航恢复、地点识别拒绝和端侧规划延迟；暂不重复收录。 |
| PRISM-SLAM: Probabilistic Ray-Grounded Inference for Scale-aware Metric SLAM | [2605.19257](https://arxiv.org/abs/2605.19257) | 2026-05-28 replacement | 已在 2026-05-21 主卡片收录；本轮不因 replacement 重复。 |
| AirRobot: Enabling AI-Enhanced Efficient and Secure Wireless Networking for Aerial Robots | [2605.28352](https://arxiv.org/abs/2605.28352) | 2026-05-28 new submission | aerial robot 通信网络安全与 Kinbot 家庭移动本体关系弱，不改变导航、记忆、安全或端侧资源判断。 |

## 5. 对 Kinbot 的落地 / 文档建议

本轮建议只作为研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。原因是 5 篇主卡片只新增 Phase 5 回放字段、专题候选和评测语言，没有形成需要改变一代纯视觉主线、端侧 / 云边界、传感器主线、成本基线或 Phase 5 门控的稳定产品判断。

建议后续轻量落地动作：

1. 在 VLN / NFM 与纯视觉导航专题中补充 `navigation_backtrack_triggered`、`decision_memory_node_reused`、`wrong_turn_recovered`、`vpr_accept_reject_state`、`false_match_risk_bound` 和 `localization_abstained_reason`。
2. 在家庭长期记忆与主动询问专题中补充 `object_owner_hypothesis`、`ownership_confidence`、`ownership_evidence_source`、`clarification_question_asked` 和 `owner_confirmation_required`，并明确物品归属不得由单次观察自动冻结。
3. 在动态通行安全回放字段中补充 `chance_constraint_violation_risk`、`rss_margin_dynamic_obstacle`、`uncertainty_calibration_state`、`safety_speed_cap_reason`，并与前序近失效承诺和复合不确定性字段合并。
4. 在端侧规划 profiling 中补充 `planning_search_region_ratio`、`planner_latency_p50_p95`、`connectivity_preserved`、`narrow_passage_failure_case`，避免把神经区域提议直接写成一代主规划器。

本轮未进入主线的原因：这些论文主要改变“怎么评测和记录导航恢复、定位拒绝、物品归属、动态安全边界和规划延迟”，不改变“Kinbot 一代必须纯视觉、端侧处理敏感原始数据、12GB + 32GB 默认量产线、移动而非操作”的主线边界。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent` 官方 listing：[https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
3. `Uni-LaViRA: A Unified Language-Vision-Robot Actions Translation and Navigation Framework for Long-Horizon Outdoor Vision-and-Language Navigation`：[https://arxiv.org/abs/2605.27582](https://arxiv.org/abs/2605.27582)
4. `SAFEVPR: Accurate and Safe Visual Place Recognition with Probabilistic Conformal Prediction`：[https://arxiv.org/abs/2605.28048](https://arxiv.org/abs/2605.28048)
5. `Whose Is This? Identity-Aware Object Recognition via Question Answering`：[https://arxiv.org/abs/2605.28087](https://arxiv.org/abs/2605.28087)
6. `Chance-Constrained Model Predictive Path Integral Control for Safe Robot Navigation Under Dynamic Uncertainty`：[https://arxiv.org/abs/2605.28330](https://arxiv.org/abs/2605.28330)
7. `Accelerating Robot Path Planning via Connectivity-Preserving Region Proposal Network`：[https://arxiv.org/abs/2605.28362](https://arxiv.org/abs/2605.28362)
8. 候选排除表条目：[`POINav`](https://arxiv.org/abs/2605.28237)、[`ICAN-Deploy`](https://arxiv.org/abs/2605.28097)、[`EventShiftFlow`](https://arxiv.org/abs/2605.28312)、[`Polytopic UQ SLAM`](https://arxiv.org/abs/2605.28172)、[`COTRATE`](https://arxiv.org/abs/2605.28442)、[`VLA Fail Differently`](https://arxiv.org/abs/2605.28726)、[`ProgVLA`](https://arxiv.org/abs/2605.27987)、[`RSBM`](https://arxiv.org/abs/2604.05673)、[`PRISM-SLAM`](https://arxiv.org/abs/2605.19257)、[`AirRobot`](https://arxiv.org/abs/2605.28352)
