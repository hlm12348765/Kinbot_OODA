# Kinbot arXiv 每日论文纪要

---

文档版本：v1.0
创建日期：2026-05-15
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-05-15 | Codex-架构师 | 基于联网检索 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 页面，确认本轮检索时官方最新 Robotics listing 为 `Friday, 15 May 2026`，合计 `69` 篇 entries；其中 new submissions `28` 篇、cross submissions `10` 篇、replacement submissions `31` 篇。本轮继续采用 `3-5` 篇强相关论文 + 候选排除表口径，收录对 Kinbot 导航安全验证、隐含意图澄清、视觉运行时监控、不可见功能物体定位和 VLN 感知瓶颈有明确增量价值的 5 篇论文。

---

## 1. 检索口径

本轮检索日期：2026-05-15。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent` 页面与 arXiv 论文详情页。
2. 本轮检索时官方 `cs.RO/new` 显示最新 listing 日期为 `Friday, 15 May 2026`，合计 `69` 篇 entries；其中 new submissions `28` 篇、cross submissions `10` 篇、replacement submissions `31` 篇。
3. 本轮按“最新官方 listing”处理，不再延续检索早段曾短暂看到的 `2026-05-14` 页面口径；`cs.RO/recent` 同步显示 `Friday, 15 May 2026` 批次为 `38` 篇 recent entries。
4. 本轮不固定凑满 `10` 篇；优先筛选真正改变 Kinbot 对导航、记忆、安全、端侧资源或验证治理判断的论文。
5. replacement / cross-list 仅在确实新增 Kinbot 评测项、治理项或端侧资源判断时收录；本轮收录 `Vision-Based Runtime Monitoring` 与 `SceneFunRI` 两篇 cross submission，原因是它们分别提供视觉安全监控和不可见物体推理的新增评测口径；replacement 条目未进入主卡片。

筛选标准：

1. 是否直接对应 Kinbot 一代或 Phase 5 问题：纯视觉家庭导航、任务过程安全、用户真实意图理解、长期空间记忆、运行时监控和端侧资源控制。
2. 是否能映射到 Kinbot 现有模块：`mobility_navigation`、`decision_orchestration`、`world_state_memory`、`safety_compliance_authorization`、`observability_data_governance`、`platform_runtime`、`companion_interaction`。
3. 是否提供可低成本吸收的研究信号：reachability-based safety rate、用户任务规格抽象、视觉 ptSTL monitor、不可见功能物体 benchmark、导航相关词表 / bbox 比例优先级。
4. 是否符合 Kinbot 当前冻结边界：一代纯视觉主线、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、`5000 到 6000 元` 当前冻结 BOM 目标。

未优先收录说明：

1. 本轮出现多篇自动驾驶 VLA / 端到端规划论文，例如 `Action Emergence from Streaming Intent`、`MindVLA-U1`、`DIAL`、`MAPLE`、`CLOVER` 等；其闭环评测和意图建模有旁路价值，但场景偏道路驾驶，不写成 Kinbot 家庭移动机器人主线变化。
2. `IntentVLA`、`DSSP`、`WarmPrior`、`Realtime-VLA FLASH`、`Hand-in-the-Loop` 等 VLA / diffusion / dexterous manipulation 条目与近期已收录的动作 chunk、异步推理、VLA 幻觉和长期记忆主题重复度较高，本轮只保留在候选排除表。
3. `SR-Platform`、`Chrono-Gymnasium`、`RoboLab`、`RoboWM-Bench` 等仿真 / benchmark 条目有工具价值，但未直接改变本轮对导航、安全、记忆或端侧资源的判断。
4. LiDAR odometry、UAV、自动驾驶、四足、灵巧手、吊车、水下 / 海底机器人、软体机器人和多车 / 多机协同条目不写成 Kinbot 一代纯视觉家庭机器人路线变化。
5. `MemCompiler` 等 replacement 条目此前已进入 2026-05-12 纪要；本轮 replacement 未提供足以覆盖既有判断的新 Kinbot 评测项。

## 2. 本轮总判断

本轮官方 Robotics listing 已更新到 `2026-05-15`。真正值得 Kinbot 吸收的不是再扩大泛 VLA 模型栈，而是把 Phase 5 的几个核心验证问题变得更可测：导航安全不能只看平均代价和成功率，HRI 指令不能假设用户把真实意图说完整，纯视觉运行时监控需要把图像转成可复用时序规格，不可见功能物体搜索应被显式评测，VLN 感知不应继续追求无差别像素级精度。

对 Kinbot 最有价值的结论有 5 个：

1. **导航安全要评估 tail risk 与可达安全边界**：`Safety-Constrained RL with Post-Training Reachability Verification` 提醒 Kinbot 不能只按平均 cost 或任务成功率评价移动策略，应加入 reachability-based safety rate。
2. **HRI 要澄清“用户真正想要什么”**：`Distill` 将自然语言和 end-user programming 的局限落到任务规格抽象，适合转成 Kinbot 对模糊照护 / 家务指令的 intent refinement 与澄清机制。
3. **视觉运行时监控可从单条规则走向可复用规格族**：`Vision-Based Runtime Monitoring` 的 semantic basis + conformal calibration 提示 Kinbot 可把视频 / 视觉日志映射成可认证的时序安全谓词，但应先离线验证。
4. **不可见对象推理是家庭导航和记忆的明确短板**：`SceneFunRI` 说明当前 VLM 对隐藏功能物体定位仍很弱，Kinbot 在找药、找遥控器、找日用品时必须显式标注不确定性和搜索策略。
5. **VLN 感知存在边际收益饱和**：`Exploring Bottlenecks in VLM-LLM Navigation` 指出 3D scene understanding 不应只追像素级精度，导航相关核心词表、bbox 比例和拓扑语义更接近 Kinbot 一代资源约束。

周度滚动判断：

| 主题 | 本周状态 | 后续动作 |
| --- | --- | --- |
| 泛 VLA / 自动驾驶式端到端规划 | 已接近饱和 | 只在出现家庭移动实机、安全证明、端侧资源实测或可审计治理新增证据时进入主卡片。 |
| 安全验证与运行时监控 | 值得进入专题跟踪 | 将 `SafeManip`、`ReasonSTL`、本轮 reachability verification 与 vision-based runtime monitoring 统一成 Phase 5 安全规格 / 监控专题。 |
| 用户真实意图与澄清机制 | 值得进入专题跟踪 | 将 `PRISM` 的 implicit intent 与 `Distill` 的任务规格抽象合并成家庭照护指令澄清评测。 |
| 纯视觉导航与不可见对象搜索 | 值得进入专题跟踪 | 将 `SceneFunRI` 与 VLN 感知瓶颈转成核心词表、空间不确定性、隐藏物体候选位置和主动搜索策略矩阵。 |
| 灵巧手 / manipulation / 接触丰富控制 | 暂不进入一代主线 | 保留中长期观察，不扩大当前移动交互机器人边界。 |

复杂度自检：现在的架构是不是太复杂了？本轮答案是“如果把 reachability verifier、ptSTL visual monitor、intent abstraction、hidden-object benchmark 和 VLN scene graph 全部变成新运行时模块，会过复杂”。建议只吸收 5 个轻量动作：导航安全评测指标、指令澄清字段、视觉监控离线评估、不可见对象搜索 case、导航相关视觉词表 / bbox 比例评测。暂不增加新的产品级模型层。

推荐优先级：

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A | Safety-Constrained Reinforcement Learning with Post-Training Reachability Verification for Robot Navigation | 转成 Kinbot 移动导航 `safety_rate` 与 tail-risk 验证指标。 |
| A | Distill: Uncovering the True Intent behind Human-Robot Communication | 吸收为家庭照护 / 家务指令的 intent refinement 与澄清问题设计。 |
| A- | Vision-Based Runtime Monitoring under Varying Specifications using Semantic Latent Representations | 进入 Phase 5 视觉日志 / 时序安全监控专题，先离线验证。 |
| B+ | SceneFunRI: Reasoning the Invisible for Task-Driven Functional Object Localization | 进入隐藏功能物体搜索与空间不确定性评测。 |
| B+ | Exploring Bottlenecks in VLM-LLM Navigation: How 3D Scene Understanding Capability Impacts Zero-Shot VLN | 用于收缩纯视觉导航感知指标，避免无差别追求像素级精度。 |

## 3. 论文卡片

### 3.1 Safety-Constrained Reinforcement Learning with Post-Training Reachability Verification for Robot Navigation

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.14174](https://arxiv.org/abs/2605.14174) |
| 本轮 listing 口径 | 2026-05-15 new submission，日更收录；abs 页显示 `Submitted on 13 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | safe navigation, CVaR, reachability verification, tail risk, safety rate |

