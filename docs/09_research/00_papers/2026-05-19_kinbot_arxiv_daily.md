# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-19
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-19 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 为 `Monday, 18 May 2026`，合计 `81` 篇 entries；其中 new submissions `40` 篇、cross submissions `12` 篇、replacement submissions `29` 篇。2026-05-19 本地日更时尚未出现新的 `Tuesday, 19 May 2026` Robotics 批次，本轮采用“最新官方 listing + 当日未出现新批次说明 + 日更收录”口径，按 3-5 篇强相关论文 + 候选排除表方式，收录对 Kinbot 导航 sim-to-real、功能 3D 场景图、LLM 规划安全传播、机器人运维承接和故障感知控制有明确增量价值的 5 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-19。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期为 `Monday, 18 May 2026`，合计 `81` 篇 entries；其中 new submissions `40` 篇、cross submissions `12` 篇、replacement submissions `29` 篇。
3. 本轮检索时官方 `cs.RO/recent` 显示最新 Robotics recent 批次为 `Mon, 18 May 2026`，该日期 recent entries 为 `52` 篇；尚未出现 `Tuesday, 19 May 2026` Robotics 新批次。
4. 本轮按“最新官方 listing + 当日未出现新批次说明 + 日更收录”处理；不把 `2026-05-19` 写成新的官方 Robotics listing 日期。
5. 本轮先核对既有日更文档中的论文标题与 arXiv 编号，未发现本轮主卡片 `2605.15559`、`2605.15753`、`2605.15641`、`2605.15892`、`2605.16056` 已进入前序主卡片。
6. 本轮不固定凑满 `10` 篇；由于 5 月中旬泛 `VLA`、world model、manipulation、自动驾驶仿真和 LiDAR / UAV 主题已经多次覆盖，本轮只保留 5 篇能改变 Kinbot Phase 5 验证字段或治理动作的论文，其余进入候选排除表。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是继续堆叠泛 `VLA`、manipulation benchmark 或自动驾驶端到端规划主题。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`observability_data_governance`、`platform_runtime`、`decision_orchestration`、`human_service_interface`。
3. 是否能低成本转化为 Phase 5 验证项：导航 sim-to-real 扰动分解、功能关系型室内场景图、LLM 规划链路污染测试、机器人运维 / 坐席承接字段、故障感知降级控制。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. replacement / cross-list 仅在新增 Kinbot 评测项或治理项时收录；本轮主卡片全部来自 `2026-05-18` 官方 listing 的 new submission，避免把 replacement 补录误写成新批次主判断。
2. `OpenFrontier`、`ConsistNav` 等 replacement 对纯视觉导航有价值，但 `ConsistNav` 已在 2026-05-13 进入主卡片，`OpenFrontier` 与前序零样本目标导航 / frontier / object navigation 主题重叠，本轮只进入候选排除表与专题候选。
3. `WorldVLN`、`Feedback World Model`、`PhysBrain` 等有技术价值，但继续扩张 world action model / VLA 在线模型层会增加复杂度；本轮只保留能转化为离线评测字段的判断，不新增产品级在线组件。
4. `Reactive Robot-Centric Safety`、`Fast Expanding Safe Circular Regions`、LiDAR mapping、UAV / quadrotor、自动驾驶仿真、灵巧手和桌面操作条目不改变 Kinbot 一代纯视觉家庭机器人路线。

## 2. 本轮总判断

本轮官方 Robotics listing 已从 2026-05-15 更新到 `2026-05-18`，因此不是继续补录同一饱和 listing，而是一次新的日更收录。高价值论文的共同信号不是“再加一个大模型”，而是把 Phase 5 验证从总体成功率拆成更可审计的工程字段：导航真实部署扰动、室内功能关系、LLM 规划污染传播、人工运维承接、硬件健康降级。

本轮对 Kinbot 有 5 个增量判断：

