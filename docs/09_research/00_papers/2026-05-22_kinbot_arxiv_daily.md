# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-22
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-22 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 为 `Thursday, 21 May 2026`，合计 `86` 篇 entries；其中 new submissions `44` 篇、cross submissions `18` 篇、replacement submissions `24` 篇。2026-05-22 本地日更时尚未出现新的 `Friday, 22 May 2026` Robotics 批次，本轮采用“最新官方 listing + 当日未出现新批次说明 + 日更收录”口径，按 3-5 篇强相关论文 + 候选排除表方式，收录对 Kinbot 具身拒答 / 澄清、安全置信校准、局部风险场规划、主动感知安全约束和端侧视觉地点识别有明确增量价值的 5 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-22。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期为 `Thursday, 21 May 2026`，合计 `86` 篇 entries；其中 new submissions `44` 篇、cross submissions `18` 篇、replacement submissions `24` 篇。
3. 本轮检索时官方 `cs.RO/recent` 显示最新 Robotics recent 批次为 `Thu, 21 May 2026`，该日期 recent entries 为 `62` 篇，对应 new submissions 与 cross submissions，不含 replacement。
4. 本轮本地日期为 2026-05-22，官方尚未出现 `Friday, 22 May 2026` Robotics 新批次；因此本轮按“最新官方 listing + 当日未出现新批次说明 + 日更收录”处理，不把 `2026-05-22` 写成新的官方 Robotics listing 日期。
5. 本轮先核对既有日更文档中的论文标题与 arXiv 编号，未发现本轮主卡片 `2605.20544`、`2605.21109`、`2605.21406`、`2605.20566`、`2605.20551` 已进入前序主卡片。
6. 本轮不固定凑满 `10` 篇；在 5 月中下旬泛 `VLA`、world model、humanoid / manipulation、自动驾驶和多机器人主题已多次覆盖后，只保留 5 篇能改变 Kinbot Phase 5 评测字段、导航安全、拒答治理或端侧资源判断的论文，其余进入候选排除表。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是继续增加泛 `VLA`、world model、灵巧操作或自动驾驶 benchmark 的数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`decision_orchestration`、`safety_compliance_authorization`、`observability_data_governance`、`platform_runtime`。
3. 是否能低成本转化为 Phase 5 验证项：具身拒答分类、视觉安全预测校准、家庭局部风险场、主动重观察安全约束、视觉地点识别资源开关。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. replacement / cross-list 仅在新增 Kinbot 评测项或治理项时收录；本轮主卡片中 `Faster or Stronger` 为 `cs.CV` cross submission，纳入原因是它直接新增视觉地点识别的 token pruning 和精度-延迟可调口径，对 Kinbot 端侧纯视觉定位 / 重定位有资源判断价值。
2. `Temporal Counterfactual Explanations of Behaviour Tree Decisions` 是 replacement，具备解释性治理价值，但其核心载体是行为树，不直接改变 Kinbot 当前 OODA / runtime baseline，本轮放入候选排除表。
3. `Perception of Social Robots as Communication Partners in Healthcare for Older Adults` 与首发老人场景相关，但主要是 HRI 接受度研究，不改变导航、记忆、安全或端侧资源判断，本轮不进入主卡片。
4. `VLA-REPLICA`、`PointACT`、`DISC`、`Mobile UMI`、`SUGAR`、`Demo-JEPA` 等继续证明 VLA / imitation / mobile manipulation 评测活跃，但缺少 Kinbot 一代家庭移动机器人、端侧资源或安全治理的直接新增字段。
5. 自动驾驶、UAV、quadrotor、humanoid whole-body、soft robot、tactile manipulation 和多机器人协作条目不改变 Kinbot 一代家庭移动机器人路线。

## 2. 本轮总判断

本轮官方 Robotics listing 已从 2026-05-20 更新到 `2026-05-21`，不是继续补录同一饱和 listing。高价值信号集中在五个方向：具身 VLM / planner 什么时候必须拒答或澄清、视觉安全预测置信度如何在异常下校准、局部规划是否需要可解释风险场、主动感知如何在“多看一点”和“不要冒险”之间硬约束，以及纯视觉地点识别怎样在端侧做精度-延迟切换。

