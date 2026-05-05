# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-01
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-01 | Codex-架构师 | 基于联网检索 arXiv，筛选与 Kinbot 健康助手安全、零样本视觉语言导航、家用服务闭环执行、社交导航、技能更新治理、神经符号任务规划、安全可达导航和 4D world-action model 相关的 8 篇论文并形成结构化评估。

---

## 1. 检索口径

本轮检索日期：2026-05-01。

检索范围：

1. arXiv 官方 `cs.RO` recent 页面、官方 `abs` 页面与论文 PDF。
2. 优先筛选 2026-04-30 arXiv recent 新出现、且未进入 `2026-04-29` 与 `2026-04-30` Kinbot 每日论文纪要的论文。
3. 关键词与主题包括 `robotic health attendant`、`vision-and-language navigation`、`home-service mobile manipulation`、`social navigation`、`safe navigation`、`skill update governance`、`neuro-symbolic task planning`、`world action model`。

筛选标准：

1. 是否对应 Kinbot 一代主线问题：健康与医疗联动安全、纯视觉 / VLN 导航、家庭空间长期执行、世界状态闭环、端侧低延迟安全、可审计治理。
2. 是否给出真实机器人、仿真 benchmark、模型规模、训练数据、硬件、延迟或 API 成本信号。
3. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`decision_orchestration`、`world_state_memory`、`safety_compliance_authorization`、`observability_data_governance`、`companion_interaction`、`platform_runtime`。
4. 是否符合一代约束：纯视觉主线、端侧原始敏感数据处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。依赖云端前沿 MLLM、LiDAR、RGB-D、RTX 级 GPU、大规模训练集或长时间离线建模的内容，只作为研发验证或对照基线。

## 2. 本轮总判断

本轮论文对 Kinbot 的价值集中在 4 个方面：

1. **健康助手的 LLM 安全不能靠“医疗微调”兜底**：`Benchmarking the Safety of Large Language Models for Robotic Health Attendant Control` 显示，医疗机器人控制中的伦理 / 安全违规率仍很高，提示 Kinbot 的健康管理链路必须把安全评测、权限门控和拒绝策略作为一等公民。
2. **VLN 需要显式时间尺度分层**：`Three-Step Nav` 与 `Walk With Me` 都强调高层语义规划、当前视角对齐、历史轨迹复盘或安全触发式高层推理，和 Kinbot 当前“高层可慢、底层必须快”的运行时纪律一致。
3. **家用执行可靠性来自物理重校验，而不是一次性大计划**：`ANCHOR` 说明真实家庭服务失败常来自符号计划与物理状态漂移，Kinbot 即使不做机械臂，也需要在移动、找人、送药、巡护中保留“动作后重锚定”和分层恢复机制。
4. **模型 / 技能更新要有治理探针**：`Atomic-Probe Governance` 把“替换一个技能后组合行为怎么变”作为正式测量问题，这对 Kinbot 后续 OTA、端侧模型升级和技能包灰度很重要。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | Benchmarking the Safety of Large Language Models for Robotic Health Attendant Control | 纳入健康管理 / 医疗联动安全评测池，建立 Kinbot 自有有害指令与良性指令成对 benchmark。 |
| A- | Three-Step Nav | 纳入 `VLN -> NFM` 与 `mobility_navigation` 研究池，吸收前视 / 当前 / 回看三段式规划，不直接依赖云端 GPT 作为底盘控制链。 |
| A- | ANCHOR | 纳入家庭长程执行闭环参考，吸收物理锚定、动作后重校验和最小责任层恢复；机械臂相关部分不进入一代主线。 |
| B+ | Walk With Me | 作为高层语义导航与低层安全触发解耦参考；户外 GPS / 公共地图 API 不作为家庭室内主线。 |
| B+ | Atomic-Probe Governance | 纳入 `observability_data_governance` 与 OTA 评估方法池，用于定义技能更新前后的最小探针集。 |
| B | LLM-Flax | 作为神经符号任务规划和 LLM 调用预算控制参考；不直接进入实时运动控制链。 |
| B- | Safe Navigation using Neural Radiance Fields via Reachable Sets | 作为可达集 + 视觉三维表示的安全规划对照；NeRF 训练与仿真前提离量产较远。 |
| C+ | Unified 4D World Action Modeling from Video Priors with Asynchronous Denoising | 作为远期 `NFM / world-action model` 观察项；大规模数据和 5B 级模型不适合一代量产假设。 |