摘要要点转述：

论文指出，移动机器人安全导航如果只看平均累计代价，容易掩盖高后果、低概率的危险行为。作者在 off-policy TD3 基础上加入 CVaR 约束，让策略训练关注高代价尾部风险；训练后再用 Taylor Model 分析在有界观测不确定性下的动作可达集合，计算动作集合是否仍落在安全边界内的 `safety rate`。实验覆盖 10 个导航场景和 6 个 baseline，方法取得 `98.3%` success rate，并显示平均 cost 排名与 reachability-based safety 排名可能明显不一致；论文还在 Clearpath Jackal 实体机器人上验证了 sim-to-real 迁移。

解决 Kinbot 的什么问题：

1. 对应 `mobility_navigation` 与 `safety_compliance_authorization` 中“移动导航成功但安全边界是否足够”的问题。
2. 对应老人看护、夜间巡护、靠近用户和绕行障碍任务：不能只记录到达目标，还要记录最坏情况下是否可能擦碰、压线或进入禁区。
3. 对应 Phase 5 验证：需要把 `task_success_rate`、平均 cost 和 `safety_rate` 分开记录，避免平均指标掩盖尾部风险。

资源消耗与部署信号：

1. reachability verification 可以先作为离线评测工具，不要求量产端侧实时运行完整 verifier。
2. 在线部署若加入 CVaR 策略或可达集合检查，需要稳定的观测不确定性边界和场景谓词定义。
3. 对 Kinbot 一代最现实的吸收方式是把 `safety_rate` 写入导航回放评测，而不是立即替换底盘控制器。

