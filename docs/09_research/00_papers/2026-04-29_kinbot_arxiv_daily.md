# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-04-29
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-04-29 | Codex-架构师 | 基于联网检索 arXiv，筛选与 Kinbot 纯视觉/VLN、端侧资源、语义空间记忆和老人健康安全相关的 7 篇论文并形成结构化评估。

---

## 1. 检索口径

本轮检索日期：2026-04-29。

检索范围：

1. arXiv 官方页面与 arXiv API。
2. 关键词组合包括 `vision-language navigation`、`VLA navigation`、`home robot emergency`、`metric depth estimation robot`、`embodied memory robot`、`fall detection elderly`、`companion robot LLM`。
3. 优先选择近一年内论文；若论文虽非最新但高度贴合 Kinbot 家庭安全闭环，则作为补充纳入。

筛选标准：

1. 是否解决 Kinbot 一代主线问题：纯视觉感知、VLN/VLA 导航、端侧资源、世界状态记忆、健康安全事件、家庭应急响应。
2. 是否给出真实部署、资源消耗、延迟、模型大小或工程约束信号。
3. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`human_health_sensing`、`world_state_memory`、`decision_orchestration`、`safety_compliance_authorization`、`observability_data_governance`。
4. 是否符合一代约束：端侧原始数据处理、纯视觉主线、`12GB RAM + 32GB Flash` 默认量产线、`>4h` 续航和 `5000 到 6000 元` 当前冻结 BOM 目标；`10000 元 BOM` 仅作为 `KBT-57` 承接的战略分支参考，不直接改写当前量产基线。

## 2. 本轮总判断

本轮最值得 Kinbot 立即吸收的不是新的“大模型口号”，而是 3 类工程信号：

1. `LiveVLN` 和 `HiCo-Nav` 共同说明：真实机器人导航的痛点已经从“模型能不能答对”转向“推理、感知、执行如何异步解耦”。这直接对应 Kinbot 样机当前“VLN 推理和算法解算时间开销高、走得犹豫”的问题。
2. `VIMD` 说明：纯视觉路线不能只押单目相对深度，必须把 IMU、稀疏 VIO/SLAM 点、多视角时序一致性纳入深度估计基线。
3. `EmbodiedLGR`、`HomeEmergency` 和跌倒解释性检测论文说明：家庭机器人需要结构化语义空间记忆与可解释健康安全事件，而不是只把所有问题交给一个 VLM 即时推理。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | LiveVLN | 进入 `mobility_navigation` 与 `decision_orchestration` 的运行时调度专项，验证非阻塞执行接口。 |
| A | VIMD | 进入纯视觉深度估计候选池，作为 `RGB + IMU + 轮速/稀疏点` 的度量深度评估基线。 |
| A- | HiCo-Nav | 吸收三层异步架构和认知记忆图，但不能照搬其激光雷达、深度相机和云 API 依赖。 |
| B+ | FreqCache | 作为端侧 VLN/VLA 加速候选，后续在 `4B / 7B / 8B + FP8` 任务模板中做板级验证。 |
| B | EmbodiedLGR | 吸收“图记忆 + RAG”分层思想，但资源口径高于 Kinbot 默认量产线。 |
| B | Explainable Fall Detection | 可作为跌倒事件二级解释器或后台复核输入，不宜单独承担跌倒闭环。 |
| B- | HomeEmergency | 高度贴合家庭安全巡护，但依赖音频方向、活动热图和 VLM，应作为场景与数据集参考。 |

## 3. 论文卡片

### 3.1 LiveVLN: Breaking the Stop-and-Go Loop in Vision-Language Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.19536](https://arxiv.org/abs/2604.19536) |
| 提交日期 | 2026-04-21 |
| 分类 | `cs.RO` |
| 代码 | 论文页面标注 GitHub 可用 |

摘要要点转述：

这篇论文关注真实机器人 VLN 部署中常见的停停走走问题。作者认为瓶颈不只是动作生成慢，而是感知、传输、推理和执行被串行阻塞。论文提出一个无需重新训练的运行时框架，在机器人执行短前缀动作时，后台刷新后续动作；系统用 guard buffer 和可修订 tail 保持动作持续可用，同时保留根据新观测修正后续动作的能力。实验显示，在真实机器人部署中，该方法显著降低等待时间和暂停次数，同时基本保持原有导航成功指标。

