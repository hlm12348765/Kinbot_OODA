# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-17
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-17 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 仍为 `Friday, 15 May 2026`，合计 `69` 篇 entries；其中 new submissions `28` 篇、cross submissions `10` 篇、replacement submissions `31` 篇。2026-05-17 未出现新的官方 Robotics 批次，本轮采用“最新官方 listing + 当日未出现新批次说明 + 近期待补录”口径，在排除 2026-05-15 与 2026-05-16 已入主卡片及明确排除论文后，只补录对 Kinbot 纯视觉 3D 场景图、边缘端可认证规划与安全验证归责有增量价值的 3 篇论文，并给出周度饱和判断。

---

## 1. 检索口径

本轮检索日期：2026-05-17。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期仍为 `Friday, 15 May 2026`，合计 `69` 篇 entries；其中 new submissions `28` 篇、cross submissions `10` 篇、replacement submissions `31` 篇。
3. 本轮检索时官方 `cs.RO/recent` 显示最新 Robotics recent 批次仍为 `Fri, 15 May 2026`，该日期 recent entries 为 `38` 篇；`Thu, 14 May 2026` 批次显示 first `12` of `66` entries；尚未出现 `2026-05-17` 新 Robotics 批次。
4. 本轮按“最新官方 listing + 当日未出现新批次说明 + 近期待补录”处理；不把 `2026-05-17` 写成新的官方 Robotics listing。
5. 本轮先核对既有日更文档中的论文标题与 arXiv 编号，排除 2026-05-15 与 2026-05-16 已进入主卡片的 `2605.14174`、`2605.14262`、`2605.13923`、`2605.14704`、`2605.14801`、`2605.14396`、`2511.17299`、`2408.16307`、`2603.03577`、`2605.14950`，并保留前两日候选排除表中的既有判断。
6. 本轮不固定凑满 `10` 篇；由于同一官方 listing 已连续三天被检索，主卡片收缩为 3 篇强相关近期待补录，其余只进入候选排除表。

筛选标准：

1. 是否改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是重复泛 `VLA`、world model 或自动驾驶端到端规划主题。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`observability_data_governance`、`platform_runtime`、`hardware_control_runtime`。
3. 是否能低成本转化为 Phase 5 验证项：室内纯视觉 3D 场景图、端侧可认证规划回放、安全场景生成中的责任归因。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 同一 `2026-05-15` 官方 listing 已在 2026-05-15 与 2026-05-16 纪要中覆盖 10 篇主卡片，本轮不继续扩大泛 `VLA`、自动驾驶 world model、manipulation 或 UAV 条目。
2. `Behavior Cloning for Active Perception with Low-Resolution Egocentric Vision`、`SR-Platform` 已在 2026-05-15 候选排除表中说明；`EARL`、`FU-MPC`、`CaMeRL` 已在 2026-05-16 候选排除表中说明，本轮不反复改写。
3. `LMPath`、`GTA-VLA` 等条目有旁路启发，但分别偏 UAV 大尺度搜索或 VLA manipulation，人机空间提示和语义搜索主题已由前序纪要覆盖。
4. `Realtime-VLA FLASH`、`FrameSkip`、`RoboEvolve`、`DSSP`、`Slot-MPC` 等继续归为 VLA / manipulation / world model 工具链观察，不因跨日补录扩张 Kinbot 一代在线模型层。
5. `LiDAR` odometry、UAV LiDAR、四足、灵巧手、起重机、海底 / 水下机器人、多机器人、自动驾驶车辆动力学等条目不写成 Kinbot 一代纯视觉家庭机器人路线变化。

## 2. 本轮总判断

本轮没有新的官方 `2026-05-17` Robotics listing。由于 `2026-05-15` listing 已被连续检索，本轮更重要的是做饱和判断：泛 `VLA` 和大一统 embodied model 不再给 Kinbot 一代带来新的架构动作；真正仍有增量的，是把纯视觉地图、端侧可认证规划和安全验证证据链转成可测、可回放、可审计的 Phase 5 工程项。

本轮对 Kinbot 有 3 个增量判断：

1. **纯视觉空间记忆需要 room-level scene graph 边界**：`LEXI-SG` 提醒 Kinbot 不应把开放词汇对象识别、稠密重建和房间拓扑割裂处理；家庭空间记忆可以先以 room 为最小稳定单元，再绑定对象、路径和重新观察状态。
2. **端侧安全规划不只看模型大小，也要看可认证求解链**：`TinySDP` 说明 resource-constrained edge robotics 上仍可追求实时优化与几何证书，但 Kinbot 应先把它转成离线回放对照和“可认证规划收益 / 资源成本”指标，不直接替换保守导航栈。
3. **安全仿真场景要区分“碰撞发现”和“责任归因”**：`CARS` 虽来自自动驾驶，但其责任归因式 adversarial scenario 生成适合转成 Kinbot Phase 5 的诊断口径：失败是系统可避免缺陷、用户 / 家庭环境不可控冲突，还是场景设计越界。

