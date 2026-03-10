# VLN角色分析与技术规划

本文时间点：2026-03-08。

本文用于回答两个问题：

1. VLN / VLA 导航能力在 Kinbot 的 OODA 架构中应该承担什么角色。
2. 基于 2025 到 2026 年公开工作的最新趋势，Kinbot 应该如何规划下一阶段 VLN 技术路线。

本文是分析与规划建议，不直接替代正式架构决策。正式边界仍以 [docs/总体架构.md](docs/总体架构.md) 和 [docs/模块分层与模块边界.md](docs/模块分层与模块边界.md) 为准。

## 1. 结论摘要

结论先行：

- 对 Kinbot 一代产品，VLN 最合适的职责不是替代 `SLAM + 局部规划 + 避障`，而是担任 `Orient -> Decide` 之间的语义导航策略层。
- VLN 应负责“理解用户要去哪里、找什么、找谁、先搜哪里、找不到如何恢复、跟随时如何保持目标”，不应直接接管底盘级安全控制。
- `Act` 层仍应由 `mobility_navigation` 负责路径跟踪、局部规划、避障、限速和急停；VLN 输出的是语义子目标、搜索策略、跟随约束和重规划建议。
- VLN 和 VLA 在模型形态上正在收敛，但研究思路并不相同：
  - VLN 仍然以“语言如何落地为空间目标、路径与恢复策略”为中心问题
  - VLA 更以“如何把观测和任务上下文统一映射成动作”为中心问题
  - 自动驾驶式 VLA 的端到端倾向显著强于家庭机器人导航
  - 机器人领域的 VLA 也并未普遍放弃分层控制、SLAM 和局部规划
- 从产品需求看，Kinbot 要解决的已经不只是狭义 VLN，而是更宽的“移动具身智能”：
  - 有用户指令时的泛化寻找、到达、寻人、跟随、护送
  - 无用户指令时在有限家庭空间中的自发移动、让行、低扰动共存和主动 reposition
- 你们已经有 8B 室内寻物 / 寻人 / 到达能力，又有真实家庭数据和高精度重建条件，最有价值的下一步不是盲目追求更大的通用基础模型，而是把现有能力收敛成稳定的“家庭语义导航系统”。

一句话概括：Kinbot 的 VLN 应该从“直接出连续动作的导航模型”升级为“带记忆、会恢复、懂家庭语义、能协同经典导航”的语义导航策略系统。

## 1.1 VLN 与 VLA 的研究思路是否明显不同

结论：有，而且到 2025 到 2026 年，这个差异比前几年更清楚。

但这个“不同”不是说两者使用完全不同的模型，而是说两者默认回答的问题不同：

- `VLN` 先问的是：语言目标如何在真实空间中被理解、落地、搜索、恢复。
- `VLA` 先问的是：能否把观测、任务上下文和动作统一成一个更通用的策略模型。

二者的差别可以概括为：


| 维度      | VLN                        | VLA                             |
| ------- | -------------------------- | ------------------------------- |
| 首要问题    | 指令跟随、目标搜索、空间 grounding、恢复  | 统一动作生成、跨任务迁移、规模化学习              |
| 语言地位    | 通常是核心目标载体                  | 可能是条件之一，也可能在推理时弱化甚至省略           |
| 输出接口    | 离散动作、waypoint、子目标、轨迹块      | 连续动作、动作 token、统一策略输出            |
| 关注的记忆形式 | 地图、拓扑、目标 belief、3D 表示、情境记忆 | 潜状态、世界模型、长时上下文，也可混合显式记忆         |
| 典型难点    | sim2real、语言歧义、长程搜索、找不到怎么办  | 数据规模、跨任务泛化、动作平滑性、端到端可训练性        |
| 评测重心    | 成功率、SPL、路径效率、恢复能力、跨本体部署    | 任务完成率、动作质量、舒适性、干预率、跨任务能力        |
| 工程默认    | 更容易与地图、planner、安全链共存       | 更容易向 action-first、end-to-end 倾斜 |


看你举的几个例子，这个差异非常明显：

- 自动驾驶里的 VLA 更容易弱化语言，因为驾驶目标通常已经被导航路线、车道结构和交通规则强约束了。
- 家庭机器人的导航目标更开放，常常是“找某个人”“找某个物”“靠近但不要太近”“从右侧绕过去”这类语言和社交约束强耦合的问题。
- 因此，智驾 VLA 容易朝 `video -> action` 收敛；而家庭机器人更容易保留 `language/identity/memory -> subgoal -> local planner` 这样的分层。

这也是为什么我不建议把“智驾 VLA 已经更端到端”直接等价推导为“Kinbot 应该抛弃 VLN 问题框架”。

更准确的表述是：

- 对 Kinbot，应该用 `VLA 的方法论` 提升 `VLN 的能力上限`
- 而不是用 `VLA 的问题定义` 取代 `VLN 的产品定义`

## 1.2 为什么智驾 VLA 与家庭导航 VLA 不应直接类比

自动驾驶之所以更适合强端到端，主要是因为它具备四个条件：

1. 动作空间相对单一，目标主要是沿路网安全高效行驶。
2. 真实驾驶数据量极大，能支撑规模法则。
3. 交通规则、道路拓扑、车辆动力学约束高度稳定。
4. 语言在闭环推理中的信息增量有限，很多目标可以由路线与场景隐式表达。

而家庭室内导航恰恰相反：

1. 目标形式高度开放，语言和身份约束经常决定任务本身。
2. 数据量远小于智驾，且分布更碎片化。
3. 家具移动、遮挡、光照、访客、门槛、狭窄空间都会引入高频长尾。
4. 机器人不仅要到达，还要解释、确认、等待、恢复、跟随、避让、低扰动靠近。

因此，家庭机器人更像 `具身语义导航问题`，而不是 `路网驾驶策略问题`。

## 1.3 需求重估：Kinbot 真正追求的是“移动具身智能”

按你这轮补充，Kinbot 对 VLN 的期待已经超出了经典论文里的“按一条语言指令到达目标”。

更准确的需求分解应该是：

### A. 有用户指令输入时的语义移动

这部分仍然属于扩展版 VLN：

- 听懂“去找谁 / 去找什么 / 到哪儿去”
- 在真实家庭里完成搜索、到达、靠近、跟随、护送
- 在失败、遮挡、漂移、多候选目标下恢复

### B. 无用户指令输入时的自发移动

这部分已经不只是 VLN，而是 `social mobility + proactive mobility`：

- 与人在有限空间里共存
- 在狭窄通道里判断何时快、何时慢、何时让、何时停
- 夜间、静默、弱光等低扰动移动
- 因电量、挡路、任务切换、礼貌让行而主动 reposition

因此，建议在文档口径上做一个区分：

- `VLN` 继续表示“有明确语义目标的导航推理能力”
- `Embodied Mobility Intelligence` 表示更宽的移动具身智能总能力

也就是说，Kinbot 的产品目标不是“做一个更强的 VLN benchmark agent”，而是“做一个在家庭中持续共存的移动智能体”。

## 2. 最新技术信号

截至 2026-03-08，最近一轮公开工作对 Kinbot 最有参考价值的信号如下。


| 工作         | 时间        | 核心信号                                                                                     | 对 Kinbot 的启发                                                 |
| ---------- | --------- | ---------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| Uni-NaVid  | RSS 2025  | 把 VLN、ObjectNav、EQA、Human-following 统一进一个视频式 VLA；公开页强调约 5 Hz 推理和 non-blocking deployment | 你们“找物 + 找人 + 到达”不应拆成完全孤立模型，应该统一为导航技能族，但执行链必须非阻塞              |
| TrackVLA   | CoRL 2025 | 把目标识别与视觉跟踪统一，支持零样本真实部署                                                                   | “找到指定人并持续靠近”应被视为独立核心技能，不应只是普通 VLN 的附属功能                      |
| MM-Nav     | 2025 预印本  | 强调 360 度多视角观测和多专家能力蒸馏                                                                    | 你们有 360 度感知硬件，应该充分利用多视角输入，而不是退化成单前视角 VLN                     |
| OmniVLA    | 2025 预印本  | 统一语言、2D pose、目标图像等多种目标形式                                                                 | Kinbot 的导航目标不该只有自然语言，还应统一支持“语义目标 + 地图点 + 目标图像 + 人员身份”        |
| NavFoM     | ICLR 2026 | 跨 embodiment、跨任务导航基础模型；真实部署里输出 trajectory，再交给本地 planner 执行                               | 最新工作依然保留 local planner，这直接支持 Kinbot 继续坚持“VLN 管语义，本地导航管安全与执行” |
| TrackVLA++ | ICRA 2026 | 在跟踪 VLA 里加入显式空间推理和目标身份记忆                                                                 | 家庭场景的“找某个老人 / 跟随某个家属 / 不跟错人”关键不在检测，而在长期身份记忆和遮挡恢复             |
| VLingNav   | 2026 预印本  | 自适应链式推理 + 跨模态持久记忆，用于长程导航                                                                 | VLN 的下一阶段重点是“什么时候需要深推理”和“如何记住过去看过的东西”，不是一味增大模型               |
| AsyncVLA   | 2026 预印本  | 把高层语义推理与板载快速控制异步解耦                                                                       | 你们当前“反应慢、走得犹豫”的问题，首先是系统时序问题，不只是模型精度问题                        |
| LISN       | 2025 预印本  | VLM 慢环调制 costmap 和 controller，低层控制器维持实时安全                                                | 在养老 / 家庭机器人里，语言和社交约束应调制局部规划，而不是绕过局部规划                        |
| OK-Robot   | 2024      | 系统集成为先；真实家庭中大量失败来自语义记忆检索错误                                                               | 家庭机器人成败很大程度取决于“物在哪里”的记忆是否稳定，而不只是模型单次推理能力                     |


