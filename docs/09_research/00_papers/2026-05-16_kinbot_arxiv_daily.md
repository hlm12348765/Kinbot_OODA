# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-16
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-16 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 仍为 `Friday, 15 May 2026`，合计 `69` 篇 entries；其中 new submissions `28` 篇、cross submissions `10` 篇、replacement submissions `31` 篇。2026-05-16 未出现新的官方 Robotics 批次，本轮采用“最新官方 listing + 当日未出现新批次说明 + 日更补录”口径，在排除 2026-05-15 已入主卡片论文后，补录对 Kinbot 语义地图安全、纯视觉探索、实例物体搜索、端侧空间表征和安全控制调参有增量价值的 5 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-16。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期仍为 `Friday, 15 May 2026`，合计 `69` 篇 entries；其中 new submissions `28` 篇、cross submissions `10` 篇、replacement submissions `31` 篇。
3. 本轮检索时官方 `cs.RO/recent` 显示最新 Robotics recent 批次仍为 `Fri, 15 May 2026`，该日期 recent entries 为 `38` 篇；尚未出现 `2026-05-16` 新 Robotics 批次。
4. 本轮按“最新官方 listing + 当日未出现新批次说明 + 日更补录”处理；不把 listing 日期误写成 `2026-05-16` 新批次。
5. 本轮先核对既有日更文档中的论文标题与 arXiv 编号，排除 2026-05-15 已进入主卡片的 `2605.14174`、`2605.14262`、`2605.13923`、`2605.14704`、`2605.14801`，再从同一官方 listing 的 cross / replacement 条目中选择确实新增 Kinbot 评测项或治理项的论文。
6. 本轮继续不固定凑满 `10` 篇；主卡片保留 5 篇强相关补录，其余放入候选排除表。

筛选标准：

1. 是否直接改变 Kinbot 对导航、记忆、安全或端侧资源的判断，而不是仅增加论文数量。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`observability_data_governance`、`platform_runtime`、`hardware_control_runtime`。
3. 是否提供可落地的 Phase 5 验证项：语义地图鲁棒性、纹理稀疏 / 低视差探索、用户自有物体实例搜索、安全调参试验边界、RGB-only 空间特征资源预算。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. `Pelican-Unified`、`XR-1`、`Any3D-VLA`、`MindVLA-U1`、`DIAL`、`DIVER`、`AutoMoT` 等大模型 / 自动驾驶 VLA 条目继续只作旁路观察；它们未改变 Kinbot 一代家庭移动机器人主线。
2. `Slot-MPC`、`RoboWM-Bench`、`Robometer`、`MALLVI` 等 world model / reward model / manipulation 条目有研究价值，但与近两周已收录的 world action model、VLA 幻觉、动作 chunk、记忆编译和评测主题重复度较高。
3. `Co-Me`、`SToRe3D` 等视觉加速条目有端侧资源价值，但场景偏多视角 3D 检测、自动驾驶或重型视觉几何 transformer，本轮不把它们写成 Kinbot 一代端侧基线变化。
4. LiDAR odometry、UAV LiDAR、蓝牙阵列导航、多机器人、海底 / 月球 / 四足 / 灵巧手 / 软体机器人等条目不写成 Kinbot 一代纯视觉家庭机器人路线变化。
5. 本轮收录的 replacement 条目均需产生明确 Kinbot 评测项或治理项：`MonoSpheres` 对应纯视觉探索不确定性，`L2G-Det` 对应用户自有物体实例搜索，`SafeCtrlBO` 对应安全控制器调参边界；其余 replacement 默认排除。

## 2. 本轮总判断

本轮没有新的官方 `2026-05-16` Robotics listing，因此不应把今天写成新批次。更合理的动作是从 `2026-05-15` 官方 listing 中补录昨天未进主卡片、但能补足 Kinbot Phase 5 验证视角的论文。

本轮对 Kinbot 有 5 个增量判断：