解决 Kinbot 的什么问题：

1. 直接对应样机“反应慢、走得犹豫”的问题。
2. 对应 `R2 执行环` 和 `R3 任务环` 的异步解耦：底盘不应等待高层 VLM/VLN 完整推理后才继续运动。
3. 对应执行范式协调机制：高层推理可以慢，但必须被本地安全执行环包住。

资源消耗与部署信号：

1. 方法本身是无需训练、与模型架构弱耦合的运行时封装，不要求换模型。
2. 论文真实机器人实验中，LiveVLN 将 StreamVLN 平均等待时间从 `7.32s` 降到 `1.63s`，将 NaVIDA 从 `10.64s` 降到 `2.89s`。
3. 可见执行间隙从约 `0.96s / 1.09s` 降到约 `0.11s / 0.16s`。
4. 系统需要 VLN 模型能够输出多步动作 continuation，并需要测量本体动作执行时长和端到端推理延迟。

优势：

1. 对 Kinbot 当前痛点极具针对性，不要求先把 VLN 模型彻底换掉。
2. 与分层导航、安全门控和局部规划共存，不破坏当前“VLN 管语义，本地导航管安全”的主线。
3. 可作为评测方法升级，把等待时间、暂停次数、可见停顿纳入 VLN 部署指标。

劣势与风险：

1. 需要给每类动作定义可提前承诺的安全前缀，否则可能在动态家庭场景中扩大执行风险。
2. 如果高层模型输出动作粒度过粗，guard buffer 会损伤在线修正能力。
3. 论文验证平台不是 Kinbot 底盘，真实效果需要在轮式底盘和家庭门槛、狭窄通道中复测。

推荐理由：

强烈建议进入 Kinbot 下一轮 VLN 运行时专项。第一步不必复现全部论文，只需在现有样机上记录 `T_sensor_sync`、`T_model`、`T_local_plan`、`T_execution`、`N_pause` 和可见停顿，再做一个最小 guard buffer 原型。

### 3.2 VIMD: Monocular Visual-Inertial Motion and Depth Estimation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2509.19713](https://arxiv.org/abs/2509.19713) |
| 首次提交 / 最新版本 | 2025-09-24 / 2026-02-09 |
| 分类 | `cs.CV`, `cs.RO` |

摘要要点转述：

这篇论文面向机器人和 XR 中的稠密度量深度估计问题。作者用基于 MSCKF 的单目视觉惯性运动估计提供稀疏度量深度点和相机运动，再用轻量 GRU 迭代细化每像素尺度，而不是只用全局仿射尺度去校正单目深度。论文强调该方法可兼容不同深度 backbone，并在只有 `10 到 20` 个稀疏度量点的情况下仍能保持较强鲁棒性。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 一代纯视觉主线中“低成本 RGB 相机 + IMU / 轮速计”如何补齐度量深度的问题。
2. 对应低传感底盘造成的 `C1 / C2 / C5` 压力转移：不能只用相对深度，要建立可与局部规划、避障和门槛通过对接的度量深度链路。
3. 对应夜间和低照闭环的研发基线：后续可以测试低光 ISP、图像增强和稀疏特征质量对深度稳定性的影响。

资源消耗与部署信号：

1. 使用轻量 ResNet-18 backbone 和 GRU refinement。
2. 论文报告模型大小约 `15.1 MB`，在 NVIDIA RTX 2080Ti 上约 `19.6 ms/frame`。
3. 相比 SML 基线，模型更小，但由于 GRU refinement，单帧耗时略高。
4. 方法依赖 VIO/SLAM 稀疏点质量；若家庭弱纹理、反光、低光或快速运动导致稀疏点退化，深度质量也会下降。

优势：

1. 比纯单目相对深度更贴近 Kinbot 的工程需求，因为它显式引入 IMU 和稀疏度量点。
2. 模型体积小，适合作为端侧深度估计候选，而不是只作为云端算法。
3. 论文的“极稀疏度量点也能校正稠密深度”适合 Kinbot 低传感量产路线。

劣势与风险：

1. 论文未直接证明在 `12GB RAM + 32GB Flash` 的国产端侧平台上可实时运行。
2. 家庭机器人低速移动、弱纹理墙面、地面反光、夜间暗光与动态人群，和论文数据集仍有明显差距。
3. 需要和双目、多目几何融合一起评估，不能单独替代整个深度链路。