### 2.1 产业侧 VLA 的最新信号

如果只看 2026 年产业侧公开路线，确实会得到“VLA 正在更端到端”的印象。

这里要区分三类情况：

#### 1. 自动驾驶 VLA：更强的 action-first 倾向

以小鹏第二代 VLA 为例，官方在 2026-03-02 明确把它定义为“物理世界大模型”，并且强调“去掉语言转译环节”，走向更原生的多模态到驾驶动作的统一范式。

这类路线说明：

- 在封闭度更高的驾驶任务里，显式语言层可以被路线、场景和隐式任务 token 部分替代
- 工业系统会更在意流畅性、舒适性、效率和全场景通行
- `video -> action` 或 `scene -> action` 的价值会比 `language -> navigation` 更突出

#### 2. 机器人 VLA：并未普遍放弃分层

NVIDIA 在 2025-03-18 发布 `GR00T N1`，在 2026-01-08 发布 `GR00T N1.6` 技术博客。公开资料显示，GR00T N1.6 仍然保留：

- 自然语言指令
- 世界模型推理
- 高层 VLA 与低层 whole-body controller 分层
- 合成数据训练的导航头
- 视觉定位、SLAM 和 occupancy map

这说明机器人 VLA 即便更统一，也没有自然收敛成“纯视频直接到底层关节控制”的单一路线。

#### 3. 通用具身 VLA：导航往往只是其中一个技能

Spirit AI 的公开资料更像“通用具身 VLA”路线：它强调的是跨场景泛化、长程操作和机器人通用大脑，而不是把导航单独作为核心问题重新定义。

这说明当研究对象从“导航任务”变成“具身智能通用动作模型”后，导航会退化成众多技能之一。

这类路线值得借鉴，但不能直接替代 Kinbot 的导航系统定义。

#### 4. Tesla 的公开材料更像产业信号，而不是可直接迁移的导航证据

截至 2026-03-08，我查到的 Tesla 官方资料强调两点：

- 以视觉与规划为核心的 AI 路线
- 以海量真实驾驶数据持续训练 FSD

但我没有查到 Tesla 官方公开把当前 FSD 明确称为 `VLA`，也没有查到其在推理时使用显式语言层的证据。

因此，对 Kinbot 而言，Tesla 更适合作为“产业界正在强化大规模 video-policy 和 end-to-end 驾驶”的信号，而不是室内家庭导航的直接架构模板。

### 2.2 趋势一：从单任务 VLN 走向导航技能统一

Uni-NaVid、NavFoM、OmniVLA 都在做同一件事：把“按指令走”“找物体”“找人 / 跟随”“目标图像到达”等任务统一进一套输入输出范式。

这说明对 Kinbot，更合理的建模对象不是单一的 `VLN 模型`，而是一套 `Semantic Navigation Policy`：

- `go_to_room`
- `search_object`
- `search_person`
- `approach_person`
- `follow_person`
- `escort_to_place`
- `recover_after_fail`

这些技能共享视觉编码、语义记忆和目标表示，但不必共享完全相同的执行头。

### 2.3 趋势二：显式记忆重新成为核心

NavFoM 用历史视觉 token 采样，VLingNav 引入跨模态持久记忆，TrackVLA++ 引入 Target Identification Memory。

这说明家庭场景里真正难的不是“看见即行动”，而是：

- 目标刚才出现过，现在被遮挡了
- 目标和相似干扰项长得很像
- 家具搬动后旧记忆仍在干扰
- 用户说“去找我的眼镜”，需要结合房间、家具、历史摆放位置和近期使用痕迹

因此，Kinbot 的核心壁垒不该只是一个更大的动作模型，而应是 `家庭语义空间记忆`：

- 房间层：卧室、客厅、厨房、卫生间、充电区
- 家具层：床头柜、沙发边桌、餐桌、药箱、抽屉
- 物品层：常见物及其高概率承载体
- 人员层：身份、活动习惯、近期出现房间、可交互状态
- 风险层：狭窄区、门槛、夜间静默区、禁入区

### 2.4 趋势三：推理要可控，而不是全程深思考

VLingNav 的启发很重要：复杂导航确实需要 reasoning，但不是每一步都需要大推理。

对 Kinbot，应把推理拆成两个层次：

- 快路径：已知房间、已知目标、路线稳定时，直接走语义子目标
- 慢路径：目标丢失、地图漂移、多人混淆、复杂约束时，触发显式推理与恢复

这比“每一帧都让 8B 模型完整思考再出动作”更符合量产系统要求。

### 2.5 趋势四：系统分层比纯端到端更接近真实落地

NavFoM 的公开部署方案明确是“远端模型输出 trajectory，本地 planner 执行”；AsyncVLA 和 LISN 进一步强调高层语义推理与低层实时控制分层。

这和 Kinbot 当前架构是同方向的，说明你们不需要为了追逐 SOTA 而打散既有导航栈。真正要升级的是：

- VLN 输出接口
- 记忆机制
- 时序调度
- 失败恢复

而不是推翻 `SLAM + 局部规划 + 避障`。

与此同时，`VLN-PE`、`VLN-VER` 以及 `VLNVerse` 这类工作给出的信号也很关键：

- `VLN-PE` 强调的不是“怎么把动作端到端化”，而是“真实机体、真实传感器、真实时延和真实控制约束会怎样改变 VLN 结论”。
- `VLN-VER` 强调的是 volumetric environment representation，说明 VLN 社区仍在主动补空间表示和连续视角建模，而不是简单把导航退化为动作生成。
- `VLNVerse` 从公开摘要看，更强调 versatile、embodied、realistic simulation 与 unified evaluation，这仍然是“把导航问题做对”，而不是“直接取消导航问题定义”。

这组信号说明：即便 VLA 在迅速吸收导航，VLN 研究本身并没有消失，而是在继续回答 VLA 尚未替代的那些导航专属问题。

## 3. VLN 在 Kinbot OODA 中的角色

结合现有 [docs/总体架构.md](docs/总体架构.md) 与 [docs/模块分层与模块边界.md](docs/模块分层与模块边界.md)，建议把 VLN 放在如下位置。

## 3.1 Observe：提供导航相关语义事实，但不做最终导航决策

VLN 不应直接属于 Observe，但其上游事实必须在 Observe 结构化输出。

Observe 侧应提供给 VLN / 语义导航策略层的事实包括：

- 当前位姿、局部 free space 摘要、门槛和动态障碍事件
- 房间识别、家具识别、可通行区域语义
- 人 / 物候选检测、身份识别结果、跟踪框与置信度
- 目标图像 / 语音指令 / 指代消解结果
- 近期观测过但当前不在视野中的目标候选

Observe 的职责是“把事实变干净”，不是“替 VLN 决定往哪走”。

## 3.2 Orient：VLN 的主战场

VLN 在 Kinbot 里最应该放在 Orient 层，核心职责有四个：

1. 目标语义落地

- 把“去找张阿姨”“去床头柜拿降压药”“去客厅找遥控器”落成世界状态中的目标实体与约束

1. 语义空间检索

- 基于家庭语义地图、历史记忆和当前观测，给出优先搜索区域与候选点

1. 目标置信度维护

- 维护目标 belief state，而不是每帧只做一次瞬时判断

