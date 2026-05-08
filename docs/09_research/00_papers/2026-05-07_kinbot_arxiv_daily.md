# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-07
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-07 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页，确认本轮检索时官方最新 Robotics listing 仍为 2026-05-06 批次，尚未出现 2026-05-07 新批次；按日更补录口径收录此前每日纪要未覆盖、与 Kinbot 长程任务规划、可行性约束、部分可观测安全控制、端侧开放世界感知、任务条件传感配置、LLM 工具执行、对抗场景生成、结构化评测和 world model 人工纠偏相关的 10 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-07。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期仍为 `Wednesday, 6 May 2026`，合计 `50` 篇 entries；其中 new submissions `20` 篇、cross submissions `6` 篇、replacement submissions `24` 篇。
3. 截至本轮检索，未看到官方 `cs.RO` 的 2026-05-07 新 listing；因此本篇按“日更补录”处理，优先覆盖前序 `2026-04-29` 至 `2026-05-06` Kinbot 每日论文纪要未收录、但仍与 Kinbot 一代验证或后续能力储备相关的条目。
4. 关键词与主题包括 `long-horizon planning`、`Signal Temporal Logic`、`belief space safety`、`physical feasibility for VLA`、`egocentric vision`、`adaptive sensing`、`LLM tool grounding`、`adversarial scenario generation`、`structured robot evaluation`、`human-in-the-world-model`。

筛选标准：

1. 是否对应 Kinbot 一代主线问题：纯视觉 / 端侧感知、家庭长程任务、低频复杂决策、运行时安全、任务执行可解释性、Phase 5 验证和资源受限部署。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`decision_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`、`companion_interaction`。
3. 是否提供资源、延迟、成功率、数据规模、约束可行性、评测粒度或工程部署信号。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。大规模 VLA、world model post-training、群体无人机、激光 profiler 和高自由度操作只作为研究输入，不直接改写一代主线。

未优先收录说明：

1. `RLDX-1 Technical Report`、`Viewpoint-Agnostic Grasp Pipeline` 等论文技术价值高，但更偏高自由度 humanoid / 带臂抓取；本轮只保留为候选观察，不进入 10 篇主卡片。
2. 与主动传感、外部 motion capture、LiDAR / laser profiler 强绑定的论文，只在其“资源治理 / 传感参数配置 / 低频验证”思想可迁移时收录，不能视为 Kinbot 一代传感主线变化。

## 2. 本轮总判断

本轮没有新的 Robotics listing，因此重点不是追逐新编号，而是把 2026-05-06 批次中尚未吸收的“验证与约束”论文补齐。相比前一日更偏端侧 LLM、混合关键性运行时和长期记忆，今天的论文更集中在一个问题：机器人把语言、视觉和学习策略接进真实家庭任务后，如何避免“看似智能但不可控、不可测、不可解释”。

对 Kinbot 最有价值的结论有 6 个：

