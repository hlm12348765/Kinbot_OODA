# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-04-30
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-04-30 | Codex-架构师 | 基于联网检索 arXiv，筛选与 Kinbot 纯视觉导航、世界状态记忆、运行时安全、端侧具身模型和家属 App / 机器人跨界面协同相关的 7 篇论文并形成结构化评估。

---

## 1. 检索口径

本轮检索日期：2026-04-30。

检索范围：

1. arXiv 官方 `abs` 页面与论文 PDF。
2. 关键词组合包括 `embodied navigation`、`RGB-only navigation`、`semantic graph memory`、`robot navigation safety`、`vision-language navigation`、`GUI embodied navigation`、`visual prompt navigation`。
3. 优先选择未在 `2026-04-29` 日报中收录、且对 Kinbot 当前 `P1 / Phase 5` 验证有工程启发的论文。

筛选标准：

1. 是否对应 Kinbot 一代主线问题：纯视觉导航、局部避障、世界状态记忆、长期空间理解、低延迟执行、老人家庭场景的可解释安全闭环。
2. 是否给出真实机器人部署、资源消耗、训练硬件、实验平台、延迟或模型规模信号。
3. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`decision_orchestration`、`safety_compliance_authorization`、`platform_runtime`、`companion_interaction`。
4. 是否符合一代约束：纯视觉主线、端侧原始敏感数据处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。依赖 LiDAR、RGB-D、云 API、高端 GPU 或大规模训练集的内容，只作为研发验证或对照基线。

## 2. 本轮总判断

本轮论文给 Kinbot 的关键启发不是“再增加一个大模型模块”，而是把已有主线压回 3 个可验证问题：

1. **导航要双层化**：`TANGO`、`Nav-R1`、`LiveVLN` 类工作共同指向同一件事：高层语义 / 推理可以慢，但底层局部执行必须有连续、低延迟、可回退的控制链。
2. **世界状态记忆要在线构建**：`ABot-Explorer` 说明空间记忆不能只靠离线扫描或事后建图，机器人探索时就应捕获门、走廊、房间边界等语义锚点。
3. **安全不能只靠几何避障**：`HJ reachability` 和 `ViLiNT` 说明局部规划需要把动态可达性、机器人尺寸、未来碰撞风险和传感不确定性纳入，而不是只做当前帧障碍物距离判断。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | TANGO | 纳入纯视觉拓扑-度量导航候选池，验证 `RGB-only + monocular depth + traversability + fallback` 的最小样机价值。 |
| A- | A Hamilton-Jacobi Reachability-Guided Search Framework | 纳入局部规划安全对照，重点吸收离线可达性预计算和在线安全剪枝思想。 |
| A- | ABot-Explorer | 纳入 `world_state_memory` 与探索专项，吸收在线语义锚点记忆，不照搬其离板 RTX 4090 推理配置。 |
| B+ | Nav-R1 | 作为 `R3` 语义推理与 `R2` 低延迟控制解耦参考，但需严控 CoT 外泄、延迟和端侧模型规模。 |
| B | ViLiNT | 作为多模态 / 尺寸感知局部导航对照基线；一代不可直接采用其 LiDAR 依赖。 |
| B- | VPN | 作为家属 App / 调试台“视觉路线标注”交互参考，不作为机器人自主导航主线。 |
| C+ | NaviMaster | 作为 App 与机器人跨界面策略统一的远期研究输入；训练资源明显超过一代近期可落地范围。 |

## 3. 论文卡片

### 3.1 TANGO: Traversability-Aware Navigation with Local Metric Control for Topological Goals