1. 环境漂移判断

- 判断“地图没错但物体移动了”还是“定位没错但房间语义变了”，触发不同恢复流程

对 Kinbot 而言，最重要的不是“VLN 能不能直接输出一个转向角”，而是“它能不能给出对家庭语义足够稳定的目标判断”。

## 3.3 Decide：VLN 作为语义导航策略器参与任务编排

在 Decide 层，VLN 不应等同于整个 planner，而应是 `decision_orchestration` 的一个导航策略器。

它应该负责：

- 选择导航技能：去房间、搜物、搜人、靠近、跟随、护送、返回
- 给出下一语义子目标
- 给出搜索顺序和恢复策略
- 在多候选目标间做排序
- 在不确定时请求补充确认或触发主动观察动作

它不应负责：

- 绕过安全门控
- 直接下发电机控制
- 决定急停和碰撞保护
- 替代底层局部规划

## 3.4 Act：只接收 VLN 的约束与子目标，不接收其直接控制权

Act 层建议保持当前原则：

- `mobility_navigation` 持有最终底盘执行权
- 实时避障、限速、急停与门槛策略保持独立
- VLN 只输出语义子目标与行为约束

VLN 对 Act 的合理输出应是：

- 目标房间或拓扑节点
- 一个或多个候选位姿
- 搜索 corridor
- 跟随目标的期望距离与相对方位
- 速度上限建议
- 失败原因与恢复建议

不建议在一代产品中让 VLN 直接输出连续底盘动作作为唯一执行信号。

## 3.5 无指令移动不应硬塞进狭义 VLN，而应新增邻接策略层

如果把“有限空间共存时何时快、何时慢、何时让、何时停”全都塞进 `semantic_navigation_policy`，模型目标会迅速膨胀：

- 一部分样本在解决“我要去哪”
- 一部分样本在解决“我该不该动”
- 一部分样本在解决“我和人谁先过”
- 一部分样本在解决“我是否应该先退一步再让行”

这会让训练目标、评测指标和运行时接口都变得混乱。

更合理的做法是，在 VLN 相邻处新增 `social_mobility_policy`：

- 共享 Observe 和 World State
- 共享身份、房间、障碍、人轨迹和风险信息
- 但单独负责共存移动、礼让、速度调节、主动 reposition 和静默靠近

它与 VLN 的关系应是：

- `semantic_navigation_policy` 回答“为了完成目标，我应该去哪里”
- `social_mobility_policy` 回答“在当前共享空间里，我应该怎么动才合适”

这两者共同构成 Kinbot 的 `Embodied Mobility Intelligence`。

## 4. 建议的能力分层

基于现有样机能力，建议把 Kinbot 的移动智能相关能力拆成五层，而不是一个统一黑盒。

### 4.1 语义理解层

输入：

- 用户指令
- 指代消解结果
- 身份 / 权限上下文
- 任务上下文

输出：

- `goal_type`
- `target_entity`
- `constraints`
- `success_condition`

示例：

- “去找穿红衣服的阿姨并靠近” -> `goal_type=search_and_approach_person`
- “去客厅找遥控器” -> `goal_type=search_object`
- “跟着张叔叔去餐桌，但不要太近” -> `goal_type=follow_person`

### 4.2 语义空间记忆层

输入：

- SLAM 地图 / 位姿
- 房间语义
- 家具语义
- 人 / 物观测历史
- 高精度重建数据

输出：

- 目标候选区域排序
- 家具承载先验
- 人员活动先验
- 地图漂移提示
- 不确定性评分

这是最值得利用你们真实家庭数据资产的地方。

### 4.3 语义导航策略层

输入：

- 当前观测
- 目标表示
- 语义空间记忆
- 局部导航状态

输出：

- 下一子目标
- 搜索动作
- 观察动作
- 恢复动作

这层可以由现有 8B 模型升级而来，但建议输出“子目标 / 轨迹块 / 行为提示”，不要直接与底盘紧耦合。

### 4.4 社交与自主移动策略层

输入：

- 邻近人员轨迹与意图预测
- 狭窄区域 / 门口 / 走廊等共享空间拓扑
- 任务紧急度
- 电量、回充状态、静默模式
- 家庭社交上下文
- 当前 embodiment 约束

输出：

- `yield / pass / slow / stop / reposition / standby`
- 期望人机距离
- 右行 / 左让 / 等待等路权判断
- 速度曲线与舒适性约束
- 主动退让或先停后过的建议

这层解决的是“无用户明确指令时，机器人如何与人共同占据空间”的问题。它更适合调制 controller 和 costmap，而不是直接输出原始底盘动作。

### 4.5 运动执行层

输入：

- 子目标位姿
- corridor / keepout / speed hints
- 当前局部障碍

输出：

- 实际底盘控制
- 执行状态
- 卡住原因

该层继续由经典导航和安全链负责。

## 5. 面向 Kinbot 的推荐接口

为了让架构可实现，建议尽快把 VLN 从“模型能力描述”收敛为稳定接口。

建议新增两个逻辑能力：

- `semantic_navigation_policy`
- `social_mobility_policy`

其中，前者解决“去哪里”，后者解决“怎么在共享空间里合适地动”。

### 5.1 `semantic_navigation_policy`

其输入建议为：

- `instruction`
- `goal_type`
- `world_state_snapshot`
- `slam_pose`
- `local_navigation_status`
- `recent_observations`
- `target_candidates`
- `risk_constraints`

其输出建议为：

- `navigation_skill`
- `semantic_subgoal`
- `candidate_metric_goals`
- `target_belief`
- `behavior_hints`
- `need_active_observation`
- `need_user_confirmation`
- `recovery_strategy`
- `explanation`

建议字段定义如下：


| 字段                        | 含义                                                                                                |
| ------------------------- | ------------------------------------------------------------------------------------------------- |
| `navigation_skill`        | `go_to_room / search_object / search_person / approach_person / follow_person / escort / recover` |
| `semantic_subgoal`        | 语义级下一步目标，例如“去客厅沙发边桌附近观察”                                                                          |
| `candidate_metric_goals`  | 一个或多个候选位姿，由局部导航择优执行                                                                               |
| `target_belief`           | 目标位置、身份和置信度的结构化表示                                                                                 |
| `behavior_hints`          | 跟随距离、右侧让行、夜间低速、静默接近等约束                                                                            |
| `need_active_observation` | 是否需要先转头 / 绕一下 / 退后一步再观察                                                                           |
| `need_user_confirmation`  | 多目标歧义或高风险时是否需要补充确认                                                                                |
| `recovery_strategy`       | 找不到、被挡住、跟丢、地图漂移时的恢复动作                                                                             |
| `explanation`             | 面向交互层和审计的可解释文本                                                                                    |


这个接口比“输出前进 0.5 米再左转 15 度”更适合产品级架构。

### 5.2 `social_mobility_policy`

在没有用户明确导航指令，或正在执行共享空间移动时，建议由 `social_mobility_policy` 提供约束。

其输入建议为：

- `human_tracks`
- `human_intent_prediction`
- `shared_space_topology`
- `robot_task_state`
- `urgency_level`
- `battery_state`
- `quiet_mode`
- `embodiment_profile`
- `risk_constraints`

其输出建议为：

- `locomotion_mode`
- `right_of_way_decision`
- `proxemic_target`
- `speed_profile`
- `reposition_goal`
- `standby_decision`
- `social_explanation`

建议字段定义如下：


| 字段                      | 含义                                                         |
| ----------------------- | ---------------------------------------------------------- |
| `locomotion_mode`       | `normal / cautious / yield / wait / pass / retreat / park` |
| `right_of_way_decision` | 共享空间里的先行、让行、交替通过等判断                                        |
| `proxemic_target`       | 期望的人机距离、侧向偏置和避让边界                                          |
| `speed_profile`         | 当前阶段的速度上限、加速度和低扰动约束                                        |
| `reposition_goal`       | 为了不挡路、回充、观察或礼貌等待而移动到的候选位置                                  |
| `standby_decision`      | 当前是否应暂停、靠边、原地等待或短距后退                                       |
| `social_explanation`    | 面向交互层和日志的原因解释，例如“通道狭窄，先礼让用户通过”                             |


## 6. 针对现有基础的研发重点

你们当前的基础有三个明显优势：

1. 已有 8B 模型，且已经实现室内任意指令寻物 / 寻人 / 到达。
2. 经典导航、局部规划、避障、SLAM 已经存在，不需要从零重建执行链。
3. 有高精度重建设备和真实家庭数据，可建立高价值家庭语义数据闭环。