优势：

1. 直接命中家庭移动机器人安全验证问题。
2. 明确区分平均成本、任务成功和可达安全边界。
3. 包含实体机器人验证，比纯仿真安全论文更可参考。

劣势与风险：

1. 基于 RL 策略和 TD3 backbone，未必对应 Kinbot 当前更保守的导航栈。
2. Taylor Model reachability 对状态 / 动作维度、模型边界和场景抽象有工程门槛。
3. 若把 verifier 直接并入在线闭环，会增加延迟和调参复杂度。

推荐理由：

建议作为 A 级输入。Kinbot 应吸收其指标思想：Phase 5 移动导航不只看成功率，还要看观测不确定性下的安全边界覆盖率。

### 3.2 Distill: Uncovering the True Intent behind Human-Robot Communication

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.14262](https://arxiv.org/abs/2605.14262) |
| 本轮 listing 口径 | 2026-05-15 new submission，日更收录；abs 页显示 `Submitted on 14 May 2026` |
| 分类 | `cs.RO`, `cs.HC` |
| 方法关键词 | human-robot communication, intent refinement, task specification, end-user programming |

摘要要点转述：

论文认为，自然语言虽然直观，但常常含糊；end-user programming 又可能过度具体，导致机器人执行的是用户写出的步骤，而不是用户真正想达成的目标。`Distill` 面向人机沟通界面，在用户给出任务规格后执行三类处理：删除不必要步骤、把单个步骤背后的意义抽象出来、放松步骤之间不必要的顺序约束。作者将其做成 web interface，并通过众包研究验证它能从初始任务规格中提炼和修正用户意图。

解决 Kinbot 的什么问题：

1. 对应 `companion_interaction` 与 `decision_orchestration` 中“用户自然语言指令是否表达了真实意图”的问题。
2. 对应健康管理和老人看护：用户说“帮我看看药”可能真正想要确认剂量、提醒时间、联系家属或只是寻找药盒。
3. 对应安全授权：不能把用户给出的每个步骤都当作必须照做的命令，需要抽象目标、识别多余步骤并在关键风险点澄清。

资源消耗与部署信号：

1. 可作为对话 / App 任务规格预处理和澄清 checklist，端侧资源成本低于新增大模型执行层。
2. 若用 LLM 自动做 intent distillation，需要记录澄清依据、用户确认和安全约束，避免过度概括。
3. 适合先进入 Phase 5 交互测试脚本，而不是直接替换正式任务 planner。

优势：

1. 直接贴近家庭用户指令不完整、不精确的真实问题。
2. 提供三类可落地的任务规格处理动作。
3. 与 Kinbot “聪明、温暖、精致”的交互目标一致：不是机械执行字面步骤，而是帮助用户澄清目的。

劣势与风险：

1. 论文实验是 web interface 和众包研究，不等同于机器人实机闭环。
2. 过度放松步骤顺序可能破坏安全流程，例如用药、授权或异常上报。
3. 真正部署时需要区分“可自动抽象”和“必须二次确认”的任务类型。

推荐理由：

建议作为 A 级输入。Kinbot 应将其转成家庭任务 intent refinement 字段和澄清问题模板，尤其用于健康管理、老人看护和家务协助指令。

### 3.3 Vision-Based Runtime Monitoring under Varying Specifications using Semantic Latent Representations

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.13923](https://arxiv.org/abs/2605.13923) |
| 本轮 listing 口径 | 2026-05-15 cross submission，日更收录；abs 页显示 `Submitted on 13 May 2026` |
| 分类 | `cs.LG`, `cs.CV`, `cs.RO`, `eess.SY` |
| 方法关键词 | visual runtime monitoring, ptSTL, semantic basis, conformal calibration, partial observability |

摘要要点转述：

论文研究在部分可观测视觉输入下，如何对 past-time Signal Temporal Logic 规格做可认证运行时监控。核心问题是 monitor 需要从图像推断安全相关量，并且同一个训练好的接口要能复用到一组不同公式，而不是每条规则重新训练。作者提出 `semantic basis`，即一组 temporal atoms 的鲁棒性得分向量，并证明它是特定可复用接口类别中的最小预测目标；公式可通过解析树确定性解码，单次 conformal calibration 就能覆盖整个规格片段。论文还提出 rolling prediction monitor，只预测当前谓词并在线重建历史；短时 horizon 更紧，长时 horizon 更保守。实验包括 pedestrian-crossroad benchmark 和真实 Waymo 数据。

解决 Kinbot 的什么问题：

1. 对应 `safety_compliance_authorization` 与 `observability_data_governance` 中“视觉日志如何转成可审计安全规则”的问题。
2. 对应夜间巡护、靠近老人、避让宠物 / 家具、进入禁区和异常上报：需要判断一段时间内是否满足规则，而不只是单帧分类。
3. 对应 Phase 5：可以把视频回放评测从人工肉眼检查推进到“视觉谓词 + 时序公式 + 校准置信”的半自动监控。

资源消耗与部署信号：

1. 需要视觉编码器、谓词鲁棒性预测和 conformal calibration 数据，短期适合离线评测。
2. 在线运行可先用于低频安全提醒或日志标注，不应替代底盘实时避障和硬安全保护。
3. 规格族复用能降低每条规则单独训练的成本，但前提是 temporal atoms 字典设计得足够稳定。

优势：

1. 将视觉感知、时序逻辑和统计覆盖保证连接起来，适合 Kinbot 安全验证。
2. 支持变化规格，减少每新增规则就重训 monitor 的负担。
3. 兼容“先离线回放、再低频上线”的工程路径。

劣势与风险：

1. 实验场景偏道路 / 行人，不是家庭照护环境。
2. 视觉谓词错误会系统性影响后续公式判断。
3. conformal coverage 需要校准数据代表目标家庭场景，否则保证意义会变弱。

推荐理由：

建议作为 A- 级输入。Kinbot 应把它纳入 Phase 5 视觉日志 / 时序安全监控专题，但先作为离线评测工具，不扩大在线安全闭环复杂度。

### 3.4 SceneFunRI: Reasoning the Invisible for Task-Driven Functional Object Localization

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.14704](https://arxiv.org/abs/2605.14704) |
| 本轮 listing 口径 | 2026-05-15 cross submission，日更收录；abs 页显示 `Submitted on 14 May 2026` |
| 分类 | `cs.CV`, `cs.AI`, `cs.RO` |
| 方法关键词 | invisible object reasoning, functional object localization, commonsense spatial priors, uncertainty-aware search |

摘要要点转述：

论文关注真实场景中目标物体可能不在可见区域内的问题。人类可以根据任务、上下文和常识推断被遮挡或不可见物体可能在哪里，但当前 VLM 在这方面仍然薄弱。`SceneFunRI` 基于 SceneFun3D 构造 `855` 个实例，把不可见功能物体定位表述为 2D 空间推理任务，要求模型根据任务指令和常识推断位置。最强 baseline `Gemini 3 Flash` 的 `CAcc@75` 只有 `15.20`，`mIoU` 为 `0.74`，`Dist` 为 `28.65`。作者比较强指令提示、推理式提示和 Spatial Process of Elimination，结论是当前模型对不可见区域推理仍不稳定，需要更紧密结合任务意图、常识先验、空间 grounding 和不确定性搜索。

解决 Kinbot 的什么问题：

1. 对应 `world_state_memory` 与 `mobility_navigation` 中“找不到但可能存在的家庭物体如何搜索”的问题。
2. 对应健康管理：药盒、血压计、遥控器、眼镜等物品可能被遮挡或放在不可见区域，Kinbot 不能把“没看到”直接等同于“不存在”。
3. 对应陪伴交互：机器人需要表达不确定性，并提出下一步搜索或询问，而不是自信地报错。

资源消耗与部署信号：

1. benchmark 思想可离线吸收，短期不要求端侧新增大模型。
2. 在线搜索需要结合房间语义、物体常见位置、用户习惯记忆和视觉不确定性，会增加 world state 维护成本。
3. 适合先做隐藏物体 case set 和回放评测，不直接扩大主动探索范围。

优势：

1. 命中家庭机器人高频真实问题：物体被遮挡、移动或不在当前视野。
2. 明确给出现有 VLM 的失败程度，提醒不要过度信任视觉常识推理。
3. 可转成 Kinbot 搜索策略：候选位置、置信度、澄清问题和搜索停止条件。

劣势与风险：

1. 任务仍是 benchmark，不等同于真实家庭连续导航。
2. 过度依赖常识可能造成偏见，例如把物品搜索局限在“常见位置”。
3. 如果主动搜索设计不当，会增加打扰、隐私和时间成本。

推荐理由：

建议作为 B+ 级输入。Kinbot 应把“不可见但可能存在”作为 ObjectNav / 家庭物体记忆的单独测试类，而不是只测可见目标导航。

### 3.5 Exploring Bottlenecks in VLM-LLM Navigation: How 3D Scene Understanding Capability Impacts Zero-Shot VLN

| 项目 | 内容 |
| --- | --- |
| arXiv | [2605.14801](https://arxiv.org/abs/2605.14801) |
| 本轮 listing 口径 | 2026-05-15 new submission，日更收录；abs 页显示 `Submitted on 14 May 2026` |
| 分类 | `cs.RO` |
| 方法关键词 | zero-shot VLN, 3D scene graph, perception saturation, navigation-relevant vocabulary, bounding boxes |

摘要要点转述：

论文分析 VLM-LLM zero-shot VLN 中 3D scene understanding 对导航成功率的真实影响。典型框架由 VLM 构造 3D scene graph，由 LLM 做高层推理和决策；但当前 3D 感知模型往往追求像素级准确，与具身导航的实时性和计算限制冲突。作者基于典型 VLM-LLM 框架，分别给慢速 LLM planner 和快速 reactive navigator 提出统计 success rate upper bound：前者依赖拓扑地图语义，后者依赖空间坐标和 bbox 执行决策。实验显示存在 perception saturation：感知精度超过某个阈值后，对导航成功率的增益递减。作者建议 3D scene understanding 应从严格像素级精度转向导航相关核心词表和准确 bbox 比例。

解决 Kinbot 的什么问题：

1. 对应一代纯视觉路线下“感知指标应该追什么”的问题。
2. 对应 `mobility_navigation`：高精度 3D 重建未必直接转化为家庭导航成功，核心是可执行拓扑语义和目标 / 障碍框。
3. 对应端侧资源：在 `12GB RAM + 32GB Flash` 量产线下，不能无限追求视觉模型精度，应优先测导航收益。

资源消耗与部署信号：

1. 可转成离线评测分析，不要求新增传感器或大型 3D 模型。
2. 提示 Kinbot 数据采集应标注导航核心词表、bbox 比例、拓扑节点和失败原因，而不是只追 dense reconstruction。
3. 对实时导航闭环，感知输出要分成 slow planner 语义与 fast navigator 几何两类预算。

优势：

1. 直接帮助 Kinbot 收缩纯视觉导航指标，避免资源投入错位。
2. 区分快速反应导航与慢速语义规划，适合双视角一致性检查。
3. 提出“感知饱和”信号，可用于成本 / 算力权衡。

劣势与风险：

1. 论文仍基于 VLM-LLM 框架，不等同于 Kinbot 最终导航栈。
2. 统计 upper bound 的适用性依赖具体 benchmark 和模块假设。
3. 如果过度简化感知指标，可能忽略弱光、遮挡、反光等真实家庭问题。

推荐理由：

建议作为 B+ 级输入。Kinbot 应吸收其“导航收益导向的感知指标”思想，把像素级精度、核心词表、bbox 比例和拓扑语义分别评估。

## 4. 候选排除表

| 候选论文 | arXiv | 条目类型 | 未进入主卡片原因 |
| --- | --- | --- | --- |
| Towards Robotic Dexterous Hand Intelligence: A Survey | [2605.13925](https://arxiv.org/abs/2605.13925) | new submission | 灵巧手综述对长期硬件路线有价值，但超出 Kinbot 一代移动交互机器人和无灵巧操作边界。 |
| Behavior Cloning for Active Perception with Low-Resolution Egocentric Vision | [2605.14106](https://arxiv.org/abs/2605.14106) | new submission | 低成本主动视觉有启发，但任务是腕部相机 + 机械臂找植物，未明显改变家庭移动导航判断。 |
| IntentVLA: Short-Horizon Intent Modeling for Aliased Robot Manipulation | [2605.14712](https://arxiv.org/abs/2605.14712) | new submission | 短程 intent 对 VLA 稳定性有价值，但仍偏 manipulation；本轮已用 `Distill` 覆盖用户真实意图问题。 |
| DSSP: Diffusion State Space Policy with Full-History Encoding | [2605.14598](https://arxiv.org/abs/2605.14598) | new submission | full-history policy 与长期记忆相关，但近期记忆 / VLA 主题已较饱和，且任务偏 manipulation。 |
| SR-Platform: An Agentic Pipeline for Natural Language-Driven Robot Simulation Environment Synthesis | [2605.14700](https://arxiv.org/abs/2605.14700) | new submission | 可作为仿真工具观察，但不直接改变导航、安全、记忆或端侧资源判断。 |
| Pelican-Unified 1.0: A Unified Embodied Intelligence Model for Understanding, Reasoning, Imagination and Action | [2605.15153](https://arxiv.org/abs/2605.15153) | new submission | 大一统 embodied foundation model 方向资源与复杂度过高，不适合作为一代主线新增判断。 |
| WarmPrior: Straightening Flow-Matching Policies with Temporal Priors | [2605.13959](https://arxiv.org/abs/2605.13959) | cross submission | 对 diffusion / flow policy 有训练技巧价值，但与近期 VLA 动作稳定性主题重复，且未给 Kinbot 新治理项。 |
| SToRe3D: Sparse Token Relevance in ViTs for Efficient Multi-View 3D Object Detection | [2605.14110](https://arxiv.org/abs/2605.14110) | cross submission | 端侧视觉稀疏化有资源价值，但场景偏多视角 3D 检测 / 自动驾驶，未直接映射家庭纯视觉导航。 |
| SOCC-ICP: Semantics-Assisted Odometry based on Occupancy Grids and ICP | [2605.15074](https://arxiv.org/abs/2605.15074) | new submission | 语义 LiDAR odometry 与当前一代纯视觉传感主线不一致，仅作对照观察。 |
| Overcoming Dynamics-Blindness: Training-Free Pace-and-Path Correction for VLA Models | [2605.11459](https://arxiv.org/abs/2605.11459) | replacement submission | VLA temporal dynamics 主题已由 2026-05-13 / 2026-05-14 纪要覆盖，本轮 replacement 未新增 Kinbot 评测项。 |
| MemCompiler: Compile, Don't Inject -- State-Conditioned Memory for Embodied Agents | [2605.07594](https://arxiv.org/abs/2605.07594) | replacement submission | 已在 2026-05-12 纪要主卡片收录，本轮不重复。 |
| HECTOR: Human-centric Hierarchical Coordination and Supervision of Robotic Fleets under Continual Temporal Tasks | [2604.10892](https://arxiv.org/abs/2604.10892) | replacement submission | human-supervised fleet 有后台服务启发，但偏多机器人机群，不改变当前单机一代 Phase 5 门控。 |

## 5. 对 Kinbot 的落地 / 文档建议

1. 建议将 `Safety-Constrained RL with Post-Training Reachability Verification` 吸收为 Phase 5 移动导航评测字段：`task_success_rate`、平均 cost、tail-risk cost、reachability-based `safety_rate` 分开记录。
2. 建议将 `Distill` 转成家庭任务指令澄清模板：删除多余步骤、抽象真实目标、放松非必要顺序、标注必须二次确认的安全步骤。
3. 建议将 `Vision-Based Runtime Monitoring` 与 `SafeManip / ReasonSTL` 合并观察，形成“视觉谓词 -> 时序规则 -> 回放监控 -> 人工抽检”的离线验证链。
4. 建议将 `SceneFunRI` 转成隐藏功能物体搜索 case：常见位置先验、不可见区域候选、用户习惯记忆、置信度表达和停止 / 询问条件。
5. 建议将 `Exploring Bottlenecks in VLM-LLM Navigation` 吸收为纯视觉导航指标收缩依据：优先测导航相关核心词表、bbox 比例、拓扑语义和真实任务收益，不把像素级 3D 精度作为唯一目标。
6. 本轮不建议回写 `03_decision_log.md` 或主线架构文档；上述内容均可作为 Phase 5 后续验证字段或专题研究输入。

## 6. 本轮未进入主线的原因

1. 本轮论文均为 arXiv 研究输入，未经过 Kinbot 实机验证、供应链评估、用户体验评审或阶段门审查。
2. 入选论文主要提供评测指标、澄清机制、离线监控和 benchmark 思路，不要求改变一代纯视觉、端侧敏感数据处理、`12GB RAM + 32GB Flash` 和 `5000 到 6000 元` BOM 冻结基线。
3. 若将所有论文对应的 verifier、monitor、VLM、scene graph、intent abstraction 和 hidden-object search 都并入在线运行时，会显著增加复杂度；本轮只保留轻量验证项和专题跟踪建议。

## 7. 来源

1. arXiv `cs.RO/new`：<https://arxiv.org/list/cs.RO/new>
2. arXiv `cs.RO/recent`：<https://arxiv.org/list/cs.RO/recent>
3. Safety-Constrained Reinforcement Learning with Post-Training Reachability Verification for Robot Navigation：<https://arxiv.org/abs/2605.14174>
4. Distill: Uncovering the True Intent behind Human-Robot Communication：<https://arxiv.org/abs/2605.14262>
5. Vision-Based Runtime Monitoring under Varying Specifications using Semantic Latent Representations：<https://arxiv.org/abs/2605.13923>
6. SceneFunRI: Reasoning the Invisible for Task-Driven Functional Object Localization：<https://arxiv.org/abs/2605.14704>
7. Exploring Bottlenecks in VLM-LLM Navigation: How 3D Scene Understanding Capability Impacts Zero-Shot VLN：<https://arxiv.org/abs/2605.14801>
