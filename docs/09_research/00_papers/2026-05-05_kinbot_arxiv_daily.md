# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-05
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-05 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页，确认本轮检索时官方最新 Robotics listing 为 2026-05-04 批次；收录此前每日纪要未覆盖、与 Kinbot 技能编排验证、语言条件导航数据集、VLA 可解释性、预测式时空场景图、端侧 GEMM 加速、fleet-scale 持续学习、潜在 world-action model、机器人 world model 综述和高帧率人类动作理解相关的 9 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-05。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/recent` 最新 listing 日期为 `Mon, 4 May 2026`，该批次显示 `26` 篇 entries；`cs.RO/new` 页面显示 `18` 篇 new submissions、`8` 篇 cross submissions 和 `13` 篇 replacement submissions。
3. 优先覆盖前序 `2026-04-29` 至 `2026-05-04` Kinbot 每日论文纪要未收录的 `2605.*` 新条目。
4. 关键词与主题包括 `affordance grounding`、`verification-gated skill orchestration`、`language-conditioned robot navigation`、`Vision-Language-Action`、`scene graph`、`edge inference`、`fleet-scale reinforcement learning`、`world-action model`、`world model`、`human action understanding`。

筛选标准：

1. 是否对应 Kinbot 一代主线问题：纯视觉导航、家庭场景世界状态记忆、任务执行可靠性、端侧资源约束、人类动作理解、长期运行安全与可解释治理。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`decision_orchestration`、`safety_compliance_authorization`、`companion_interaction`、`platform_runtime`、`observability_data_governance`。
3. 是否给出资源、数据规模、硬件平台、帧率、功耗、延迟、成功率或工程部署约束。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。fleet-scale 学习、后台数据回流、高帧率传感、事件相机和大规模 world model 只作为研究输入或 `KBT-57` 战略分支观察项，不直接改写一代主线。

## 2. 本轮总判断

本轮最新 Robotics listing 已进入 `2605.*` 批次。相比前几日补录 `2604.*` 论文，今日更像是“运行时智能系统化”的一批输入：多技能不再靠固定 pipeline，导航数据集开始贴近差速移动机器人，VLA 可解释性从热力图走向因果诊断，场景图从静态语义关系走向可预测的时间关系，端侧推理也开始用固定资源块和流式 GEMM 讲清功耗与算力边界。

对 Kinbot 最有价值的结论有 5 个：

1. **技能编排必须带验证门**：`Affordance Agent Harness` 把 Router、证据存储、episodic memory、Verifier 和成本控制放在同一个闭环，适合作为 Kinbot 低频复杂感知 / 可供性判断的参考。
2. **语言导航需要可复现实验资产**：`MiniVLA-Nav v1` 的差速机器人、自然语言指令、RGB / depth / mask / action label 和 OOD 模板，对 Kinbot 纯视觉导航验证集设计有直接启发。
3. **VLA / VLM 不能只看成功率**：`Embodied Interpretability` 提供因果归因与 nuisance 质量指标，可用于判断模型是否把动作建立在任务相关区域上。
4. **家庭世界状态应显式建模时间规律**：`PredictiveGraphs` 与 Kinbot 家庭半静态环境高度匹配，杯子、药盒、充电桩、门口障碍物等对象位置变化应被建成可预测、不确定的状态，而不是一次性地图事实。
5. **端侧资源是架构约束，不只是优化项**：`Tempus` 把固定 16 个 AIE-ML cores、`607 GOPS`、`10.677 W` 这类指标讲清楚，提醒 Kinbot 在 `12GB + 32GB` 主线下需要把大模型调用、矩阵乘和视觉链路共享资源一起算。

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 9 篇论文分别变成 9 个新模块，就会过复杂”。推荐只吸收 4 类验证任务：技能编排验证门、语言导航验证集、预测式时空场景图、端侧推理预算。fleet-scale 学习、latent world-action、高帧率动作理解和 world model 综述只保留研究输入，不进入当前一代冻结主线。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | Affordance Agent Harness: Verification-Gated Skill Orchestration | 纳入 `decision_orchestration` 低频技能编排验证池，重点看证据充分性、重试和成本门限。 |
| A | MiniVLA-Nav v1 | 用作 Kinbot 语言条件导航数据集规格参照，提炼 RGB-only、模板 OOD 和停止距离评测口径。 |
| A- | Predictive Spatio-Temporal Scene Graphs for Semi-Static Scenes | 纳入 `world_state_memory` 研究输入，优先验证家庭半静态对象的时间预测。 |
| A- | Embodied Interpretability | 作为 VLA / VLM 安全评测指标输入，用于离线诊断模型是否依赖任务无关区域。 |
| A- | Tempus | 作为端侧 GEMM / LLM 推理预算参考，不绑定 AMD Versal，但吸收固定资源块和流式执行思路。 |
| B+ | High-Speed Vision Improves Zero-Shot Semantic Understanding of Human Actions | 作为人类快速动作识别研究输入，先用于摄像头帧率与带宽 tradeoff，不改写传感器主线。 |
| B+ | Being-H0.7 | 作为未来 VLA latent reasoning 观察项，当前只吸收“不生成未来帧”的部署思想。 |
| B | Learning while Deploying | 作为 `KBT-57` 数据回流 / fleet learning 战略分支输入，不能写成一代已确认闭环。 |
| B | World Model for Robot Learning: A Comprehensive Survey | 作为导航、评估和数据生成的综述索引，不直接形成架构变更。 |

## 3. 论文卡片

### 3.1 Affordance Agent Harness: Verification-Gated Skill Orchestration

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.00663](https://arxiv.org/abs/2605.00663) |
| 提交日期 | 2026-05-01 |
| 分类 | `cs.RO`, `cs.CV` |
| 篇幅 | 43 页、22 图、8 表，arXiv 页面标注为 ongoing work |
| 方法关键词 | affordance grounding, Router, evidence store, episodic memory, Verifier, cost control |

摘要要点转述：

论文关注开放场景中的可供性定位：机器人需要判断哪里可抓、可按、可推或可交互，但可操作区域常常小、被遮挡、反光或存在视觉歧义。作者认为固定的检测 / 分割 / 交互想象 pipeline 无法适配不同实例难度，也不擅长从中间错误中有针对性恢复。论文提出 `Affordance Agent Harness`，用 Router 自适应选择技能，用 evidence store 和 episodic memory 复用先验，再由 Verifier 基于自一致性、跨尺度稳定性和证据充分性决定是否提交结果或触发重试，最终由 judge 融合证据和轨迹。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 在家庭环境中对门把手、药箱、充电桩、桌面物品、障碍物和可通行区域的低频可供性判断。
2. 对应 `decision_orchestration`：多技能调用需要成本门、证据门和失败重试，而不是固定顺序调用 VLM / 检测 / 分割。
3. 对应 `world_state_memory`：重复出现的家具、物品和空间位置可进入 episodic memory，为下一次识别提供先验。

资源消耗与部署信号：

1. 论文强调 bounded inference cost，并报告相较固定 pipeline 有更好的 accuracy-cost Pareto frontier，但摘要未给出具体端侧延迟、显存或模型大小。
2. 多技能编排会占用视觉、VLM 和分割资源，不适合放入高频避障链路。
3. 更适合 Kinbot 作为低频确认链路：例如异常处置、可交互对象确认、巡护事件解释或离线回放标注。

优势：

1. 把“何时相信模型输出”显式做成 Verifier，符合 Kinbot 安全与审计要求。
2. 针对难例可触发重试，比一次性 VLM 判断更适合家庭长尾场景。
3. 成本控制和证据存储能自然接入 Kinbot 端侧资源预算。

劣势与风险：

1. ongoing work，工程成熟度和真实机器人稳定性仍需观察。
2. Verifier 仍依赖模型自一致性，不能替代物理安全约束。
3. 如果直接引入完整多技能系统，会显著增加运行时复杂度。

推荐理由：

建议作为 Kinbot “低频技能编排验证门”参考，不新建顶层模块。优先把其中 Router、evidence sufficiency 和 targeted retry 抽象为 `decision_orchestration` 的验证策略，用 5 到 8 个家庭长尾场景做离线回放。

### 3.2 MiniVLA-Nav v1: A Multi-Scene Simulation Dataset for Language-Conditioned Robot Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.00397](https://arxiv.org/abs/2605.00397) |
| 提交日期 | 2026-05-01 |
| 分类 | `cs.RO` |
| 篇幅 | 9 页、12 图、7 表，dataset paper |
| 数据关键词 | Isaac Sim, NVIDIA Nova Carter, language-conditioned object approach, RGB, depth, instance mask, 60 Hz action labels |

摘要要点转述：

论文发布 `MiniVLA-Nav v1`，面向语言条件目标接近任务：给定短自然语言指令，差速移动机器人需要在多个 photorealistic Isaac Sim 环境中导航到目标物体并停在 1 米内。数据集包含 `1,174` 个 episodes，覆盖 office、hospital、warehouse 等四类环境；每条轨迹包含 `640x640` RGB、metric depth、instance segmentation mask、连续速度控制 `(v, omega)` 和 `7x7` tokenized expert action labels，动作标签来自 60 Hz 视觉比例控制器。数据还设计了近 / 中 / 远起点距离、12 类目标物、训练模板和 paraphrase-OOD 模板。

解决 Kinbot 的什么问题：

1. 对应 Kinbot “听懂家属或老人一句话后移动到家庭目标附近”的语言条件导航验证问题。
2. 对应 `mobility_navigation + companion_interaction`：语言指令需要落到可执行的目标接近和停止判定。
3. 对应 Phase 5 验证资产：Kinbot 需要可复现的 OOD 模板、停止距离、不同空间类型和轨迹长度分层。

资源消耗与部署信号：

1. 数据分辨率为 `640x640`，控制标签为 `60 Hz`，对 Kinbot 的视觉输入频率和控制频率设计有参考价值。
2. 数据包含 depth 和 instance mask；Kinbot 一代纯视觉主线不能把 depth 作为产品 fallback，但可用作仿真真值或训练辅助标签。
3. 数据规模 `1,174` episodes 不算大，适合快速基线，不足以覆盖真实家庭长尾。

优势：

1. 任务形态与家用移动机器人接近，比通用 VLN 更贴近 Kinbot。
2. OOD paraphrase 和 OOD object-category split 对语言鲁棒性评测有用。
3. 连续动作和离散 token 标签并存，便于比较端到端策略和分层策略。

劣势与风险：

1. 仿真环境仍与真实家庭光照、镜面、狭窄通道、宠物和老人活动有差距。
2. 使用 depth / mask 可能高估纯视觉部署效果。
3. 目标接近任务比 Kinbot 长程巡护、回桩、找人和异常处理简单。

推荐理由：

建议将该论文作为 Kinbot 语言导航验证集规格参照：保留短指令、停止距离、起点距离分层和 OOD paraphrase；训练 / 评测时额外增加 RGB-only 轨道，避免被 depth 和 mask 结果误导。

### 3.3 Embodied Interpretability: Linking Causal Understanding to Generalization in Vision-Language-Action Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.00321](https://arxiv.org/abs/2605.00321) |
| 提交日期 | 2026-05-01 |
| 分类 | `cs.RO` |
| 会议状态 | ICML 2026 accepted |
| 方法关键词 | interventional attribution, ISS, NMR, VLA generalization, causal misalignment |

摘要要点转述：

论文指出 VLA 策略在分布外环境中失败，往往不是因为模型完全不会任务，而是动作预测可能依赖了无关视觉相关性。作者把视觉-动作归因建模为干预估计问题，提出 `Interventional Significance Score` 评估视觉区域对动作预测的因果影响，并提出 `Nuisance Mass Ratio` 衡量模型把注意力分配到任务无关特征的程度。实验显示，`NMR` 可预测泛化行为，`ISS` 比常规解释方法更忠实。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 使用 VLM / VLA 参与导航、事件理解或交互时的“看起来解释合理，但实际依赖错误区域”风险。
2. 对应 `safety_compliance_authorization`：安全评测不能只看输出动作，还要看动作依据是否与任务相关。
3. 对应 `observability_data_governance`：离线回放需要能定位模型失败是因为感知缺失、语言误解还是视觉归因偏移。

资源消耗与部署信号：

1. 干预式 masking 和 attribution 适合作为离线诊断或回归测试，不适合作为高频运行时组件。
2. 摘要未给出计算时延、显存或模型大小。
3. 可转化为 Kinbot 仿真 / 日志回放的质量指标，而不是端侧常驻模块。

优势：

1. 关注因果相关性，比普通 attention heatmap 更接近安全评审需要。
2. `NMR` 作为标量指标，便于纳入版本回归。
3. 能帮助识别模型是否被背景、纹理、光照或无关物体误导。

劣势与风险：

1. 主要在 manipulation 任务上验证，移动导航和家庭事件理解需重做适配。
2. 干预区域定义若不稳定，指标本身会带来噪声。
3. 指标只能发现风险，不能直接修复策略。

推荐理由：

建议纳入 Kinbot VLA / VLM 离线评测指标池：对“识别老人动作”“判断门口障碍”“根据语音导航到物体”等样例做 attribution 检查，避免只按成功率筛模型。

### 3.4 Predictive Spatio-Temporal Scene Graphs for Semi-Static Scenes

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.00121](https://arxiv.org/abs/2605.00121) |
| 提交日期 | 2026-04-30 |
| 分类 | `cs.RO` |
| 方法关键词 | PredictiveGraphs, Perpetua*, 3D scene graph, Bayesian temporal reasoning, semi-static scenes |

摘要要点转述：

论文关注半静态环境中的时空语义推理。现有 spatio-semantic 表示能表达物体、几何和语义关系，但多数缺少跨时间预测能力。作者以家庭中的杯子日常在橱柜、台面、水槽之间循环移动为例，提出把 Bayesian filter `Perpetua*` 嵌入 3D scene graph 的边中，让对象关系带有时间规律和未来状态预测。论文在仿真和真实动态导航任务中验证，真实实验覆盖一个持续三周、每两小时变化一次的环境。

解决 Kinbot 的什么问题：

1. 高度对应 Kinbot `world_state_memory`：家庭不是完全静态地图，药盒、水杯、门、充电器、椅子和地面物品会按生活节奏变化。
2. 对应 `mobility_navigation`：预测半静态变化可帮助机器人提前选择路径、减少重复搜索。
3. 对应陪伴 / 看护：周期性行为异常可能是健康或生活习惯变化的线索。

资源消耗与部署信号：

1. 论文给出真实环境三周、两小时频率的长期实验信号，适合 Kinbot 长期运行验证。
2. 摘要未给出端侧 CPU / GPU 消耗；Bayesian filter 嵌入图边，理论上比大模型常驻预测更轻。
3. 需要可靠的对象重识别和位置更新，否则时序图会积累错误。

优势：

1. 与家庭半静态场景天然匹配，比一次性语义地图更接近 Kinbot 使用环境。
2. 可解释性强，图节点和边能直接映射到工程日志。
3. 可以先作为低频记忆层能力，不必影响底盘实时控制。

劣势与风险：

1. 长期对象观测依赖稳定感知，遮挡、光照和同类物体会造成错配。
2. 家庭隐私边界需要明确，不能把原始敏感轨迹无约束回流。
3. 若预测被当成事实，可能误导任务执行。

推荐理由：

建议作为本轮最值得吸收进 `world_state_memory` 研究池的论文：先做“半静态对象时间规律”验证，不改主线接口；对象状态必须带置信度、过期时间和可审计来源。

### 3.5 Tempus: A Temporally Scalable Resource-Invariant GEMM Streaming Framework for Versal AI Edge

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.00536](https://arxiv.org/abs/2605.00536) |
| 提交日期 | 2026-05-01 |
| 分类 | `cs.DC`, `cs.AR`, `cs.LG`, `cs.PF`, `cs.RO` |
| 篇幅 | 11 页、3 图、8 表、4 算法 |
| 硬件关键词 | AMD Versal AI Edge, GEMM, 16 AIE-ML cores, streaming, data tiling |

摘要要点转述：

论文聚焦边缘 LLM / AI 推理中的 GEMM 加速。作者指出 GEMM 可占推理时间的大部分，常见空间扩展方法依赖大量核心，会在资源受限 edge SoC 上遇到实现失败、带宽饱和和功耗上升。`Tempus` 采用固定 16 个 AIE-ML cores，通过迭代图执行、数据 tiling / replication、级联流式 partial sum reduction 和 deadlock-free DATAFLOW 实现可扩展执行。论文报告 GEMM workloads 上达到 `607 GOPS`，总 on-chip power 为 `10.677 W`，并给出比空间扩展 SOTA 更好的资源、功耗和 I/O frugality 指标。

解决 Kinbot 的什么问题：

1. 对应 Kinbot `platform_runtime`：端侧 VLM / LLM / VLA 推理不能只看模型效果，必须纳入固定资源、功耗、带宽和热设计。
2. 对应 `12GB RAM + 32GB Flash` 默认量产线：推理框架需要证明在有限资源块下可伸缩，而不是要求无限加核。
3. 对应 BOM / 功耗 tradeoff：计算方案必须避免把端侧智能推到不可接受的散热和成本区间。

资源消耗与部署信号：

1. 明确给出 `16 AIE-ML cores`、`607 GOPS`、`10.677 W`。
2. 报告 `0.00%` URAM / DSP utilization、`22.0x` core frugality、`7.1x` power frugality 和 `6.3x` I/O demand reduction。
3. 硬件是 AMD Versal AI Edge，不等同于 Kinbot 当前候选主控；价值在于固定资源块和流式执行方法。

优势：

1. 工程指标具体，适合做端侧推理预算参考。
2. 强调时间扩展而非无限空间扩展，符合量产资源约束。
3. 功耗和 I/O 指标对机器人平台有直接意义。

劣势与风险：

1. Versal 方案未必符合 Kinbot 成本、生态和软件栈。
2. GEMM 加速只是底层算子能力，不能直接保证 VLM / VLA 系统可用。
3. 论文未覆盖机器人多任务并发下视觉链路、语音链路和安全链路的整体调度。

推荐理由：

建议纳入 Kinbot 端侧推理预算参考：不绑定 Versal，但要求后续芯片 / NPU / GPU 评审按固定资源块、功耗、带宽、I/O 和多任务并发给出同级别证据。

### 3.6 High-Speed Vision Improves Zero-Shot Semantic Understanding of Human Actions

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.00496](https://arxiv.org/abs/2605.00496) |
| 提交日期 | 2026-05-01 |
| 分类 | `cs.CV`, `cs.RO` |
| 方法关键词 | high-speed vision, zero-shot action understanding, video-language model, LLM reasoning, 120 Hz / 60 Hz / 30 Hz |

摘要要点转述：

论文研究视觉时间分辨率对零样本人类动作语义理解的影响。作者以剑道这类快速、细微动作作为代表，构建 training-free pipeline：用预训练视频语言模型获得语义表示，再用 LLM 做成对动作比较推理。实验比较 `120 Hz`、`60 Hz` 和 `30 Hz`，发现更高时间分辨率能提升快速动作的语义可分性，并在全量 / 部分观测下分析人体关节跟踪信息的作用。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 老人看护和家庭安全巡护中的快速动作理解：起身不稳、滑倒前姿态变化、挥手求助、手部异常动作等。
2. 对应 `companion_interaction + safety_compliance_authorization`：训练数据不足时，零样本动作理解需要更稳定的视觉证据。
3. 对应传感器 tradeoff：帧率、带宽、功耗和端侧模型预算之间需要量化。

资源消耗与部署信号：

1. 实验明确比较 `120 Hz`、`60 Hz` 和 `30 Hz`，对 Kinbot 摄像头规格和处理频率评审有直接参考。
2. training-free pipeline 降低训练成本，但高帧率增加传感、ISP、存储、带宽和推理压力。
3. 论文场景为快速体育动作，不等于家庭老人动作，需要重建场景数据。

优势：

1. 直观说明高时间分辨率对快速动作语义理解的价值。
2. 不依赖任务特定训练，适合少样本 / 长尾动作研究。
3. 有助于把“摄像头帧率”从硬件参数转化为模型可用证据。

劣势与风险：

1. 高帧率会冲击端侧功耗和存储，不应默认进入一代量产配置。
2. 体育动作与家庭风险动作差异明显。
3. LLM reasoning 不适合高频实时安全闭环。

推荐理由：

建议作为 Kinbot “老人动作细粒度理解”的研究输入：先用离线回放比较 `30 / 60 / 120 Hz` 对起身、跌倒前失衡、挥手和异常徘徊的识别收益，再决定是否影响摄像头或 ISP 规格。

### 3.7 Learning while Deploying: Fleet-Scale Reinforcement Learning for Generalist Robot Policies

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.00416](https://arxiv.org/abs/2605.00416) |
| 提交日期 | 2026-05-01 |
| 分类 | `cs.RO` |
| 方法关键词 | fleet-scale RL, offline-to-online, VLA post-training, human intervention, DIVL, QAM |

摘要要点转述：

论文提出 `Learning While Deploying`，用于通用 VLA 策略从离线预训练走向部署后的持续改进。方法把机器人 fleet 的自主 rollout、人类干预、策略改进和重新部署闭环连接起来，并用 `Distributional Implicit Value Learning` 和 `Q-learning via Adjoint Matching` 稳定稀疏、异质 fleet 数据上的学习。作者在 `16` 台双臂机器人、`8` 个真实操作任务上验证，包括语义 grocery restocking 和 `3` 到 `5` 分钟长程任务，报告单一通用策略随 fleet 经验积累提升，平均成功率达到 `95%`。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 长期部署后的长尾问题：家庭差异、用户习惯、失败案例和人工纠正无法完全靠离线数据覆盖。
2. 对应 `observability_data_governance` 与 `KBT-57` 战略分支：非隐私结构化数据、人工坐席或运营介入可能成为持续改进闭环的一部分。
3. 对应策略更新治理：部署后学习必须有版本、回滚、评测和用户授权边界。

资源消耗与部署信号：

1. 论文给出 `16` 台机器人、`8` 个真实任务、`3-5` 分钟长程任务和 `95%` 平均成功率，工程信号强。
2. 但 fleet-scale RL 需要数据基础设施、人工干预标注、云端训练和安全部署流程。
3. Kinbot 当前一代原始敏感数据端侧处理，不能直接复制开放 fleet 数据回流。

优势：

1. 命中真实部署后的分布漂移和长尾失败。
2. 把人类干预纳入学习闭环，贴近家庭机器人运营现实。
3. 给出真实 fleet 规模和长程任务指标。

劣势与风险：

1. 双臂操作任务与 Kinbot 一代移动 / 陪伴 / 看护主线不同。
2. 数据回流和持续学习涉及隐私、合规、版本安全和商业运营，不是纯算法问题。
3. 若未设置严格 gate，在线学习会放大错误策略或用户偏见。

推荐理由：

建议仅作为 `KBT-57` 战略假设下的数据回流 / fleet learning 输入，标注为 `provisional`。当前一代主线只吸收“部署后失败案例结构化采集”和“策略更新必须先评测再发布”的治理思想。

### 3.8 Being-H0.7: A Latent World-Action Model from Egocentric Videos

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.00078](https://arxiv.org/abs/2605.00078) |
| 提交日期 | 2026-04-30 |
| 分类 | `cs.RO`, `cs.CV`, `cs.LG` |
| 方法关键词 | latent world-action model, egocentric videos, VLA, future-aware reasoning, no visual rollout at inference |

摘要要点转述：

论文认为 VLA 直接从观察和语言映射到动作，容易因动作监督稀疏而学习捷径；而 video world-action model 虽能预测未来，但生成未来帧代价高且不一定与控制相关。`Being-H0.7` 在感知和动作之间插入可学习 latent queries，训练时用未来观察构建 posterior branch，部署时只用 prior branch 从当前上下文推断 latent 状态，并丢弃 posterior branch，不生成未来视频帧。作者报告在多个仿真和真实任务上取得 SOTA 或相近表现。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 长程任务执行中“需要未来感，但不能生成昂贵视频”的部署矛盾。
2. 对应 `decision_orchestration`：未来状态推理应辅助动作选择，而不是直接把生成视频当事实。
3. 对应 `platform_runtime`：无视觉 rollout 的 latent 方式更接近端侧可部署方向。

资源消耗与部署信号：

1. 摘要强调推理时不生成未来帧，posterior branch 仅训练使用，部署成本低于像素级 video rollout。
2. 摘要未给出模型大小、显存、延迟或芯片平台。
3. 使用 egocentric videos，和 Kinbot 头部 / 躯干视觉日志有潜在数据形态一致性。

优势：

1. 把 future-aware reasoning 留在 latent 空间，避免高成本视频生成。
2. 训练 / 推理结构分离，适合部署前做重训练、端侧用轻路径。
3. 对 VLA 捷径学习问题有针对性。

劣势与风险：

1. 仍是 VLA 研究前沿，安全可解释性和失效边界不足。
2. 摘要未给出端侧资源指标，不能直接判断量产可用性。
3. 如果 latent 不可解释，审计难度仍高。

推荐理由：

建议保留为未来 VLA 路线观察项，不进入当前一代架构冻结。可以在研究层记录一个原则：若引入 world-action model，应优先评估 latent future reasoning，而非像素级未来视频生成。

### 3.9 World Model for Robot Learning: A Comprehensive Survey

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.00080](https://arxiv.org/abs/2605.00080) |
| 提交日期 | 2026-04-30 |
| 分类 | `cs.RO`, `cs.CV` |
| 篇幅 | 43 页、6 图 |
| 类型 | 综述 |

摘要要点转述：

论文系统综述机器人学习中的 world model：从环境在动作作用下如何演化的预测表示出发，梳理其在策略学习、规划、仿真、评估、数据生成和机器人视频 world model 中的角色。作者进一步把 world model 与导航、自动驾驶、数据集、benchmark 和评估协议连接起来，并维护持续更新的资源仓库。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 在“世界状态记忆、导航预测、仿真评估、数据生成和任务规划”之间如何分层的问题。
2. 对应研究目录管理：可作为后续 world model / NFM / VLN 论文的索引入口。
3. 对应复杂度治理：帮助区分 world model 是训练工具、评估工具、规划工具，还是运行时组件。

资源消耗与部署信号：

1. 综述本身不给出单一部署资源指标。
2. 其价值在于归纳不同 world model 范式的资源和应用边界，适合支持后续路线评审。
3. 对 Kinbot 当前一代，world model 更适合先作为离线评估 / 数据生成工具，而非端侧常驻大模型。

优势：

1. 覆盖面广，能为 Kinbot 后续研究建立文献地图。
2. 直接连接导航和 embodied agent，相关度高。
3. 有助于避免把所有预测、仿真、规划都混成一个“大世界模型”概念。

劣势与风险：

1. 综述不会提供可直接落地的工程方案。
2. 可能诱导架构概念膨胀，需要强约束使用边界。
3. 若没有对应评测任务，很容易停留在术语层面。

推荐理由：

建议作为 `docs/09_research/07_vln_model_design/` 后续 world model / NFM 研究的文献索引，不回写主线。当前只吸收“先区分训练、评估、规划、运行时角色”的复杂度治理原则。

## 4. 对 Kinbot 的落地 / 文档建议

1. **技能编排验证门**：把 `Affordance Agent Harness` 的 Router / evidence / Verifier 思想纳入 `decision_orchestration` 的离线验证池，不新增顶层系统实体。
2. **语言导航验证集**：参考 `MiniVLA-Nav v1` 建立 Kinbot 内部 RGB-only 语言目标接近评测，保留停止距离、起点距离分层、模板 OOD 和目标类别 OOD。
3. **VLA 可解释性回归**：将 `ISS / NMR` 类指标作为 VLA / VLM 离线评测候选，优先检查模型是否依赖任务无关视觉区域。
4. **预测式场景图**：把 `PredictiveGraphs` 作为 `world_state_memory` 专题输入，先验证半静态对象的周期性位置预测、置信度和过期机制。
5. **端侧资源评审**：后续芯片 / 推理框架评审应参考 `Tempus`，至少要求给出固定资源块、功耗、带宽、I/O 和多任务并发预算。
6. **高帧率动作理解**：只在研究层比较 `30 / 60 / 120 Hz` 对老人看护动作识别的收益，未证实收益前不改写一代传感器主线。
7. **KBT-57 战略分支**：`Learning while Deploying` 只能作为 fleet 数据回流和人工干预持续学习的 `provisional` 研究输入，不写成当前确认决策。

## 5. 本轮未进入主线的原因 / 复杂度自检

本轮不回写 `docs/00_governance/03_decision_log.md`，也不改写 P1 / P2 / Phase 5 主线文档。原因如下：

1. 这些论文提供的是研究输入和验证素材，不是 Kinbot 已完成的工程验证。
2. 多数方法仍缺少 Kinbot 当前候选硬件、家庭真实数据、端侧延迟和隐私合规证据。
3. `Learning while Deploying` 涉及 fleet 数据回流和人工干预，必须绑定 `KBT-57` 战略假设，不能覆盖当前端侧隐私主线。
4. `Being-H0.7`、world model 和 high-speed vision 容易诱发架构膨胀，本轮只保留研究线索。

现在的架构是不是太复杂了？如果把技能编排、预测图、world model、fleet learning 和高帧率动作理解全部并列纳入主线，答案是“是”。本轮约束为：主线只增加评测题和研究索引，不增加运行时模块。

## 6. 来源

- arXiv `cs.RO/recent` 官方 listing：[https://arxiv.org/list/cs.RO/recent](https://arxiv.org/list/cs.RO/recent)
- arXiv `cs.RO/new` 官方 listing：[https://arxiv.org/list/cs.RO/new](https://arxiv.org/list/cs.RO/new)
- Affordance Agent Harness: Verification-Gated Skill Orchestration：[https://arxiv.org/abs/2605.00663](https://arxiv.org/abs/2605.00663)
- MiniVLA-Nav v1: A Multi-Scene Simulation Dataset for Language-Conditioned Robot Navigation：[https://arxiv.org/abs/2605.00397](https://arxiv.org/abs/2605.00397)
- Embodied Interpretability: Linking Causal Understanding to Generalization in Vision-Language-Action Models：[https://arxiv.org/abs/2605.00321](https://arxiv.org/abs/2605.00321)
- Predictive Spatio-Temporal Scene Graphs for Semi-Static Scenes：[https://arxiv.org/abs/2605.00121](https://arxiv.org/abs/2605.00121)
- Tempus: A Temporally Scalable Resource-Invariant GEMM Streaming Framework for Versal AI Edge：[https://arxiv.org/abs/2605.00536](https://arxiv.org/abs/2605.00536)
- High-Speed Vision Improves Zero-Shot Semantic Understanding of Human Actions：[https://arxiv.org/abs/2605.00496](https://arxiv.org/abs/2605.00496)
- Learning while Deploying: Fleet-Scale Reinforcement Learning for Generalist Robot Policies：[https://arxiv.org/abs/2605.00416](https://arxiv.org/abs/2605.00416)
- Being-H0.7: A Latent World-Action Model from Egocentric Videos：[https://arxiv.org/abs/2605.00078](https://arxiv.org/abs/2605.00078)
- World Model for Robot Learning: A Comprehensive Survey：[https://arxiv.org/abs/2605.00080](https://arxiv.org/abs/2605.00080)