据此，最值得投入的不是“再训一个更大但边界不清的端到端模型”，而是下面几项。

### 6.1 把现有动作式 VLN 改造成“子目标式 VLN”

你们当前痛点是：

- 推理慢
- 算法解算慢
- 走得犹豫

这往往说明系统把高层语义决策和低层连续控制耦合得太紧。

建议把输出从“连续短动作”改成更稀疏、更稳定的：

- 房间级目标
- 家具级目标
- 拓扑节点
- 轨迹块
- 搜索 corridor

也就是让模型少做“每一步怎么踩油门”，多做“下一步去哪里看、为什么去那里看”。

### 6.2 建立家庭语义记忆而不是只做瞬时识别

建议利用高精度重建数据建立：

- 房间图
- 家具图
- 物品承载体先验
- 人员常驻区与活动路径
- 动态变化日志
- 遮挡与相似目标 hard negative 集

如果做得好，这比单纯再增加通用互联网数据更直接提升真实家庭成功率。

### 6.3 单独做“寻人 / 跟人 / 靠近某人”能力线

TrackVLA / TrackVLA++ 的信号很强：人跟踪不是普通 ObjectNav 的附属功能，而是一条独立能力线。

Kinbot 至少应单独建设：

- 指定人搜索
- 指定人靠近
- 指定人持续跟随
- 丢失后重识别
- 多相似人物 disambiguation

这对你们“紧急情况用药时先寻人并到达”的业务链路是关键。

### 6.4 采用异步时序，而不是阻塞式推理

AsyncVLA 和 Uni-NaVid 的经验都说明：

- 语义策略刷新频率不必等于底盘控制频率
- 模型慢，不代表底盘必须慢
- 非阻塞执行比单次推理精度更重要

建议时序如下：

- 安全 / 避障：10 到 50 Hz
- 局部规划 / 路径跟踪：5 到 20 Hz
- 语义子目标刷新：1 到 3 Hz
- 复杂恢复 / 显式推理：0.2 到 1 Hz

### 6.5 Sim2Real 需要本体感知，但不建议让高层模型直接吃完整 URDF

结论：需要把“机器人有多大、能怎么动、哪些姿态下视野会变、哪些地方能过不能过”显式引入训练与部署，但不建议把完整 URDF 文本直接作为高层 VLN/VLA 的主要输入。

更合理的是三层使用：

#### 1. 仿真 / RL / 控制层：需要高保真本体模型

这一层最需要准确 URDF 或等效物理模型，用于：

- 底盘尺寸、重心、碰撞体
- 传感器外参与视野遮挡
- 机身升降、俯仰、抽屉开启等状态变化
- 门槛通过、最小转弯半径、制动距离、动态稳定性

如果这一层没有足够精度，模型和 controller 学到的“能不能过”“会不会碰”“能不能及时停”都会偏掉。

#### 2. 导航策略层：需要压缩过的 `embodiment_profile`

高层导航策略真正需要的不是原始 URDF，而是 compact body schema，例如：

- `footprint_polygon`
- `body_height`
- `sensor_fov`
- `blind_zones`
- `min_turn_radius`
- `braking_distance`
- `passable_clearance`
- `threshold_capability`
- `camera_mount_mode`

也就是让策略知道“我是什么样的机器人”，而不是让它每次都去解析机械结构文件。

#### 3. 运行时安全层：需要实时本体状态

例如：

- 当前是否升高机身
- 当前屏幕 / 头部俯仰角
- 当前抽屉是否外伸
- 当前负载和制动余量

这些会直接影响通过性和安全边界。

结合外部工作看，这也是更主流的方向：

- NVIDIA `GR00T N1.6` 仍然把高层 VLA 与低层 whole-body control 分开，并把导航通过速度命令接到控制层。
- `COMPASS` 通过 embodiment-specific adaptation 和 distillation 处理不同机器人形态。
- `X-VLA` 也采用 embodiment-specific prompts，而不是要求所有本体差异都由一个完全无结构的统一 token 流自己吸收。

对 Kinbot 这种移动平台，一代产品最应该优先建设的不是“完整 URDF 进高层模型”，而是“高保真仿真 + 稳定 embodiment_profile + 运行时 body state”这三件套。

### 6.6 是否需要先做空间增强 VLM，再训练 VLN

结论：需要，但不建议把它理解成“再堆一个更大的通用 VLM 然后端到端吃掉所有导航问题”。

更合适的定义是：先建立一个 `spatially enhanced perception teacher / encoder`，再让 VLN 或移动策略在其上学习。

原因有三点：

1. 你们当前的导航问题，核心不只是识别物体，而是房间、家具、拓扑、遮挡、可通行性和人机关系。
2. 官方资料显示，`Qwen3-VL` 已经强化了 spatial perception、3D grounding 和 spatial understanding，这说明拿它做教师模型是合理的。
3. 但房间识别、家具承载先验、家庭拓扑和社交距离并不是互联网通用 VLM 的天然强项，仍然需要你们自己的家庭数据做 domain specialization。

因此推荐路线不是“直接对 `Qwen3-VL-8B` 喂导航动作数据继续硬训”，而是：

1. 先把 `Qwen3-VL-8B` 当成教师模型和标注引擎。
2. 用真实家庭数据补齐房间、家具、通行性、遮挡、共存移动等结构化标签。
3. 训练空间增强感知模块，稳定输出：
  - 房间类别与边界
  - 房间连通关系
  - 家具类别与承载关系
  - 目标候选排序
  - 人员相对方位与可交互状态
  - 狭窄区域和共享空间语义
4. 再让 VLN / social mobility policy 消费这些结构化空间结果。

这样做的本质，是把“看懂空间”与“决定怎么动”拆开优化。

### 6.7 小尺寸专用模型能否在使用情境中超越大尺寸通用模型

结论：完全有可能，而且在闭环机器人系统里，这往往是更现实的目标。

这里的“超越”不应只看离线问答能力，而应看：

- 闭环成功率
- 首次响应时延
- 犹豫时间占比
- 通行舒适性
- 跟丢率 / 错认率
- 单位算力下的稳定性

从公开工作看，这条路线是成立的：

- Stanford `MiniVLA` 把 OpenVLA 从 7B 缩到约 1B，并通过 action chunking 和 multi-image support 在 Libero-90 上把成功率从 62% 提到 82%，同时推理更快。
- `OpenVLA-OFT` 说明训练配方和动作表示优化可以带来 25 到 50 倍速度提升，以及 20% 以上成功率提升。
- `X-VLA-0.9B` 说明小尺寸模型配合合理的 embodiment 设计，也能在多仿真与真实机器人上达到很强表现。
- `COMPASS` 则更直接说明：specialist policy + distillation 是有效路线。

对 Kinbot，这意味着：

- 大模型不一定最适合作为执行模型
- 小模型只要问题定义正确、输入结构化、输出受约束，完全可能在真实闭环里赢过大模型

推荐的双轨方案是：

#### 慢路径：大模型教师

用途：

- 离线标注和数据清洗
- hard case 复盘
- 新场景 / 新指令解释
- 低频复杂恢复

#### 快路径：小模型执行器

用途：

- 房间识别
- 家具与目标候选排序
- 人员状态与相对方位判断
- 语义子目标刷新
- 共享空间礼让 / 让行 / 低扰动移动

也就是说，真正该追求的不是“一个更大的通用模型包打天下”，而是“一个更合理的教师-学生-外部记忆-局部规划组合”。

### 6.8 技术克制：先把模型做窄、做快、做稳，再逐步统一

按当前需求，很容易把下面这些都想一次性塞进一个模型：

- 指令寻物
- 指令寻人
- 跟随和护送
- 无指令共存移动
- 社交礼让
- 主动 reposition
- 回充与低电量自主移动
- 夜间低扰动策略

这会导致模型尺寸、数据标注、训练目标和评测体系同时失控。

更稳妥的方式是分三步：

1. 先把 `semantic_navigation_policy` 做稳。
2. 再把 `social_mobility_policy` 接上。
3. 最后再考虑更宽的自主移动统一策略。

不要在一代产品阶段试图直接训练一个“既懂找人找物，又懂共存礼让，还懂所有底盘细节”的单一巨模型。

## 7. 量产预备路线建议

结合项目时间线，建议把 VLN 规划切成四段。

### P0：接口冻结与评测定义

建议时间：2026-03-08 到 2026-04-15

目标：

- 明确 VLN 在 OODA 中的角色边界
- 冻结 `semantic_navigation_policy` 与 `social_mobility_policy` 输入输出
- 冻结 `embodiment_profile` 结构
- 定义真实家庭导航评测集