1. **长程规划需要全局一致性约束**：分段生成的局部轨迹不能简单拼接，Kinbot 的多步骤家庭任务也需要边界一致性和失败重采样机制。
2. **VLA / VLM 动作不能只靠模仿隐式学会物理可行性**：显式可行性监督、约束检测或执行前过滤，应成为低频动作建议和未来操作能力的基础。
3. **安全控制要面向部分可观测**：家庭机器人常常只看到局部、被遮挡或延迟的状态，安全策略需要同时管理目标达成、主动观测和有限时域概率安全。
4. **任务级指令必须落到结构化工具和运行时护栏**：LLM 只做推理不够，Kinbot 需要工具 schema、状态观测、授权边界、失败回滚和执行质量指标。
5. **Phase 5 评测不能只看二元成功率**：结构化评测和对抗场景生成可以帮助区分效率、协调、安全稳定性和阶段性失败位置。
6. **world model 更适合先用于离线纠偏和验证**：`Hi-WM` 提示 world model 可以作为人工纠错的可复用环境，但不应在一代端侧变成常驻决策依赖。

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把每篇论文都变成新运行时模块，就会过复杂”。建议只吸收 4 类轻量动作：长程任务一致性检查、物理可行性 / 安全约束过滤、结构化验证指标、低频离线 world model 纠偏研究。群体执行、humanoid 操作、激光 profiler 和大规模 post-training 不进入当前一代主线。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | Safety-critical Control Under Partial Observability | 纳入 `safety_compliance_authorization` 和 Phase 5 风险验证输入，重点看部分可观测下的安全证书与主动观测。 |
| A | Can Explicit Physical Feasibility Benefit VLA Learning? | 纳入 VLA / VLM 动作建议的可行性过滤研究，避免纯模仿策略绕过硬约束。 |
| A- | RoboEval | 用于补强 Kinbot Phase 5 评测指标，从二元成功扩展到效率、协调、安全稳定性和阶段失败定位。 |
| A- | Feasibility-aware Hybrid Control for Motion Planning under Signal Temporal Logics | 用于多重家庭约束任务的形式化规划参考，先作为低频任务验证输入。 |
| A- | Steerable Adversarial Scenario Generation | 用于生成可控强度的导航 / 巡护风险场景，支持验证覆盖而非产品运行时。 |
| B+ | Refining Compositional Diffusion for Reliable Long-Horizon Planning | 作为长程任务分段规划一致性研究输入，暂不进入端侧部署。 |
| B+ | Say the Mission, Execute the Swarm | 作为 LLM 工具执行与 MCP / WoT 风格接口治理参考，不吸收其 swarm 形态。 |
| B+ | SigLoMa | 吸收“低频视觉检测 + 高频状态估计”的结构思想，不吸收 quadruped loco-manipulation 形态。 |
| B | Task-Aware Scanning Parameter Configuration | 作为任务条件传感参数配置参考，迁移到相机曝光、帧率、分辨率和夜间策略评估。 |
| B | Hi-WM | 作为未来离线 post-training / 失败纠偏研究输入，一代不引入常驻 world model 闭环。 |

## 3. 论文卡片

### 3.1 Safety-critical Control Under Partial Observability: Reach-Avoid POMDP meets Belief Space Control