周度综合判断：

| 主题                                          | 本周状态     | 后续动作                                                                                                                            |
| ------------------------------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------- |
| 泛 `VLA` / 大一统 embodied foundation model     | 已饱和      | 只在出现家庭移动实机闭环、端侧资源实测、可审计安全机制或用户交互纠错新增证据时进入主卡片。                                                                                   |
| world action model / manipulation benchmark | 已饱和      | 保留为中长期研究输入；一代不扩大到灵巧操作、大一统动作模型或全量视频 world model。                                                                                 |
| 纯视觉导航与空间记忆                                  | 值得进入专题跟踪 | 将 `ConsistNav`、VLN 感知瓶颈、`MonoSpheres`、`MIRAGE`、`LEXI-SG` 汇总为“导航收益导向的纯视觉空间记忆”专题。                                                 |
| 安全验证、运行时监控与调参治理                             | 值得进入专题跟踪 | 将 `SafeManip`、`ReasonSTL`、reachability verification、visual runtime monitoring、`MIRAGE`、`SafeCtrlBO`、`CARS` 合并成 Phase 5 安全证据链专题。 |
| 端侧资源与可认证优化                                  | 值得谨慎跟踪   | 将 `TinySDP`、端侧 GEMM、轻量 depth-enhanced VLA、asynchronous inference 统一放入“资源收益比 + 证书 / 延迟 / 功耗”评估，不改变 `12GB + 32GB` 基线。             |
| 隐藏物体、特定实例和用户模板搜索                            | 接近专题成熟   | 将 `SceneFunRI` 与 `L2G-Det` 转成家庭找物 case set；短期不再为相似 object grounding 论文新增在线模块。                                                   |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 room-level scene graph、embedded SDP solver、responsibility-attributed scenario generator 都变成在线组件，会继续过复杂”。建议只吸收为 3 个轻量验证动作：室内空间记忆的 room-level schema 对照、可认证规划离线回放指标、安全仿真失败归责字段。暂不增加产品级模型层、在线优化器或新传感器。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | LEXI-SG: Monocular 3D Scene Graph Mapping with Room-Guided Feed-Forward Reconstruction | 转成纯视觉空间记忆专题输入，重点验证 room-level scene graph 是否降低长期地图漂移与对象记忆混乱。 |
| A- | TinySDP: Real Time Semidefinite Optimization for Certifiable and Agile Edge Robotics | 转成端侧可认证规划回放对照，评估证书、延迟、资源占用和路径质量收益。 |
| B+ | Learning Responsibility-Attributed Adversarial Scenarios for Testing Autonomous Vehicles | 转成 Phase 5 安全仿真诊断口径，补充失败归责字段，不直接迁移自动驾驶场景。 |

## 3. 论文卡片