必须完成的评测任务：

- 指令寻物
- 指令寻人
- 指定人靠近
- 指定人跟随
- 约束导航
- 狭窄通道会车
- 人机共存让行
- 无指令主动 reposition
- 地图漂移恢复
- 遮挡恢复
- 多相似目标 disambiguation

关键指标：

- 成功率
- 到达时间
- 首次发现目标时间
- 犹豫时间占比
- 重规划次数
- 跟丢率
- 错跟率 / 错认率
- 安全干预次数
- 不必要停车率
- 窄通道一次通过率
- 近人场景舒适性 / 侵扰率

### P1：记忆增强与子目标化

建议时间：2026-04-16 到 2026-06-30

目标：

- 把现有 8B 模型从动作输出改造为子目标输出
- 建立家庭语义记忆模块
- 建立 `embodiment_profile` 与 body-state 管线
- 打通寻物 / 寻人的统一技能接口

建议优先做：

- 目标 belief state
- 房间 / 家具 / 人员候选排序
- 房间识别与共享空间语义
- 主动观察动作
- 搜索恢复流程
- 多相机时间同步、标定与可回放数据底座
- 纯视觉基线链路：前向双目 + 单目先验 + `VSLAM / local planner`

### P2：异步执行与专项能力强化

建议时间：2026-07-01 到 2026-09-30

目标：

- 把语义推理与局部执行彻底异步化
- 强化指定人跟随、拥挤场景靠近、夜间低扰动接近
- 建立 `social_mobility_policy`
- 将语言约束转成速度 / 让行 / keepout 提示

建议专项：

- 人跟随专线
- 社交导航约束
- 共享空间博弈策略
- 语义约束到 costmap / controller 调制
- 低时延边缘适配器或小模型蒸馏
- `shared BEV / local occupancy + topometric memory` 的统一世界状态
- `uncertainty_stack` 对弱光、玻璃、细障碍和人宠切入做显式门控

### P3：家庭试点硬化

建议时间：2026-10-01 到 2026-12-31

目标：

- 在试点家庭里做长周期稳定性验证
- 建立漂移、误检、误跟随、家具移动、弱光等故障闭环
- 形成量产预备判定材料

需要重点验证：

- 家具日常移动后是否还能恢复
- 夜间和逆光条件下是否误跟人
- 多老人 / 访客在场时是否错认
- 弱网或断网时是否仍能稳定完成核心导航链路
- 纯视觉长尾是否在玻璃、镜面、细桌腿、电线和黑色低纹理区域出现系统性脆弱
- 端到端纯视觉 VLA 仅作为探索支线，不作为量产验收前提

## 8. 明确不建议的方向

以下方向不建议作为一代产品主路线：

### 8.1 不建议让 VLN 替代安全链

原因：

- 公开最新工作仍然普遍采用分层
- 家庭场景需要稳定、可审计、可验证的实时安全链
- 产品责任无法接受“因为大模型延迟导致碰撞”

### 8.2 不建议优先追求跨 embodiment 超大基础模型

NavFoM 这种工作很有启发，但它解决的是更宽泛的统一性问题。

对 Kinbot 当前阶段，更高优先级是：

- 家庭内高成功率
- 指定人 / 指定物稳定搜索
- 弱网和离线稳定性
- 试点可闭环

而不是先做无人机、四足、车辆等跨本体统一。

### 8.3 不建议把“多模态”误解为“全都直接喂进一个大模型”

更合理的是：

- 多模态目标统一表达
- 多模态记忆统一检索
- 安全执行仍然模块化

### 8.4 不建议照搬智驾式 `video -> action` 作为 Kinbot 主架构

这个判断不是否定 VLA，而是区分任务边界。

Kinbot 可以借鉴智驾 VLA 的地方有：

- 大规模视频先验
- 异步执行时序
- 舒适性 / 犹豫度 / 干预率指标
- 世界模型和长时上下文
- 数据飞轮与自动评测

但不该直接照搬的地方有：

- 取消显式语言目标层
- 取消身份与权限上下文
- 取消目标 belief 和搜索恢复
- 取消局部 planner 和实时安全链

因为 Kinbot 的核心任务不是“沿路高效驾驶”，而是“在开放家庭环境里，按语义、身份、授权和社交约束稳定到达并继续交互”。

### 8.5 不建议把“移动具身智能”一次性定义成单一巨模型

这会同时带来四类风险：

- 模型尺寸失控
- 数据定义失控
- 评测目标失控
- 端侧时延失控

更稳妥的路线是：

- 大模型承担教师、标注、低频恢复
- 小模型承担高频执行
- 外部记忆承担长期空间与家庭先验
- 经典导航承担局部可达性和安全闭环

## 9. 对架构师的直接建议

如果要把这件事推进成正式架构项，建议架构师优先确认以下六条：

1. 是否正式确认 `VLN = 语义导航策略层`，而不是底层运动控制器。
2. 是否新增 `semantic_navigation_policy` 和 `semantic_spatial_memory` 两个逻辑能力。
3. 是否把“指定人搜索 / 跟随 / 靠近”升级为与寻物同级的一条正式产品能力线。
4. 是否明确“借鉴 VLA 的训练与模型方法，但不照搬智驾式 `video -> action` 闭环”。
5. 是否新增 `social_mobility_policy`，专门覆盖无指令共存移动与主动 reposition。
6. 是否采用“仿真层高保真 URDF + 策略层 compact embodiment_profile + 教师大模型 / 执行小模型双轨”的工程路线。

如果这六条确认，后续 VLN 规划就会非常清晰：

- 上层做任务语义和记忆
- 中层做子目标、共存移动与恢复
- 下层做局部规划和安全执行

## 10. OODA 与具身智能前沿的关系

OODA 来自 John Boyd 的空战决策理论。它的原始语境是高不确定、强对抗、时间敏感的动态闭环决策。

从这个意义上说，它和当下具身智能并不是“硬凑关系”，因为具身系统同样具备四个核心特征：

- 持续闭环，而不是一次性离线推理
- 部分可观测，而不是全信息
- 环境会反过来影响 agent，而不是静态输入输出
- 成败取决于感知、理解、决策、执行的整体耦合，而不是某一个模块单点精度

所以，`OODA` 与具身智能前沿是有真实契合点的。

但如果把 OODA 理解成“必须严格拆成四个串行模块，每一轮都完整跑一遍，再交下一个模块”，那就会变成硬套。因为当前前沿具身系统的真实形态是：

- 多时间尺度异步执行
- 观察、理解、决策在模型内部高度融合
- 动作常常以 trajectory chunk、velocity command、joint target 的形式连续生成
- 世界模型、外部记忆、controller 和 safety layer 往往与策略网络并存

因此，更准确的判断是：

- `OODA` 适合作为具身系统的外部系统架构语言
- `OODA` 不适合作为每个端到端模型都必须显式遵守的内部网络拓扑

## 10.1 OODA 与前沿具身系统的真实契合点

如果看最近一轮公开路线，OODA 最契合的不是“模型结构图”，而是“系统职责分层和时间尺度分层”。

典型信号有：

- Figure `Helix 02` 虽然强调 pixels-to-whole-body 的端到端控制，但官方仍然保留 `System 2 -> System 1 -> System 0` 的层次，分别处理语义推理、快速全身目标生成和 kHz 执行。
- NVIDIA `GR00T N1.6` 也不是简单的单一端到端黑盒，而是 `VLA + world model + navigation specialist + localization + whole-body controller` 的组合。
- `OpenVLA-OFT` 一类工作说明，端到端策略确实在增强，但工程上仍然高度依赖动作表示、控制频率、执行接口和训练配方。

这些系统共同说明一件事：

- 前沿不是在取消闭环
- 前沿是在压缩和重组闭环里的内部边界

也就是说，OODA 没过时，只是边界的位置变了。

## 10.2 OODA 与当下端到端模型的主要不匹配点

OODA 如果直接照搬到端到端模型内部，会有三个明显问题：

### 1. Observe / Orient / Decide 很难在模型内部被干净切开

在 VLA、VLM policy、world model policy 里，感知、空间理解、目标推断和动作选择往往共享同一套 latent。

因此不能要求一个 transformer 的前几层是 Observe，中间几层是 Orient，后几层是 Decide。这种映射通常没有工程意义。

### 2. 现代具身系统不是单节拍循环

真实系统往往是：

- 安全控制 50 到 1000 Hz
- 局部规划 5 到 50 Hz
- 高层策略 0.5 到 5 Hz
- 长程推理 / 恢复更慢