| 项目 | 内容 |
| --- | --- |
| arXiv | [2603.10572](https://arxiv.org/abs/2603.10572) |
| 提交日期 | 2026-03-11 |
| 本轮 listing 口径 | 2026-05-06 replacement，前序纪要未收录 |
| 分类 | `cs.RO` |
| 方法关键词 | reach-avoid POMDP, belief space control, BCLF, BCBF, conformal prediction, lightweight QP |

摘要要点转述：

论文面向部分可观测环境中的安全关键控制。作者指出，reach-avoid POMDP 同时需要完成目标到达、安全保持和主动信息获取，若全部塞进同一个 belief tree search，会因时间尺度冲突而难以实时求解。论文提出分层的证书式 belief-space 控制架构，把目标到达、信息获取和安全控制拆成模块：用 Belief Control Lyapunov Functions 表达主动降低不确定性，用 Belief Control Barrier Functions 结合 conformal prediction 给出有限时域概率安全保证，最终转化为可实时求解的轻量 QP。实验覆盖仿真和空间机器人平台，并报告在高维非高斯 belief 表示下仍能实时运行。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 家庭移动中的局部可见、遮挡、弱光、反光和用户突然介入问题。
2. 对应 `safety_compliance_authorization`：安全策略不能只依赖“当前看见的确定状态”，还要对不确定性做显式建模。
3. 对应 `mobility_navigation` 和 `decision_orchestration`：当任务目标、主动观测和避险冲突时，需要可解释的优先级和停止条件。

资源消耗与部署信号：

1. 论文强调最终控制合成是轻量 QP，适合转化为实时安全过滤器思路。
2. 高维 belief 表示维度可超过 `10^4`，说明完整方法仍需谨慎评估端侧内存与计算。
3. 具体平台是空间机器人，不等于家庭底盘，但部分可观测建模思想可迁移到 Phase 5 安全验证。

优势：

1. 明确把“主动看清楚”和“安全约束”放在同一控制问题里。
2. 使用概率安全证书，比纯规则避障更适合处理遮挡和不确定性。
3. 分层结构便于 Kinbot 做离线验证和运行时轻量化裁剪。

劣势与风险：

1. 理论门槛高，工程实现需要控制、感知和测试共同 owner。
2. 家庭场景的非高斯、不规则人类行为比仿真任务更难建模。
3. 如果直接作为主规划器，会增加一代系统复杂度。

推荐理由：

建议作为本轮 A 级输入。Kinbot 可先在 Phase 5 建立“部分可观测安全场景集”：门后突然出现人、低光下窄通道、遮挡物绕行、用户临时拦截和定位置信度下降，并评估是否需要 belief-level 安全过滤。

### 3.2 Can Explicit Physical Feasibility Benefit VLA Learning? An Empirical Study

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.17896](https://arxiv.org/abs/2604.17896) |
| 首次提交日期 | 2026-04-20 |
| 本轮 listing 口径 | 2026-05-06 replacement，前序纪要未收录 |
| 分类 | `cs.LG`, `cs.AI`, `cs.RO` |
| 方法关键词 | VLA, physical feasibility, diffusion policy, obstacle-aware manipulation, low-data learning |

摘要要点转述：

论文研究一个直接影响机器人安全的问题：VLA 模型通常从大规模模仿数据学习视觉、语言到动作的映射，但不会显式监督障碍物规避、运动学可行性等硬物理约束。作者在 diffusion-based VLA policy 中加入几何可行性目标，用 obstacle-aware manipulation 作为可控 probe，评估显式可行性监督是否能提升可靠性。实验显示，加入可行性监督后，策略的物理可靠性、任务表现和低数据效率都有提升。

解决 Kinbot 的什么问题：

1. 对应未来 Kinbot 使用 VLA / VLM 给出动作建议、导航子目标或物体交互建议时的安全过滤。
2. 对应 `decision_orchestration`：大模型建议不能直接变成执行命令，需要过可行性和安全约束层。
3. 对应一代纯视觉主线：视觉理解再强，也不能替代几何、空间和底盘运动边界。

资源消耗与部署信号：

1. 可行性监督发生在训练阶段，不必全部进入端侧运行时。
2. 若运行时保留 feasibility checker，消耗取决于几何表示、地图粒度和动作候选数量。
3. 论文未给出 Kinbot 可直接使用的端侧延迟或内存指标。

优势：

1. 直接补 VLA 的硬约束短板，工程价值明确。
2. 低数据提升对家庭机器人长尾任务尤其有意义。
3. 与 Kinbot “大模型低频建议 + 传统安全链路兜底”的架构原则兼容。

劣势与风险：

1. 实验仍以操作任务为 probe，不能直接证明家庭导航全链路收益。
2. 可行性目标设计过窄时，可能让策略保守或漏掉有效解。
3. 如果约束层与学习策略接口不清晰，会造成双重决策和责任边界模糊。

推荐理由：

建议纳入 VLA / VLM 研究池的硬门槛：任何动作建议在进入 Kinbot 执行队列前，至少要经过几何可行性、碰撞风险、底盘能力边界和用户授权状态检查。

### 3.3 RoboEval: Where Robotic Manipulation Meets Structured and Scalable Evaluation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2507.00435](https://arxiv.org/abs/2507.00435) |
| 首次提交日期 | 2025-07-01 |
| 本轮 listing 口径 | 2026-05-06 replacement，前序纪要未收录 |
| 分类 | `cs.RO`, `cs.AI`, `cs.CV` |
| 方法关键词 | structured evaluation, stagewise progress, efficiency, coordination, safety, stability |

摘要要点转述：

论文提出 `RoboEval`，目标是避免机器人评测只用“成功 / 失败”覆盖全部行为差异。框架提供 `8` 个双臂任务、系统化变量、超过 `3000` 条专家示范和模块化仿真平台，并把指标拆成效率、协调、安全 / 稳定性以及阶段性 outcome。作者用多种 visuomotor policy 验证这些指标能够区分类似成功率下的执行质量，并定位失败发生在哪个阶段。

解决 Kinbot 的什么问题：

1. 对应 Phase 5 验证：Kinbot 不应只记录“巡护成功”“提醒成功”，还要记录路径效率、停顿、误解、恢复、用户打断和安全稳定性。
2. 对应 `observability_data_governance`：结构化指标能帮助把失败日志变成可复盘证据。
3. 对应 `decision_orchestration`：阶段性进度指标有助于定位失败在感知、计划、执行还是交互澄清。

资源消耗与部署信号：

1. 框架偏离线评测，不直接增加端侧运行负担。
2. 数据规模超过 `3000` 条示范，提示 Kinbot 自建评测集也需要覆盖变体，而非少量 demo。
3. 任务偏 manipulation，指标结构比任务本体更值得迁移。

优势：

1. 评测粒度清楚，适合从研发验证一路延伸到试点复盘。
2. 能区分同样成功率下的质量差异，避免“能跑通就通过”。
3. stagewise outcome 与 Kinbot 任务状态机、事件日志天然兼容。

劣势与风险：

1. 双臂操作任务与 Kinbot 一代主场景不同。
2. 若指标过多，会增加测试和日志治理负担。
3. 需要先定义 Kinbot 自有任务阶段，否则指标无法落地。

推荐理由：

建议作为 Phase 5 评测模板输入。Kinbot 的最小吸收动作是为每类高频任务补 `success` 之外的 `efficiency`、`safety_stability`、`intervention`、`recovery` 和 `stage_failure` 字段。

### 3.4 Feasibility-aware Hybrid Control for Motion Planning under Signal Temporal Logics

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.03662](https://arxiv.org/abs/2605.03662) |
| 提交日期 | 2026-05-05 |
| 分类 | `cs.RO`, `eess.SY` |
| 方法关键词 | Signal Temporal Logic, hybrid control, control barrier function, local feasibility, input saturation |

摘要要点转述：

论文提出一种面向 Signal Temporal Logic 任务的平面任务与运动规划方法。核心思路是在混合模型中引入离散变量，表达局部约束满足状态并支持局部可行性分析；同时在变换后的 disk workspace 上设计 control barrier functions，缓解非凸复杂环境中的 deadlock。仿真显示，该方法能处理多个重叠的时空任务，即使存在输入饱和也能保持有效。

解决 Kinbot 的什么问题：

1. 对应家庭巡护、老人看护和安全避让中的“时间 + 空间 + 禁区 + 优先级”组合约束。
2. 对应 `mobility_navigation`：机器人不是只到达一个目标点，还要满足先后顺序、避让区域、停留时间和不可进入边界。
3. 对应 `safety_compliance_authorization`：可行性分析可帮助判断任务是否应拒绝、降级或请求用户澄清。

资源消耗与部署信号：

1. 论文主要为仿真与控制方法，没有给出端侧 CPU / 内存指标。
2. STL + hybrid control 适合作为低频任务可行性验证，不适合直接替换实时局部控制。
3. 输入饱和处理对消费级底盘有参考价值。

优势：

1. 能显式表达复杂时空任务，便于审计和解释。
2. 把局部可行性与控制设计放在一起，减少规划-执行脱节。
3. 对多约束任务的拒绝 / 降级判断有启发。

劣势与风险：

1. 家庭真实环境不规则，形式化建模成本高。
2. 如果把所有产品规则都写成 STL，会增加维护成本。
3. 仿真有效不等于家庭实机长期稳定。

推荐理由：

建议作为 Kinbot 低频任务可行性分析参考。最小落地是为 Phase 5 选 5 个多约束任务，明确“必须满足 / 可以放宽 / 需要询问用户”的约束分类。

### 3.5 Steerable Adversarial Scenario Generation through Test-Time Preference Alignment

| 项目 | 内容 |
| --- | --- |
| arXiv | [2509.20102](https://arxiv.org/abs/2509.20102) |
| 首次提交日期 | 2025-09-24 |
| 本轮 listing 口径 | 2026-05-06 replacement，ICLR 2026，前序纪要未收录 |
| 分类 | `cs.AI`, `cs.RO` |
| 方法关键词 | adversarial scenario generation, preference alignment, realism-adversariality tradeoff, closed-loop training |

摘要要点转述：

论文面向自动驾驶安全评估中的对抗场景生成。传统方法通常固定在某个“真实性 vs 对抗性”权衡点，导致生成模型难以按测试需求灵活调整。作者把问题改写为多目标偏好对齐，提出 `SAGE`：先用层级 group-based preference optimization 分离硬可行性约束和软偏好，再训练两个偏好相反的专家，并在推理时通过权重插值获得连续可调的场景生成策略。实验显示，该方法能生成更均衡的对抗场景，并提升闭环训练效果。

解决 Kinbot 的什么问题：

1. 对应 Phase 5 的风险场景覆盖：家庭机器人需要可调强度的极端但真实场景，而不是随机堆案例。
2. 对应 `safety_compliance_authorization`：测试应能区分轻微挑战、边界挑战和不可接受风险。
3. 对应 `mobility_navigation`：导航、避障、用户突然出现、宠物 / 小物体干扰等场景可以按真实性和危险性调节。

资源消耗与部署信号：

1. 方法偏离线生成和训练，不适合产品端侧运行。
2. 论文对象是自动驾驶，Kinbot 需要重新定义家庭场景的 hard feasibility 和 soft preference。
3. 可用于构造测试数据，不改变 BOM 或一代硬件边界。

优势：

1. 可以按测试目标调节对抗强度，适合阶段门验证。
2. 把硬约束和软偏好分离，符合 Kinbot 安全门槛优先的口径。
3. 适合生成闭环训练和仿真回放案例。

劣势与风险：

1. 从自动驾驶迁移到家庭机器人需要重建场景语义。
2. 对抗场景若过度追求挑战，可能偏离真实家庭分布。
3. 需要测试 owner 定义可解释的场景维度。

推荐理由：

建议作为 Phase 5 测试资产生成方法输入。Kinbot 可把 `realism`、`adversariality`、`privacy_sensitivity` 和 `user_disturbance` 作为可调维度，生成巡护和看护场景库。

### 3.6 Refining Compositional Diffusion for Reliable Long-Horizon Planning

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.03075](https://arxiv.org/abs/2605.03075) |
| 提交日期 | 2026-05-04 |
| 分类 | `cs.RO`, `cs.AI`, `cs.LG` |
| 方法关键词 | compositional diffusion, long-horizon planning, score composition, overlap consistency, OGBench |

摘要要点转述：

论文关注长程轨迹生成中的分段一致性问题。Compositional diffusion planning 会把长任务拆成重叠短片段并通过 score composition 拼接，但当局部分布多峰时，平均不同局部模式会得到既不局部可行、也不全局一致的计划。作者提出 training-free 的 `RCD` guidance，用预训练 diffusion model 的自重建误差近似组合计划的 log-density，并加入片段边界的 overlap consistency，引导采样集中到高密度、全局一致的计划。实验覆盖 OGBench 中 locomotion、object manipulation 和 pixel-based observation 长程任务。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 多步骤家庭任务：例如“先确认老人状态，再绕开障碍去药箱，再回到用户身边解释”。
2. 对应 `decision_orchestration`：分段计划之间必须保持状态、目标和安全边界一致。
3. 对应 future VLA / world model 研究：生成式规划需要有一致性校验，不可直接执行。

资源消耗与部署信号：

1. 方法是 training-free guidance，但仍依赖 diffusion planner，端侧部署成本可能较高。
2. 论文摘要未给出延迟、显存或嵌入式平台指标。
3. 更适合作为离线规划评估和低频复杂任务候选生成研究输入。

优势：

1. 直接解决长程生成中常见的模式平均和边界不一致问题。
2. 不要求重新训练底层模型，便于先做离线评估。
3. 与 Kinbot “低频复杂规划 + 执行前验证”思路兼容。

劣势与风险：

1. 生成式轨迹规划离一代产品实时链路仍远。
2. OGBench 任务不能直接代表家庭老人看护和巡护。
3. 没有显式讨论安全认证和人机交互约束。

推荐理由：

建议保留为长程任务规划研究输入。Kinbot 当前只吸收“片段边界一致性检查”思想，在任务执行计划中显式校验前后状态、资源占用、用户授权和安全条件。

### 3.7 Say the Mission, Execute the Swarm: Agent-Enhanced LLM Reasoning in the Web-of-Drones

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.03788](https://arxiv.org/abs/2605.03788) |
| 提交日期 | 2026-05-05 |
| 分类 | `cs.AI`, `cs.NI`, `cs.RO` |
| 方法关键词 | LLM agent, MCP gateway, Web of Things, tool grounding, runtime guardrails, swarm execution |

摘要要点转述：

论文研究如何让用户用自然语言下达无人机群任务，并由系统通过结构化工具执行。作者提出 agent-enhanced LLM 框架：LLM-based Agent Core 负责推理，MCP gateway 和基于 W3C Web of Things 的 Web-of-Drones 抽象把无人机、传感器和服务暴露为标准化 Things，从而支持结构化工具调用、连续状态观测和安全动作执行，而不是依赖直接生成代码。仿真评估覆盖 `4` 类 swarm mission 和 `6` 个前沿 LLM，结果显示通用 LLM 即使推理能力强，如果缺少明确 grounding 和执行支持，简单任务也难以可靠完成；任务专用 planning tools 和运行时 guardrails 能显著提升鲁棒性，token 消耗也不能代表执行质量。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 未来自然语言任务入口：用户说“帮我看看厨房有没有异常”后，系统必须落到具体工具、状态和权限。
2. 对应 `decision_orchestration`：LLM 不能直接控制机器人，需要结构化工具、状态观测和 guardrails。
3. 对应 `platform_runtime` 和 `observability_data_governance`：执行质量要靠任务结果和安全事件度量，而不是 token 或回答流畅度。

资源消耗与部署信号：

1. 论文没有给出端侧模型大小和延迟；它的价值主要在架构模式和执行评测。
2. MCP / WoT 风格接口可能增加系统集成复杂度，需要严格裁剪。
3. Swarm 场景不适合直接迁移 Kinbot 一代，但工具 grounding 和 guardrail 结论可迁移。

优势：

1. 明确反对无约束代码生成，符合 Kinbot 安全边界。
2. 把设备、传感器和服务建成结构化工具，利于审计。
3. 指出 token 消耗与执行质量不等价，对 LLM 评测很有提醒价值。

劣势与风险：

1. 无人机群任务与家庭机器人单体任务差异大。
2. WoT / MCP 体系若全量引入，会扩大一代接口面。
3. 论文结果也说明通用 LLM 可靠执行能力仍不足。

推荐理由：

建议作为 LLM 工具执行治理参考。Kinbot 可吸收三条最小规则：工具 schema 明确、每步读取真实状态、动作前经过权限与安全 guardrail；不要吸收 swarm 组织形态。

### 3.8 SigLoMa: Learning Open-World Quadrupedal Loco-Manipulation from Ego-Centric Vision

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.03846](https://arxiv.org/abs/2605.03846) |
| 提交日期 | 2026-05-05 |
| 分类 | `cs.RO` |
| 方法关键词 | onboard egocentric vision, open-vocabulary detector, Sigma Points, Kalman Filter, sim-to-real |

摘要要点转述：

论文面向四足 loco-manipulation 的开放世界 pick-and-place。作者认为传统 exteroception 强化学习样本效率低、sim-to-real gap 大，且视觉跟踪延迟与浮动基高频控制冲突，导致系统依赖昂贵外部 motion capture 和 off-board computation。`SigLoMa` 通过轻量几何表示 Sigma Points 表达外部感知，用 egocentric Kalman Filter 在低频视觉和高频控制之间补齐状态估计；训练上用 Hint Poses 引导 Active Sampling Curriculum，并用 temporal encoding 和随机漂移模拟结构视觉盲区。实机显示，系统仅依赖 `5Hz`、`200 ms` latency 的开放词汇检测器，也能完成动态 loco-manipulation，表现接近专家遥操作。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 纯视觉主线中的低频语义检测与高频底盘状态控制解耦。
2. 对应 `platform_runtime`：感知慢、控制快时，需要中间状态估计，而不是让高频控制等待 VLM。
3. 对应 `mobility_navigation`：开放词汇目标识别不能直接拖慢安全控制链路。

资源消耗与部署信号：

1. 明确报告开放词汇检测器 `5Hz`、`200 ms` latency，可作为 Kinbot 低频视觉链路预算参考。
2. 依赖 fully onboard egocentric vision，方向上贴近端侧部署。
3. 四足带操作形态不等于 Kinbot 底盘，一代只能迁移“频率解耦”思想。

优势：

1. 直接处理慢感知和快控制的频率不匹配。
2. 用轻量几何表示减少对外部系统依赖。
3. 真实机器人结果比纯仿真更有工程信号。

劣势与风险：

1. quadruped loco-manipulation 与 Kinbot 一代差异较大。
2. 开放词汇检测器 5Hz 对快速人类动作仍可能不够。
3. 论文不等于证明纯视觉室内导航可完全依赖类似机制。

推荐理由：

建议作为端侧运行频率分层的研究输入：Kinbot 可把 VLM / open-vocabulary detector 限定为低频语义层，底盘安全、局部避障和姿态估计保持高频独立。

### 3.9 Task-Aware Scanning Parameter Configuration for Robotic Inspection Using Vision Language Embeddings and Hyperdimensional Computing

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.03909](https://arxiv.org/abs/2605.03909) |
| 提交日期 | 2026-05-05 |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | instruction-conditioned sensing, hyperdimensional computing, low-latency inference, parameter recommendation |

摘要要点转述：

论文研究机器人检测中传感器参数配置的问题。工业 laser profiler 的采样频率、测量范围、曝光、动态范围和照明等参数通常靠人工试错，设置错误会造成饱和、裁切或缺失回波。作者把问题定义为“给定预扫描 RGB 观察和自然语言检测指令，推断离散传感器配置”，构建 `Instruct-Obs2Param` 数据集，并提出 `ScanHD`：用 vision-language embedding 和 hyperdimensional computing 绑定指令与观察，再通过紧凑记忆做参数级关联推理。实验显示，`ScanHD` 在五个参数上达到 `92.7%` 平均 exact accuracy 和 `98.1%` 平均 Win@1 accuracy，且推理低延迟、可解释。

解决 Kinbot 的什么问题：

1. 直接对象虽是 laser profiler，但思想可迁移到 Kinbot 相机曝光、帧率、分辨率、夜间模式和事件采样策略。
2. 对应 `platform_runtime`：感知参数不应固定不变，应随任务和场景风险调整。
3. 对应 `observability_data_governance`：传感配置本身也应成为可记录、可复盘的决策。

资源消耗与部署信号：

1. Hyperdimensional computing 使用紧凑记忆和低延迟推理，适合资源受限端侧作为候选。
2. 指标覆盖五个参数的离散配置准确率，但未报告 Kinbot 相机任务上的延迟和功耗。
3. laser profiler 不符合 Kinbot 一代纯视觉主线，不能作为传感器变更依据。

优势：

1. 把传感器配置从静态参数变成任务条件决策。
2. 低延迟和可解释性比直接调用 MLLM 更适合端侧。
3. 可帮助设计夜间、低光、反光和巡护任务的相机策略。

劣势与风险：

1. 研究对象不是普通 RGB / stereo camera，迁移需要重新采集数据。
2. 离散参数推荐不能解决传感器硬件上限。
3. 如果参数自动调整缺少安全边界，可能造成感知链路不稳定。

推荐理由：

建议作为“任务条件感知配置”的轻量研究输入。Kinbot 可先在验证集中记录任务类型、光照、运动速度、曝光 / 帧率和识别质量，再决定是否需要自动参数推荐。

### 3.10 Hi-WM: Human-in-the-World-Model for Scalable Robot Post-Training

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.21741](https://arxiv.org/abs/2604.21741) |
| 首次提交日期 | 2026-04-23 |
| 本轮 listing 口径 | 2026-05-06 replacement，前序纪要未收录 |
| 分类 | `cs.RO` |
| 方法关键词 | world model, human-in-the-loop, post-training, rollback, branching, corrective trajectories |

摘要要点转述：

论文关注通用机器人策略的 post-training。传统 human-in-the-loop 纠偏依赖真实机器人执行：每次纠错都要占用机器人、重置场景并由操作员监督。作者提出 `Hi-WM`，把已学习 world model 作为可复用的纠偏环境：策略先在 world model 中闭环 rollout，一旦出现错误或高风险状态，人类直接在模型中给出短纠正动作；系统缓存中间状态并支持回滚、分支，从一个失败点生成多条纠正轨迹，再把这些轨迹加入训练集。实验覆盖 `3` 个真实操作任务和 `2` 种策略 backbone，平均实机成功率较基础策略提升 `37.9` 个百分点，较 world-model 闭环 baseline 提升 `19.0` 个百分点；world-model 评估与真实表现相关性为 `r = 0.953`。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 长期试点后的失败回放和纠偏：不是所有失败都适合在真实家庭中反复重演。
2. 对应 `observability_data_governance`：失败状态、人工纠正和后续训练数据需要可追溯。
3. 对应未来 `KBT-57` 数据回流战略分支：world model 可作为离线纠偏基座，而不是一代端侧实时依赖。

资源消耗与部署信号：

1. 训练和 world model rollout 成本较高，不适合一代 `12GB + 32GB` 常驻。
2. 论文给出成功率提升和 real-world correlation，但未给出端侧推理预算。
3. 更适合离线研发、云端受控环境或后续战略分支。

优势：

1. 减少真实机器人纠错成本，适合试点数据闭环。
2. 回滚和分支能围绕失败点生成高密度监督。
3. 人类纠正进入模型环境，避免真实家庭中的重复风险暴露。

劣势与风险：

1. world model 如果不准确，会把纠偏引向错误方向。
2. 操作任务收益不能直接迁移到陪伴、巡护和健康提醒。
3. 涉及数据回流和再训练，必须严格遵守隐私和授权边界。

推荐理由：

建议作为后续离线纠偏研究输入。Kinbot 一代只吸收“失败回放 + 人工短纠正 + 审计化训练样本”的流程思想，不把 world model post-training 写入当前主线事实源。

## 4. 对 Kinbot 的落地 / 文档建议

本轮不建议直接回写 `docs/00_governance/03_decision_log.md` 或主线架构文档，原因是这些论文仍属于研究补录输入，且官方未出现 2026-05-07 新 Robotics 批次；尚未形成经用户确认的稳定产品 / 架构判断。

建议后续只做 5 个轻量吸收动作：

1. 在 Phase 5 验证设计中补充“部分可观测安全”场景：遮挡、弱光、定位置信度下降、用户突然介入和目标状态不确定。
2. 在 VLA / VLM 研究池中补充“物理可行性硬门槛”：碰撞、运动学、底盘能力、授权状态和环境禁区。
3. 在任务日志中补充结构化评测字段：阶段性进度、效率、安全稳定性、人工介入、恢复次数和失败位置。
4. 在低频复杂任务规划中增加“分段边界一致性检查”：目标、状态、资源、权限和安全条件必须前后闭合。
5. 把 world model、对抗场景生成和 human-in-the-loop post-training 留在离线研究 / 试点复盘池，不进入一代端侧常驻架构。

本轮未进入主线的原因：

1. `Hi-WM`、`RCD` 和 `SAGE` 都更适合作为离线验证或训练工具，不是当前产品运行时依赖。
2. `SigLoMa` 和 `ScanHD` 的形态涉及四足操作、laser profiler 或主动传感配置，只能迁移频率解耦和任务条件配置思想。
3. `Say the Mission` 的 swarm / WoT / MCP 体系不宜直接引入一代接口面，只保留工具 grounding 和 guardrail 原则。
4. 本轮没有论文足以改变当前纯视觉主线、`12GB + 32GB` 量产资源线或 `5000 到 6000 元` BOM 冻结基线。

## 5. 来源

- arXiv `cs.RO/new` listing: [Robotics new submissions, Wednesday 6 May 2026](https://arxiv.org/list/cs.RO/new)
- arXiv `cs.RO/recent` listing: [Robotics recent submissions](https://arxiv.org/list/cs.RO/recent)
- [2603.10572 | Safety-critical Control Under Partial Observability](https://arxiv.org/abs/2603.10572)
- [2604.17896 | Can Explicit Physical Feasibility Benefit VLA Learning?](https://arxiv.org/abs/2604.17896)
- [2507.00435 | RoboEval](https://arxiv.org/abs/2507.00435)
- [2605.03662 | Feasibility-aware Hybrid Control for Motion Planning under Signal Temporal Logics](https://arxiv.org/abs/2605.03662)
- [2509.20102 | Steerable Adversarial Scenario Generation](https://arxiv.org/abs/2509.20102)
- [2605.03075 | Refining Compositional Diffusion for Reliable Long-Horizon Planning](https://arxiv.org/abs/2605.03075)
- [2605.03788 | Say the Mission, Execute the Swarm](https://arxiv.org/abs/2605.03788)
- [2605.03846 | SigLoMa](https://arxiv.org/abs/2605.03846)
- [2605.03909 | Task-Aware Scanning Parameter Configuration](https://arxiv.org/abs/2605.03909)
- [2604.21741 | Hi-WM](https://arxiv.org/abs/2604.21741)
