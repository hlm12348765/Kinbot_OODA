# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-06
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-06 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页，确认本轮检索时官方最新 Robotics listing 为 2026-05-06 批次；收录此前每日纪要未覆盖、与 Kinbot 端侧语言模型、混合关键性运行时、开放词汇语义地图、长期情景记忆、视觉 SLAM 退化评测、具身安全、设计期不确定性分析、单智能体运行时、协作行为评测和机器人视频 world model 对齐相关的 10 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-06。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期为 `Wednesday, 6 May 2026`，合计 `50` 篇 entries；其中 new submissions `20` 篇、cross submissions `6` 篇、replacement submissions `24` 篇。
3. 优先覆盖前序 `2026-04-29` 至 `2026-05-05` Kinbot 每日论文纪要未收录的 `2605.*` 新条目；对 replacement 条目，仅在其与 Kinbot 当前架构、验证或资源治理直接相关时补录。
4. 关键词与主题包括 `edge LLM`、`social robot`、`mixed criticality robotics`、`open-vocabulary semantic mapping`、`episodic memory`、`visual SLAM`、`embodied AI safety`、`uncertainty analysis`、`agent runtime`、`human-AI collaboration`、`robot video world model`。

筛选标准：

1. 是否对应 Kinbot 一代主线问题：端侧隐私交互、纯视觉导航和定位、家庭世界状态记忆、长期运行安全、陪伴协作、运行时隔离和资源约束。
2. 是否能映射到 Kinbot 现有模块：`companion_interaction`、`mobility_navigation`、`world_state_memory`、`decision_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`observability_data_governance`。
3. 是否给出资源、数据规模、硬件平台、功耗、延迟、成功率、存储压缩或工程部署约束。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。云端 / fleet / world model / 可变能力包只作为研究输入或 `KBT-57` 战略分支观察项，不直接改写一代主线。

## 2. 本轮总判断

本轮 `2026-05-06` Robotics listing 对 Kinbot 的价值集中在“真实产品化约束”：本地语言模型不是越大越好，机器人运行时需要把安全控制、感知管线和用户应用放到同一 SoC 上并隔离，家庭长期记忆必须会遗忘，纯视觉定位需要在低光、雾化、运动模糊等退化条件下评测，具身智能安全也要覆盖从感知、认知、规划到动作的完整链路。

对 Kinbot 最有价值的结论有 6 个：

1. **端侧 LLM 要按任务价值而非通用分数选型**：社交机器人本地 LLM benchmark 显示教学 / 互动质量与通用 MMLU 不单调相关，Kinbot 陪伴交互应把响应速度、能耗、隐私和场景质量合并评测。
2. **消费者机器人需要混合关键性隔离**：`Jiao` 明确把安全关键控制、感知和用户应用共平台部署作为问题起点，适合 Kinbot 评估“底盘 / 安全链路不可被 App 或大模型拖垮”的运行时边界。
3. **长期记忆必须内置遗忘策略**：`H^2-EMV` 用用户反馈学习“什么值得记住”，比无边界日志堆积更接近 Kinbot 家庭长期陪伴与隐私治理。
4. **开放词汇地图不能只看语义效果**：`FUS3DMaps` 的 dual-layer / sliding-window 设计对家庭语义地图有启发，但 Kinbot 一代不能把大规模 3D 语义图当成实时控制依赖。
5. **纯视觉链路需要退化条件矩阵**：V-SLAM 对比论文把低光、尘雾、运动模糊和组合退化拆开评测，适合补入 Kinbot Phase 5 纯视觉定位验证集。
6. **安全评估要穿透到具身全链路**：具身 AI 安全综述提醒 Kinbot 不应只做 LLM 内容安全，还要覆盖多模态感知脆弱性、规划 jailbreak、动作层安全和人机信任。

复杂度自检：现在的架构是不是太复杂了？本轮答案是“研究输入变多，但不应增加新顶层模块”。建议只吸收 4 类验证 / 设计任务：端侧 LLM 选型基准、混合关键性隔离验证、长期记忆遗忘策略、纯视觉退化评测矩阵。开放词汇 3D 地图、world model 对齐、AEROS 能力包和协作心智评测先作为研究池，不进入当前一代冻结主线。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | Benchmarking Local Language Models for Social Robots using Edge Devices | 纳入 `companion_interaction` 与 `platform_runtime` 的端侧 LLM 选型基准，重点看 TPS、J/token、交互质量和隐私。 |
| A | Jiao: Bridging Isolation and Customization in Mixed Criticality Robotics | 纳入 `platform_runtime` / `safety_compliance_authorization` 的混合关键性隔离验证项。 |
| A | Learning to Forget -- Hierarchical Episodic Memory for Lifelong Robot Deployment | 纳入 `world_state_memory` 长期记忆研究池，优先验证选择性遗忘、查询耗时和用户反馈规则。 |
| A- | Robust Visual SLAM for UAV Navigation in GPS-Denied and Degraded Environments | 纳入纯视觉定位退化评测输入，提炼低光、雾化、模糊和嵌入式资源口径。 |
| A- | Safety in Embodied AI | 作为 Kinbot 具身安全检查清单的综述索引，不直接新增主线事实。 |
| A- | FUS3DMaps | 作为开放词汇语义地图研究输入，先评估家庭场景 sliding-window 语义层，而非实时控制依赖。 |
| B+ | Human-in-the-Loop Uncertainty Analysis in Self-Adaptive Robots Using LLMs | 用于 Phase 5 设计期风险清单和不确定性 taxonomy，不作为运行时 LLM 自动决策依据。 |
| B+ | AEROS | 作为单智能体运行时和能力包治理参考，避免把 ECM 直接复制成 Kinbot 新模块体系。 |
| B | Evaluating Generative Models as Interactive Emergent Representations of Human-Like Collaborative Behavior | 作为陪伴协作评测方法输入，重点看行为标签和人工满意度，而非 2D 游戏环境本身。 |
| B | RoboAlign-R1 | 作为机器人视频 world model 对齐观察项，当前不进入一代端侧部署。 |

## 3. 论文卡片

### 3.1 Benchmarking Local Language Models for Social Robots using Edge Devices

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.03111](https://arxiv.org/abs/2605.03111) |
| 提交日期 | 2026-05-04 |
| 分类 | `cs.RO`, `cs.CL` |
| 会议状态 | Accepted for 22nd IEEE International Conference on Advanced Robotics and its Social Impact |
| 方法关键词 | edge LLM, social robot, Raspberry Pi, tokens per second, energy per token, teaching quality |

摘要要点转述：

论文面向社交 / 教育机器人本地语言模型部署，指出这类机器人既要响应及时，又要保护隐私，但边缘硬件算力极弱。作者在 Raspberry Pi 4 上主测、并在 Raspberry Pi 5 和笔记本 GPU 上做补充，对 `25` 个开源语言模型从推理效率、通用知识和教学效果三个维度评估，并用 `5` 名独立人工评分者校验 LLM 评审排序。结果显示，不同模型的吞吐与能效可相差一个数量级以上；通用知识准确率从接近随机到 `57.2%`，但高通用分数不必然带来更好的教学互动。`Granite4 Tiny Hybrid 7B` 在整体均衡性上表现较好，达到 `2.5 tokens/s`、`0.90 tokens/J` 和 `54.6%` MMLU 子集准确率。

解决 Kinbot 的什么问题：

1. 对应 Kinbot `companion_interaction` 的本地对话、解释和轻量教学 / 引导能力。
2. 对应 `platform_runtime` 的端侧资源选型：不能只看参数量或云端 benchmark，需要同时看吞吐、能耗和场景质量。
3. 对应隐私边界：老人家庭交互中，大量低风险对话应优先本地处理，只有复杂任务或受控数据才考虑回流。

资源消耗与部署信号：

1. 明确以 Raspberry Pi 4 为主平台，补充 Raspberry Pi 5 和笔记本 GPU，对 Kinbot 端侧低功耗场景有参考价值。
2. 报告 `2.5 tokens/s`、`0.90 tokens/J` 等指标，能直接转化为 Kinbot 本地 LLM 候选模型筛选表字段。
3. 论文提示 MMLU 与交互质量不完全一致，Kinbot 应新增“陪伴 / 解释质量”评测项。

优势：

1. 指标体系贴近真实机器人，而不是只评云端大模型能力。
2. 把能耗、速度和任务质量放在同一张表里，适合 Kinbot 成本 / 功耗 tradeoff。
3. 人工评分校验自动评分，能降低 LLM 自评偏差。

劣势与风险：

1. 教育机器人任务与老人陪伴、健康提醒和家庭安全解释仍有差异。
2. Raspberry Pi 4 的算力低于 Kinbot 默认主控预期，结果不能直接等价迁移。
3. `2.5 tokens/s` 对自然对话偏慢，Kinbot 需要分层策略或更强 NPU / GPU 支撑。

推荐理由：

建议作为本轮最高优先级输入之一。Kinbot 的本地语言模型选型应建立“小模型常驻 + 大模型按需 + 云端受控”的分层基准，评估字段至少包括 TPS、J/token、首 token 延迟、任务完成质量、幻觉率、隐私等级和故障降级策略。

### 3.2 Jiao: Bridging Isolation and Customization in Mixed Criticality Robotics

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.03641](https://arxiv.org/abs/2605.03641) |
| 提交日期 | 2026-05-05 |
| 分类 | `cs.RO`, `cs.HC` |
| 会议状态 | Accepted by Infocom'26 Embodied Intelligence Networks workshop |
| 方法关键词 | mixed criticality, partition isolation, Safe IO Cell, parameter synchronization, safety communication |

摘要要点转述：

论文关注消费者机器人在同一多核平台上整合安全关键控制、感知 pipeline 和用户应用的问题。传统静态分区 hypervisor 可以做硬件隔离，但直接搬用汽车架构会遇到“用户想定制机器人行为，但不具备平台安全知识”的不对称问题。作者提出 `Jiao`，包含硬件级覆盖能力的 Safe IO Cell、封装跨域复杂性的参数同步服务，以及符合 `IEC 61508` 思路的安全通信层。实测在 ARM Cortex-A55 平台上，分区隔离将周期抖动降低 `84.5%`，p99 抖动从 `69.0 us` 降到 `7.8 us`，并消除超过 `50 us` 的 excursion。

解决 Kinbot 的什么问题：

1. 对应 Kinbot `platform_runtime`：底盘控制、安全监控、视觉感知和用户态应用可能共享 SoC，但关键链路不能被大模型或 App 侧负载拖垮。
2. 对应 `safety_compliance_authorization`：用户自定义、家属 App 指令和机器人本体安全策略之间需要边界清楚的参数同步与授权。
3. 对应 Phase 5：需要验证“复杂软件负载下安全控制周期是否稳定”。

资源消耗与部署信号：

1. 硬件平台为 ARM Cortex-A55，接近消费级嵌入式机器人可用算力层。
2. 给出周期抖动、p99 timing error 和超限事件消除等工程指标。
3. 论文关注隔离机制本身，未展开 VLM / SLAM 等高负载场景的完整系统成本。

优势：

1. 问题定义与家用机器人高度一致：安全关键控制、感知和用户应用共平台部署。
2. 指标可量化，适合转为 Kinbot 运行时验收项。
3. 把用户定制能力和安全隔离放在一起考虑，避免“能定制但不可控”。

劣势与风险：

1. 需要硬件、OS、驱动和中间件共同配合，落地成本不低。
2. `IEC 61508` 对齐不等同于完整认证完成。
3. 如果过早引入复杂 hypervisor 架构，可能超出一代开发节奏。

推荐理由：

建议纳入 Kinbot `platform_runtime` 的验证清单，不必立即绑定具体实现。最小动作是建立“安全控制周期抖动 + 用户态负载压力 + 感知高峰负载”的混合关键性测试矩阵。

### 3.3 Learning to Forget -- Hierarchical Episodic Memory for Lifelong Robot Deployment

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.11306](https://arxiv.org/abs/2604.11306) |
| 首次提交日期 | 2026-04-13 |
| 本轮 listing 口径 | 2026-05-05 replacement，前序纪要未收录 |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | hierarchical episodic memory, selective forgetting, user feedback, lifelong deployment |

摘要要点转述：

论文指出，机器人长期运行后需要回答“钥匙放在哪里”“任务为什么失败”这类关于过去经历的问题，但连续多模态感知会很快造成存储膨胀和实时查询困难。作者提出 `H^2-EMV`，增量构建层级情景记忆，并基于语言模型估计相关性，结合用户以自然语言形成的记忆规则来选择性遗忘。系统还能根据用户对遗忘细节的反馈更新规则。评估覆盖仿真家庭任务和 ARMAR-7 上 `20.5` 小时真实记录，在保持问答准确率的同时，记忆规模降低 `45%`，查询计算降低 `35%`；第二轮查询准确率提升 `70%`，反映用户偏好适配效果。

解决 Kinbot 的什么问题：

1. 对应 Kinbot `world_state_memory` 的长期家庭记忆：物品位置、任务失败原因、老人习惯和环境变化不能无限保留。
2. 对应隐私治理：选择性遗忘是产品能力，不只是存储优化。
3. 对应陪伴体验：用户会追问机器人过去发生的事，机器人需要给出可解释、可追溯且不过度记忆的回答。

资源消耗与部署信号：

1. 报告 `45%` 记忆规模下降和 `35%` 查询计算下降，直接对应 Kinbot `12GB + 32GB` 资源线。
2. 真实数据时长 `20.5` 小时，仍短于家庭长期部署，但足以作为 Phase 5 小规模验证起点。
3. 依赖语言模型做相关性估计，需要控制端侧 / 云端边界和敏感信息输入。

优势：

1. 把“记住什么”和“忘掉什么”做成可学习策略，符合家庭长期陪伴场景。
2. 用户反馈闭环能适配家庭差异，而不是固定保留规则。
3. 同时降低存储和查询成本，有明确工程收益。

劣势与风险：

1. 遗忘错误会伤害用户信任，尤其是安全和健康相关事件。
2. 用户自然语言规则可能冲突，需要优先级和审计机制。
3. 论文基于 humanoid 平台，Kinbot 一代移动交互机器人需要重新定义记忆事件粒度。

推荐理由：

建议将其作为 `world_state_memory` 的核心研究输入之一。Kinbot 不应默认“全量多模态日志长期保存”，而应设计事件分级、过期时间、用户可纠正规则和不可遗忘安全事件白名单。

### 3.4 Robust Visual SLAM for UAV Navigation in GPS-Denied and Degraded Environments

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.03678](https://arxiv.org/abs/2605.03678) |
| 提交日期 | 2026-05-05 |
| 分类 | `cs.RO` |
| 篇幅 | 24 页 |
| 方法关键词 | visual SLAM, degraded environments, low light, haze, motion blur, Jetson deployment |

摘要要点转述：

论文系统比较 `ORB-SLAM3`、`DPVO`、`DROID-SLAM`、`DUSt3R` 和 `MASt3R` 五类 V-SLAM 系统，覆盖 classical、深度学习、递归和 Vision Transformer 范式。实验使用 TUM RGB-D、EuRoC MAV、UMA-VI、SubT-MRS 和自建单目室内数据集，并设置正常、低光、尘雾、运动模糊和组合退化五类条件，配合 Vicon 真值。结果显示，`ORB-SLAM3` 在严重退化下出现关键失败，整体 tracking success rate 为 `62.4%`，dense haze 下为 `0%`；学习型方法更稳健，`MASt3R` degraded ATE 最低为 `0.027 m`，`DUSt3R` tracking success 最高为 `96.5%`；`DPVO` 在效率和稳健性之间较均衡，达到 `18.6 FPS`、`3.1 GB GPU memory` 和 `86.1%` TSR。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 一代纯视觉主线下的室内定位和导航稳健性验证。
2. 对应夜间、弱光、快速转头、老人活动导致遮挡、厨房雾气等家庭退化场景。
3. 对应 `mobility_navigation` 的算法选型：传统 SLAM、学习型 VO 和 transformer-based 重建应在同一退化矩阵下比较。

资源消耗与部署信号：

1. `DPVO` 的 `18.6 FPS` 和 `3.1 GB GPU memory` 对 Kinbot 端侧资源预算有直接参考意义。
2. 论文包含 NVIDIA Jetson 平台部署分析，适合转化为 Kinbot 嵌入式验证计划。
3. UAV 场景与地面移动机器人不同，但退化视觉条件可复用。

优势：

1. 不是只报平均精度，而是拆出低光、雾化、运动模糊和组合退化。
2. 同时比较经典与学习型方法，适合 Kinbot 做基线矩阵。
3. 给出 FPS、显存和成功率，可进入工程选型表。

劣势与风险：

1. UAV 动态与 Kinbot 底盘运动模型不同，不能直接迁移控制结论。
2. ViT / 3D foundation 方法端侧成本可能超出一代量产资源线。
3. 自建室内数据未必覆盖家庭窄通道、镜面、低纹理墙面和人体遮挡。

推荐理由：

建议吸收为 Phase 5 纯视觉定位退化评测模板。Kinbot 至少应建立“正常 / 低光 / 模糊 / 反光 / 遮挡 / 组合退化”的定位成功率、漂移、恢复时间和资源消耗表。

### 3.5 FUS3DMaps: Scalable and Accurate Open-Vocabulary Semantic Mapping by 3D Fusion of Voxel- and Instance-Level Layers

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.03669](https://arxiv.org/abs/2605.03669) |
| 提交日期 | 2026-05-05 |
| 分类 | `cs.RO`, `cs.AI` |
| 状态 | Submitted to IEEE for possible publication |
| 方法关键词 | open-vocabulary semantic mapping, voxel map, instance layer, dense layer, spatial sliding window |

摘要要点转述：

论文关注开放词汇语义地图：机器人需要把未预定义类别的概念落到空间中。现有 training-free 方法通常在多视角中融合语义 embedding，要么做 instance-level 分割与 crop 编码，要么把 image patch embedding 投射到密集 3D 地图。作者提出 `FUS3DMaps`，在共享 voxel map 中同时维护 dense layer 和 instance-level layer，并通过跨层语义融合结合两者优点。为提升规模化能力，dense layer 和 cross-layer fusion 被限制在 spatial sliding window 内。实验覆盖 3D 语义分割 benchmark 和大规模场景，目标是实现多层建筑尺度的开放词汇语义地图。

解决 Kinbot 的什么问题：

1. 对应 Kinbot `world_state_memory`：用户可能说“红色药盒”“常用杯子”“门口那个包”，系统需要把开放词汇概念映射到家庭空间。
2. 对应 `mobility_navigation`：语义目标导航需要把语言目标转为空间候选。
3. 对应家庭长期记忆：instance layer 可以承接具体物体，dense layer 可以承接区域语义和可通行上下文。

资源消耗与部署信号：

1. sliding-window 设计是资源受限场景的重要信号，说明全局 dense fusion 成本可能过高。
2. 论文摘要未给出端侧 FPS、显存或 CPU / GPU 占用。
3. 多层建筑尺度强于 Kinbot 一代家庭场景，但一代只需要家庭级局部窗口和常见对象子集。

优势：

1. 同时保留 dense 和 instance 语义，有助于连接导航、问答和物体搜索。
2. 开放词汇能力符合家庭非固定物体集合。
3. sliding-window 思路有利于控制端侧资源。

劣势与风险：

1. 3D semantic mapping 可能依赖深度、重建或多视角质量，Kinbot 一代纯视觉部署要谨慎。
2. 语义 embedding 误融合会污染长期世界状态。
3. 如果作为实时控制依赖，会显著增加复杂度和资源压力。

推荐理由：

建议作为开放词汇家庭语义地图研究输入，不直接回写主线接口。Kinbot 可先验证“局部语义窗口 + 长期 instance 摘要”的轻量方案，而不是构建全屋大规模 dense 3D 语义图。

### 3.6 Safety in Embodied AI: A Survey of Risks, Attacks, and Defenses

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.02900](https://arxiv.org/abs/2605.02900) |
| 本轮 listing 口径 | 2026-05-06 cross-list，前序纪要未收录 |
| 分类 | `cs.CR`, `cs.AI`, `cs.CV`, `cs.RO` |
| 篇幅 | 51 页、4 图、19 表，覆盖 400+ 篇论文 |
| 方法关键词 | embodied AI safety, attacks, defenses, multimodal perception, planning jailbreak, human-agent interaction |

摘要要点转述：

论文是一篇具身 AI 安全综述，将具身智能定义为感知、认知、规划、交互和动作共同构成的开放世界系统。与纯数字 AI 不同，具身 agent 的感知不确定、知识不完整，并且要与人动态互动，错误可能直接导致物理伤害。综述按感知、认知、规划、动作、交互和 agentic system 分层组织风险、攻击和防御，覆盖对抗、后门、jailbreak、硬件层攻击、攻击检测、安全训练、鲁棒推理和风险感知人机交互。作者强调若干被低估的问题，例如多模态感知融合脆弱、规划在 jailbreak 下不稳定，以及开放式人机交互的可信性。

解决 Kinbot 的什么问题：

1. 对应 Kinbot `safety_compliance_authorization` 的安全清单：安全不能只限于 LLM 文本内容。
2. 对应 `observability_data_governance`：需要记录并审计从感知到动作的风险链。
3. 对应健康、陪伴和家庭巡护场景：机器人在家庭中既可能被错误输入诱导，也可能因感知退化或交互误解触发错误动作。

资源消耗与部署信号：

1. 综述本身不提供端侧消耗，但提供安全分类和防御策略索引。
2. 可作为 Kinbot 安全测试矩阵的文献入口，而非具体算法实现。
3. 涵盖 400+ 篇文献，适合做安全风险雷达，不适合直接变成工程 backlog。

优势：

1. 覆盖全链路，能避免 Kinbot 只做 LLM jailbreak 或内容过滤。
2. 把具身系统特有的物理伤害、感知融合和规划风险拉到同一框架。
3. 对 Phase 5 风险清单和安全评审表有直接帮助。

劣势与风险：

1. 综述范围很大，工程落地需要二次裁剪。
2. 不直接给出 Kinbot 场景的优先级和验证步骤。
3. 若无 owner 容易变成“安全概念堆叠”。

推荐理由：

建议作为 `safety_compliance_authorization` 的外部安全索引输入：只提炼 10 到 15 条与家庭机器人直接相关的攻击 / 防御场景，进入 Phase 5 测试设计，不新增主线模块。

### 3.7 Human-in-the-Loop Uncertainty Analysis in Self-Adaptive Robots Using LLMs

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.02983](https://arxiv.org/abs/2605.02983) |
| 提交日期 | 2026-05-04 |
| 分类 | `cs.RO`, `cs.SE` |
| 方法关键词 | uncertainty taxonomy, self-adaptive robots, LLM, design-stage analysis, human-in-the-loop |

摘要要点转述：

论文关注自适应机器人在动态环境中的不确定性管理。未被识别和分析的不确定性会导致安全违规和运行失败，但现实环境、机器人动态行为和快速演进的技术栈让系统性梳理变得困难。作者提出 `RoboULM`，用 LLM 支持从设计阶段探索不确定性来源、影响和缓解策略，并配套不确定性 taxonomy。论文在 `4` 个工业用例中邀请 `16` 名实践者评估，结果显示参与者认为该工具有用且易理解，尤其认可结构化提示和迭代细化支持。

解决 Kinbot 的什么问题：

1. 对应 Kinbot Phase 5 验证前的风险清单梳理：哪些不确定性来自环境、传感、用户行为、模型输出、服务链路或硬件状态。
2. 对应 `decision_orchestration` 和 `safety_compliance_authorization`：自适应行为必须先识别不确定性，再决定是否降级、询问或停止。
3. 对应主线治理：把设计期假设与运行时证据分开，避免把未验证设想写成 confirmed。

资源消耗与部署信号：

1. 该方法主要用于设计阶段，不是端侧实时组件。
2. 资源消耗取决于所用 LLM，可用离线工具链完成，不影响产品 BOM。
3. 实验样本为 `16` 名实践者和 `4` 个工业用例，偏方法可用性而非机器人性能。

优势：

1. 适合梳理复杂机器人系统的不确定性来源和缓解动作。
2. human-in-the-loop 方式能减少 LLM 直接替人做安全判断的风险。
3. 与 Kinbot `provisional -> confirmed` 治理口径兼容。

劣势与风险：

1. LLM 生成的不确定性清单可能漏项或泛化，需要专家复核。
2. 工业用例不等同于家庭养老 / 陪伴场景。
3. 不能替代实测、FMEA、故障注入和安全认证。

推荐理由：

建议用于 Kinbot Phase 5 风险工作坊或文档清单补齐。最佳用法是让 LLM 辅助生成候选不确定性，再由架构、硬件、算法、测试和产品 owner 逐条确认。

### 3.8 AEROS: A Single-Agent Operating Architecture with Embodied Capability Modules

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.07039](https://arxiv.org/abs/2604.07039) |
| 首次提交日期 | 2026-04-08 |
| 本轮 listing 口径 | 2026-05-05 replacement，前序纪要未收录 |
| 分类 | `cs.RO`, `cs.AI` |
| 篇幅 | 48 页、5 图、9 表 |
| 方法关键词 | single persistent agent, embodied capability modules, policy-separated runtime, hot-swapping, failure recovery |

摘要要点转述：

论文认为机器人系统缺少统一组织智能、能力和执行的抽象：单体架构耦合过强，多 agent 或松散模块又容易失去身份和控制权一致性。作者提出 `AEROS`，把每台机器人建模为一个持久智能主体，能力通过可安装的 `Embodied Capability Modules` 扩展；每个 ECM 封装技能、模型和工具，运行时用独立策略层约束执行与安全。作者在 PyBullet 中以 Franka Panda 做参考实现，覆盖重规划、失败恢复、策略执行、跨任务泛化、ECM hot-swapping 和失败边界分析。超过 `100` 次随机试验中，AEROS 在三个任务上达到 `100%` 成功率，策略层阻止所有非法动作且零 false acceptance，ECM runtime 加载后保持 `100%` post-swap success。

解决 Kinbot 的什么问题：

1. 对应 Kinbot `decision_orchestration` 与 `platform_runtime`：能力扩展不能破坏机器人身份、权限和安全约束。
2. 对应长期产品演进：未来新增药箱、看护、巡护或服务能力时，需要可治理的能力包边界。
3. 对应双视角一致性：本体实体架构和运行时功能架构不能漂移成多套互不一致的 agent。

资源消耗与部署信号：

1. 论文主要是架构与仿真验证，未给出端侧 CPU / GPU / 内存消耗。
2. `48` 页系统论文说明其概念完整，但一代直接照搬会增加复杂度。
3. hot-swapping 和 policy-separated runtime 可作为 Kinbot 未来能力升级治理参考。

优势：

1. 单持久主体思想与 Kinbot “家庭共居智能体”主线有概念共振。
2. 策略层独立于能力模块，有助于能力扩展时保持安全边界。
3. 失败恢复和非法动作拦截指标明确。

劣势与风险：

1. 主要在机械臂仿真上验证，家庭移动机器人场景需要重做实证。
2. ECM 若被直接映射成新增模块体系，会让 Kinbot 一代复杂度上升。
3. 论文未给出量产资源和实时性指标。

推荐理由：

建议作为运行时治理思想输入，而不是新建 `AEROS` 式架构。Kinbot 可以吸收“单主体 + 能力包 + 策略层”的边界原则，用于未来 OTA / 能力升级，但当前一代主线仍保持既有模块结构。

### 3.9 Evaluating Generative Models as Interactive Emergent Representations of Human-Like Collaborative Behavior

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.03855](https://arxiv.org/abs/2605.03855) |
| 提交日期 | 2026-05-05 |
| 分类 | `cs.RO` |
| 状态 | Under review |
| 方法关键词 | human-AI collaboration, mental model, collaborative behavior, LLM judges, user study |

摘要要点转述：

论文研究 embodied foundation model agent 是否能在协作任务中表现出类似人类的协同行为，进而反映对协作者的心智模型。作者构建了一个 `2D` 协作游戏环境，让 LLM agent 和人类完成颜色匹配任务，并定义 `5` 类协作行为：视角采择、感知协作者的规划、自省、心智理论和澄清。自动行为检测系统使用 LLM-based judges 标注这些行为，与人工标注达到 fair 到 substantial 的一致性。结果显示，不同 foundation model 在协作阶段会表现出不同频率的协同行为；用户研究也显示参与者认可 agent 的任务聚焦、计划表达和主动性，但希望响应更快、更像人。

解决 Kinbot 的什么问题：

1. 对应 Kinbot `companion_interaction`：陪伴不是单轮问答，而是与老人、家属和机器人任务状态持续协作。
2. 对应 `decision_orchestration`：机器人需要在任务中澄清、解释计划、识别人的视角和意图变化。
3. 对应体验评测：Kinbot 需要评估“是否像可靠协作者”，而不只是回答正确率。

资源消耗与部署信号：

1. 论文未给出端侧推理延迟和模型大小，响应速度问题由用户研究间接暴露。
2. 评测环境为 `2D` 游戏，资源成本低，但与真实家庭机器人差距明显。
3. LLM judge 可作为离线日志标注工具，不建议直接进入运行时闭环。

优势：

1. 给出协作行为标签，有助于 Kinbot 设计陪伴交互评测 rubrics。
2. 同时包含自动标注和用户研究，避免纯模型自评。
3. 将“澄清”和“计划表达”纳入协作行为，贴近家庭任务执行。

劣势与风险：

1. 游戏环境过于简化，无法覆盖老人看护、健康提醒和家庭巡护的真实风险。
2. LLM judge 可能受提示和模型偏见影响。
3. emergent collaborative behavior 不等于可被信任的安全行为。

推荐理由：

建议作为 Kinbot 陪伴协作评测方法输入。可把 `5` 类行为转成离线对话 / 任务回放评分维度，但必须另加安全、隐私、响应时间和误解修复指标。

### 3.10 RoboAlign-R1: Distilled Multimodal Reward Alignment for Robot Video World Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.03821](https://arxiv.org/abs/2605.03821) |
| 提交日期 | 2026-05-05 |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | robot video world model, reward alignment, RobotWorldBench, lightweight reward model, Sliding Window Re-encoding |

摘要要点转述：

论文关注机器人视频 world model 的目标错配：传统训练目标偏重重建和感知相似度，但机器人决策更关心指令跟随、操作成功和物理合理性。作者构建 `RobotWorldBench`，包含 `10,000` 条带注释的视频-指令对，并训练多模态教师 judge `RoboAlign-Judge`，从 `6` 个维度评价生成视频。随后作者把教师蒸馏为轻量学生 reward model，用于强化学习式后训练；同时提出 `Sliding Window Re-encoding`，周期性刷新生成上下文以降低长时预测漂移。结果显示，`RoboAlign-R1` 总体六维得分相对最强 baseline 提升 `10.1%`，操作准确性提升 `7.5%`，指令跟随提升 `4.6%`；SWR 仅增加约 `1%` latency，同时提升 SSIM `2.8%`、降低 LPIPS `9.8%`。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 未来使用 world model 做任务预演、异常解释或策略评估时的“视频看起来像，但任务不对”问题。
2. 对应 `observability_data_governance`：需要把模型评估维度从视觉相似度扩展到任务一致性、物理合理性和指令跟随。
3. 对应 `decision_orchestration` 的低频预演：复杂任务执行前可以离线或云端做候选轨迹评估。

资源消耗与部署信号：

1. 数据集规模为 `10,000` 个视频-指令对，后训练和 judge 不适合一代端侧常驻。
2. SWR 额外延迟约 `1%`，但前提是已有视频 world model 推理成本可接受。
3. 轻量学生 reward model 是工程化亮点，但论文摘要未给出具体参数量和端侧指标。

优势：

1. 把 world model 从“重建好看”拉回机器人任务价值。
2. 六维评价和人类盲评交叉验证有助于减少单一指标误导。
3. SWR 针对长时漂移问题，有实际部署启发。

劣势与风险：

1. 当前仍偏研究前沿，不适合直接进入 Kinbot 一代端侧运行。
2. 操作任务数据与家庭移动交互任务仍有差距。
3. 如果引入 world model 预演，会显著增加架构复杂度和算力需求。

推荐理由：

建议保留为 world model 对齐观察项。Kinbot 当前只吸收评测思想：任务一致性、物理合理性、指令跟随和长时漂移应成为未来预演模型评价维度；不建议回写一代主线。

## 4. 对 Kinbot 的落地 / 文档建议

本轮不建议直接回写 `docs/00_governance/03_decision_log.md` 或主线架构文档，原因是这些论文仍属于研究输入，尚未形成经用户确认的稳定产品 / 架构判断。

建议后续只做 4 个轻量吸收动作：

1. 在 Phase 5 验证设计中补一张端侧 LLM 选型表：TPS、J/token、TTFT、任务质量、隐私等级、故障降级。
2. 在运行时验证中补一个混合关键性压力测试：安全控制周期抖动、用户态负载、视觉高峰负载和大模型调用同时存在时的边界。
3. 在 `world_state_memory` 研究池中新增“选择性遗忘”小题：事件分级、用户纠正规则、不可遗忘白名单、查询耗时和存储上限。
4. 在纯视觉导航验证集中补退化条件矩阵：低光、运动模糊、遮挡、反光、烟雾 / 雾化和组合退化。

本轮未进入主线的原因：

1. `FUS3DMaps`、`AEROS` 和 `RoboAlign-R1` 的能力形态有价值，但若直接吸收会增加一代架构复杂度。
2. `Safety in Embodied AI` 是综述索引，适合提炼测试清单，不直接成为事实源。
3. `Human-AI collaboration` 评测仍在简化环境中，需等待 Kinbot 自有场景回放验证。
4. 本轮没有论文足以改变当前纯视觉主线、`12GB + 32GB` 量产资源线或 `5000 到 6000 元` BOM 冻结基线。

## 5. 来源

- arXiv `cs.RO/new` listing: [Robotics new submissions, Wednesday 6 May 2026](https://arxiv.org/list/cs.RO/new)
- arXiv `cs.RO/recent` listing: [Robotics recent submissions](https://arxiv.org/list/cs.RO/recent)
- [2605.03111 | Benchmarking Local Language Models for Social Robots using Edge Devices](https://arxiv.org/abs/2605.03111)
- [2605.03641 | Jiao: Bridging Isolation and Customization in Mixed Criticality Robotics](https://arxiv.org/abs/2605.03641)
- [2604.11306 | Learning to Forget -- Hierarchical Episodic Memory for Lifelong Robot Deployment](https://arxiv.org/abs/2604.11306)
- [2605.03678 | Robust Visual SLAM for UAV Navigation in GPS-Denied and Degraded Environments](https://arxiv.org/abs/2605.03678)
- [2605.03669 | FUS3DMaps](https://arxiv.org/abs/2605.03669)
- [2605.02900 | Safety in Embodied AI](https://arxiv.org/abs/2605.02900)
- [2605.02983 | Human-in-the-Loop Uncertainty Analysis in Self-Adaptive Robots Using LLMs](https://arxiv.org/abs/2605.02983)
- [2604.07039 | AEROS](https://arxiv.org/abs/2604.07039)
- [2605.03855 | Evaluating Generative Models as Interactive Emergent Representations of Human-Like Collaborative Behavior](https://arxiv.org/abs/2605.03855)
- [2605.03821 | RoboAlign-R1](https://arxiv.org/abs/2605.03821)