这更像“多速率异步 OODA”，而不是单线程顺序 OODA。

### 3. 端到端模型会压缩中间变量，但产品系统不能失去中间变量

模型可以不显式输出“我已经完成了 Orient”。

但产品系统仍然需要：

- 世界状态
- 风险状态
- 授权状态
- 失败原因
- 可解释日志

所以，模型内部可以 fused，系统外部仍然要保留可观测中间面。

## 10.3 端到端趋势下，如何重构 OODA

建议把 OODA 重构成两层：

### 第一层：系统级 OODA，保持显式

这一层仍然是 Kinbot 的主架构语言。


| OODA    | 在 Kinbot 系统中的含义                                                   |
| ------- | ----------------------------------------------------------------- |
| Observe | 传感器、多模态感知、SLAM、人体/房间/障碍识别、body state、事件流                          |
| Orient  | World State、空间记忆、身份/权限、embodiment_profile、场景风险、任务上下文              |
| Decide  | `semantic_navigation_policy`、`social_mobility_policy`、行为仲裁、安全前置门控 |
| Act     | 局部规划、controller、底盘执行、急停/限速、执行反馈与恢复                                |


这一层的目标不是追求“神经网络纯度”，而是保证：

- 职责边界清楚
- 时序清楚
- 安全链不被旁路
- 失败可诊断

### 第二层：模型级 OODA，允许压缩

在模型内部，可以接受更强的 fused policy：

- `Observe + Orient + 部分 Decide` 被压缩进共享表征
- 模型直接输出 action chunk、trajectory chunk 或语义子目标
- 局部控制器与 safety layer 继续负责最终 Act

也就是说，端到端模型不是否定 OODA，而是把 OODA 的中间过程压缩成 learned latent。

对 Kinbot 最合适的重构方式不是“取消 OODA”，而是：

- 系统层保持 OODA
- 模型层允许 `OO(D)` 融合
- Act 和 safety 继续显式保留

## 10.4 OODA 是大系统架构，还是 VLN 模型架构

结论：首先是大系统架构，其次才可能成为某些模型设计的启发。

更直接地说：

- `OODA` 不应该被定义成 VLN 模型本体
- `VLN / VLA / social mobility policy` 应该被定义成 OODA 系统中的策略组件

对 Kinbot，建议明确三层概念：

### A. OODA 是系统运行时架构

它定义：

- 信息如何进入系统
- 世界状态如何形成
- 哪些策略负责提议动作
- 哪些模块拥有最终执行权
- 安全、授权、恢复如何闭环

### B. VLN 是系统中的语义移动策略

它主要落在 `Orient -> Decide` 之间，解决：

- 目标 grounding
- 搜索与恢复
- 语义子目标生成

### C. VLA 是一类模型方法，而不是架构层级

它可以用来实现：

- 更强的 `semantic_navigation_policy`
- 更强的 `social_mobility_policy`
- 更低时延的 action / trajectory generation

但它本身不应自动升级为系统总架构。

一个实用判断标准是：

- 如果换掉某个模型，系统仍然需要 Observe、World State、安全门控、执行监督，那 `OODA` 就是系统架构
- 如果某个模型只是把一部分 Observe / Orient / Decide 压缩在自己内部，那它只是 OODA 内的一个策略实现

## 10.5 对 Kinbot 的直接结论

对 Kinbot，我建议把 OODA 定义为：

- `系统级主架构`
- `不是 VLN 模型的强制内部结构`
- `可以被端到端模型局部压缩，但不能被整体替代`

因此，在端到端趋势下，Kinbot 不应该问：

- “要不要抛弃 OODA，直接上端到端模型？”

而应该问：

- “哪些 OODA 边界应保留在系统外部？”
- “哪些 OODA 中间过程可以被模型内部压缩？”
- “哪些安全、记忆、授权和恢复变量必须继续显式存在？”

当前更稳妥的答案是：

- `Observe` 和 `Act` 的系统边界必须保留
- `Orient` 和 `Decide` 可以部分被端到端策略压缩
- `VLN / VLA` 应被视为 OODA 中的策略引擎，而不是 OODA 本身
- 可以把 OODA 当作分析模型内部推理过程的镜像，但不建议把 `VLN 模型级 OODA` 写成一代产品的刚性软件边界
- 即便未来存在高频策略头，Kinbot 也不应把“直接输出底盘速度”默认设为 VLN 的标准责任

## 10.6 纯视觉路线不是边缘方案，但它通常不是“无几何”

如果把“纯视觉”定义为“不使用主动 ToF、结构光或激光，只使用被动 RGB 单目 / 双目”，那么近两年的 VLN 或相近导航路线里，这已经不是边缘尝试，而是一个明确存在的分支。

从公开工作看，大体有三类做法：

- `RGB-only policy`：`GNM / ViNT / NoMaD`、`OmniVLA`、`AutoFly` 这类工作，直接在 RGB 观测上学习目标条件导航策略，重点是泛化、跨场景与动作生成。
- `RGB-only topometric / memory`：`TANGO` 这类工作不依赖 3D 先验地图或主动深度，而是用 RGB-only object-level topometric graph 结合局部可通行性控制完成长距离导航。
- `Passive-vision geometry`：`WildGS-SLAM` 这类工作说明单目 RGB 几何与动态场景 SLAM 正在快速进步；而 `Isaac ROS Visual SLAM` 与 `Isaac Perceptor` 这类工业路线则更强调被动双目和多相机 RGB 几何。

这说明一个很重要的判断：

- 纯视觉路线在高层策略上是成立的
- 但主流工程做法并不是“完全放弃几何”
- 更常见的形式是“语义策略由 RGB 驱动，近场几何由被动双目或单目深度先验补足”

对 Kinbot 来说，这个判断很关键。因为你们当前并不是要证明“只靠一张 RGB 图像也能动起来”，而是要在家庭场景里把：

- 指令泛化搜索与到达
- 无指令的共存移动
- 其他感知与交互任务共享同一组相机

同时做成一个可部署系统。这个问题天然更偏工程闭环，而不是单一 benchmark。

## 10.7 在 OODA 与 Kinbot 功能需求下，3～5 个被动 RGB 相机是否足够

如果把问题拆回 OODA，会更清楚。


| OODA 环节 | 对 Kinbot 的真实需求                     | 3～5 个被动 RGB 是否可支撑                                                         | 判断    |
| ------- | ---------------------------------- | ------------------------------------------------------------------------- | ----- |
| Observe | 房间、门口、家具、目标物、人、姿态、交互线索、盲区          | 可以，但必须是多相机、时间同步、外参稳定的共享感知输入                                               | `可以`  |
| Orient  | 位姿估计、房间识别、拓扑定位、目标候选排序、共享空间风险理解     | 可以，但要依赖 `VSLAM + place recognition + room/furniture memory + uncertainty` | `可以`  |
| Decide  | 语义子目标、搜索策略、礼让、速度调节、是否暂停 / 让行 / 重观察 | 可以，且这部分本来更依赖语义与社会线索，而不是主动深度                                               | `可以`  |
| Act     | 近场避障、窄通道通过、动态人宠避让、最终速度与刹停          | 有条件可以；若完全依赖多单目而没有双目几何或高质量深度先验，产品风险偏高                                      | `有条件` |


因此，结论不是“纯视觉不行”，而是：

- 对 `Observe -> Orient -> Decide`，3～5 个被动 RGB 完全有现实可行性。
- 对 `Act`，纯视觉的难点不是高层语义，而是近场几何鲁棒性、动态障碍不确定性和最终安全冗余。
- 如果一代产品要追求的是“家庭可部署”，那就不应把“全部单目 + 纯端到端动作输出”当成主方案。

进一步细分：

### A. `3` 个单目 RGB

更像研究样机或强约束 MVP 配置。

问题在于：

- 前向几何冗余不足
- 侧向或后向盲区大
- 同一批相机还要兼顾交互、人物、目标搜索和导航，资源竞争会很强

如果只有 `3` 个单目，也不是完全不能做，但要接受以下前提：

- 速度上限保守
- 转弯前更频繁地停下重观察
- 对低光、反光、玻璃、细杆和宠物突然切入更敏感

### B. `4` 个相机，其中前向 `1` 组双目 + 侧向 `2` 个单目

这是我认为最稳妥的最小产品配置。

原因是：

- 前向双目为 `Act` 提供稳定的被动几何基础
- 左右单目补足门框、侧向行人、交互朝向和房间切换线索
- 这套配置仍然保持了“纯视觉”，但不把所有近场几何都压在单目深度估计上