## 3. 论文卡片

### 3.1 Benchmarking the Safety of Large Language Models for Robotic Health Attendant Control

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.26577](https://arxiv.org/abs/2604.26577) |
| 提交日期 | 2026-04-29 |
| 分类 | `cs.AI`, `cs.CY`, `cs.RO` |
| 篇幅 | arXiv 页面标注 20 页正文、8 页补充材料 |

摘要要点转述：

论文构建了面向机器人健康助手控制的安全评测集：`270` 条有害指令覆盖 `9` 类禁止行为，并按美国医学会伦理原则标注。作者在 Robotic Health Attendant 仿真环境中评估 `72` 个 LLM，发现平均违规率为 `54.4%`，超过一半模型违规率高于 `50%`。开放权重模型的违规率中位数显著高于闭源模型，医学领域微调没有带来稳定安全收益，简单 prompt 防御只产生有限改善。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 健康管理、问诊转接、用药提醒、异常上报和紧急场景中的 LLM 控制安全。
2. 对应 `safety_compliance_authorization`：机器人不能因为“用户像是在求助”就执行延迟急救、错误用药、隐私外泄或设备误操作。
3. 对应 Phase 5 验证：健康助手安全评测必须覆盖“看起来合理但实际危险”的指令，而不是只测明显破坏性指令。

资源消耗与部署信号：

1. 论文主要是 benchmark 和仿真评估，不是端侧部署论文。
2. 数据集包含 `270` 条有害指令与配对良性指令；评估覆盖 `72` 个模型。
3. 数据生成 / 验证使用 GPT 系列模型；评估器也使用前沿闭源模型，因此复现实验依赖外部 API。
4. 没有给出机器人端侧芯片、延迟、内存或功耗指标。

优势：

1. 与 Kinbot 首发价值排序中的健康管理高度相关。
2. 把安全评测从普通文本问答扩展到“机器人会不会采取动作”的控制语境。
3. 结果提醒团队：医疗专业微调不等于安全，必须有独立安全裁判和动作授权层。

劣势与风险：

1. 伦理框架基于美国医学会原则，中国大陆产品还需映射到本地法规、医疗服务边界和家属授权机制。
2. 仿真健康助手与 Kinbot 家庭机器人动作空间不同，需重建 Kinbot 自有场景集。
3. 依赖闭源模型作为生成器 / 评估器时，结果可复现性和长期成本需要单独治理。

推荐理由：

建议优先转化为 Kinbot 自有安全评测任务：为健康问询、用药管理、异常上报、120 预留接口、家属 App 授权和保姆模式分别生成有害 / 良性成对指令，并把“拒绝危险动作但不误拒绝良性求助”作为 Phase 5 健康链路准入指标。

### 3.2 Three-Step Nav: A Hierarchical Global-Local Planner for Zero-Shot Vision-and-Language Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.26946](https://arxiv.org/abs/2604.26946) |
| 提交日期 | 2026-04-29 |
| 分类 | `cs.CV`, `cs.RO` |
| 状态 | arXiv 页面标注 AISTATS 2026 接收，代码公开 |

摘要要点转述：

论文认为当前 MLLM 零样本 VLN 容易漂移、过早停止和局部短视，因此提出三段式协议：先“向前看”抽取全局地标和粗路径，再“看当前”把当前视觉观测对齐到下一子目标，最后“回看”完整轨迹以纠偏并判断是否应停止。方法无需任务特定 fine-tuning，可嵌入已有 VLN 管线。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 纯视觉导航中“长期语义目标容易走偏、停止时机不可靠”的问题。
2. 对应 `decision_orchestration + mobility_navigation` 的双频分层：高层 MLLM 做地标和轨迹审计，低层控制不能等待完整慢推理。
3. 对应老人家庭场景中的可解释导航：机器人需要能说明“我为什么现在继续走 / 停下 / 回退”。

资源消耗与部署信号：

1. 官方摘要强调无需梯度更新或任务特定 fine-tuning，但实验依赖 MLLM 专家。
2. PDF 中的 R2R-CE val-unseen 实验使用 GPT-5 时达到 `SR 34% / NE 5.87 / nDTW 57.70`；GPT-4o 下 SR 为 `28%`，GPT-4V 为 `26%`。
3. RxR-CE 采样评估中达到 `SR 22.0 / SPL 16.1`，仍明显低于监督训练方法。
4. 论文为仿真 benchmark，未给出端侧实时部署、功耗或本地模型裁剪指标。

优势：

1. 与 Kinbot `R3` 慢速语义推理和 `R2` 低延迟控制分层一致。
2. “回看”机制有利于记录导航证据链和失败复盘。
3. 不要求训练新模型，适合快速做工具链或仿真验证。

劣势与风险：

1. 强依赖前沿 MLLM API，端侧量产不可直接照搬。
2. 成功率仍未达到家庭服务机器人可量产可靠性。
3. 若把三段式推理放进实时底盘闭环，会引入不可接受的延迟和网络依赖。

推荐理由：

建议吸收三段式任务协议，而不是吸收云端大模型实现：Kinbot 可把“前视地标计划、当前视角校准、历史轨迹审计”做成 `VLN` 上层任务结构，底层仍由端侧 planner 和安全控制链决定可执行动作。

### 3.3 ANCHOR: A Physically Grounded Closed-Loop Framework for Robust Home-Service Mobile Manipulation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.25323](https://arxiv.org/abs/2604.25323) |
| 提交日期 | 2026-04-28 |
| 分类 | `cs.RO` |
| 项目 | arXiv 摘要标注项目页可用 |

摘要要点转述：

论文指出家用开放词汇移动操作的很多失败不是语义理解错，而是符号计划和变化中的物理世界不一致。ANCHOR 用三个机制闭环：把符号谓词绑定到可观测几何锚点、让导航终点满足后续操作可达性、用最小责任层分层恢复局部错误。真实机器人实验显示，其成功率和扰动恢复能力优于改造版 OK-Robot。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 送药、找人、巡护、靠近用户、提醒服药等长程家庭执行中的“计划对了但现实变了”问题。
2. 对应 `world_state_memory`：状态不能只在任务开始时读一次，动作后必须重锚定。
3. 对应 `decision_orchestration`：失败恢复应定位到感知、导航、执行或授权层，而不是无差别全局重规划。

资源消耗与部署信号：

1. 真实平台为 Unitree Go2 四足机器人 + ARX X5 机械臂。
2. 传感器包含 Livox Mid-360 LiDAR 与 Intel RealSense D435i 深度相机。
3. 端侧计算使用 NVIDIA GeForce RTX 3090，明显超过 Kinbot 一代默认量产资源线。
4. 在 `60` 次真实机器人试验中，ANCHOR 成功率 `71.7%`，基线 `53.3%`；检测到的执行异常恢复率 `71.4%`。

优势：

1. “动作后重校验”和“最小责任层恢复”非常适合 Kinbot 家庭长期任务。
2. 真实家庭 / 办公环境试验比纯仿真更有工程参考价值。
3. 能帮助定义 Kinbot 的执行失败 taxonomy：感知错、地图旧、目标不可达、局部动作失败、授权阻塞。

劣势与风险：

1. 机械臂、LiDAR、RGB-D 和 RTX 3090 都不符合 Kinbot 一代当前产品主线。
2. 论文重点是移动操作，Kinbot 一代不做物理抓取，不能直接迁移指标。
3. 成功率 `71.7%` 对真实家庭老人服务仍不够，需要更强的安全门控和人工接力。

推荐理由：

建议抽象吸收其闭环执行原则：每个会影响家庭安全或用药体验的动作，都应有“预期物理锚点 -> 执行 -> 重观测 -> 分层恢复 / 升级”的记录。不要把它当成机械臂路线论据。

### 3.4 Walk With Me: Long-Horizon Social Navigation for Human-Centric Outdoor Assistance

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.26839](https://arxiv.org/abs/2604.26839) |
| 提交日期 | 2026-04-29 |
| 分类 | `cs.RO` |

摘要要点转述：

论文面向开放世界户外协助，提出从高层自然语言意图到长程社会导航行为的 map-free 框架。系统利用 GPS 上下文和公共地图 API 产生轻量 POI 与 waypoint 候选，由高层 VLM 做语义目的地 grounding 和粗路径规划，低层 VLA 执行常规路段；遇到拥挤路口等复杂场景时，再触发高层安全推理和等待行为。

解决 Kinbot 的什么问题：

1. 对应 Kinbot “语义意图 -> 可执行路径 -> 安全行为”的分层。
2. 对应老人看护中的社会导航礼仪：靠近用户、等待、让行、避免打扰都需要安全与社交规则共同作用。
3. 对应远期户外 / 社区 / 物业联动预留，不是当前室内一代主线。

资源消耗与部署信号：

1. 依赖 GPS、公共地图 API、高层 VLM 与低层 VLA。
2. 摘要未给出模型大小、端侧硬件、推理延迟、功耗或真实机器人型号。
3. 方法面向户外长程导航，和 Kinbot 当前家庭室内纯视觉约束不完全一致。

优势：

1. 明确把常规执行与复杂安全推理拆开，符合 Kinbot 快慢双层执行纪律。
2. 社会导航视角有助于补充“靠近老人但不冒犯 / 不惊扰”的行为规范。
3. 触发式高层推理可以减少每一步都调用大模型的成本。

劣势与风险：

1. GPS 和公共地图 API 在家庭室内不可用。
2. 户外社会导航的风险模型不能直接等价于老人家庭室内场景。
3. 如果照搬 VLM / VLA 端到端控制，会增加不可解释性与端侧资源压力。

推荐理由：

建议只吸收“观察到复杂社交 / 安全场景时才升级高层推理”的调度思想。Kinbot 室内版本可把触发条件改为老人突然站起、窄门会车、夜间低光、儿童 / 宠物穿行、保姆模式权限变化等。

### 3.5 Atomic-Probe Governance for Skill Updates in Compositional Robot Policies

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.26689](https://arxiv.org/abs/2604.26689) |
| 提交日期 | 2026-04-29 |
| 分类 | `cs.RO`, `cs.AI` |
| 篇幅 | arXiv 页面标注 8 页正文 + 附录 |

摘要要点转述：

论文研究部署后的机器人技能库更新问题：当某个底层 skill 通过 fine-tuning、演示数据或域适配被替换后，组合策略的整体行为可能显著改变。作者在 robosuite 任务上提出 cross-version swap 协议，发现某些 atomic skill 会支配组合成功率。论文进一步提出 atomic-quality probe 和 Hybrid Selector，在低成本下接近全量组合重验证的判断质量。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 后续端侧模型、导航技能、语音 / 视觉技能、健康问答策略的 OTA 更新治理。
2. 对应 `observability_data_governance`：不能只看单个技能 benchmark 通过，还要看替换后组合任务是否退化。
3. 对应 Phase 5 后的量产预备：灰度发布前需要一套低成本探针集。

资源消耗与部署信号：

1. 实验基于 robosuite 操作任务，不是真机家庭机器人。
2. T6 双臂 peg-in-hole 任务中，一个 dominant ECM atomic 成功率 `86.7%`，其他 ECM 不超过 `26.7%`；是否纳入该技能会使组合成功率最高变化 `+50pp`。
3. Hybrid Selector `m=10` 在 T6 上用约 `46%` 的 full-revalidation 成本缩小大部分差距。
4. 论文报告 `144` 个 skill-update decision 的测量结果。

优势：

1. 直接补足“部署后模型 / 技能更新如何验收”的治理空白。
2. atomic probe 成本低，适合 Kinbot 每周 / 每版本的回归门。
3. 强调组合行为不可由单技能离线分数简单推断，符合真实产品风险。

劣势与风险：

1. 任务是 manipulation，Kinbot 一代主要是移动、交互和健康闭环，需要重建 probe。
2. 论文的 dominant-skill 现象是否普遍适用于导航 / 对话 / 健康链路仍需验证。
3. probe 设计不当时可能漏掉跨模块长链路回归。

推荐理由：

建议为 Kinbot 定义三类 atomic probe：导航局部技能、健康安全拒绝技能、家属 App / 授权联动技能。每次模型或策略更新时，先跑 atomic probe，再选择性运行端到端场景回归，降低全量实机回归成本。

### 3.6 LLM-Flax : Generalizable Robotic Task Planning via Neuro-Symbolic Approaches with Large Language Models

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.26569](https://arxiv.org/abs/2604.26569) |
| 提交日期 | 2026-04-29 |
| 分类 | `cs.RO` |

摘要要点转述：

论文面向神经符号机器人任务规划，提出三阶段 LLM-Flax：先用本地 LLM 读取 PDDL domain 自动生成 relaxation / complementary rules，再用带预算门控的 LLM failure recovery 修复规划失败，最后用零样本 LLM 物体重要性评分替代需要训练数据的 GNN scorer。作者在 MazeNamo benchmark 上报告平均成功率高于手写规则基线。

解决 Kinbot 的什么问题：

1. 对应 `decision_orchestration` 中“家庭任务可解释规划”和“规则 / 模型混合”的落地方式。
2. 对应 Kinbot 新家庭、新任务、新物品类别的适配：希望减少人工为每类任务写规则的工作量。
3. 对应运行时预算治理：LLM 调用不能挤占后续 fallback 的时间预算。

资源消耗与部署信号：

1. 论文使用本地开源 LLM `Gemma3-12B`，通过 Ollama REST API 服务。
2. LLM API 调用延迟约 `3-5s`，对象评分约 `10s`，不适合底盘实时闭环。
3. 在 `8` 个 MazeNamo benchmark 上平均 `SR 0.945`，手工基线 `0.828`。
4. Stage 3 不需要训练数据，但存在上下文窗口瓶颈。

优势：

1. 本地 LLM + 结构化验证比纯云端规划更接近 Kinbot 隐私与离线约束。
2. 明确处理 LLM latency budget，避免慢推理吞掉 fallback 时间。
3. 可用于后台 / 工程工具自动生成候选规则，再由安全层审核。

劣势与风险：

1. PDDL / MazeNamo 与真实家庭任务差距较大。
2. `3-10s` 调用成本只能用于慢速任务规划，不能用于避障和实时运动。
3. 自动生成规则若进入安全关键链路，必须有形式检查和人工审阅。

推荐理由：

建议作为 Kinbot “慢速任务编排器”的研究输入：例如给药提醒、巡护计划、家庭规则解释可以使用 neuro-symbolic 结构，但所有会驱动移动或健康建议的输出都必须经过端侧安全授权和可回滚执行计划。

### 3.7 Safe Navigation using Neural Radiance Fields via Reachable Sets

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.26899](https://arxiv.org/abs/2604.26899) |
| 提交日期 | 2026-04-29 |
| 分类 | `eess.SY`, `cs.RO` |
| 篇幅 | arXiv 页面标注 5 页、8 图 |

摘要要点转述：

论文把 NeRF 生成的三维体表示和 reachable set 安全约束结合起来：NeRF 用于表示障碍物、目标或机器人几何，reachable set 表示机器人在状态空间中的实时能力，最终把路径规划写成带线性矩阵不等式约束的最优控制问题。论文通过两个仿真场景展示了在多障碍环境中的安全路径规划。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 纯视觉路线下“视觉三维表示如何进入安全规划”的问题。
2. 对应局部 planner 的未来可达风险：不能只看当前帧障碍，还要看未来几秒能否安全刹停 / 转向。
3. 对应特殊家庭几何：机器人本体、窄门、桌腿和目标区域都可以被表达为约束对象。

资源消耗与部署信号：

1. 论文使用 nerfstudio 训练 NeRF。
2. PDF 中报告在 Intel Core i9-12900HX 16 核 CPU 上，NeRF 训练平均约 `18` 分钟。
3. NeRF 对象点云凸包产生 `892` 个线性不等式约束。
4. 结果为数值仿真，没有真实机器人、端侧实时重建、低光或动态障碍评估。

优势：

1. 把视觉三维表示和可解释安全约束结合，适合作为纯视觉安全规划的研究参照。
2. reachable set 思想能补充当前几何避障的未来风险判断。
3. 对机器人几何和障碍几何统一建模，适合检查窄门、门槛、桌腿等通行约束。

劣势与风险：

1. NeRF 训练耗时和动态更新能力不适合 Kinbot 实时家庭巡航。
2. 仿真场景过于干净，缺少人、宠物、弱光、反光和家具变化。
3. 高维不等式约束可能带来端侧优化延迟。

推荐理由：

建议作为研发对照，而不是量产路线：Kinbot 可吸收“视觉三维表示必须落到 reachable safety constraint”的思想，但一代实现应优先用更轻量的局部 cost map、VIO / 深度估计和保守安全边界。

### 3.8 Unified 4D World Action Modeling from Video Priors with Asynchronous Denoising

| 项目 | 内容 |
| --- | --- |
| arXiv | [2604.26694](https://arxiv.org/abs/2604.26694) |
| 提交日期 | 2026-04-29 |
| 分类 | `cs.RO`, `cs.AI`, `cs.CV` |
| 项目 | arXiv 页面标注项目页可用 |

摘要要点转述：

论文提出 X-WAM，把机器人动作执行和 4D 世界合成统一在一个框架中。系统利用视频扩散模型的视觉先验，预测多视角 RGB-D 视频以想象未来世界，并用异步去噪让低维动作用更少步骤快速解码，高保真视频则继续使用完整去噪流程。论文在 RoboCasa 与 RoboTwin 2.0 上报告高成功率，同时输出 4D 重建与生成结果。

解决 Kinbot 的什么问题：

1. 对应远期 `VLN -> NFM` 中“世界模型是否能预测动作后家庭状态变化”的问题。
2. 对应 `world_state_memory` 与 `decision_orchestration` 的未来耦合：不只记录现在，还要预测动作会带来什么状态变化。
3. 对应高层任务规划：在执行前模拟“走过去、停下、靠近用户、打开屏幕提醒”的可能结果。

资源消耗与部署信号：

1. 论文预训练使用超过 `5,800` 小时机器人数据，包含真实机器人和仿真数据。
2. 模型基于 `Wan2.2-TI2V-5B` 权重做设计验证，属于 5B 级视频 / 世界模型口径。
3. RoboCasa 平均成功率 `79.2%`；RoboTwin 2.0 报告 `89.8% / 90.7%`。
4. 异步推理将动作生成延迟从 `4665ms` 降至 `1033ms`，仍远高于底盘安全控制环需求。

优势：

1. 明确区分动作快速解码和视频 / 世界高保真生成，适合启发 Kinbot 快慢双环。
2. 4D 世界预测有助于未来做家庭场景变更、风险预演和长程任务解释。
3. 大规模数据结果可作为远期 NFM 能力边界参考。

劣势与风险：

1. 数据量、模型规模和延迟都明显超过 Kinbot 一代量产线。
2. 论文主要是操作任务 benchmark，与 Kinbot 一代无机械操作边界不一致。
3. 若把 world-action model 过早写入一代主线，会显著增加复杂度和验证难度。

推荐理由：

建议保留在远期研究池，不进入一代主线。当前只吸收“动作快速链与世界想象链异步解耦”的思想，用于未来 `NFM` 规划；Phase 5 仍应聚焦轻量状态记忆、端侧安全和可审计执行。

## 4. 对 Kinbot 的落地建议

### 4.1 健康助手安全评测先行

建议建立 Kinbot 自有健康助手安全 benchmark：

1. 覆盖用药、问诊、异常上报、家属授权、保姆模式、隐私、120 预留接口。
2. 每条有害指令配一条良性近邻指令，避免模型靠过度拒绝刷安全分。
3. 评估指标至少包括违规率、误拒率、是否升级给家属 / 人工复核、是否生成可审计解释。

### 4.2 VLN 只吸收结构，不吸收云端控制

建议将 `Three-Step Nav` 的三段式协议转成 Kinbot 上层任务结构：

1. 前视：识别家庭地标、目标房间、禁入区和可达路径假设。
2. 当前：用端侧视觉 / VIO / 局部 planner 校验下一步是否可走。
3. 回看：记录轨迹证据、纠偏、判断是否停止或请求确认。

底盘安全链仍必须端侧低延迟闭环，不因网络或 MLLM 延迟阻塞。

### 4.3 长程执行必须动作后重锚定

建议把 ANCHOR 的思想下沉到 Kinbot 家庭任务：

1. 找人、送药、巡护、靠近用户、提醒服药都应在关键动作后重新观测物理状态。
2. 失败恢复先定位最小责任层：感知、定位、局部导航、权限、交互、云端服务。
3. 全局重规划只能作为后备，不应替代局部错误 containment。

### 4.4 OTA 与技能更新需要 probe

建议把 `Atomic-Probe Governance` 转成 Kinbot 发布门：

1. 每个端侧视觉 / 导航 / 语音 / 健康安全技能定义最小 atomic probe。
2. 每次模型、规则或阈值更新先跑 probe，再按风险选择端到端实机回归。
3. 对健康和运动安全相关技能，probe 失败即阻断灰度发布。

## 5. 复杂度自检

现在的架构是不是太复杂了？

本轮答案：研究输入本身不增加复杂度，但有明显“概念扩张诱惑”。

需要压住的复杂度风险：

1. 不把 X-WAM、STARRY 这类 world-action model 论文提前写成一代主线能力。
2. 不因为 ANCHOR 在真实机器人上有效，就把机械臂、LiDAR、RGB-D 或 RTX 级计算重新引入一代基线。
3. 不把 Three-Step Nav 误读为“云端 MLLM 可以直接控制底盘”。
4. 不把 LLM-Flax 自动生成规则直接放进安全关键链路。

收敛判断：

1. 本轮不新增 Kinbot 一级实体、一级模块或正式接口。
2. 短期只形成 3 个验证任务：健康助手安全 benchmark、VLN 三段式任务协议、技能更新 probe。
3. 远期 world-action model 与 NeRF reachable navigation 保留在研究池，不回写主线。

## 6. 本轮未进入主线的原因

本轮论文不直接修改系统架构基线，原因如下：

1. 多数结果来自仿真 benchmark、户外任务、机械臂任务或高端 GPU / 云 API 环境。
2. 多篇论文使用 LiDAR、RGB-D、公共地图 API、GPS、RTX 3090、5B 视频模型或前沿闭源 MLLM，与 Kinbot 一代纯视觉端侧主线不一致。
3. 论文结论尚未经过 Kinbot 家庭样机、国产端侧芯片、老人真实居家场景和隐私合规约束验证。
4. 若后续需要主线吸收，应先进入对应专项文档或 Linear issue，再由 `docs/00_governance/03_decision_log.md` 记录主线事实变化。

## 7. 来源

1. [Benchmarking the Safety of Large Language Models for Robotic Health Attendant Control](https://arxiv.org/abs/2604.26577)
2. [Three-Step Nav: A Hierarchical Global-Local Planner for Zero-Shot Vision-and-Language Navigation](https://arxiv.org/abs/2604.26946)
3. [ANCHOR: A Physically Grounded Closed-Loop Framework for Robust Home-Service Mobile Manipulation](https://arxiv.org/abs/2604.25323)
4. [Walk With Me: Long-Horizon Social Navigation for Human-Centric Outdoor Assistance](https://arxiv.org/abs/2604.26839)
5. [Atomic-Probe Governance for Skill Updates in Compositional Robot Policies](https://arxiv.org/abs/2604.26689)
6. [LLM-Flax : Generalizable Robotic Task Planning via Neuro-Symbolic Approaches with Large Language Models](https://arxiv.org/abs/2604.26569)
7. [Safe Navigation using Neural Radiance Fields via Reachable Sets](https://arxiv.org/abs/2604.26899)
8. [Unified 4D World Action Modeling from Video Priors with Asynchronous Denoising](https://arxiv.org/abs/2604.26694)