本轮对 Kinbot 有 5 个增量判断：

1. **具身智能体必须评测“该拒绝时是否拒绝 / 澄清”**：`The Yes-Man Syndrome` 说明 embodied planner 的 abstention 不是普通聊天模型拒答，而是要识别视觉假前提、物理不可行、指令歧义和传感不足。Kinbot 的访客指令、老人模糊指令、家属远程指令和坐席建议都需要 `abstain_or_clarify` 字段。
2. **视觉安全预测不能只看模型置信度，要区分视觉异常和动力学异常**：`Anomaly-Informed Confidence Calibration` 说明图像仍看似正常时，执行延迟、控制偏置和动力学漂移也会让视觉安全预测过度自信。Kinbot 需要把 `perception_anomaly` 与 `dynamics_anomaly` 分开记录。
3. **家庭导航风险场要从“是否可通行”升级到“人 / 宠物 / 家具 / 门槛 / 动态物”的分量化风险**：`MC-Risk` 来自自动驾驶，但 multi-component risk field 的工程语言适合转译为家庭局部规划成本层，重点是早期风险定位、类别解释和 MPC / 局部规划接口。
4. **主动重观察必须以安全为硬约束，而不是让信息增益压过安全边界**：`Conflict-Aware Active Perception` 用 CBF 把安全约束作为硬条件，把感知收益作为可放松目标。Kinbot 在夜间巡护、找人、找药盒和看门窗时，可以吸收这个原则，但不应承诺在线 3DGS 重建。
5. **纯视觉定位 / 重定位要有资源开关，而不是固定跑最大视觉模型**：`Faster or Stronger` 说明视觉地点识别可通过 token pruning 做可调精度-延迟权衡。Kinbot 在 `12GB + 32GB` 量产线上，应优先把它转为 `vpr_latency_mode`、`token_prune_ratio`、`place_match_confidence` 等离线 / 半在线验证字段。

周度滚动判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 具身拒答、恶意 / 模糊指令、良性效用 | 值得进入安全专题 | 将本轮 RoboAbstention 与前序 RoboJailBench、typographic attack、unsafe propagation 合并为“视觉 / 语言 / 跨端指令污染与拒答澄清”测试包。 |
| 视觉安全预测、置信校准和异常检测 | 值得进入 Phase 5 评测字段 | 将视觉异常、动力学异常、延迟、暗光、模糊和执行偏置拆成独立回放标签，不再只记录一个 generic confidence。 |
| 局部规划风险场、可达区域和人类动态风险 | 接近专题成熟 | 本周已覆盖可达区域、动态干扰、风险场和 CBF；后续只在出现家庭移动实机、端侧资源实测或用户打扰成本字段时进入主卡片。 |
| 纯视觉地点识别 / SLAM / 空间记忆资源线 | 值得进入专题跟踪 | 将 VPR token pruning 与 PRISM-SLAM、视觉退化评测、记忆型重探索合并成“纯视觉定位与重定位资源开关”验证包。 |
| 泛 `VLA`、world model、humanoid manipulation、多机器人协作、自动驾驶专用栈 | 已饱和 | 只有出现端侧资源实测、家庭移动实机闭环、安全审计新增证据或老人照护任务映射时才进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把拒答 benchmark、在线校准器、风险场、3DGS 主动感知和 VPR token pruning 都变成在线组件，会明显过复杂”。建议只吸收为 5 个轻量验证 / 治理动作：拒答 / 澄清分类、视觉与动力学异常分离、家庭风险场候选标签、安全硬约束下的重观察评测、VPR 资源模式开关。暂不新增产品级在线 3DGS、重型风险中台、云端 VLA 主控或新传感器 fallback。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | The Yes-Man Syndrome: Benchmarking Abstention in Embodied Robotic Agents | 转成安全专题：具身拒答 / 澄清 taxonomy、假前提、物理不可行、传感不足、良性指令不过度拒绝。 |
| A | Anomaly-Informed Confidence Calibration for Vision-Based Safety Prediction | 转成 Phase 5 视觉安全校准字段：视觉异常、动力学异常、延迟、控制偏置、低光 / 模糊。 |
| A- | MC-Risk: Multi-Component Risk Fields for Risk Identification and Motion Planning | 转成家庭局部风险场候选：人 / 宠物 / 门槛 / 家具 / 动态物分量、早期风险定位、局部规划成本接口。 |
| A- | Conflict-Aware Active Perception and Control in 3D Gaussian Splatting Fields via Control Barrier Functions | 转成主动重观察约束：安全硬门槛、信息增益软目标、未确认区域重观察成本。 |
| B+ | Faster or Stronger: Towards Flexible Visual Place Recognition via Weighted Aggregation and Token Pruning | 转成端侧资源专题：VPR token pruning、精度-延迟切换、重定位置信度回放。 |