如果只能做一个主推荐方案，我会优先推荐这个。

### C. `5` 个相机，其中前向 `1` 组双目 + 另外 `3` 个单目

这是更均衡的产品配置。

新增的第 `5` 个相机，建议按产品优先级二选一：

- 如果更看重人机共存与盲区安全，放在后向或后侧
- 如果更看重交互、房间理解和远处目标发现，放在前上方广角

这类配置的优势不是“让 VLN 更像论文”，而是让同一套视觉输入同时支撑：

- 导航
- 人物 / 物体 / 房间感知
- 交互朝向与说话人关联
- 盲区感知与让行判断

### D. `5` 个单目 RGB，不做双目

理论上可行，研究上也有支撑，但我不建议把它作为 Kinbot 一代主交付路线。

它的主要问题不是“完全做不出来”，而是：

- 几何质量更依赖运动视差和学习深度先验
- 转身、起步、擦边通过时的不确定性会更高
- 你会被迫把很多安全策略做得非常保守

所以，如果允许把 `2` 个单目变成 `1` 组双目，这个自由度应该优先用于前向近场几何，而不是继续追求“全单目概念纯度”。

## 10.8 推荐的纯视觉技术路线

在现有 OODA 设计下，更合理的路线不是“为 VLN 单独配一套相机”，而是构建 `shared multi-camera visual stack`，再让多个策略共享同一份 World State。

### A. 传感器布局建议

推荐优先级如下：

1. `首选`：前向 `1` 组双目 + 左右 `2` 个单目，共 `4` 个相机。
2. `次选`：前向 `1` 组双目 + 左右 `2` 个单目 + 后向或前上方 `1` 个单目，共 `5` 个相机。
3. `备选`：`5` 个单目 RGB，但必须接受更保守的速度、更多停顿重观察和更强的不确定性门控。

布局原则应是：

- 前向负责近场几何、门框、窄通道和主要行进方向
- 侧向负责共享空间、人机交互、会车 / 让行和房间切换
- 后向或上向负责盲区补齐、回退安全或远距语义观察

如果机器人本体已经存在头部 / 云台 / 前上方交互相机，建议把它定义为 `active semantic observer`，重点承担：

- 房间与地标确认
- 说话人、手势、注视方向与目标人物关联
- 搜索失败后的主动换视角重观察
- 前向几何不确定时的语义复核

但不建议把这类相机定义成近场安全几何的主传感器。

### B. 同一套相机数据应先汇聚成共享视觉状态，而不是直接喂给 VLN 黑盒

建议在 `Observe` 层显式拆出四条共享支路：

#### 1. `visual_geometry_stack`

负责：

- 前向双目深度或多视几何
- `VSLAM / VO`
- 局部 freespace / occupancy / traversability
- 动态障碍物短时轨迹

这条支路主要服务：

- 局部规划
- 速度约束
- 窄通道通过
- 停车 / 礼让 / 避障

#### 2. `semantic_scene_stack`

负责：

- 房间识别
- 门口 / 走廊 / 家具类别
- 物体检测与开放词汇候选
- 人员检测、再识别、朝向、可交互状态
- 说话人和目标人物关联

这条支路主要服务：

- `semantic_navigation_policy`
- `social_mobility_policy`
- 交互与任务理解

#### 3. `spatial_memory_stack`

负责把多相机观察写成持续的家庭世界状态：

- room graph
- room-furniture-object relation
- target belief map
- person last-seen / likely-to-be
- shared-space hot zones

如果没有这层，VLN 只能反复做“当前帧反应”，无法稳定完成家庭中的搜索、恢复和再次定位。

这里建议采用 `hybrid representation`，而不是一开始就押注单一表示：

- 近场用 `BEV / local occupancy` 表达可通行性、动态障碍和局部代价
- 中远场用 `topometric / scene graph memory` 表达房间、家具、人物与目标关系

这样比“所有信息都投到一个统一 BEV 再解决一切”更稳妥，也更贴合家庭机器人既要导航、又要交互和搜索恢复的需求。

#### 4. `uncertainty_stack`

纯视觉路线必须把不确定性显式化，至少要持续评估：

- 低光 / 背光
- 模糊 / 过曝
- 玻璃 / 镜面 / 强反光
- 细杆、桌腿、电线等细小障碍
- 快速切入的人和宠物
- 深度先验与双目几何不一致

这条支路的价值，不是提高论文指标，而是给系统一个合理的“慢下来、停下来、换角度再看一次”的依据。

### C. 策略层建议继续分成两类，而不是合并成一个大导航模型

在这套共享视觉状态之上：

- `semantic_navigation_policy` 负责“为了完成任务，我该去哪里、先看哪里、下一个语义子目标是什么”
- `social_mobility_policy` 负责“在当前有人共存的空间里，我该怎么动才合适”

两者都不直接持有底盘最终控制权。

`Act` 层仍然建议保持：

- 经典局部规划
- 限速 / 急停 / 通过性门控
- 近场避障和轨迹平滑

这样做的好处是，端到端模型趋势可以体现在 `Orient / Decide` 内部，而不是把执行安全边界一并吞掉。

### D. 训练路线建议采用“共享视觉底座 + 教师大模型 + 小模型执行”

你们现在已经有：

- `Qwen3-VL-8B`
- 家庭数据采集能力
- 经典导航和 SLAM 基础设施

在纯视觉路线下，这三个积累是足够构建一个很强起点的。

更合适的路线是：

1. 先把多相机数据做成同步、标定稳定、可回放的数据底座。
2. 用前向双目和 SLAM 产出稳定几何监督，再反向蒸馏给侧向 / 后向单目的深度与可通行性估计。
3. 用 `Qwen3-VL-8B` 做稀疏教师，标注房间、家具、目标候选、人物状态、遮挡关系与搜索理由。
4. 训练小尺寸专用模型分别承担：
  - room / doorway / furniture understanding
  - object / person candidate ranking
  - target belief update
  - social mobility scoring
5. 最后再由 `semantic_navigation_policy` 与 `social_mobility_policy` 组合这些结构化结果。

这条路线的关键，不是让一个大模型直接吃下所有原始视频流，而是让大模型负责“解释”和“蒸馏”，让小模型负责“闭环执行”。

### E. 工程推进建议采用“三阶段纯视觉路线”

结合外部反馈，我认为三阶段思路是有价值的，但需要重新定性：

#### 阶段 1：`Deep V-SLAM + VLM baseline`

这是应当优先落地的产品化主线。

做法是：

- 保留经典局部规划与执行安全链
- 用前向双目和单目深度先验替换主动深度输入
- 让 VLM 负责稀疏语义解释、房间 / 家具 / 人 / 目标候选理解

这一步的目标不是“证明纯视觉最先进”，而是先得到可部署、可评测、可回放的闭环系统。

#### 阶段 2：`shared BEV/world-state unification`

这是中期研发重点。

做法是：

- 把多相机特征统一写入 `BEV / local occupancy + topometric memory`
- 引入主动观察与语义复核
- 把 `uncertainty_stack` 和 `social_mobility_policy` 接入统一世界状态

这一步的价值，在于把导航、交互、搜索恢复和共存移动真正建立在同一个 World State 上，而不是几个松散模块拼接。

#### 阶段 3：`pure-vision end-to-end VLA exploration`

这一步只建议作为前沿探索支线，而不是一代量产主路线。

原因是：

- 需要海量的真实闭环轨迹数据
- 纯视觉家庭场景 Sim2Real 仍然困难
- 一旦直接吞掉局部规划和安全门控，系统可审计性会明显下降

因此，更合理的策略是：先让阶段 1 和阶段 2 建立数据、接口与故障闭环，再决定是否投入阶段 3。

### F. Sim2Real 的重点应放在“相机布局 + 本体边界 + 动态共存”

如果最终采用纯视觉多相机方案，仿真里最该对齐的，不只是场景纹理，还包括：

- 相机安装位姿
- FOV 与畸变
- 双目基线
- 机身宽度与转弯包络
- 家庭常见反光面、玻璃门、桌椅腿、地毯边界
- 人和宠物的随机切入

也就是说，Sim2Real 在这里不只是“训练数据扩容”，而是要把 `Observe -> Act` 之间最容易出问题的视觉边界提前暴露出来。

## 10.9 对 Kinbot 的最终建议

基于当前技术趋势和 Kinbot 的需求边界，我的判断是：