推荐理由：

建议纳入 `S2 相机与深度路线` 的候选算法池，并设置 Kinbot 自有验证集：低矮门槛、地毯边缘、桌椅腿、老人腿部、弱光走廊、反光地面。通过指标应包括深度误差、局部避障误报/漏报、热稳态帧率和与局部 costmap 的一致性。

### 3.3 A Deployable Embodied Vision-Language Navigation System with Hierarchical Cognition and Context-Aware Exploration

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.21363](https://arxiv.org/abs/2604.21363) |
| 提交日期 | 2026-04-23 |
| 分类 | `cs.RO` |
| 代码 | 论文页面与正文标注 GitHub 可用 |

摘要要点转述：

这篇论文提出一个可部署的具身 VLN 系统，把机器人导航拆成三个异步层：实时感知与规划层、空间语义记忆层、高层 VLM 推理层。系统增量构建认知记忆图，并把图拆成子图供 VLM 推理；在探索阶段，作者把候选视点选择建模为带上下文权重的 Traveling Repairman Problem，以减少发现目标前的等待时间。论文在仿真和真实机器人上展示了比若干 VLN 基线更好的导航成功率和效率。

解决 Kinbot 的什么问题：

1. 对应 Kinbot “VLN 不应直接接管底盘级安全控制，而应做语义导航策略层”的主线。
2. 对应 `world_state_memory` 如何把家庭空间组织成可检索、可推理、可探索的语义图。
3. 对应找人、找物、到达和搜索失败恢复等 `R3 任务环` 能力。

资源消耗与部署信号：

1. 论文系统图中实时感知层约 `20 Hz`，记忆低频更新约 `1 到 2 Hz`。
2. 仿真效率实验使用 NVIDIA RTX 5090 和 AMD Ryzen 9 9950X3D；在线版本任务平均时间约 `21.5s`，帧处理约 `0.22s`。
3. 真实机器人为 Unitree 四足平台，传感器包含 Mid-360 LiDAR、RealSense D455 和 Jetson Orin NX；高层推理使用 Qwen3-Omni API，效率表也包含本地 Qwen3-VL-8B 口径。
4. 真实物体搜索中，大物体成功率 `95%`，小物体 `65%`，小物体失败主要来自运动振动导致的图像模糊和检测不稳。

优势：

1. 架构分层与 Kinbot 当前多尺度执行范式高度一致。
2. 明确把高频感知、低频记忆和持续高层推理解耦，符合端侧资源调度方向。
3. 认知记忆图和全局探索优化对“找药、找人、找物、确认异常”有参考价值。

劣势与风险：

1. 真实部署使用 LiDAR、深度相机和云 API，不能直接作为 Kinbot 一代纯视觉量产方案。
2. 仿真效率数据来自高端桌面 GPU，不代表 `12GB RAM + 32GB Flash` 默认量产线。
3. 小物体和细粒度目标受检测质量限制，Kinbot 若要做药品/小物递送，仍需要专门视觉闭环。

推荐理由：

建议把它作为 `mobility_navigation + world_state_memory + decision_orchestration` 的架构参考，而不是算法照搬对象。Kinbot 可吸收“三层异步 + 认知记忆图 + 全局候选视点排序”，但必须用纯视觉输入、端侧模型和本地 planner 重写验证。

### 3.4 FreqCache: Accelerating Embodied VLN Models with Adaptive Frequency-Guided Token Caching

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.24391](https://arxiv.org/abs/2604.24391) |
| 提交日期 | 2026-04-27 |
| 分类 | `cs.RO` |

摘要要点转述：

这篇论文关注 VLN 模型高计算开销。作者指出，普通视觉 token cache 方法直接迁移到导航任务会出问题：机器人视角移动导致 patch 位置变化，障碍物边缘容易被错误缓存，场景复杂度随时间变化而固定 cache 预算不合适。论文提出 FreqCache，用频域信息判断 token 是否可复用，并动态调整缓存预算，同时避免把门框、障碍边缘等关键高频信息缓存错。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 端侧 VLN/VLM 的 `TTFT / TPS` 和热稳态压力。
2. 对应 `R2 / R3` 中高频多帧视觉输入的 token 复用问题。
3. 对应低传感纯视觉路线下“不能因为压算力而丢掉障碍边缘”的安全要求。

资源消耗与部署信号：

1. 论文报告整体约 `1.59x` step speedup。
2. 频域模块平均额外开销约 `2.54 ms/step`。
3. 完整方案 token reuse 约 `53.5%`，并保持较高 SR / SPL。
4. 硬件实现采用 GPU 上三进程并行：核心 VLA 推理、频域处理、token 选择与 cache 更新。

优势：

1. 不需要重新训练模型，适合先做工程验证。
2. 关注导航中特有的视角迁移和障碍边缘问题，比普通 VLM cache 更贴合机器人安全。
3. 动态 cache budget 可接入 Kinbot 的资源状态调度器。

劣势与风险：

1. 论文仍以 GPU 并行为主要实现口径，国产端侧 NPU / GPU / CPU 混合平台未验证。
2. Token cache 的收益依赖模型结构和视觉 token 管线，未必能直接套到 Kinbot 自研 4B/7B/8B 模型。
3. 对低光、运动模糊、多相机拼接的频域稳定性仍需单独验证。

推荐理由：

建议作为 `platform_runtime` 的加速候选进入观察验证。优先在离线日志上复测：同一家庭连续运动视频中，缓存复用率、关键边缘漏刷新率、VLN 输出稳定性和端侧延迟收益。

### 3.5 EmbodiedLGR: Integrating Lightweight Graph Representation and Retrieval for Semantic-Spatial Memory in Robotic Agents

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.18271](https://arxiv.org/abs/2604.18271) |
| 提交日期 | 2026-04-20 |
| 分类 | `cs.RO` |

摘要要点转述：

这篇论文解决机器人语义空间记忆越来越大、检索越来越慢的问题。作者提出 EmbodiedLGR-Agent，把低层对象和位置存入语义图，把高层场景描述保留在传统 RAG 结构中。系统提供语义、位置和时间三类检索工具，让 LLM 在简单问题上优先查图，在复杂问题上回退到向量数据库。论文在 NaVQA 上验证查询效率，并在真实机器人上本地运行 VLM 与记忆构建/检索流程。

解决 Kinbot 的什么问题：

1. 对应 Kinbot `world_state_memory`：家庭物品、房间、事件和用户历史不能只堆在向量数据库里。
2. 对应最小 `R4` 治理接口与长周期演化研究线：机器人要记住“某物在哪里、何时见过、是否可带用户过去”。
3. 对应长期陪伴和健康管理：需要把家庭环境记忆、事件记忆和用户偏好分层管理。

资源消耗与部署信号：

1. PC 测试配置为 AMD Ryzen 7 3700X、RTX3060 12GB、32GB DDR4。
2. 真实机器人为 AgileX Bunker Pro，计算平台为 Jetson AGX Orin 64GB。
3. 本地 VLM 使用 Florence-2-large，约 `0.77B`，未量化；LLM 调用 GPT-4o API。
4. 真实部署包含 ZED X 相机、Velodyne 3D LiDAR、SLAM 与 Nav2。

优势：

1. “图记忆处理原子空间事实，RAG 处理复杂语义描述”的分层很适合 Kinbot。
2. 支持位置、时间和语义多种查询，有利于家庭物品寻找、事件回溯和巡护解释。
3. 相比单纯向量记忆，更容易做可审计、可删除、可修改的家庭记忆。

劣势与风险：

1. 资源配置高于 Kinbot 默认量产线，Jetson AGX Orin 64GB 不能作为一代默认假设。
2. 论文仍使用 LiDAR、ZED 和云端 LLM，不符合 Kinbot 一代纯视觉和端侧隐私默认边界。
3. LLM 工具调用错误会导致错误检索或错误导航目标，需要安全门控。

推荐理由：

建议吸收其记忆分层思想，作为 Kinbot `world_state_memory` 的结构参考：家庭长期事实优先图结构，原始片段和复杂语义描述进入受控 RAG，所有可行动检索结果必须经过置信度和安全授权校验。

### 3.6 Explainable Fall Detection for Elderly Care via Temporally Stable SHAP in Skeleton-Based Human Activity Recognition

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.13279](https://arxiv.org/abs/2604.13279) |
| 提交日期 | 2026-04-14 |
| 分类 | `cs.CV`, `cs.AI` |

摘要要点转述：

这篇论文聚焦老人跌倒检测的可解释性。作者认为，跌倒检测不仅要分类准确，还要给临床或护理人员可信的解释；普通 SHAP 逐帧解释在时序数据上容易抖动。论文提出 T-SHAP，用时间平滑方式聚合相邻窗口的 SHAP 归因，让解释更稳定，同时保留 Shapley 值的局部准确性和一致性。实验使用骨架动作数据，报告较高分类准确率和低延迟。

解决 Kinbot 的什么问题：

1. 对应 `human_health_sensing` 中跌倒/异常检测。
2. 对应高风险事件上报时的“为什么判断为跌倒”的解释需求。
3. 对应后台人工服务或家属 App 的事件摘要：机器人不能只发一个黑箱告警。

资源消耗与部署信号：

1. 模型为单层 `128 hidden units` LSTM，主 LSTM 参数约 `104,960`。
2. 论文报告 NTU RGB+D 子任务准确率 `94.3%`。
3. RTX 3070 Ti 上 LSTM 推理约 `4.8 ms`，解释模块约 `12 到 20 ms`，总延迟约 `20 到 25 ms`。
4. 论文明确指出边缘设备性能仍需另测；且使用的是骨架输入，真实部署还需要本地人体姿态估计。

优势：

1. 轻量、低延迟、可解释，适合作为跌倒事件的二级确认或告警解释模块。
2. 骨架表示比原始 RGB 更符合隐私最小化原则。
3. 能把跌倒解释落到下肢不稳、脊柱姿态变化等人体运动模式上，利于人工复核。

劣势与风险：

1. 论文没有验证真实家庭机器人视角、遮挡、夜间和老人缓慢倒地等长尾情况。
2. Kinbot 仍需端侧从 RGB 提取稳定骨架；姿态估计本身可能比 LSTM 更耗资源。
3. 不应作为唯一跌倒检测链路，必须和穿戴、UWB、语音呼救、地面异常姿态等多源证据融合。

推荐理由：

建议作为 `human_health_sensing` 的候选二级解释器，而不是主检测器。Kinbot 的第一版跌倒闭环应采用多源融合：视觉骨架 + 穿戴活动状态 + 语音/声响 + 交互确认 + 家属上报策略。

### 3.7 HomeEmergency -- Using Audio to Find and Respond to Emergencies in the Home

| 项目 | 内容 |
| --- | --- |
| arXiv | [2504.01089](https://arxiv.org/abs/2504.01089) |
| 提交日期 | 2025-04-01 |
| 分类 | `cs.RO`, `cs.AI` |
| 发表状态 | 论文页面标注 IEEE Robotics and Automation Letters, 2025 |

摘要要点转述：

这篇论文提出 HomeEmergency 任务：家庭机器人听到瞬时或周期性声音后，需要判断是否存在家庭应急事件，并导航到多房间家庭场景中的可能位置。作者构建了基于 ThreeDWorld 的家庭应急数据集，并提出概率动态场景图 P-DSG，把用户活动位置、音频方向、房间和物体风险结合起来，用贝叶斯更新定位可能的应急源。系统也使用 VLM 判断物体属性和应急状态，并在真实小型移动机器人上做了演示。

解决 Kinbot 的什么问题：

1. 对应家庭安全巡护中的“听到摔倒、呼救、报警声后如何找人/找事件”。
2. 对应麦克风阵列优势：Kinbot 团队已有语音和麦阵基础，音频方向可成为纯视觉之外的安全事件触发输入。
3. 对应 `R3 任务环` 的异常确认路径：从声响触发，到定位，到靠近，到视觉/语音确认，再到家属上报。

资源消耗与部署信号：

1. 真实测试使用小型移动机器人、第一视角相机和麦克风阵列。
2. 方法依赖概率动态场景图、音频方向估计、用户活动热图和 VLM。
3. 真实测试中，作者方法 AG SR 为 `0.83`，基线为 `0.60`；应急误漏相关指标优于基线。
4. 论文没有给出端侧延迟、功耗和模型大小，因此只能作为场景与方法参考。

优势：

1. 任务设定非常贴合 Kinbot 家庭应急闭环。
2. 用音频方向缩小搜索空间，能减少机器人盲目巡航。
3. P-DSG 与 Kinbot 世界状态图可以兼容，适合记录“用户常在何处、声音来自何处、风险物在哪里”。

劣势与风险：

1. 活动热图存在隐私和合规压力，必须按 Kinbot 本地处理、可查看、可删除原则设计。
2. 背景噪声、电视声、装修声、宠物和多住户会显著增加误触发。
3. 论文用 RGBD/仿真条件较多，距离 Kinbot 纯视觉量产路线仍有工程差距。

推荐理由：

建议纳入安全巡护场景库，而不是立即纳入量产算法主线。最小可行验证可以先做“异常声响触发 + 房间级声源方向 + 找人/确认 + 家属摘要”闭环，不急于让 VLM 独立判定所有应急类型。

## 4. 对 Kinbot 的落地建议

### 4.1 导航运行时专项

建议新增或更新一个 VLN 运行时验证任务，目标不是先换模型，而是验证非阻塞执行：

1. 在现有样机上记录每轮 `Observe -> Orient -> Decide -> Act` 的分段耗时。
2. 把可见停顿、暂停次数、等待时间比例加入 VLN 评测。
3. 设计最小 `guard buffer`，由本地 planner 和安全门控确认可执行前缀。
4. 保留高层 VLM 对 tail 的修订权，禁止高层模型直接越过 `R1/R2` 安全链。

### 4.2 纯视觉深度专项

建议将 `VIMD` 类视觉惯性度量深度加入候选池：

1. 与双目深度、多目几何融合、自研单目深度一起横评。
2. 验证 `10 到 20` 个稀疏度量点是否足以支撑家庭局部避障。
3. 重点测试低光、地毯边缘、低矮门槛、反光地面、老人腿部和小宠物等一代风险场景。
4. 所有结果必须回到 `C1 / C2 / C5`：模型大小、热稳态帧率、端侧内存、功耗和误报/漏报。

### 4.3 世界状态与长期记忆专项

建议把家庭记忆拆成 3 层：

1. 可行动空间图：房间、通道、家具、可达点、禁入区域。
2. 可检索语义图：物体、人物、事件、时间、位置、置信度。
3. 受控 RAG 记忆：摘要、对话中允许长期记忆的片段、健康历史和用户偏好。

所有“机器人要移动过去”的记忆检索结果，都必须经过安全门控、置信度阈值和必要的人机确认。

### 4.4 健康安全事件专项

建议采用多源融合，而不是单模型闭环：

1. 跌倒：视觉骨架/姿态、穿戴活动状态、音频声响、用户响应、历史身体状态共同判断。
2. 久卧不起：用户习惯、床边/房间位置、穿戴数据和交互确认共同判断。
3. 家庭应急：麦阵方向、智能家居事件、视觉确认、房间级搜索策略共同判断。
4. 上报摘要必须包含证据链：时间、地点、触发源、机器人确认动作、是否联系到用户。

## 5. 本轮未进入主线的原因

本轮论文只作为研究输入，不直接修改系统架构基线，原因如下：

1. 部分论文依赖 LiDAR、RGBD、云 API 或高端 GPU，与 Kinbot 一代纯视觉和默认量产资源线不完全一致。
2. 论文指标多来自公开 benchmark 或特定真实机器人平台，缺少 Kinbot 家庭样机、国产端侧芯片和低光家居场景验证。
3. 若后续验证通过，应由对应专项文档吸收，再回写 `docs/00_governance/03_decision_log.md`。

## 6. 来源

1. [LiveVLN: Breaking the Stop-and-Go Loop in Vision-Language Navigation](https://arxiv.org/abs/2604.19536)
2. [VIMD: Monocular Visual-Inertial Motion and Depth Estimation](https://arxiv.org/abs/2509.19713)
3. [A Deployable Embodied Vision-Language Navigation System with Hierarchical Cognition and Context-Aware Exploration](https://arxiv.org/abs/2604.21363)
4. [FreqCache: Accelerating Embodied VLN Models with Adaptive Frequency-Guided Token Caching](https://arxiv.org/abs/2604.24391)
5. [EmbodiedLGR: Integrating Lightweight Graph Representation and Retrieval for Semantic-Spatial Memory in Robotic Agents](https://arxiv.org/abs/2604.18271)
6. [Explainable Fall Detection for Elderly Care via Temporally Stable SHAP in Skeleton-Based Human Activity Recognition](https://arxiv.org/abs/2604.13279)
7. [HomeEmergency -- Using Audio to Find and Respond to Emergencies in the Home](https://arxiv.org/abs/2504.01089)