| 项目 | 内容 |
| --- | --- |
| arXiv | [2509.08699](https://arxiv.org/abs/2509.08699) |
| 提交日期 | 2025-09-10 |
| 分类 | `cs.RO`, `cs.AI`, `cs.CV`, `cs.LG`, `eess.SY` |
| 代码 | 论文页面标注代码公开 |

摘要要点转述：

这篇论文提出一个 `RGB-only` 的对象级拓扑-度量导航管线。系统先用对象级拓扑图确定语义子目标，再用单目深度与可通行性估计生成局部 BEV cost map 和连续轨迹。当局部 traversability 失败时，系统自动回退到基线视觉伺服控制，避免机器人在狭窄家庭空间里停住。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 一代纯视觉导航中“语义目标能找到，但局部走法不稳”的问题。
2. 对应 `mobility_navigation` 的分层：高层对象 / 房间级目标和底层局部轨迹不应混在一个 VLM 里。
3. 对应家庭场景的可解释 fallback：当地面、桌椅腿、门槛或遮挡导致 traversability 不确定时，需要可控降级而不是继续相信模型。

资源消耗与部署信号：

1. 论文明确强调 `RGB-only`，局部控制使用 FastSAM、LightGlue、Depth Anything、CLIP 等基础模型组合。
2. 真实演示报告约 `5 Hz`。
3. 仿真评估使用 HM3D / InstanceImageNav，`No-GT` 设置下 TANGO 在 `1-3m / 3-5m / 8-10m` 轨迹上的成功率分别为 `61.76% / 43.14% / 21.57%`，优于 RoboHop 和 PixNav。
4. Auto-switch fallback 在 hard `3-5m` 设置下将成功率从 `62.14%` 提升到 `73.78%`。

优势：

1. 与 Kinbot 纯视觉主线最贴合，不要求 LiDAR 或深度相机作为产品 fallback。
2. 拆分拓扑目标和局部度量控制，符合 Kinbot 当前“VLN 管语义，本地导航管安全”的架构纪律。
3. fallback 机制直接适合 Phase 5 验证，把失败恢复能力纳入导航指标。

劣势与风险：

1. 依赖多个视觉基础模型，端侧算力、热稳态和模型裁剪压力较大。
2. 长距离成功率仍有限，不能单独承担老人家中找人、找药、跨房间巡护的完整闭环。
3. 单目深度和 traversability 在夜间、反光地面、地毯边缘和低矮门槛上仍需 Kinbot 自有数据复测。

推荐理由：

建议进入 `S2 / mobility_navigation` 候选池，第一步只复现思想而非完整模型栈：用 Kinbot 现有 RGB 输入生成局部 cost map，加入 traversability 不确定时的可解释 fallback，并记录 `5 Hz` 以上稳定运行、误停、误撞、绕行距离和热稳态功耗。

### 3.2 A Hamilton-Jacobi Reachability-Guided Search Framework for Efficient and Safe Indoor Planar Robot Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.17679](https://arxiv.org/abs/2604.17679) |
| 提交日期 | 2026-04-20 |
| 分类 | `cs.RO` |

摘要要点转述：

这篇论文把离线 Hamilton-Jacobi 可达性分析和在线图搜索结合起来。离线阶段预计算 time-to-reach、静态障碍 backward reachable tube 和人-机器人相对安全值函数；在线阶段把这些值函数作为启发式和安全剪枝，减少搜索空间，同时提前排除未来会走向碰撞的节点。

解决 Kinbot 的什么问题：

1. 对应 `R1/R2` 底盘安全执行环：老人家庭里有人、椅子、桌角和狭窄通道时，局部 planner 不能只做瞬时距离避障。
2. 对应 Phase 5 安全验证：需要一个可解释、可审计的 planner 对照基线，用来评估学习型导航是否过度冒险。
3. 对应端侧实时性：如果纯图搜索节点膨胀，端侧很难满足低延迟控制。

资源消耗与部署信号：

1. A* 使用 TTR heuristic 时，四个任务节点扩展从 `1.291e7` 降到 `6.483e5`，搜索时间从 `414.16s` 降到 `20.97s`，路径成本保持一致。
2. 作者估算优化 C++ planner 每秒约 `1.9e6` 次迭代；原始 Dist heuristic 对应约 `6.8s`，TTR 降到约 `0.34s`，接近室内导航 `500ms` 级需求。
3. ANA* 使用 TTR heuristic 在 12 个任务上成功率从 `7/12` 提升到 `12/12`。
4. BRT 安全剪枝能提升成功率，但当前实现有额外查询开销，需优化 value-function lookup / batching。

优势：

1. 安全逻辑比黑箱学习型 planner 更可解释，适合作为 Kinbot 的安全底线或验证 oracle。
2. 离线预计算、在线查表的模式适合端侧资源受限场景。
3. 可与 Nav2 / SmacPlanner / 自研局部 planner 做对照，不要求改变高层 VLN 主线。

劣势与风险：

1. 论文模型是平面 Dubins 车和受控人模型，距离真实家庭动态物体、老人缓慢移动、儿童和宠物仍有差距。
2. 高维 value function 存储和插值可能挤占 Kinbot `32GB Flash` 与运行时内存预算。
3. 安全约束过保守时会降低通行效率，容易造成机器人“胆小、绕远、停住”。

推荐理由：

建议作为 `safety_compliance_authorization + mobility_navigation` 的研发对照：不必直接量产 HJ planner，但应把“未来可达碰撞风险”和“搜索节点膨胀”纳入局部导航验收指标。

### 3.3 Explore Like Humans: Autonomous Exploration with Online SG-Memo Construction for Embodied Agents

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.19034](https://arxiv.org/abs/2604.19034) |
| 提交日期 | 2026-04-21 |
| 分类 | `cs.CV` |
| 代码 | 论文页面标注 GitHub 可用 |

摘要要点转述：

这篇论文提出 ABot-Explorer：一个在线探索和场景图记忆构建框架。它不先完整扫图再离线建记忆，而是在探索过程中用多视角 RGB 和 VLM 识别门、走廊、楼梯等 Semantic Navigational Affordances，再把这些语义锚点组织成层次化 `SG-Memo`，用于后续导航和问答。

解决 Kinbot 的什么问题：

1. 对应 Kinbot `world_state_memory`：家庭空间记忆需要从“房间/物体列表”升级到“可行动的语义锚点图”。
2. 对应首次入户建图和持续巡护：机器人不能只覆盖面积，还要优先理解门口、过道、房间连接、常用路径。
3. 对应长期陪伴：找人、找物、回忆事件和安全巡护都需要可解释空间记忆，而不是仅依赖向量检索。

资源消耗与部署信号：

1. 输入为 `RGB-only`，训练和推理设置使用四个水平 RGB 相机，每路 `720x640`。
2. 真实部署平台为 MagicDog 四足机器人，四视角相机配置与训练一致。
3. 真实部署中，多视角观测通过 WebSocket 传到离板 NVIDIA RTX 4090 GPU 做 VLM 推理。
4. 数据集扩展 InteriorGS，并补充超过 `1000` 个室内场景的 SNA / SG-Memo 标注。

优势：

1. “探索即建记忆”的思想非常适合 Kinbot 的入户初始化、夜间巡护和家庭变化检测。
2. 语义锚点比纯几何 frontier 更贴近日常导航：门、走廊、房间入口比随机覆盖面积更重要。
3. `SG-Memo` 可与 Kinbot 七实体 `World State` 对接，形成房间、物体、位置、事件和可达点的可审计索引。

劣势与风险：

1. 离板 RTX 4090 推理不符合 Kinbot 默认量产资源线。
2. 四视角相机配置可能增加头部 / 躯干布置复杂度，与当前紧凑轻量头部主线需要单独评估。
3. VLM 识别语义锚点可能把装饰、镜面、半开门等误判为可通行锚点，需要安全门控二次确认。

推荐理由：

建议吸收为 `world_state_memory` 的结构参考：Kinbot 一代可以先做轻量版“房间入口 / 通道 / 常驻家具 / 禁入区”在线锚点图，不直接引入完整 VLM 在线建图。

### 3.4 Nav-R1: Reasoning and Navigation in Embodied Scenes

| 项目 | 内容 |
| --- | --- |
| arXiv | [2509.10884](https://arxiv.org/abs/2509.10884) |
| 提交日期 | 2025-09-13 |
| 分类 | `cs.RO`, `cs.CV` |
| 代码 / 项目 | 论文页面标注 GitHub 与项目页可用 |

摘要要点转述：

这篇论文提出 Nav-R1，把对话、推理、规划和导航统一到一个具身导航模型中。作者构建 `Nav-CoT-110K` 作为冷启动推理数据，再用 GRPO 和格式、理解、导航三类奖励做强化学习，并提出 `Fast-in-Slow` 推理范式，将慢速语义推理和低延迟反应控制拆开。

解决 Kinbot 的什么问题：

1. 对应 Kinbot `R3` 任务环：复杂家庭指令需要长期语义推理，但不能让底盘等待完整推理。
2. 对应双视角一致性：模型输出的推理、路径、动作和现实安全执行必须被拆成不同频率的链路。
3. 对应样机体验：用户感知到的是“边走边想、少停顿”，而不是完整思考完才开始移动。

资源消耗与部署信号：

1. 论文使用 `Nav-CoT-110K` 大规模推理数据和 GRPO 训练，训练成本显著高于普通导航策略微调。
2. arXiv 摘要报告 benchmark 平均提升超过 `8%`，并在移动机器人上做真实部署。
3. 摘要只称真实部署在有限车载资源下验证鲁棒性，但未在摘要中给出具体芯片、模型大小、内存、延迟和功耗。
4. 对 Kinbot 来说，CoT 数据和推理链还涉及隐私、可审计和不向用户暴露内部推理的问题。

优势：

1. `Fast-in-Slow` 与 Kinbot 多执行范式高度一致，适合作为运行时设计参考。
2. 通过结构化推理改善导航解释性，有利于失败复盘和家属摘要。
3. 可作为 `VLN -> NFM` 专题中的导航推理训练参考。

劣势与风险：

1. 单一大模型统一对话、推理、规划和导航，容易重新推高主线复杂度和安全验证难度。
2. 训练数据与模型规模压力大，不适合直接进入 `12GB RAM + 32GB Flash` 一代量产线。
3. CoT 输出如果未经治理，可能泄露内部判断、生成不稳定解释或引导错误动作。

推荐理由：

建议只吸收 `Fast-in-Slow` 双频控制思想，不建议把 Nav-R1 当成 Kinbot 一代统一大脑。Kinbot 应继续坚持高层语义可慢、底层安全必须快，并把慢速推理结果转成可授权、可撤销的行动意图。

### 3.5 Multimodal Embodiment-Aware Navigation Transformer

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.19267](https://arxiv.org/abs/2604.19267) |
| 提交日期 | 2026-04-21 |
| 分类 | `cs.RO` |

摘要要点转述：

这篇论文提出 ViLiNT，一个融合 RGB、3D LiDAR、目标嵌入和机器人尺寸描述的导航 Transformer。模型用 diffusion 生成多个候选轨迹，再用 clearance prediction head 评估轨迹安全性。它强调 embodiment token：不同机器人尺寸应影响轨迹选择，而不是所有机器人共用同一通行策略。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 底盘、头身宽度、转弯半径和家庭狭窄通道的尺寸约束。
2. 对应局部规划中“能不能过”的判断：机器人不只需要目标方向，还需要按自身尺寸选择安全轨迹。
3. 对应 Phase 5 验证：需要把碰撞率、轨迹 clearance、尺寸膨胀后的可通行性纳入评价。

资源消耗与部署信号：

1. 真实机器人为 Clearpath Husky，传感器包含 Zed2i 相机和 Ouster OS1 32 线 LiDAR。
2. 模型运行在 NVIDIA AGX Orin 嵌入式计算机上。
3. 真实实验目标距离包括超过 `100m` 和障碍后方 `30m` 的目标；障碍场景中 ViLiNT 成功率 `85%`，NoMaD-FT 为 `15%`。
4. 仿真中相对 NoMaD-FT 平均成功率提升 `166%`，碰撞率降低 `62%`；但非学习型 TEB-Elev 在零碰撞上仍强。

优势：

1. embodiment token 对 Kinbot 很重要：躯干宽度、药箱、屏幕、头部形态都会影响可通行区域。
2. clearance head 可作为学习型局部 planner 的安全解释接口。
3. AGX Orin 真实部署比离板 GPU 更接近产品化验证口径。

劣势与风险：

1. 依赖 LiDAR，不符合 Kinbot 一代纯视觉量产主线。
2. 主要场景偏室外 / off-road / 障碍场，和老人家庭低速、窄门、低矮物体、夜间弱光仍不同。
3. diffusion 轨迹采样和多模态 Transformer 的端侧延迟、内存和热稳态仍需实测。

推荐理由：

建议作为 `S2` 导航的对照基线，而不是一代量产路线。Kinbot 可以吸收“机器人尺寸 token + clearance 评分”的思想，用纯视觉 / VIO / 局部 costmap 重建同类接口。

### 3.6 VPN: Visual Prompt Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2508.01766](https://arxiv.org/abs/2508.01766) |
| 首次提交 / 最新版本 | 2025-08-03 / 2025-11-23 |
| 分类 | `cs.CV` |
| 发表状态 | arXiv 页面标注 AAAI 2026 接收 |

摘要要点转述：

这篇论文提出 Visual Prompt Navigation：用户不再用自然语言描述路线，而是在 2D top-view map 上画出或标注视觉导航轨迹。作者构建 R2R-VP 和 R2R-CE-VP 两个数据集，并提出 VPNet 作为基线网络，研究视觉提示形态、地图格式和数据增强对导航效果的影响。

解决 Kinbot 的什么问题：

1. 对应家属 App / 调试台中“请机器人走这条路线、避开这里、去这个区域”的低歧义交互。
2. 对应老人表达不清或语音歧义时的替代入口：家属可以通过地图标注约束机器人路径。
3. 对应 Phase 5 试点：技术人员可用视觉 prompt 快速生成导航测试任务。

资源消耗与部署信号：

1. arXiv 摘要未给出模型大小、推理延迟、硬件和功耗。
2. 方法依赖 top-view map 和可视化路线标注，前提是已有家庭地图或可交互平面图。
3. 论文构建离散和连续导航数据集，不是直接的真实家庭机器人部署报告。

优势：

1. 用户意图更直观，减少自然语言“到那边绕一下”的歧义。
2. 很适合作为家属 App、工程调试台和试点任务生成工具。
3. 与 Kinbot “机器人本体 + 家属 App + 最小云”的当前闭环兼容。

劣势与风险：

1. 需要地图视图，首次入户和地图不准时难以使用。
2. 老人本人未必能熟练画路线，主用户更可能是家属、运维或研发。
3. 不能替代机器人自主避障；视觉路线必须被本地 planner 和安全授权层重解释。

推荐理由：

建议作为 `companion_interaction + observability` 的交互候选，而非导航算法主线。Kinbot 可先在调试台支持“路线草图 -> 本地 planner 约束 -> 风险提示”的闭环。

### 3.7 NaviMaster: Learning a Unified Policy for GUI and Embodied Navigation Tasks

| 项目 | 内容 |
| --- | --- |
| arXiv | [2508.02046](https://arxiv.org/abs/2508.02046) |
| 首次提交 / 最新版本 | 2025-08-04 / 2026-03-25 |
| 分类 | `cs.RO`, `cs.LG` |
| 代码 / 数据 | 论文页面标注代码、数据和 checkpoint 可用 |

摘要要点转述：

这篇论文认为 GUI 导航和具身导航都可以形式化为 MDP，因此尝试用一个统一 agent 处理手机 / 网页界面和三维具身环境中的视觉目标导航。作者把 GUI 和 embodied 动作空间统一为视角移动、定位动作和特定动作，并用 distance-aware dense reward 做强化学习。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 的跨界面协同：机器人本体、家属 App、运维后台都存在“看图、定位、执行下一步”的共性。
2. 对应 `decision_orchestration` 的动作表示统一：屏幕 UI 操作和物理导航都需要可审计的目标、动作和结果。
3. 对应远期平台化：同一套模型是否能理解 App 状态、机器人视角和家庭空间，是后续多端 Agent 的研究方向。

资源消耗与部署信号：

1. 基座模型为 `Qwen2.5VL-7B`。
2. 训练使用 `8` 张 NVIDIA A800 GPU，训练 `3` 个 epoch，全局 batch size `128`。
3. 训练数据为 `20k` 样本，其中 `10k` GUI 样本来自 GUI-Odyssey，`10k` embodied 样本来自 Matterport 3D 和 RoboPoint。
4. 论文重点报告训练与 benchmark 表现，不是端侧机器人实时部署论文。

优势：

1. 给 Kinbot 提供一个跨 App / 机器人 / 后台界面动作表示的研究参照。
2. dense reward 思路可用于训练“差一点也给分”的导航/界面 grounding 模型，减少稀疏成功信号带来的训练浪费。
3. 对未来家属 App、运维后台和机器人本体统一任务语言有启发。

劣势与风险：

1. `7B + 8xA800` 训练口径远超 Kinbot 一代近期量产验证需要。
2. GUI 和具身导航的统一可能带来概念诱惑，但对一代最关键的安全、低延迟、可靠导航帮助间接。
3. 不能直接解决家庭空间中的碰撞、低光、老人动态行为和端侧隐私约束。

推荐理由：

建议放入远期 `companion_interaction / observability_data_governance` 研究池。近期不要为它修改主线架构，只把“跨界面动作表示”和“dense grounding reward”作为后续工具链设计参考。

## 4. 对 Kinbot 的落地建议

### 4.1 纯视觉导航验证

建议把 TANGO 作为下一轮纯视觉导航最小对照：

1. 使用现有 Kinbot RGB 输入，构建局部 traversability / cost map 原型。
2. 设置“可信局部轨迹”和“不可信 fallback”两种执行路径。
3. 用家庭样机验证窄门、桌椅腿、门槛、地毯边、反光地面、弱光走廊。
4. 指标不要只看成功率，还要看 `N_pause`、可见犹豫、误停、近碰撞次数、热稳态帧率和用户主观信任。

### 4.2 世界状态记忆验证

建议用 ABot-Explorer 思路定义轻量 `SG-Memo` 子集：

1. 一代只冻结房间、入口、通道、常驻家具、禁入区、可达点和最近观测时间。
2. 不把完整 VLM 在线建图作为默认量产假设。
3. 所有会驱动机器人移动的记忆结果，必须经过置信度、安全授权和必要的人机确认。

### 4.3 安全局部规划验证

建议把 HJ reachability 作为安全对照，不直接替换 planner：

1. 建立未来碰撞风险标签，用于评估学习型局部 planner 的激进程度。
2. 对比普通几何避障、TTR heuristic 和可达性剪枝的成功率、节点扩展、规划延迟。
3. 在老人移动、家属穿行、宠物突然出现等动态场景中验证误停和误闯。

### 4.4 交互与调试工具

建议把 VPN 和 NaviMaster 的价值限制在工具层：

1. 家属 App / 工程调试台可以支持“画路线 / 标区域 / 禁入区”。
2. 视觉 prompt 只表达意图，不直接下发底盘轨迹。
3. App、后台和机器人本体可以逐步统一“目标-动作-证据-结果”的任务表示，但不新增主线实体。

## 5. 复杂度自检

现在的架构是不是太复杂了？

本轮答案：暂时不是，因为这些论文只作为研究输入，不新增 Kinbot 主线实体、一级模块或正式接口。

需要警惕的复杂度风险：

1. 不要把 Nav-R1 / NaviMaster 这类统一大模型论文误读为 Kinbot 一代应建立“统一大脑”。
2. 不要把 ABot-Explorer 的四视角相机和离板 RTX 4090 推理配置写成量产假设。
3. 不要因为 ViLiNT 指标好就把 LiDAR 重新作为产品 fallback；它只能作为研发对照。
4. 下一步应优先压缩成 3 个验证问题：纯视觉局部导航、轻量空间记忆、安全局部规划，而不是扩张新概念。

## 6. 本轮未进入主线的原因

本轮论文不直接修改系统架构基线，原因如下：

1. 多篇论文依赖 LiDAR、离板 GPU、高端训练硬件或仿真 benchmark，与 Kinbot 默认量产线不一致。
2. 论文指标多来自特定平台或公开数据集，缺少 Kinbot 家庭样机、国产端侧芯片和老人真实居家场景验证。
3. 若后续验证通过，应先回写对应专项文档，再由 `docs/00_governance/03_decision_log.md` 记录主线事实变化。

## 7. 来源

1. [TANGO: Traversability-Aware Navigation with Local Metric Control for Topological Goals](https://arxiv.org/abs/2509.08699)
2. [A Hamilton-Jacobi Reachability-Guided Search Framework for Efficient and Safe Indoor Planar Robot Navigation](https://arxiv.org/abs/2604.17679)
3. [Explore Like Humans: Autonomous Exploration with Online SG-Memo Construction for Embodied Agents](https://arxiv.org/abs/2604.19034)
4. [Nav-R1: Reasoning and Navigation in Embodied Scenes](https://arxiv.org/abs/2509.10884)
5. [Multimodal Embodiment-Aware Navigation Transformer](https://arxiv.org/abs/2604.19267)
6. [VPN: Visual Prompt Navigation](https://arxiv.org/abs/2508.01766)
7. [NaviMaster: Learning a Unified Policy for GUI and Embodied Navigation Tasks](https://arxiv.org/abs/2508.02046)