- `纯视觉 VLN / mobility intelligence` 是可行方向，不是硬凑概念。
- 但“纯视觉”应理解为“不使用主动深度”，而不是“拒绝被动双目几何”和“让端到端模型独占控制链”。
- 在 OODA 下，`3～5` 个被动 RGB 相机足以支撑 `Observe -> Orient -> Decide`，并在保留经典局部规划的前提下支撑大部分 `Act` 需求。

如果把结论再压缩成工程建议，就是三条：

1. 不建议把 `3` 个单目 RGB 作为一代产品主方案。
2. 建议把 `4` 相机方案定义为默认基线：前向 `1` 组双目 + 左右 `2` 个单目。
3. 如果预算与算力允许，把 `5` 相机方案作为增强版：在上述基础上再加一个后向或前上方单目。

最后要特别克制的一点是：

- 不要因为“缺少主动深度”就把所有希望寄托在一个更大的 VLN / VLA 模型上。
- 不要因为“模型内部也能隐式形成 OODA”就把 OODA 下降成 VLN 的内部实现细节。
- 不要把“前沿探索里可以直接输出底盘速度”误写成一代产品的默认目标。

真正该增强的，是：

- 多相机共享感知底座
- 房间 / 家具 / 人 / 目标的结构化世界状态
- 不确定性门控
- `semantic_navigation_policy + social_mobility_policy + classical local planner` 的分层协同

如果这四件事做稳，Kinbot 的纯视觉路线是能成立的；如果这四件事没做稳，只是把更多相机和更大模型堆进去，系统仍然会在真实家庭里暴露出脆弱性。

## 11. 外部参考

以下链接用于支撑本文判断，访问时间以 2026-03-08 至 2026-03-09 为主：

VLN / 导航侧：

- Uni-NaVid 项目页：[https://pku-epic.github.io/Uni-NaVid/](https://pku-epic.github.io/Uni-NaVid/)
- TrackVLA 项目页：[https://pku-epic.github.io/TrackVLA-Web/](https://pku-epic.github.io/TrackVLA-Web/)
- TrackVLA++ 项目页：[https://pku-epic.github.io/TrackVLA-plus-plus-Web/](https://pku-epic.github.io/TrackVLA-plus-plus-Web/)
- NavFoM 项目页：[https://pku-epic.github.io/NavFoM-Web/](https://pku-epic.github.io/NavFoM-Web/)
- VLingNav 项目页：[https://wsakobe.github.io/VLingNav-web/](https://wsakobe.github.io/VLingNav-web/)
- OmniVLA 项目页：[https://omnivla-nav.github.io/](https://omnivla-nav.github.io/)
- AsyncVLA 项目页：[https://asyncvla.github.io/](https://asyncvla.github.io/)
- MM-Nav 项目页：[https://pku-epic.github.io/MM-Nav-Web/](https://pku-epic.github.io/MM-Nav-Web/)
- LISN 项目页：[https://social-nav.github.io/LISN-project/](https://social-nav.github.io/LISN-project/)
- OK-Robot 项目页：[https://ok-robot.github.io/](https://ok-robot.github.io/)
- VLN-PE 项目页：[https://crystalsixone.github.io/vln_pe.github.io/](https://crystalsixone.github.io/vln_pe.github.io/)
- VLN-PE ICCV 2025 论文页：[https://openaccess.thecvf.com/content/ICCV2025/html/Wang_Rethinking_the_Embodied_Gap_in_Vision-and-Language_Navigation_A_Holistic_Study_ICCV_2025_paper.html](https://openaccess.thecvf.com/content/ICCV2025/html/Wang_Rethinking_the_Embodied_Gap_in_Vision-and-Language_Navigation_A_Holistic_Study_ICCV_2025_paper.html)
- VLN-VER 官方代码页：[https://github.com/DefaultRui/VLN-VER](https://github.com/DefaultRui/VLN-VER)
- General Navigation Models 项目页：[https://general-navigation-models.github.io/](https://general-navigation-models.github.io/)
- ViNT 项目页：[https://general-navigation-models.github.io/vint/](https://general-navigation-models.github.io/vint/)
- NoMaD 项目页：[https://general-navigation-models.github.io/nomad/](https://general-navigation-models.github.io/nomad/)
- TANGO 项目页：[https://podgorki.github.io/TANGO/](https://podgorki.github.io/TANGO/)
- AutoFly 项目页：[https://xiaolousun.github.io/AutoFly](https://xiaolousun.github.io/AutoFly)
- Vision-Only Robot Navigation in a Neural Radiance World 项目页：[https://mikh3x4.github.io/nerf-navigation/](https://mikh3x4.github.io/nerf-navigation/)
- WildGS-SLAM 项目页：[https://wildgs-slam.github.io/](https://wildgs-slam.github.io/)
- VLM-Social-Nav 项目页：[https://jingliangc.github.io/social_navigation/social_vlm/](https://jingliangc.github.io/social_navigation/social_vlm/)

VLM / VLA / 通用具身侧：

- Qwen3-VL 官方仓库：[https://github.com/QwenLM/Qwen3-VL](https://github.com/QwenLM/Qwen3-VL)
- MiniVLA 官方博客：[https://ai.stanford.edu/blog/minivla/](https://ai.stanford.edu/blog/minivla/)
- OpenVLA-OFT 项目页：[https://openvla-oft.github.io/](https://openvla-oft.github.io/)
- X-VLA 项目页：[https://thu-air-dream.github.io/X-VLA/](https://thu-air-dream.github.io/X-VLA/)
- XPENG 第二代 VLA 官方发布：[https://www.xiaopeng.com/news/company_news/5539.html](https://www.xiaopeng.com/news/company_news/5539.html)
- Tesla AI & Robotics 官方页：[https://www.tesla.com/AI](https://www.tesla.com/AI)
- Tesla FSD 官方页：[https://www.tesla.com/fsd](https://www.tesla.com/fsd)
- Tesla FSD Support 页：[https://www.tesla.com/support/fsd](https://www.tesla.com/support/fsd)
- NVIDIA GR00T N1 官方发布：[https://nvidianews.nvidia.com/news/nvidia-isaac-gr00t-n1-open-humanoid-robot-foundation-model-simulation-frameworks](https://nvidianews.nvidia.com/news/nvidia-isaac-gr00t-n1-open-humanoid-robot-foundation-model-simulation-frameworks)
- NVIDIA GR00T N1.6 技术博客：[https://developer.nvidia.com/blog/building-generalist-humanoid-capabilities-with-nvidia-isaac-gr00t-n1-6-using-a-sim-to-real-workflow/](https://developer.nvidia.com/blog/building-generalist-humanoid-capabilities-with-nvidia-isaac-gr00t-n1-6-using-a-sim-to-real-workflow/)
- NVIDIA Isaac GR00T 官方页：[https://developer.nvidia.com/project-gr00t](https://developer.nvidia.com/project-gr00t)
- Isaac ROS Visual SLAM 官方文档：[https://nvidia-isaac-ros.github.io/repositories_and_packages/isaac_ros_visual_slam/index.html](https://nvidia-isaac-ros.github.io/repositories_and_packages/isaac_ros_visual_slam/index.html)
- NVIDIA Isaac Perceptor Reference Architecture：[https://nvidia-isaac-ros.github.io/v/release-3.2/reference_workflows/isaac_perceptor/reference_architecture.html](https://nvidia-isaac-ros.github.io/v/release-3.2/reference_workflows/isaac_perceptor/reference_architecture.html)
- NVIDIA Nova Orin Developer Kit 文档：[https://nvidia-isaac-ros.github.io/v/release-3.1/robots/nova_developer_kit/index.html](https://nvidia-isaac-ros.github.io/v/release-3.1/robots/nova_developer_kit/index.html)
- Figure Helix 02 官方发布：[https://www.figure.ai/news/helix-02](https://www.figure.ai/news/helix-02)
- Spirit AI 官方介绍：[https://www.spirit-ai.com/en/about](https://www.spirit-ai.com/en/about)
- Spirit AI 新闻页：[https://www.spirit-ai.com/en/news](https://www.spirit-ai.com/en/news)

补充说明：

- 截至 2026-03-08，我没有检索到 NVIDIA 官方公开名为 `GR00T N2` 的材料；目前可核实的是 2025-03-18 的 `GR00T N1` 和 2026-01-08 的 `GR00T N1.6`。
- `VLNVerse` 的 2025-12-22 预印本公开摘要与本文判断方向一致，即更强调 versatile、embodied、realistic simulation 与 unified evaluation；但我本次未找到稳定的官方项目页，因此没有把它作为本文的核心依据。