1. **语义级环境变化比像素级攻击更接近家庭风险**：`MIRAGE` 提醒 Kinbot 的纯视觉语义地图不能只测噪声、模糊、曝光变化，还要测阴影、反光、湿地面、贴纸、门缝光等“看起来合理但会误导地图”的语义扰动。
2. **纯视觉探索要显式记录 free-space uncertainty**：`MonoSpheres` 虽是单目 UAV 场景，但其对稀疏深度、低纹理、视差不足和快速重规划的处理，可转成 Kinbot 家庭探索 / 巡航的回放压力测试。
3. **找用户自有物品不能只靠开放类名识别**：`L2G-Det` 说明少量模板图像可用于寻找特定实例，适合 Kinbot 处理“我的药盒 / 这副眼镜 / 这个遥控器”类任务。
4. **控制器调参也需要安全治理，不只是算法优化**：`SafeCtrlBO` 可转成 Phase 5 实机调参规程：每次硬件试验都要有安全约束、可回退参数、试验预算和停止条件。
5. **RGB-only 空间增强应优先看资源收益比**：`Evo-Depth` 的 0.9B lightweight implicit depth 思路支持“一代不加主动深度传感器”的方向，但仍需先作为候选空间特征模块验证，而不是新增在线大模型层。

周度综合判断：

| 主题 | 本周状态 | 后续动作 |
| --- | --- | --- |
| 泛 VLA / 自动驾驶端到端规划 | 已饱和 | 只在出现家庭移动实机、端侧资源实测、可审计安全治理或用户交互澄清新增证据时进入主卡片。 |
| world action model / manipulation benchmark | 接近饱和 | 保留为中长期研究输入；一代不扩大到灵巧操作和大一统动作模型。 |
| 安全验证与运行时监控 | 值得进入专题跟踪 | 将 `SafeManip`、`ReasonSTL`、视觉运行时监控、MIRAGE、SafeCtrlBO 汇总为 Phase 5 安全规格 / 监控 / 调参专题。 |
| 纯视觉导航与空间不确定性 | 值得进入专题跟踪 | 将 VLN 感知瓶颈、MonoSpheres、MIRAGE、Evo-Depth 转成“导航收益导向”的感知指标和压力场景。 |
| 物体记忆与搜索 | 值得进入专题跟踪 | 将 `SceneFunRI` 与 `L2G-Det` 合并为隐藏物体、特定实例、用户模板图和不确定性表达测试集。 |
| 端侧资源优化 | 继续观察，避免过早引入复杂模型 | 只保留能量化模型大小、显存、延迟、频率或端侧部署收益的论文；不因单篇加速论文改写 `12GB + 32GB` 基线。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把语义攻击生成器、单目探索规划器、模板实例分割、Safe BO 调参器和 RGB 隐式深度 VLA 都变成在线模块，会明显过复杂”。建议只吸收为 5 个轻量验证动作：语义地图扰动集、free-space uncertainty 回放字段、用户模板物体搜索 case、安全调参 checklist、RGB-only 空间特征离线评测。暂不增加新的产品级模型层。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | Systematic Discovery of Semantic Attacks in Online Map Construction through Conditional Diffusion | 转成纯视觉语义地图鲁棒性与异常环境压力测试。 |
| A- | MonoSpheres: Large-Scale Monocular SLAM-Based UAV Exploration through Perception-Coupled Mapping and Planning | 吸收 free-space uncertainty、低纹理、视差不足和快速重规划评测字段。 |
| A- | Safe Bayesian Optimization for Complex Control Systems via Additive Gaussian Processes | 转成 Phase 5 控制器调参安全规程和硬件试验边界。 |
| B+ | From Local Matches to Global Masks: Template-Guided Instance Detection and Segmentation in Open-World Scenes | 用于用户自有物品实例搜索与模板图评测。 |
| B+ | Evo-Depth: A Lightweight Depth-Enhanced Vision-Language-Action Model | 作为 RGB-only 空间特征候选，不改写当前传感器主线。 |

## 3. 论文卡片