1. **导航 sim-to-real 要从单一成功率拆成扰动归因**：`NavRL++` 提醒 Kinbot 不应只比较仿真导航和实机导航成功率，还要分开记录传感噪声、感知失败、系统延迟和控制响应对家庭巡航的影响。
2. **空间记忆要从“物体存在”升级到“功能关系 + 层级”**：`Hierarchical and Holistic Open-Vocabulary Functional 3D Scene Graphs` 提醒 Kinbot 的家庭记忆不能只记房间和物体，还应评估物体之间的可交互关系、功能边和小物体密集场景下的实例混淆。
3. **LLM 规划安全要测试传播链路，不只测试单点 prompt**：`Propagating Unsafe Actions` 说明一台入口机器人被污染后，恶意意图可沿协作通信扩散。Kinbot 一代虽不是多机器人系统，但机器人本体、家属 App、云端、人工坐席之间也存在指令传播和权限放大风险。
4. **Phase 5 需要显式设计运维承接角色**：`Designing for Robot Wranglers` 提醒真实部署中的设置、排障、现场支持和服务生态很容易被隐藏成“没人负责的劳动”。这与 Kinbot 的后台服务 / 人工坐席战略假设相关，但仍应标注为 `KBT-57` 的 provisional 研究输入。
5. **物理故障不应只作为异常结果记录，要进入降级控制输入**：`Health-Conditioned VLA` 提醒 Kinbot 应把关节、执行器、底盘、头颈、屏幕、麦克风等健康状态作为任务执行约束和降级策略输入，而不是等失败后再人工归因。

周度滚动判断：

| 主题 | 当前状态 | 后续动作 |
| --- | --- | --- |
| 纯视觉导航与 sim-to-real 扰动 | 值得进入专题跟踪 | 将 `NavRL++` 与前序 `ConsistNav`、`MonoSpheres`、`TinySDP`、导航安全验证一起收敛为“家庭导航扰动归因 + 回放基准”。 |
| 功能 3D 场景图与空间记忆 | 值得进入专题跟踪 | 将本轮功能关系图与 `LEXI-SG`、`OpenSGA`、预测式时空场景图合并，重点验证 room / object / function / reobserve 四层是否足够。 |
| LLM / VLA 安全治理 | 值得跟踪，但只作离线评测 | 将 unsafe action propagation、LLM threat model、action hallucination、visual runtime monitoring 合并为执行链污染测试，不新增在线大模型层。 |
| 后台服务 / 人工坐席 / robot wrangler | 值得作为 `KBT-57` 研究输入 | 只补 Phase 5 角色、台账和交接字段候选；不得把服务体系写成已冻结产品事实。 |
| 泛 `VLA`、world model、manipulation 加速 | 已饱和 | 只在出现端侧资源实测、家庭移动实机闭环或安全审计新增证据时进入主卡片。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 sim-to-real RL、功能 3D scene graph、LLM 安全传播防御、robot wrangler 平台和 health-conditioned VLA 都变成在线组件，会明显过复杂”。建议只吸收为 5 个轻量验证 / 治理动作：导航扰动字段、功能关系图评测字段、指令传播污染测试、运维角色矩阵、硬件健康降级输入。暂不新增产品级在线模型层、重型仿真平台或坐席系统冻结事实。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | NavRL++: A System-Level Framework for Improving Sim-to-Real Transfer in Reinforcement Learning-Based Robot Navigation | 转成 Phase 5 导航回放扰动归因表：sensor noise、perception failure、latency、control response、sim_real_gap。 |
| A- | Hierarchical and Holistic Open-Vocabulary Functional 3D Scene Graphs for Indoor Spaces | 转成空间记忆专题输入：功能边、层级关系、小物体实例混淆、跨帧关系稳定性。 |
| A- | Propagating Unsafe Actions in LLM Controlled Multi-Robot Collaboration via Single Robot Compromise | 转成执行链污染与权限传播测试：入口污染、传播路径、隔离门、人工复核和审计记录。 |
| B+ | Designing for Robot Wranglers: A Synthesis of Literature and Practice | 转成 Phase 5 运维承接角色矩阵，绑定 `KBT-57` provisional，不改写当前本体量产基线。 |
| B+ | Health-Conditioned Vision-Language-Action Models for Malfunction-Aware Robot Control | 转成硬件健康降级评测字段，不直接引入 VLA 控制栈。 |

## 3. 论文卡片