## 3. 论文卡片

### 3.1 The Yes-Man Syndrome: Benchmarking Abstention in Embodied Robotic Agents

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.20544](https://arxiv.org/abs/2605.20544) |
| 本轮 listing 口径 | 2026-05-21 官方 listing new submission，日更收录；abs 页显示 `Submitted on 19 May 2026` |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | embodied abstention, false premise, physical infeasibility, sensory insufficiency, auditable instruction generation |

摘要要点转述：

论文把 VLM 作为具身智能体高层 planner 时的“yes-man”问题单独拎出来：模型不该在所有自然语言指令下都产出行动计划，因为机器人场景里存在视觉假前提、物理不可达、上下文不充分、传感器无法确认和指令歧义。作者提出 `RoboAbstention`，先做结构化视觉 grounding，再用确定性约束派生不可满足条件，最后通过类别模板生成可审计的拒答 / 澄清指令集。论文在多套机器人图像数据上构造 6069 条 benchmark 指令，并测试多个前沿 VLM / embodied planner。结果显示，即便推理能力强的模型，在无防御时也经常过度顺从；提示防御和 in-context learning 可以显著提升 abstention，但仍不能完全解决。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`decision_orchestration` 和 `human_service_interface` 中“机器人什么时候应该拒绝、澄清或请求补充信息”的问题。
2. Kinbot 会面对老人含糊表达、访客越权、家属远程指令、坐席建议和视觉场景不完整；不能只评估是否完成任务，还要评估是否在不可确认条件下保持克制。
3. 对应 Phase 5：建议增加 `abstain_or_clarify`、`false_premise_detected`、`physical_infeasibility_reason`、`sensory_insufficiency`、`benign_instruction_preserved` 字段。

资源消耗与部署信号：

1. 论文提供的是 benchmark 生成与评测口径，不要求 Kinbot 端侧新增大模型。
2. 可先落为离线回放集和任务编排日志标签，在端侧只保留轻量拒答 / 澄清规则与高风险触发器。
3. 若直接把所有低置信任务都拒绝，会伤害陪伴和照护体验，需要同时度量良性指令通过率。

优势：

1. 直接命中具身场景中“模型不知道自己不能答”的安全问题。
2. 拒答原因可审计，适合 Kinbot 的权限、合规和人工承接链路。
3. 可与前序 jailbreak、视觉提示攻击和危险指令评测合并。

劣势与风险：

1. 数据集来自多套机器人图像，不等同于 Kinbot 家庭真实场景。
2. 提示防御效果强，但量产系统不能只依赖 prompt。
3. 过度拒答会让老人觉得机器人“不懂事”或“不温暖”。

推荐理由：

建议作为 A 级输入。Kinbot 应把它吸收为具身拒答 / 澄清评测，而不是新增在线大模型安全层；重点是让 Phase 5 任务回放能看见“该停、该问、该拒绝”的边界。

### 3.2 Anomaly-Informed Confidence Calibration for Vision-Based Safety Prediction

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.21109](https://arxiv.org/abs/2605.21109) |
| 本轮 listing 口径 | 2026-05-21 官方 listing new submission，日更收录；abs 页显示 `Submitted on 20 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | confidence calibration, vision-based safety prediction, perceptual anomaly, dynamics anomaly, test-time temperature scaling |

摘要要点转述：

论文关注视觉控制器在分布外条件下的危险过度自信。作者指出，常见异常分数往往只看视觉重建误差，能发现暗光、模糊等图像异常，却会漏掉执行延迟、控制偏置这类动力学异常，因为画面仍然合理，但轨迹已经开始偏离。论文提出 anomaly-informed online calibration，不重新训练基础安全预测器，而是从 world model 中提取两类异常信号：视觉重建误差对应感知异常，epistemic uncertainty 和控制流统计对应动力学异常；再用轻量 temperature scaling 与 test-time augmentation 降低异常条件下的过度置信。物理 DonkeyCar 实验覆盖暗光、模糊、执行偏置和处理延迟，报告平均 ECE 从 0.184 降到 0.116。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`platform_runtime` 和 `safety_compliance_authorization` 中“视觉安全预测是否可信”的问题。
2. Kinbot 室内会遇到暗光、反光、遮挡、网络 / 进程延迟、底盘偏置、轮胎打滑和执行时序抖动；这些异常不都能从图像看出来。
3. 对应 Phase 5：建议增加 `perception_anomaly_score`、`dynamics_anomaly_score`、`safety_confidence_calibrated`、`latency_shift_detected`、`actuation_bias_detected` 字段。

资源消耗与部署信号：

1. 方法强调不重训基础模型，用轻量校准器处理 test-time 异常，适合先做回放和 shadow mode。
2. 若要在线运行，需要确认 world model / uncertainty 信号在 `12GB + 32GB` 量产线上的成本；低成本版本可先用控制流统计、里程计残差和视觉质量分数替代。
3. 对 Kinbot 的价值不是照搬 DonkeyCar，而是把视觉异常与动力学异常拆开。

优势：

1. 明确指出视觉安全置信度的“感知-动力学缺口”。
2. 覆盖真实设备上的暗光、模糊、偏置和延迟，比纯仿真更接近部署问题。
3. 可转为低成本测试字段，不必新增主控模型。

劣势与风险：

1. 实验平台是小车和赛车式任务，不等同于家庭低速移动机器人。
2. 依赖 world model 提供异常信号，Kinbot 需要评估轻量替代。
3. 校准改善不等于安全证明，仍需硬约束、限速和停机策略。

推荐理由：

建议作为 A 级输入。Kinbot 应把它转成 Phase 5 视觉安全校准口径，重点复测暗光、模糊、延迟、控制偏置和底盘异常，不因此引入重型在线 world model。

### 3.3 MC-Risk: Multi-Component Risk Fields for Risk Identification and Motion Planning

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.21406](https://arxiv.org/abs/2605.21406) |
| 本轮 listing 口径 | 2026-05-21 官方 listing new submission，日更收录；abs 页显示 `Submitted on 20 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | multi-component risk field, planner-aligned risk localization, class-aware risk, MPC cost density |

摘要要点转述：

论文提出 `MC-Risk`，将风险表达成与规划器对齐的多分量 BEV grid。它不是只输出一个黑箱危险分数，而是把风险拆成可解释组件：机动车风险场结合多模态轨迹预测和解析 Gaussian-torus 构造，弱势交通参与者风险场用与朝向和速度对齐的各向异性核替代圆形 blob，道路惩罚场利用 HD map 拓扑表达 off-road 和车道方向风险。作者在 RiskBench collision subset 上做标准化评估，报告其风险定位更好且能更早提示危险，并展示可把风险场作为 MPC cost density 接入规划器，无需额外训练。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 和 `safety_compliance_authorization` 中“局部规划如何解释风险来源”的问题。
2. Kinbot 家庭场景不需要道路车道，但需要把人、宠物、家具边缘、低矮门槛、湿滑地面、门缝、儿童玩具和动态障碍拆成不同风险分量。
3. 对应 Phase 5：建议增加 `risk_component_type`、`early_hazard_signal`、`planner_cost_density`、`human_pet_buffer`、`threshold_edge_risk` 字段。

资源消耗与部署信号：

1. 论文场景偏自动驾驶，不能直接引入 HD map / BEV 大模型假设。
2. 可吸收为轻量局部 costmap 分层：静态几何、动态人 / 宠物、门槛 / 地面、语义危险物和不确定区域。
3. 风险分量可用于日志解释和局部规划调参，不需要新建独立风险中台。

优势：

1. 将风险拆成可解释、可接入规划的组件。
2. 强调早期危险提示，适合老人看护和家庭巡护的保守策略。
3. 与 Kinbot 的局部规划、限速、避让和停机策略兼容。

劣势与风险：

1. 自动驾驶语义到家庭语义需要重映射，不能照搬车道 / VRU 定义。
2. 若风险层过多，会增加调参复杂度和误停概率。
3. 需要家庭真实数据验证“早提示”不会变成频繁打扰。

推荐理由：

建议作为 A- 级输入。Kinbot 应吸收 multi-component risk field 的工程语言，先做家庭局部风险标签和回放解释，不把它升级为产品级风险场平台。

### 3.4 Conflict-Aware Active Perception and Control in 3D Gaussian Splatting Fields via Control Barrier Functions

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.20566](https://arxiv.org/abs/2605.20566) |
| 本轮 listing 口径 | 2026-05-21 官方 listing new submission，日更收录；abs 页显示 `Submitted on 19 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | active perception, 3D Gaussian Splatting, control barrier function, risk-aware EIG, safety-critical QP |

摘要要点转述：

论文研究机器人在不确定环境中主动感知时的冲突：信息量高的视角常靠近未知或高碰撞风险区域。作者以 3D Gaussian Splatting 表示环境不确定性，用基于 Average Value-at-Risk 的 collision-risk metric 构造 Control Barrier Function，将安全集合的 forward invariance 作为硬约束；同时用 risk-aware Expected Information Gain 选择 next-best-view，并用 perception barrier function 约束相机朝向信息增益方向。最终通过统一的 safety-critical、perception-aware quadratic program，把安全约束强制满足，把感知目标通过 slack variable 可放松。仿真结果显示，在 3DGS 场景中安全和信息采集都优于既有方法。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 和 `safety_compliance_authorization` 中“机器人是否为了看清楚而靠近风险区域”的问题。
2. Kinbot 找人、确认门窗、看药盒、夜间巡护和补充家庭地图时，经常需要多看一眼，但不能让信息增益压过避障、距离和用户打扰约束。
3. 对应 Phase 5：建议增加 `safe_active_perception_gate`、`information_gain_goal`、`risk_aware_viewpoint`、`perception_slack_reason`、`minimum_clearance_preserved` 字段。

资源消耗与部署信号：

1. 论文依赖 3DGS 表示与仿真验证，Kinbot 一代不应承诺在线 3DGS。
2. 可吸收的是“安全硬约束 + 感知软目标”的控制原则，而不是完整系统。
3. 端侧落地可先使用局部障碍 costmap、视觉质量分数和固定重观察动作集合。

优势：

1. 明确把主动感知的安全与信息收益冲突形式化。
2. CBF / QP 口径适合和底盘安全限速、避障和停机策略衔接。
3. 对 Kinbot 纯视觉路线下的重观察策略有直接启发。

劣势与风险：

1. 3DGS 在线构建和不确定性估计资源成本不明。
2. 仿真结果距离家庭真实动态场景仍有差距。
3. 若把每次重观察都优化化，会增加实时控制复杂度。

推荐理由：

建议作为 A- 级输入。Kinbot 应把它转成主动重观察评测规则：安全硬门槛优先，信息增益只能在约束内优化；暂不新增在线 3DGS 或复杂主动感知模块。

### 3.5 Faster or Stronger: Towards Flexible Visual Place Recognition via Weighted Aggregation and Token Pruning

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.20551](https://arxiv.org/abs/2605.20551) |
| 本轮 listing 口径 | 2026-05-21 官方 listing cross submission from `cs.CV`，日更收录；abs 页显示 `Submitted on 19 May 2026` |
| 分类 | `cs.CV`, `cs.AI`, `cs.LG`, `cs.RO` |
| 方法关键词 | visual place recognition, ViT token pruning, weighted aggregated descriptor, self-distillation, accuracy-latency tradeoff |

摘要要点转述：

论文关注 Visual Place Recognition 的精度和延迟权衡。当前很多 VPR 方法使用 ViT backbone 提取 patch-level features，再聚合成全局描述子；但不同聚类 token 对地点识别的贡献不一样，均匀聚合会浪费表达能力。作者提出 `WeiAD`，在聚合时为 cluster 赋权，得到更有判别力的全局描述子；进一步提出 `WeiToP`，用聚合诱导的 token importance 监督早期 transformer 层上的轻量 pruning 模块，从而在推理时裁剪 token，降低特征提取成本。论文强调该 pruning 是一次联合训练后推理期可插拔的，可按需求调整精度-效率权衡，并优于从通用视觉任务迁移来的 token pruning 方法。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`world_state_memory` 和 `platform_runtime` 中“纯视觉重定位和地点识别如何适配端侧资源”的问题。
2. Kinbot 家庭中会重复经过客厅、卧室、门口、药箱附近等区域；VPR 可以辅助重定位、场景记忆重锚定和视觉 SLAM 失败恢复。
3. 对应 Phase 5：建议增加 `vpr_latency_mode`、`token_prune_ratio`、`place_match_confidence`、`descriptor_refresh_interval`、`relocalization_fallback_trigger` 字段。

资源消耗与部署信号：

1. 该论文直接讨论资源受限 edge devices 的 retrieval latency，符合 Kinbot `12GB + 32GB` 量产线关注点。
2. 但 ViT backbone 仍可能偏重，Kinbot 应先以离线数据集和端侧样机 profiling 验证 token pruning 收益。
3. 更现实的吸收方式是把 VPR 做成可降级辅助能力，而不是导航主链路强依赖。

优势：

1. 直接连接纯视觉定位 / 重定位和端侧推理成本。
2. 支持按场景切换 faster / stronger 模式，适合低电量、夜间、巡航和异常复核等不同状态。
3. 可与前序 PRISM-SLAM、视觉退化评测和空间记忆回放合并验证。

劣势与风险：

1. cross-list 来自 CV / VPR，未直接验证家庭机器人长时运行。
2. 需要自己构建 Kinbot 家庭地点库，避免隐私数据外流。
3. token pruning 收益依赖 backbone 和硬件栈，不能凭论文指标承诺端侧性能。

推荐理由：

建议作为 B+ 级输入。Kinbot 应把它转成纯视觉定位资源专题候选，先测 VPR 精度-延迟曲线和重定位收益，不新增导航主链路依赖。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| To Select or not to Select, that is the Question: Distilling Robot Skill Prediction into a Small Ensemble | [2605.21242](https://arxiv.org/abs/2605.21242) | new submission | 小模型 skill taxonomy 对端侧任务路由有启发，但论文面向异构 robot fleet，Kinbot 一代仍是单机器人系统；可作为任务分类器专题候选，不改变本轮导航 / 安全主判断。 |
| Perception of Social Robots as Communication Partners in Healthcare for Older Adults | [2605.21053](https://arxiv.org/abs/2605.21053) | new submission | 与首发老人场景相关，但主要是 35 位 70+ 用户的 HRI 接受度研究，不新增导航、记忆、安全或端侧资源字段；后续可进入产品 / 交互研究，不进入本轮技术主卡。 |
| Validating Navmesh using Geometry: Voxel-Based Analysis with Prioritized Exploration | [2605.21397](https://arxiv.org/abs/2605.21397) | cross submission from `cs.SE` | 离线几何验证思路对 Phase 5 地图 QA 有价值，但载体是游戏 navmesh 和引擎查询，Kinbot 当前地图栈不同；暂作为离线 QA 候选。 |
| Temporal Counterfactual Explanations of Behaviour Tree Decisions | [2509.07674](https://arxiv.org/abs/2509.07674) | replacement | 反事实解释对可审计决策有治理价值，但 replacement 且行为树不是 Kinbot 当前主控架构；本轮不把它升级为主线评测字段。 |
| VLA-REPLICA: A Low-Cost, Reproducible Benchmark for Real-World Evaluation of Vision-Language-Action Models | [2605.20774](https://arxiv.org/abs/2605.20774) | new submission | 真实 VLA 评测有价值，但偏 manipulation / VLA benchmark，5 月已多次覆盖同类主题；未新增家庭移动、老人照护或端侧资源结论。 |
| Lost in Fog: Sensor Perturbations Expose Reasoning Fragility in Driving VLAs | [2605.21446](https://arxiv.org/abs/2605.21446) | new submission | 传感扰动暴露 VLA 推理脆弱性与安全校准有关，但场景是 driving VLA，本轮已由 `Anomaly-Informed Confidence Calibration` 覆盖更直接的视觉安全置信校准。 |

## 5. 对 Kinbot 的落地 / 文档建议

本轮建议只作为研究输入，不直接回写主线架构、`03_decision_log.md` 或 Linear。原因是 5 篇论文均提供评测字段、资源 profiling 方向或治理口径，但尚未形成需要改变一代纯视觉主线、端侧 / 云边界、传感器主线、Phase 5 门控或成本基线的稳定产品判断。

建议后续轻量落地动作：

1. 在 Phase 5 回放字段候选中补充 `abstain_or_clarify`、`false_premise_detected`、`perception_anomaly_score`、`dynamics_anomaly_score`、`risk_component_type`、`safe_active_perception_gate`、`vpr_latency_mode`。
2. 把本轮拒答 / 澄清与前序 RoboJailBench、typographic attack、unsafe propagation 合并，形成具身指令安全小测试包。
3. 把 `Anomaly-Informed Confidence Calibration` 与视觉退化、动态干扰、延迟和底盘偏置测试合并，形成纯视觉安全置信校准回放集。
4. 把 `MC-Risk` 和 `Conflict-Aware Active Perception` 只转为家庭局部规划 / 重观察评测语言，不新增在线风险场或 3DGS 组件。
5. 把 `Faster or Stronger` 纳入纯视觉定位资源 profiling，先测 faster / stronger 模式在样机上的延迟、热和重定位收益。

本轮未进入主线的原因：这些论文主要改变“怎么测、怎么记录、怎么做离线 / shadow 评估”，不改变“Kinbot 一代必须纯视觉、端侧处理敏感原始数据、12GB + 32GB 默认量产线、移动而非操作”的主线边界。

## 6. 来源

1. arXiv `cs.RO/new` 官方 listing：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
2. arXiv `cs.RO/recent` 官方 listing：[https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
3. `The Yes-Man Syndrome: Benchmarking Abstention in Embodied Robotic Agents`：[https://arxiv.org/abs/2605.20544](https://arxiv.org/abs/2605.20544)
4. `Anomaly-Informed Confidence Calibration for Vision-Based Safety Prediction`：[https://arxiv.org/abs/2605.21109](https://arxiv.org/abs/2605.21109)
5. `MC-Risk: Multi-Component Risk Fields for Risk Identification and Motion Planning`：[https://arxiv.org/abs/2605.21406](https://arxiv.org/abs/2605.21406)
6. `Conflict-Aware Active Perception and Control in 3D Gaussian Splatting Fields via Control Barrier Functions`：[https://arxiv.org/abs/2605.20566](https://arxiv.org/abs/2605.20566)
7. `Faster or Stronger: Towards Flexible Visual Place Recognition via Weighted Aggregation and Token Pruning`：[https://arxiv.org/abs/2605.20551](https://arxiv.org/abs/2605.20551)