### 3.1 LEXI-SG: Monocular 3D Scene Graph Mapping with Room-Guided Feed-Forward Reconstruction

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.13741](https://arxiv.org/abs/2605.13741) |
| 本轮 listing 口径 | `cs.RO/recent` 2026-05-14 entry，近期待补录；abs 页显示 `Submitted on 13 May 2026` |
| 分类 | `cs.RO`, `cs.CV` |
| 方法关键词 | monocular RGB, 3D scene graph, room-level reconstruction, open-vocabulary mapping, object tracking |

摘要要点转述：

论文提出 `LEXI-SG`，目标是只用单目 `RGB` 输入构建开放词汇 3D 场景图。现有 scene graph mapping 常依赖深度相机或 LiDAR，而该方法利用开放词汇 foundation model 的语义先验先把环境按 room 切分，等房间被充分观察后再做 feed-forward reconstruction，降低 sliding-window 重建中的尺度不一致。系统进一步用 room-based factor graph 对齐各房间重建，保持局部地图一致性，同时自然形成场景图层级；每个房间内部支持开放词汇对象分割和跟踪。论文在 Habitat-Matterport 3D 和自采 egocentric office 序列上验证，报告了轨迹估计、稠密重建和开放词汇分割方面的提升或竞争性表现。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory` 与 `mobility_navigation` 中“纯视觉家庭地图如何同时保存房间、对象、路径和语义层级”的问题。
2. Kinbot 一代不采用深度相机 / LiDAR 作为产品 fallback，因此需要认真评估单目 / 双目 `RGB` 是否能支持足够稳定的 room-level scene graph。
3. 对应家庭空间记忆：厨房、卧室、客厅等 room-level 单元比全局连续稠密地图更适合绑定对象、用户习惯、清扫 / 巡航禁区和重新观察任务。

资源消耗与部署信号：

1. 依赖开放词汇 foundation model 与 feed-forward reconstruction，短期不应直接并入端侧实时闭环。
2. room-level 分段可以降低全局重建压力，适合作为离线建图、回放分析或低频空间记忆更新候选。
3. 对 Kinbot 最现实的吸收方式是增加评测字段：`room_boundary_stability`、`object_track_consistency`、`scale_drift`、`reobserve_required`。

优势：

1. 直接命中 Kinbot 一代纯视觉空间记忆与室内场景图需求。
2. room-guided 结构比无差别全局重建更贴近家庭空间组织方式。
3. 开放词汇对象分割和跟踪可与找物、巡航和家属 App 标注联动。

劣势与风险：

1. 论文仍是研究系统，未给出 Kinbot 类端侧硬件上的延迟、功耗和内存预算。
2. 单目重建在反光地面、暗光、低纹理墙面和动态家庭成员场景下仍可能漂移。
3. 若把开放词汇场景图写成在线强依赖，会扩大运行时复杂度；应先作为离线评测和空间记忆专题输入。

推荐理由：

建议作为 A- 级输入。Kinbot 应吸收其 room-level scene graph 思想，把纯视觉空间记忆从“看见对象”提升到“房间层级 + 对象关系 + 重新观察状态”的可测结构，但不改变当前传感主线。

### 3.2 TinySDP: Real Time Semidefinite Optimization for Certifiable and Agile Edge Robotics

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.13748](https://arxiv.org/abs/2605.13748) |
| 本轮 listing 口径 | `cs.RO/recent` 2026-05-14 entry，近期待补录；abs 页显示 `Submitted on 13 May 2026` |
| 分类 | `cs.RO`, `eess.SY`, `math.OC` |
| 方法关键词 | embedded optimization, semidefinite programming, certifiable MPC, edge robotics, obstacle constraints |

摘要要点转述：

论文关注非凸几何约束运动规划中的半定规划求解。传统 `SDP` 能为非凸约束提供凸松弛，但求解器通常太重，难以在资源受限嵌入式系统上做实时控制。`TinySDP` 将正半定锥投影整合进 cached-Riccati-based `ADMM` solver，使微控制器也能在含非凸障碍约束的问题上运行 model-predictive control。论文还加入 a posteriori rank-1 certificate，把松弛解转成每个时间步的几何保证。实验覆盖 cul-de-sac 和动态障碍等本地方法容易失败的场景，报告 collision-free navigation 以及较短路径，并在 Crazyflie quadrotor 上验证了实时执行。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation`、`platform_runtime` 与 `hardware_control_runtime` 中“端侧资源受限时，安全规划是否仍能提供可检查保证”的问题。
2. Kinbot 家庭巡航会遇到窄通道、局部死胡同、临时障碍和动态人员移动；这些场景不能只依赖平均成功率或局部启发式路径。
3. 对应 Phase 5：需要在回放评测中区分路径质量、碰撞风险、实时性和可认证几何保证，而不只是看导航是否到达。

资源消耗与部署信号：

1. 论文强调嵌入式实时求解，但具体适配仍要看 Kinbot 底盘控制频率、状态维度、障碍表达和算力预算。
2. `SDP` 证书可先作为离线回放 / 仿真对照，不应直接替代当前保守导航与硬安全机制。
3. 若后续复现，应记录 `latency_ms`、内存占用、失败率、证书通过率、路径长度和与现有导航栈的冲突。

优势：

1. 把端侧资源约束和可认证规划连接起来，符合 Kinbot 一代对端侧可靠性的关注。
2. 面向非凸障碍约束，比单纯轻量模型或启发式规划更接近安全证据链。
3. 可转成 Phase 5 离线 benchmark，不需要新增传感器。

劣势与风险：

1. 验证平台是 agile quadrotor，不是家庭轮式底盘，动力学和风险边界不同。
2. 几何证书不等同于完整系统安全，感知错误、用户突然移动和地图错误仍需其他机制兜底。
3. 若把优化器作为在线强依赖，调参、异常回退和实时调度复杂度会增加。

推荐理由：

建议作为 A- 级输入。Kinbot 可将 `TinySDP` 作为“端侧可认证规划”的研究对照：先评估证书与资源收益比，再决定是否进入底盘导航专题，不应立即改写量产导航栈。

### 3.3 Learning Responsibility-Attributed Adversarial Scenarios for Testing Autonomous Vehicles

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.13751](https://arxiv.org/abs/2605.13751) |
| 本轮 listing 口径 | `cs.RO/recent` 2026-05-14 entry，近期待补录；abs 页显示 `Submitted on 13 May 2026` |
| 分类 | `cs.RO`, `cs.SE`, `eess.SY` |
| 方法关键词 | adversarial scenario generation, responsibility attribution, safety assurance, closed-loop simulation, diagnostic evidence |

摘要要点转述：

论文提出 `CARS`，用于生成带责任归因的自动驾驶对抗测试场景。作者指出，现有 adversarial simulation 可以高效发现碰撞，但通常无法区分“系统本可避免的缺陷”和“交通参与者造成的不可避免冲突”。`CARS` 把 context-aware adversary selection、闭环 generative adversarial policy 和规范化责任评估结合起来，生成物理可行且诊断上可归责的碰撞场景。论文在多个国家交通数据 benchmark 上验证，强调安全验证不应停留在发现碰撞，而要构造可解释、与法规模型一致的安全证据。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization` 与 `observability_data_governance` 中“失败回放如何判断责任和改进动作”的问题。
2. Kinbot Phase 5 也会遇到类似诊断问题：碰撞 / 停滞 / 误报是机器人策略缺陷、感知误差、用户突然介入、家具摆放越界，还是测试场景本身不合理。
3. 对应安全仿真：仅生成“容易失败”的家庭场景不够，还要给出失败责任、可避免性、复现条件和修复 owner。

资源消耗与部署信号：

1. 场景生成与责任归因适合作为离线仿真和回放分析，不应进入端侧实时链路。
2. 自动驾驶法规模型不能直接迁移到家庭机器人，需要重写为家庭安全规范：用户距离、宠物 / 小孩、药箱禁区、跌倒风险、隐私区域等。
3. 最现实的吸收方式是为 Phase 5 失败样本增加字段：`avoidable_by_robot`、`environment_out_of_scope`、`user_intervention`、`test_design_issue`、`owner_action`。

优势：

1. 把 adversarial testing 从“找失败”推进到“解释失败”，适合安全证据链。
2. 可以帮助 Kinbot 区分算法问题、系统集成问题、用户场景问题和测试设计问题。
3. 与前序 `MIRAGE`、visual runtime monitoring、reachability verification 可组成更完整的验证闭环。

劣势与风险：

1. 原任务是自动驾驶，不是家庭室内移动机器人。
2. 责任归因需要规范模型，若规范定义含糊，自动归因可能制造虚假确定性。
3. 过度生成对抗场景会扩大测试复杂度，应先从少量高价值家庭风险场景开始。

推荐理由：

建议作为 B+ 级输入。Kinbot 应吸收“责任归因式安全证据”的思路，把 Phase 5 失败样本从简单 bug list 升级为可避免性、责任边界和修复 owner 的诊断记录。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| LMPath: Language-Mediated Priors and Path Generation for Aerial Exploration | [2605.13782](https://arxiv.org/abs/2605.13782) | recent entry | 语义先验搜索有旁路价值，但场景是 UAV + satellite imagery + geofence 大尺度搜索；家庭找物已由 `SceneFunRI`、`L2G-Det` 覆盖。 |
| Guide, Think, Act: Interactive Embodied Reasoning in Vision-Language-Action Models | [2605.13632](https://arxiv.org/abs/2605.13632) | recent entry | 人类空间提示可用于交互纠错，但任务仍偏 VLA manipulation；本周 intent refinement、hidden-object search 与 grounding 已接近饱和。 |
| Reactive Planning based Control for Mobile Robots in Obstacle-Cluttered Environments | [2605.14232](https://arxiv.org/abs/2605.14232) | 2026-05-15 listing new submission | 部分环境信息下的移动避障相关，但偏经典数值示例；未比 `Safety-Constrained RL`、`TinySDP` 提供更强的安全验证增量。 |
| Behavior Cloning for Active Perception with Low-Resolution Egocentric Vision | [2605.14106](https://arxiv.org/abs/2605.14106) | 2026-05-15 listing new submission | 已在 2026-05-15 候选排除表中说明；低成本主动视觉有启发，但任务偏腕部相机机械臂找植物。 |
| SR-Platform: An Agentic Pipeline for Natural Language-Driven Robot Simulation Environment Synthesis | [2605.14700](https://arxiv.org/abs/2605.14700) | 2026-05-15 listing new submission | 已在 2026-05-15 候选排除表中说明；可作仿真工具观察，但不直接改变导航、安全、记忆或端侧资源判断。 |
| EARL: Towards a Unified Analysis-Guided Reinforcement Learning Framework for Egocentric Interaction Reasoning and Pixel Grounding | [2605.14742](https://arxiv.org/abs/2605.14742) | 2026-05-15 listing cross submission | 已在 2026-05-16 候选排除表中说明；egocentric grounding 有价值，但当前不扩大 MLLM grounding 主线。 |
| FU-MPC: Frontier- and Uncertainty-Aware Model Predictive Control for Efficient and Accurate UAV Exploration with Motorized LiDAR | [2605.14920](https://arxiv.org/abs/2605.14920) | 2026-05-15 listing new submission | 已在 2026-05-16 候选排除表中说明；依赖 motorized LiDAR，与一代纯视觉传感主线不一致。 |
| CaMeRL: Collision-Aware and Memory-Enhanced Reinforcement Learning for UAV Navigation in Multi-Scale Obstacle Environments | [2605.14810](https://arxiv.org/abs/2605.14810) | 2026-05-15 listing new submission | 已在 2026-05-16 候选排除表中说明；UAV RL 与深度观测设定弱于 `MonoSpheres` 对纯视觉探索不确定性的映射。 |
| Realtime-VLA FLASH: Speculative Inference Framework for Diffusion-based VLAs | [2605.13778](https://arxiv.org/abs/2605.13778) | recent entry | 低延迟 VLA 推理工具价值明确，但本周端侧推理与 VLA 主题已饱和；未提供新的家庭导航 / 安全治理项。 |
| FrameSkip: Learning from Fewer but More Informative Frames in VLA Training | [2605.13757](https://arxiv.org/abs/2605.13757) | recent entry | 训练效率方向有资源启发，但偏 VLA 训练技巧；不改变 Kinbot 一代端侧运行基线。 |
| RoboEvolve: Co-Evolving Planner-Simulator for Robotic Manipulation with Limited Data | [2605.13775](https://arxiv.org/abs/2605.13775) | recent entry | planner-simulator 共演化有工具价值，但任务偏 manipulation 且仍为 on-going work，不进入本轮主卡片。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 建议将 `LEXI-SG` 转成纯视觉空间记忆专题输入：新增 room-level scene graph、房间边界稳定性、对象跟踪一致性、尺度漂移和重新观察字段。
2. 建议将 `TinySDP` 转成端侧可认证规划离线对照：在回放中记录证书通过率、延迟、内存占用、路径长度、动态障碍失败率和现有导航栈冲突。
3. 建议将 `CARS` 转成 Phase 5 安全失败诊断字段：可避免性、环境越界、用户介入、测试设计问题、修复 owner 和复现实验条件。
4. 建议将本周主题收敛为 3 个专题候选：纯视觉空间记忆、安全证据链、端侧可认证优化；不再为泛 `VLA` 或 manipulation 条目增加主线概念。
5. 本轮不建议回写 `03_decision_log.md` 或主线架构文档；上述内容均为研究输入和 Phase 5 验证候选，不构成已确认产品决策。

## 6. 本轮未进入主线的原因

1. 本轮官方未出现 `2026-05-17` Robotics 新批次，主卡片来自近期待补录，不代表新的架构事实。
2. 入选论文主要提供场景图结构、离线回放指标和安全诊断字段，未经过 Kinbot 实机验证、供应链评估、端侧资源实测或用户体验评审。
3. 若将入选论文直接升级为在线 room graph、online SDP solver 和 adversarial scenario generator，会扩大运行时复杂度并稀释当前 Phase 5 门控；本轮只保留轻量验证动作。
4. 当前一代纯视觉、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 与 `5000 到 6000 元` BOM 冻结基线不因本轮论文改变。

## 7. 来源

1. arXiv `cs.RO/new`：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent`：<https://arxiv.org/list/cs.RO/recent>
3. LEXI-SG: Monocular 3D Scene Graph Mapping with Room-Guided Feed-Forward Reconstruction：<https://arxiv.org/abs/2605.13741>
4. TinySDP: Real Time Semidefinite Optimization for Certifiable and Agile Edge Robotics：<https://arxiv.org/abs/2605.13748>
5. Learning Responsibility-Attributed Adversarial Scenarios for Testing Autonomous Vehicles：<https://arxiv.org/abs/2605.13751>