### 3.1 NavRL++: A System-Level Framework for Improving Sim-to-Real Transfer in Reinforcement Learning-Based Robot Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.15559](https://arxiv.org/abs/2605.15559) |
| 本轮 listing 口径 | 2026-05-18 官方 listing new submission，日更收录；abs 页显示 `Submitted on 15 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | navigation RL, sim-to-real, sensor noise, perception failure, system latency, temporal reasoning policy |

摘要要点转述：

论文指出，强化学习导航研究常把注意力放在输入表示、动作空间和奖励函数上，却缺少对真实部署性能的系统拆解。作者提出 `NavRL++`，不仅包含导航 RL 框架，还给出训练到部署的完整 pipeline，并通过实证研究分解影响 sim-to-real transfer 的关键因素，包括传感噪声、感知失败、系统延迟和控制响应。论文进一步提出 perturbation-aware fine-tuning，把真实部署中的差异显式引入后训练阶段；同时用 Transformer temporal reasoning policy 利用短时观测历史改善感知退化下的控制平滑性。实验覆盖静态和动态环境，并在多类机器人平台上验证了零样本 sim-to-real 部署。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`platform_runtime` 与 Phase 5 中“仿真导航结果如何解释实机表现”的问题。
2. Kinbot 家庭巡航会受到暗光、反光地面、移动人员、遮挡、网络 / 线程延迟、底盘控制响应和视觉丢帧共同影响，不能只用一个 `success_rate` 判断导航成熟度。
3. 对应量产预备：导航验证表应拆分 `sensor_noise`、`perception_failure`、`latency_ms`、`control_response`、`dynamic_obstacle_density`、`recovery_action` 和 `sim_real_gap`。

资源消耗与部署信号：

1. 论文的 RL 策略和 temporal reasoning policy 不应直接替换 Kinbot 当前保守导航栈。
2. 对 Kinbot 最现实的吸收方式是评测字段和回放扰动库，而不是在线 RL 控制器。
3. 若后续专题复现，应记录端侧推理延迟、内存占用、控制频率、失败恢复时间，以及与现有导航栈的冲突。

优势：

1. 直接命中导航 sim-to-real 的工程关键问题。
2. 将部署差异拆成可测扰动，适合 Kinbot Phase 5 回放体系。
3. 同时覆盖静态、动态和多平台部署，避免只在单一仿真中做指标优化。

劣势与风险：

1. 原平台包括 aerial 和 legged robots，不等同于 Kinbot 家庭移动底盘。
2. 强化学习导航的安全边界、可解释性和异常回退仍需保守栈兜底。
3. 若把 RL policy 作为在线主控，会增加验证复杂度和安全证明负担。

推荐理由：

建议作为 A 级输入。Kinbot 应优先吸收其扰动分解和 sim-to-real 归因方法，用于 Phase 5 导航回放与实机对照，不直接改变当前导航主线。

### 3.2 Hierarchical and Holistic Open-Vocabulary Functional 3D Scene Graphs for Indoor Spaces

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.15753](https://arxiv.org/abs/2605.15753) |
| 本轮 listing 口径 | 2026-05-18 官方 listing new submission，日更收录；abs 页显示 `Submitted on 15 May 2026` |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | functional 3D scene graph, indoor spaces, open vocabulary, visual grounding, temporal graph optimization |

摘要要点转述：

论文关注功能型 3D 场景图，即用对象节点、可交互元素和功能关系边表达室内场景。作者认为已有 benchmark 和 pipeline 多关注大件家具，缺少密集桌面小物体、多层级功能关系和真实视角变化下的关系稳定性。论文扩展 benchmark 覆盖密集 tabletop objects 和多级功能关系，并提出基于 2D visual grounding 与 3D graph optimization 的开放词汇 pipeline：先用 2D 视觉证据锚定细粒度功能边，再用多线索跨帧关联节点，并把边关联建模为 temporal graph optimization，结合证据累积、熵正则和时间平滑来恢复稳定功能关系与全局层级图结构。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory`、`mobility_navigation` 和家庭找物 / 提醒任务中“机器人到底记住了什么”的问题。
2. Kinbot 不能只记“杯子在桌上”，还需要评估“杯子是否可拿、药盒是否在禁区、充电器与设备是否关联、物品是否属于某个功能区”。
3. 对应纯视觉路线：在不引入深度相机 / LiDAR 作为产品 fallback 的情况下，需要评估开放词汇功能关系是否能在 RGB 观测和跨帧融合中保持稳定。