### 3.1 Systematic Discovery of Semantic Attacks in Online Map Construction through Conditional Diffusion

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.14396](https://arxiv.org/abs/2605.14396) |
| 本轮 listing 口径 | 2026-05-15 cross submission，日更补录；abs 页显示 `Submitted on 14 May 2026` |
| 分类 | `cs.CV`, `cs.CR`, `cs.LG`, `cs.RO` |
| 方法关键词 | semantic attack, online map construction, conditional diffusion, map robustness, adversarial defense |

摘要要点转述：

论文提出 `MIRAGE`，用于系统寻找在线地图构建中的语义级攻击。不同于像素扰动，它通过 diffusion latent manifold 搜索看起来合理的环境变化，例如阴影、湿地面等，使道路拓扑在语义上似乎没有变化，却能误导 HD map 预测。作者在 nuScenes 上验证了 boundary removal 和 boundary injection 两类攻击：前者压制了 `57.7%` 检测并破坏 `96%` 规划轨迹，后者能注入虚假边界，而常规 pixel PGD 与 AdvPatch 失败。两位独立 VLM judge 评估显示，MIRAGE 生成场景有 `80-84%` 被判断为真实，明显高于传统补丁攻击的真实性。论文核心结论是，语义级环境变化比像素级扰动更难被现有 adversarial defenses 抵消。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 与 `observability_data_governance` 中“纯视觉语义地图是否会被合理外观变化误导”的问题。
2. 家庭场景中也存在类似风险：地面反光、窗帘阴影、门缝强光、地毯纹理、贴纸、湿拖地痕迹、临时遮挡，都可能让语义地图或可通行区域判断偏移。
3. 对应 Phase 5：导航验证不能只测图像噪声和弱光，还要测“外观看起来正常但语义边界被误导”的场景。

资源消耗与部署信号：

1. diffusion-based semantic mutation 适合离线生成测试集，不应并入量产端侧实时链路。
2. VLM judge 可用于离线筛选扰动是否自然，但仍需人工抽检和真实家庭回放确认。
3. 量产端侧更现实的吸收方式是增加地图一致性检查、异常回放标签和保守降级规则。

优势：

1. 直接补足纯视觉地图 / 语义导航的安全鲁棒性测试角度。
2. 将攻击从像素噪声提升到合理环境变化，更贴近家庭机器人真实误判来源。
3. 给出可量化指标，可转成 Kinbot stress case。

劣势与风险：

1. 原场景是自动驾驶 HD map，不是家庭室内语义地图。
2. 攻击生成依赖 diffusion 和道路拓扑设定，迁移到家庭场景需要重构语义边界类型。
3. 若过度追求自动生成攻击，可能增加测试体系复杂度；应先做少量手工定义的高价值扰动。

推荐理由：

建议作为 A- 级输入。Kinbot 应吸收其“语义级合理扰动”思想，把纯视觉导航评测从低层图像扰动扩展到语义地图误导场景，但仅作为离线验证项。

### 3.2 MonoSpheres: Large-Scale Monocular SLAM-Based UAV Exploration through Perception-Coupled Mapping and Planning

| 项目 | 内容 |
| --- | --- |
| arXiv | [2511.17299](https://arxiv.org/abs/2511.17299) |
| 本轮 listing 口径 | 2026-05-15 replacement submission，日更补录；abs 页显示 `Submitted on 21 Nov 2025`，`Last revised 13 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | monocular exploration, sparse SLAM, free-space uncertainty, perception-aware planning, rapid replanning |

摘要要点转述：

论文研究只有单目相机、没有 dense range sensor 的机器人如何在未知 3D 环境中自主探索。作者提出 perception-coupled mapping and planning：地图侧显式处理稀疏深度、自由空间缺口和大深度不确定性，在低纹理区域过采样 free space，并记录障碍物位置不确定性；规划侧通过快速重规划和 perception-aware heading control 应对这些不确定性。论文还指出，只要考虑视差需求和无纹理表面，frontier-based exploration 仍可基于稀疏单目深度运行。实验覆盖真实与仿真环境，并开源实现。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 一代纯视觉路线下“不开主动深度 / LiDAR 时，探索和巡航如何处理空间不确定性”的问题。
2. 虽然 Kinbot 默认是头部主双目而非单目 UAV，但家庭场景同样有低纹理墙面、反光地面、窄走廊、暗处和视差不足的问题。
3. 对应 `world_state_memory`：不能把 free space 当作确定事实写死，需要记录自由空间缺口、障碍物不确定性和重新观察需求。

资源消耗与部署信号：

1. 方法基于稀疏 SLAM 与规划耦合，资源压力通常低于 dense reconstruction，但对前端鲁棒性依赖高。
2. 快速重规划与 heading control 可作为低频策略，不必把完整论文系统移植进 Kinbot。
3. 对 Kinbot 最现实的吸收方式是新增回放字段：`free_space_gap`、`depth_uncertainty`、`textureless_area`、`reobserve_required`。

优势：

1. 直接命中“纯视觉 + 无 dense range sensor”的空间探索问题。
2. 将感知不确定性显式传给规划，而不是把稀疏地图当成确定地图。
3. 给出真实环境验证与开源实现，便于后续专题复现。

劣势与风险：

1. 主要应用在 UAV 大尺度 3D 探索，家庭移动底盘的运动约束和安全边界不同。
2. 单目假设比 Kinbot 双目更极端，部分工程取舍不能直接迁移。
3. 若把探索主动性做得过强，可能增加家庭打扰、隐私和碰撞风险。

推荐理由：

建议作为 A- 级输入。Kinbot 应吸收其评测思想：纯视觉导航评测要记录自由空间不确定性、低纹理失败和重新观察策略，不只看最终是否到达。

### 3.3 Safe Bayesian Optimization for Complex Control Systems via Additive Gaussian Processes

| 项目 | 内容 |
| --- | --- |
| arXiv | [2408.16307](https://arxiv.org/abs/2408.16307) |
| 本轮 listing 口径 | 2026-05-15 replacement submission，日更补录；abs 页显示 `Submitted on 29 Aug 2024`，`Last revised 14 May 2026` |
| 分类 | `cs.RO`, `cs.AI` |
| 方法关键词 | safe Bayesian optimization, controller tuning, additive Gaussian process, safe-set expansion, hardware evaluation |

摘要要点转述：

论文关注复杂控制系统的自动调参。黑盒优化在机器人和机电系统上很有吸引力，但每次 query 都要在真实物理系统上执行，可能带来安全风险。`SafeCtrlBO` 用 additive Gaussian-process kernel 表达控制器增益之间的低阶结构，降低多回路控制器调参的样本复杂度；同时用 boundary-based expansion 替代昂贵的 potential-expander 计算，在显式几何条件下保持 safe-set expansion 行为。实验包括 synthetic benchmark 和永磁同步电机速度控制平台，结果显示该方法用更少硬件试验找到高性能参数，并维持高概率安全标准，硬件实验中未违反 hard signal-safety constraint。

解决 Kinbot 的什么问题：

1. 对应 Kinbot Phase 5 中底盘、头颈、屏幕机构、传动控制和低层控制器调参的试验治理问题。
2. 实机调参不应只追求性能提升，还要明确安全参数边界、试验预算、回退点和停止条件。
3. 对应 `hardware_control_runtime` 与 `safety_compliance_authorization`：控制器参数更新也属于受控能力变更，需要可审计记录。

资源消耗与部署信号：

1. Safe BO 是离线 / 试验台调参工具，不要求量产端侧实时运行。
2. additive GP 降低样本需求，但仍需要定义安全信号、初始安全集和硬件试验流程。
3. 若用于 Kinbot，应先从低风险台架和仿真数字孪生开始，不直接在用户场景在线优化。

优势：

1. 把“调参”纳入安全约束和试验治理，而不是只做性能搜索。
2. 面向多回路控制器，比单参数 toy tuning 更接近机器人硬件实际。
3. 强调硬件评估次数少和 hard safety constraint，适合 Phase 5 门控语言。

劣势与风险：

1. 论文验证平台是电机速度控制，不等同于完整移动机器人。
2. GP 假设和低阶结构若不成立，可能低估耦合风险。
3. 过度自动化调参会削弱工程师对异常原因的理解，需保留人工 review gate。

推荐理由：

建议作为 A- 级输入。Kinbot 可将其转成安全调参 checklist，而不是立即引入自动调参系统：每次实机参数试验必须记录安全约束、可回退版本、试验预算和停止条件。

### 3.4 From Local Matches to Global Masks: Template-Guided Instance Detection and Segmentation in Open-World Scenes

| 项目 | 内容 |
| --- | --- |
| arXiv | [2603.03577](https://arxiv.org/abs/2603.03577) |
| 本轮 listing 口径 | 2026-05-15 replacement submission，日更补录；abs 页显示 `Submitted on 3 Mar 2026`，`Last revised 13 May 2026` |
| 分类 | `cs.CV`, `cs.RO` |
| 方法关键词 | template-guided instance detection, open-world object search, dense patch matching, SAM, clutter and occlusion |

摘要要点转述：

论文研究开放世界中“给少量模板图像，机器人要在杂乱未知场景中找到同一个具体物体实例”的问题。传统 proposal-based 方法对 proposal 质量很敏感，遇到遮挡和复杂背景容易失败。`L2G-Det` 通过模板图和查询图之间的 dense patch-level matching 生成候选点，再用 candidate selection 抑制 false positives，最后用增强版 SAM 和 instance-specific object tokens 重建完整实例 mask。实验显示该方法在开放世界挑战场景中优于 proposal-based baseline。论文已被 RSS 2026 接收。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory` 和 `companion_interaction` 中“用户说找我的某个具体物品”的问题。
2. 家庭任务里常见目标不是通用类别，而是用户自有实例：某个药盒、某副眼镜、某个遥控器、某个护理用品包装。
3. 可与家属 App 或初始化流程连接：用户上传少量模板图，Kinbot 用作本地搜索或离线评测，不把所有任务都压到开放词汇检测。

资源消耗与部署信号：

1. dense matching + SAM 类模型对端侧资源有压力，短期适合作为离线 benchmark 或云端 / 开发机评测。
2. 若进入端侧，需要替换为轻量分割、分阶段检索或只在用户确认场景触发。
3. 模板图属于用户隐私数据，应默认本地留存和受控处理。

优势：

1. 明确覆盖“特定实例”而非泛类别识别，贴近家庭找物任务。
2. 对遮挡和杂乱背景的失败问题有针对性。
3. 可转成 Kinbot 低成本测试集：少量模板图 + 真实家庭 clutter 场景。

劣势与风险：

1. SAM 增强链路可能不适合量产端侧实时运行。
2. 模板拍摄质量、视角差异和物体外观变化会影响稳定性。
3. 若自动搜索过度主动，可能扩大隐私边界，需要明确触发条件。

推荐理由：

建议作为 B+ 级输入。Kinbot 应把“用户自有实例搜索”加入物体记忆与找物评测，而不是只测开放类别识别或不可见物体常识推理。

### 3.5 Evo-Depth: A Lightweight Depth-Enhanced Vision-Language-Action Model

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.14950](https://arxiv.org/abs/2605.14950) |
| 本轮 listing 口径 | 2026-05-15 cross submission，日更补录；abs 页显示 `Submitted on 14 May 2026` |
| 分类 | `cs.CV`, `cs.RO` |
| 方法关键词 | RGB-only depth enhancement, VLA, implicit depth encoding, spatial-semantic representation, edge deployment |

摘要要点转述：

论文指出，当前 VLA 模型主要依赖 2D 视觉表示，精确空间理解不足；显式加入 depth map 或 point cloud 会增加系统复杂度、传感器需求和噪声风险，而一些从 RGB 中学习隐式 3D 的方法又依赖大型 geometry foundation model，训练和部署成本高。`Evo-Depth` 提出轻量 depth-enhanced VLA：用 Implicit Depth Encoding Module 从 multi-view RGB 中抽取紧凑深度特征，再通过 Spatial Enhancement Module 做 depth-aware modulation，并用 Progressive Alignment Training 将空间增强表示对齐到动作学习。论文称其只有 `0.9B` 参数，在四个仿真 benchmark 和真实实验中取得较高成功率，同时模型尺寸、GPU memory 和 inference frequency 更优。

解决 Kinbot 的什么问题：

1. 对应 Kinbot 一代纯视觉路线下“如何增强空间理解而不新增主动深度传感器”的问题。
2. 对应端侧资源：如果未来需要空间增强模块，应优先比较参数量、显存、频率和真实任务收益，而不是直接上大 geometry foundation model。
3. 对应 `platform_runtime`：空间特征增强要与 `12GB RAM + 32GB Flash` 量产线约束一起评估。

资源消耗与部署信号：

1. `0.9B` 参数相对 VLA 大模型轻，但对 Kinbot 一代端侧仍不是小模块，需要实测显存、延迟和功耗。
2. 方法面向 manipulation VLA，不能直接替代 Kinbot 导航感知栈。
3. 最现实的吸收方式是作为 RGB-only 空间特征候选，在离线评测中比较其对导航、找物和交互 grounding 的边际收益。

优势：

1. 与“不新增主动深度传感器”的产品边界一致。
2. 明确把空间理解、模型大小、显存和推理频率放在一起评价。
3. 可作为避免盲目引入重型 3D 模型的对照。

劣势与风险：

1. 主要验证在 manipulation 任务，不等同于家庭移动导航。
2. 需要 multi-view RGB，实际视角组织和标定要求需另行评估。
3. `0.9B` 仍可能超过量产端侧常驻预算，不能直接写成默认方案。

推荐理由：

建议作为 B+ 级输入。Kinbot 可将其作为纯视觉空间增强候选信号，但短期只进入离线对比，不改变传感器主线和端侧资源冻结基线。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| Slot-MPC: Goal-Conditioned Model Predictive Control with Object-Centric Representations | [2605.14937](https://arxiv.org/abs/2605.14937) | cross submission | object-centric world model 对规划有价值，但实验偏模拟 manipulation；近两周 world action model / 记忆 / VLA 主题已较饱和。 |
| EARL: Towards a Unified Analysis-Guided Reinforcement Learning Framework for Egocentric Interaction Reasoning and Pixel Grounding | [2605.14742](https://arxiv.org/abs/2605.14742) | cross submission | egocentric grounding 有交互价值，但当前更缺的是家庭找物实例、隐藏物体和安全监控评测；本轮不扩大 MLLM grounding 主线。 |
| Co-Me: Confidence-Guided Token Merging for Visual Geometric Transformers | [2511.14751](https://arxiv.org/abs/2511.14751) | replacement submission | 最高 `21.5x / 20.4x` 的视觉几何 transformer 加速有资源价值，但仍偏重型 3D perception；本轮由 `Evo-Depth` 覆盖更贴近 RGB-only 空间增强的资源信号。 |
| Any3D-VLA: Enhancing VLA Robustness via Diverse Point Clouds | [2602.00807](https://arxiv.org/abs/2602.00807) | replacement submission | 显式 point cloud 融合与 Kinbot 一代不新增主动深度 / LiDAR 的边界不完全一致，且 VLA manipulation 主题重复。 |
| Robometer: Scaling General-Purpose Robotic Reward Models via Trajectory Comparisons | [2603.02115](https://arxiv.org/abs/2603.02115) | replacement submission | 轨迹偏好 reward model 有评测启发，但数据规模和通用机器人学习目标过大，不直接改变当前 Phase 5 门控。 |
| Terminal Matters: Kinodynamic Planning with a Terminal Cost and Learned Uncertainty in Belief State-Cost Space | [2605.09046](https://arxiv.org/abs/2605.09046) | replacement submission | belief uncertainty 与 goal-reaching reliability 有价值，但本周已由 reachability verification、risk-aware planning 和 MonoSpheres 覆盖主要导航不确定性评测。 |
| RoboLab: A High-Fidelity Simulation Benchmark for Analysis of Task Generalist Policies | [2604.09860](https://arxiv.org/abs/2604.09860) | replacement submission | 高保真仿真 benchmark 有工具价值，但未直接改变导航、记忆、安全或端侧资源判断。 |
| Action Emergence from Streaming Intent / MindVLA-U1 / DIAL / DIVER / AutoMoT | [2605.12622](https://arxiv.org/abs/2605.12622) 等 | replacement submission | 自动驾驶 VLA / preference RL / streaming intent 主题已在 2026-05-15 未优先收录说明中处理；不写成家庭机器人主线变化。 |
| FU-MPC: Frontier- and Uncertainty-Aware Model Predictive Control for Efficient and Accurate UAV Exploration with Motorized LiDAR | [2605.14920](https://arxiv.org/abs/2605.14920) | new submission | frontier / uncertainty-aware exploration 有旁路价值，但依赖 motorized LiDAR，与一代纯视觉传感主线不一致。 |
| CaMeRL: Collision-Aware and Memory-Enhanced Reinforcement Learning for UAV Navigation in Multi-Scale Obstacle Environments | [2605.14810](https://arxiv.org/abs/2605.14810) | new submission | collision-aware memory navigation 有相关性，但场景偏 UAV RL；本轮用 `MonoSpheres` 覆盖更直接的纯视觉探索不确定性。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 建议将 `MIRAGE` 转成纯视觉语义地图压力测试：阴影、反光、湿地面、地毯纹理、局部遮挡和临时物体造成的语义边界误导。
2. 建议将 `MonoSpheres` 转成导航回放字段：`free_space_gap`、`depth_uncertainty`、`textureless_area`、`low_parallax_risk`、`reobserve_required`。
3. 建议将 `L2G-Det` 转成用户自有实例搜索评测：少量模板图、真实家庭 clutter、遮挡、视角变化、隐私留存边界。
4. 建议将 `SafeCtrlBO` 转成控制器调参安全 checklist：初始安全集、硬件试验预算、hard safety signal、回退参数、人工 review gate。
5. 建议将 `Evo-Depth` 保留为 RGB-only 空间增强候选：只做离线资源 / 收益对比，不写成新增传感器、默认 VLA 或量产端侧基线。
6. 本轮不建议回写 `03_decision_log.md` 或主线架构文档；上述内容均为研究输入和 Phase 5 评测候选，不构成已确认产品决策。

## 6. 本轮未进入主线的原因

1. 本轮官方未出现 `2026-05-16` Robotics 新批次，主卡片来自 `2026-05-15` listing 的日更补录，不代表新的架构事实。
2. 入选论文主要提供测试集、评测字段、离线工具和调参治理思路，未经过 Kinbot 实机验证、供应链评估、端侧资源实测或用户体验评审。
3. 若把本轮 5 篇论文都升级为在线模块，会扩大运行时复杂度并稀释当前 Phase 5 门控；本轮只保留轻量验证项。
4. 当前一代纯视觉、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 与 `5000 到 6000 元` BOM 冻结基线不因本轮论文改变。

## 7. 来源

1. arXiv `cs.RO/new`：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent`：<https://arxiv.org/list/cs.RO/recent>
3. Systematic Discovery of Semantic Attacks in Online Map Construction through Conditional Diffusion：<https://arxiv.org/abs/2605.14396>
4. MonoSpheres: Large-Scale Monocular SLAM-Based UAV Exploration through Perception-Coupled Mapping and Planning：<https://arxiv.org/abs/2511.17299>
5. Safe Bayesian Optimization for Complex Control Systems via Additive Gaussian Processes：<https://arxiv.org/abs/2408.16307>
6. From Local Matches to Global Masks: Template-Guided Instance Detection and Segmentation in Open-World Scenes：<https://arxiv.org/abs/2603.03577>
7. Evo-Depth: A Lightweight Depth-Enhanced Vision-Language-Action Model：<https://arxiv.org/abs/2605.14950>