资源消耗与部署信号：

1. 论文 pipeline 依赖视觉 grounding 和 3D graph optimization，短期不应作为端侧实时强依赖。
2. 最现实的吸收方式是离线回放和低频空间记忆更新评测。
3. 建议新增评测字段：`functional_edge_stability`、`instance_confusion_rate`、`hierarchy_consistency`、`visual_anchor_evidence`、`reobserve_required`。

优势：

1. 将室内空间记忆从对象列表推进到功能关系图，贴近家庭服务任务。
2. 明确处理小物体密集、相似实例和跨视角归因不确定性。
3. 可与 `LEXI-SG`、`OpenSGA` 和预测式时空场景图合并成空间记忆专题。

劣势与风险：

1. 资源消耗和端侧延迟未直接对齐 Kinbot `12GB + 32GB` 量产线。
2. 功能关系边容易被错误视觉证据误导，需要人工标注、用户纠正和低置信回退。
3. 如果把开放词汇功能图写成所有任务的在线前置条件，会扩大运行时复杂度。

推荐理由：

建议作为 A- 级输入。Kinbot 应吸收其功能边和层级图评测语言，把空间记忆专题从“房间 / 物体”扩展到“房间 / 物体 / 功能关系 / 重新观察状态”。

### 3.3 Propagating Unsafe Actions in LLM Controlled Multi-Robot Collaboration via Single Robot Compromise

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.15641](https://arxiv.org/abs/2605.15641) |
| 本轮 listing 口径 | 2026-05-18 官方 listing new submission，日更收录；abs 页显示 `Submitted on 15 May 2026` |
| 分类 | `cs.RO`, `cs.CR` |
| 方法关键词 | LLM planner security, multi-robot collaboration, unsafe action propagation, obedience, infectiousness, stealthiness |

摘要要点转述：

论文研究 LLM 作为具身智能规划器时的安全风险，重点不是单机器人 prompt attack，而是多机器人协作中“单个入口机器人被攻击后，恶意意图沿机器人间通信传播”的场景。作者提出一种攻击范式：攻击者只与一台 entry robot 交互，被污染的机器人通过 peer communication 影响其他机器人，最终导致协同不安全动作。论文从失职、隐私泄露和公共安全危害等维度评估，并提出 obedience、infectiousness、stealthiness 三个指标。实验显示强攻击下恶意控制可保持并快速传播，说明协作通信机制可能在紧急或权利冲突场景中放大不安全指令。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization`、`decision_orchestration` 与 `observability_data_governance` 中“LLM 规划输出能否跨链路污染”的问题。
2. Kinbot 一代不是多机器人协作系统，但机器人本体、家属 App、云端、人工坐席、售后工具之间也会传递任务意图、权限和上下文。
3. 对应家庭场景：恶意或误导性指令可能通过家属 App、访客语音、远程协助或客服工单被放大，影响巡护、隐私区域、用药提醒和老人看护。

资源消耗与部署信号：

1. 该论文主要提供安全评测范式，不进入端侧运行时。
2. Kinbot 可将三类指标改写为离线污染测试：`obedience_to_unsafe_input`、`propagation_path_count`、`stealthiness_of_context_change`。
3. 需要在权限边界上落实：跨端上下文不自动继承高权限，坐席 / 云端建议不能直接覆盖端侧硬安全和用户确认。

优势：

1. 把 LLM 安全从单点输入扩展到协作链路传播，贴近实际系统。
2. 指标可转化为 Kinbot 的执行链审计与权限传播测试。
3. 能补强前序 LLM threat model、action hallucination 和 visual runtime monitoring 的安全证据链。

劣势与风险：

1. 原任务是多机器人协作，不等同于 Kinbot 单机 + App + 云 + 坐席结构。
2. 攻击设定需要重写成家庭机器人权限模型，不能直接照搬 multi-robot 指标。
3. 如果因此新增重型安全中台，会偏离一代轻服务闭环；应先做测试用例和权限矩阵。

推荐理由：

建议作为 A- 级输入。Kinbot 应吸收“污染传播链路”视角，用于 Phase 5 的指令安全、权限边界和审计测试，不新增产品级多机器人协同概念。

### 3.4 Designing for Robot Wranglers: A Synthesis of Literature and Practice

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.15892](https://arxiv.org/abs/2605.15892) |
| 本轮 listing 口径 | 2026-05-18 官方 listing new submission，日更收录；abs 页显示 `Submitted on 15 May 2026` |
| 分类 | `cs.RO`, `cs.HC` |
| 方法关键词 | robot wrangler, human-robot interaction, troubleshooting, service ecology, deployment support |

摘要要点转述：

论文关注机器人进入医院、博物馆、仓库等人类空间后出现的新角色：负责设置、监督和排障的 robot wrangler。作者通过 scoping review 梳理研究文献中的 wrangling 类型，指出这个角色往往把高度复杂、异质的劳动折叠成一个模糊词，导致实际支持需求难以被系统设计覆盖。论文进一步结合作者自身经验，提出支持 wrangler 作为个人和服务生态成员的设计启示。

解决 Kinbot 的什么问题：

1. 对应 `human_service_interface`、`observability_data_governance` 与 `KBT-57` 中“后台服务 / 人工坐席是否只是后续适配位，还是需要作为 Phase 5 证据包”的问题。
2. Kinbot 面向家庭交付时，真实排障不会只发生在用户 UI 内，还会涉及安装、地图初始化、网络、传感器状态、家庭成员授权、远程协助和售后工单。
3. 该论文提醒不要把这些劳动隐藏成“用户自己会处理”或“客服自然兜底”，需要在 Phase 5 试点中明确 owner、记录字段和升级路径。

资源消耗与部署信号：

1. 论文不是算法组件，不影响端侧算力。
2. 对 Kinbot 的成本影响来自服务流程、工具台账、培训和响应 SLA，而不是硬件 BOM。
3. 本轮只应作为 `KBT-57` provisional 研究输入，不能把后台服务 / 人工坐席写成已冻结一代产品能力。

优势：

1. 直接补足机器人真实部署中的人工承接视角。
2. 适合转成 Phase 5 试点角色矩阵和故障台账字段。
3. 能帮助区分用户、家属、客服、现场工程师和研发 owner 的责任边界。

劣势与风险：

1. 文献综合不提供 Kinbot 特定家庭场景数据。
2. 若过早产品化坐席 / 后台服务，会扩大组织复杂度和成本结构。
3. 必须绑定 `KBT-57` 继续验证，不应覆盖当前已冻结本体基线。

推荐理由：

建议作为 B+ 级输入。Kinbot 应吸收其“隐藏运维劳动显性化”的视角，补 Phase 5 试点运维字段和角色矩阵，但维持服务体系为 provisional。

### 3.5 Health-Conditioned Vision-Language-Action Models for Malfunction-Aware Robot Control

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.16056](https://arxiv.org/abs/2605.16056) |
| 本轮 listing 口径 | 2026-05-18 官方 listing new submission，日更收录；abs 页显示 `Submitted on 15 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | health-conditioned VLA, malfunction-aware control, health vector, degraded joints, lightweight adapter |

摘要要点转述：

论文指出，许多 VLA 研究关注任务失败检测、预防和恢复，但较少处理机器人自身的物理故障，例如关节退化、执行器失效或夹爪能力下降。作者提出 health-conditioned VLA，把表示关节工作角度和扭矩能力的 health vector 输入模型，并通过在 VLA-Adapter 架构中加入轻量 Health Projector，让策略在不同关节退化配置下调整动作预测。实验基于 LIBERO-Spatial 任务和作者采集的故障机器人数据，显示轻量模块可以让模型在默认 VLA-Adapter 不能处理的退化关节配置下继续完成任务。

解决 Kinbot 的什么问题：

1. 对应 `platform_runtime`、`hardware_control_runtime` 与 `safety_compliance_authorization` 中“硬件状态如何影响任务执行”的问题。
2. Kinbot 家庭场景中的故障不只包括机械臂；底盘电机、头颈自由度、屏幕、麦克风、扬声器、摄像头、充电触点和网络都可能出现退化。
3. Phase 5 不能只在失败后记录“任务失败”，还要记录故障前置条件、可执行能力降级、是否需要停止任务、是否升级人工或家属确认。

资源消耗与部署信号：

1. 论文方法是 VLA 控制增强，不应直接引入 Kinbot 一代在线 VLA 主控。
2. Health vector 思想可低成本转化为状态机和验证字段：`component_health`、`capability_degraded`、`allowed_task_subset`、`safe_stop_required`。
3. 若未来验证，应先在仿真 / 回放中测故障感知策略，不替换底盘硬安全和诊断机制。

优势：

1. 把物理故障从事后异常转为执行前置输入，符合量产可靠性思路。
2. 轻量 adapter 思路提示不必用全量模型微调解决所有故障配置。
3. 可与运维承接、故障台账和安全降级状态机结合。

劣势与风险：

1. 原实验是 LIBERO 空间任务和关节退化设置，不等同于家庭移动底盘。
2. VLA 成功率不等于系统安全，必须由硬安全、诊断和权限机制兜底。
3. 如果把 health-conditioned policy 写成在线控制主线，会扩大模型验证范围。

推荐理由：

建议作为 B+ 级输入。Kinbot 应吸收 health vector 与能力降级口径，用于 Phase 5 故障注入和安全停止测试，不新增 VLA 控制基线。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| PhysBrain 1.0 Technical Report | [2605.15298](https://arxiv.org/abs/2605.15298) | 2026-05-18 new submission | 大规模人类第一视角视频物理常识对长期 VLA 有价值，但仍是重模型 / 泛 VLA 方向；本轮不扩大产品级在线模型层。 |
| FLASH: Efficient Visuomotor Policy via Sparse Sampling | [2605.15492](https://arxiv.org/abs/2605.15492) | 2026-05-18 new submission | 推理延迟和 action horizon 有资源启发，但任务偏 manipulation；端侧 VLA 加速本月已多次覆盖，未新增 Kinbot 导航 / 安全治理项。 |
| Feedback World Model Enables Precise Guidance of Diffusion Policy | [2605.15705](https://arxiv.org/abs/2605.15705) | 2026-05-18 new submission | 闭环反馈 world model 有技术价值，但仍偏 manipulation policy；本轮只把“预测-观测误差”作为离线诊断字段观察，不新增 WAM 主线。 |
| PCASim: Promptable Closed-loop Adversarial Simulation for Urban Traffic Environment | [2605.15654](https://arxiv.org/abs/2605.15654) | 2026-05-18 new submission | 自动驾驶对抗仿真与前序 `CARS`、`RoboLab` 主题重叠；可保留场景生成参考，但不改变 Kinbot 家庭安全仿真主线。 |
| WorldVLN: Autoregressive World Action Model for Aerial Vision-Language Navigation | [2605.15964](https://arxiv.org/abs/2605.15964) | 2026-05-18 new submission | 闭环 world-action VLN 对导航专题有旁路启发，但场景是 aerial VLN，且 WAM 主题已接近饱和；只作为 VLN 专题候选。 |
| Fast Expanding Safe Circular Regions for Efficient Local Path Planning | [2605.16009](https://arxiv.org/abs/2605.16009) | 2026-05-18 new submission | 几何局部规划简单高效，但依赖 local LiDAR scan 且仅仿真评估；与一代纯视觉主线不一致。 |
| Reactive Robot-Centric Safety for Autonomous Navigation in Constrained and Dynamic Environments | [2605.15782](https://arxiv.org/abs/2605.15782) | 2026-05-18 new submission | 3D LiDAR + CBF 安全过滤有安全证据价值，但平台是地下四足 / 点云安全区；不作为 Kinbot 一代传感路线变化。 |
| STABLE: Simulation-Ready Tabletop Layout Generation via a Semantics-Physics Dual System | [2605.16137](https://arxiv.org/abs/2605.16137) | 2026-05-18 cross submission | 语义-物理双系统生成可用于仿真资产，但偏 tabletop layout；本轮已有功能场景图与运维承接更直接。 |
| OpenFrontier: General Navigation with Visual-Language Grounded Frontiers | [2603.05377](https://arxiv.org/abs/2603.05377) | 2026-05-18 replacement | 对纯视觉开放世界导航很相关，但属于 replacement，且前序零样本目标导航 / frontier / ConsistNav 已覆盖；进入“纯视觉导航专题”候选，不重复入主卡片。 |
| ConsistNav: Closing the Action Consistency Gap in Zero-Shot Object Navigation with Semantic Executive Control | [2605.09869](https://arxiv.org/abs/2605.09869) | 2026-05-18 replacement | 已在 2026-05-13 主卡片收录；本轮不重复。 |
| parallelcbf: A composable safety-filter and auditability framework for tensor-parallel reinforcement learning | [2605.15509](https://arxiv.org/abs/2605.15509) | 2026-05-18 cross submission | 安全过滤与可审计框架有方法启发，但偏 tensor-parallel RL 训练框架；未直接新增 Kinbot Phase 5 产品验证字段。 |
| Learning Bilevel Policies over Symbolic World Models for Long-Horizon Planning | [2605.15975](https://arxiv.org/abs/2605.15975) | 2026-05-18 cross submission | 符号 world model 长程规划相关，但与本月任务规划 / world model 主题重叠；暂不扩张主线概念。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 建议把 `NavRL++` 转成 Phase 5 导航回放扰动归因字段：`sensor_noise`、`perception_failure`、`latency_ms`、`control_response`、`dynamic_obstacle_density`、`sim_real_gap`、`recovery_action`。
2. 建议把功能 3D scene graph 转成空间记忆专题字段：`functional_edge`、`interactive_element`、`instance_confusion_rate`、`hierarchy_consistency`、`visual_anchor_evidence`、`reobserve_required`。
3. 建议把 LLM unsafe propagation 转成执行链污染测试：入口污染源、传播路径、权限升级点、隔离门、人工复核点、审计证据和 fail-closed 行为。
4. 建议把 robot wrangler 论文转成 Phase 5 运维角色矩阵：用户、家属、客服 / 坐席、现场交付、研发 owner、售后工单 owner；该动作绑定 `KBT-57` provisional，不回写为 confirmed 产品事实。
5. 建议把 health-conditioned VLA 转成硬件健康降级字段：`component_health`、`capability_degraded`、`allowed_task_subset`、`safe_stop_required`、`handoff_required`。
6. 本轮不建议回写 `03_decision_log.md` 或主线架构文档；上述内容均为研究输入、Phase 5 验证字段候选或 `KBT-57` provisional 线索，不构成已确认产品决策。

## 6. 本轮未进入主线的原因

1. 本轮文档日期为 2026-05-19，但官方最新 Robotics listing 日期为 2026-05-18；本轮记录的是最新官方 listing 的日更收录，不代表 2026-05-19 另有新官方批次。
2. 入选论文主要提供评测字段、治理测试和运维承接口径，尚未经过 Kinbot 实机验证、供应链评估、端侧资源实测或用户体验评审。
3. 若将 RL 导航策略、功能场景图、LLM 安全防御、robot wrangler 平台和 health-conditioned VLA 直接升级为在线组件，会显著扩大系统复杂度。
4. 当前一代纯视觉、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 与 `5000 到 6000 元` BOM 冻结基线不因本轮论文改变。

## 7. 来源

1. arXiv `cs.RO/new`：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent`：<https://arxiv.org/list/cs.RO/recent>
3. NavRL++: A System-Level Framework for Improving Sim-to-Real Transfer in Reinforcement Learning-Based Robot Navigation：<https://arxiv.org/abs/2605.15559>
4. Hierarchical and Holistic Open-Vocabulary Functional 3D Scene Graphs for Indoor Spaces：<https://arxiv.org/abs/2605.15753>
5. Propagating Unsafe Actions in LLM Controlled Multi-Robot Collaboration via Single Robot Compromise：<https://arxiv.org/abs/2605.15641>
6. Designing for Robot Wranglers: A Synthesis of Literature and Practice：<https://arxiv.org/abs/2605.15892>
7. Health-Conditioned Vision-Language-Action Models for Malfunction-Aware Robot Control：<https://arxiv.org/abs/2605.16056>
8. OpenFrontier: General Navigation with Visual-Language Grounded Frontiers：<https://arxiv.org/abs/2603.05377>
9. WorldVLN: Autoregressive World Action Model for Aerial Vision-Language Navigation：<https://arxiv.org/abs/2605.15964>
10. STABLE: Simulation-Ready Tabletop Layout Generation via a Semantics-Physics Dual System：<https://arxiv.org/abs/2605.16137>
