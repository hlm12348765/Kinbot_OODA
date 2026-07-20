# Kinbot arXiv 每周论文纪要

---

文档版本：v1.0
创建日期：2026-07-19
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-07-19 | Codex-架构师 | 联网复核 arXiv 官方 `cs.RO/new`、`cs.RO/recent?show=2000` 与论文详情页，确认周日未出现当日新批次、最新正式 Robotics listing 为 `Friday, 17 July 2026`，共 `84` 篇 entries（`48 new + 10 cross + 26 replacement`）；按周度综合判断口径，从 2026-07-13 至 2026-07-17 的 `309` 篇 recent entries 中去重精筛 5 篇主卡片，覆盖实机 VLN 失效、可编辑长期记忆、机器人侧能力合同，以及 world-action model 的因果动作偏置与想象—动作漂移，并保留候选排除表和端侧资源边界。

---

## 1. 检索口径

本轮检索日期：2026-07-19。

检索范围：

1. arXiv 官方 `cs.RO/new`、`cs.RO/recent?show=2000`、论文详情页、论文正文资源表与本地既有每日论文纪要。
2. 本轮刷新时，官方 `cs.RO/new` 最新 Robotics listing 为 `Friday, 17 July 2026`，合计 `84` 篇 entries；其中 new submissions `48` 篇、cross submissions `10` 篇、replacement submissions `26` 篇。
3. 官方 `cs.RO/recent?show=2000` 覆盖 `Mon, 13 Jul 2026` 至 `Fri, 17 Jul 2026`，显示 `Total of 309 entries`；分日为 `33 + 113 + 41 + 64 + 58`。其中 7 月 17 日的 `58` 篇只包含 `48 new + 10 cross`，不包含同日 `26` 篇 replacement，因此正式 listing 与分类计数仍以 `cs.RO/new` 为准，`recent` 只用于近期待补录、周度扫描和去重。
4. 今天为 2026-07-19 周日，本轮检索时 arXiv 尚未出现 `Sunday, 19 July 2026` Robotics 新批次；本纪要按“最新正式 listing + 周日无新批次说明 + 最近一周综合判断”形成。
5. 已对 `docs/09_research/00_papers/` 既有纪要做 arXiv ID 去重。本轮 5 篇主卡片均未进入既有日更；上一轮 `TTC Dynamic Obstacle Avoidance`、`StreamVLN`、`PreSIST`、`Validate the Dream` 与 `GigaWorld-1` 不重复收录，只用于比较本周是否产生新的导航、记忆与 world-model assurance 增量。
6. 本轮主卡中的 `CD-LAM` 为 `cs.CV -> cs.RO` cross-list，`BadWAM` 为 `cs.LG -> cs.RO` cross-list。两者进入主卡不是因为 cross-list 热度，而是分别新增了 latent action 因果偏置 / 动作跟随审计，以及想象—动作漂移 / 闭环攻击治理字段，符合 cross-list 例外口径。
7. 本轮不以 replacement 本身制造新结论。候选表中的旧论文 revision 若未给出可审计的新评测、治理项或资源证据，继续排除；本周 original new 后发生无实质内容变化的 revision，也不把 revision 计成第二份证据。

筛选标准：

1. 是否改变 Kinbot 对家庭室内导航、长期记忆、运行时安全、world-model 证据资格或端侧资源的判断。
2. 是否能映射到 `mobility_navigation`、`world_state_memory`、`safety_compliance_authorization`、`decision_orchestration`、`platform_runtime` 或 `observability_data_governance`。
3. 是否能转化为 Phase 5 字段、离线红队或评审门，而不是继续扩张在线模型层。
4. 是否尊重当前冻结边界：一代纯视觉、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、独立确定性硬安全数据面，以及 `5000 到 6000 元` BOM 目标。

未优先收录说明：

1. 通用 VLA / WAM manipulation、模型规模竞赛和“生成更快 / 画面更真”已明显饱和；本周只提升会改变动作忠实度、规划支持域或证据治理判断的 world-model 论文。
2. 开放词汇 ObjectNav、3D token、语义地图与 RGB-D scene graph 仍密集，但新增条目大多是表示或 benchmark 迭代，没有优先于实机碰撞 / 语义停止证据与可编辑记忆生命周期。
3. Orin、RTX 4090、A6000 或 H100 上的平均吞吐不能直接作为 Kinbot 目标 SoC 证据；缺少 batch-1 `P95 / max / jitter`、峰值内存、持续功耗与热稳态的条目只作为研究输入。
4. LiDAR、RGB-D、sonar 与外部动捕仍可作为研发对照和真值参考，但不能因单篇论文结果改写 V1 纯视觉产品主线。

## 2. 本轮总判断

本周真正的新信息不是“机器人又能做更多任务”，而是五个原先容易被混在一起的判断被进一步拆开：

1. **导航：仿真成功率不能代表家庭实机可用。** 实机 VLN 对比显示，被测 RGB-only monolithic 配置从仿真 `61%` 降到实机 `22%`，碰撞率达到 `51%`；被测 hierarchical 配置虽有更低碰撞率，但要求终点距离与语义条件同时正确的 Strict Success Rate（`SSR`）仍只有 `37%`。Kinbot 需要把 sim-real gap、碰撞、低障碍漏检、回溯、`SSR` 与另行标注的语义停止分开验收，不能只看 `SR / SPL`。
2. **记忆：长期记忆应是可编辑、类型化且有 provenance 的状态。** `MEMORA` 把环境、实体、活动和推断知识拆成四类存储，用在线编辑和离线整合控制膨胀。它补强上周 `PreSIST` 的 freshness 判断：不是把更多视频永久保存，而是保留可修订状态、证据时间和来源链。
3. **运行时治理：能力合同可以约束 Agent，但不能替代硬安全。** 机器人侧技能白名单、类型化参数、允许的行为树算子与执行前验证值得进入 `KBT-59` 评审候选；然而越界拒绝、意图正确性和运行期安全仍需独立门控，模型不得直达执行器。
4. **世界模型：视觉可信、模型更大或未来画面稳定都不等于动作可信。** `CD-LAM` 说明 reconstruction-only latent action 会学习背景 / 相机捷径；`BadWAM` 说明即使未来想象仍接近 clean rollout，动作通道也可能被劫持。继上周 `Validate the Dream` 后，world-model assurance 应新增“训练时动作因果可控性”和“运行时动作—想象完整性”两层。
5. **端侧资源：本周仍没有论文提供足以证明其满足 `12GB + 32GB` 在线部署线的目标 SoC 证据。** 主卡均缺少可等价外推的 batch-1、尾延迟、峰值内存、持续功耗与热稳态证据；其中大模型记忆、行为树合成与 world-model 审计目前只能先用于充电期整合、低频任务生成或离线评测，不得进入运动控制周期。

周度综合判断：

| 主题 | 当前状态 | 本周判断与后续动作 |
| --- | --- | --- |
| 通用 VLA / WAM manipulation 与模型扩张 | 本周主卡边际证据已饱和 | 不再因参数量、画质或单项成功率新增主卡；只保留动作忠实度、支持域、对抗漂移与 sim-real verdict 增量。 |
| 开放词汇 ObjectNav / 语义地图 / 通用 VLN 结构 | 本周模型结构增量接近饱和 | 模型结构不再优先；转向实机 `sim_real_success_gap`、碰撞、`strict_success_rate`、回溯和动态环境证据。 |
| 长期对象与行动记忆 | 值得专题跟踪 | 从 append-only 片段库转向类型化状态、在线编辑、离线整合、freshness、provenance 与有界活跃工作集。 |
| world-model assurance | 本周关键增量，值得专题跟踪 | 在既有 `L0-L4 admissibility` 上增加 latent action shortcut、zero-action / camera-shift 干预、动作—想象一致性和闭环累积漂移红队。 |
| 动态障碍与近人安全 | 值得进入 Phase 5 回放 | 继续保留 `TTC`、multi-object belief、估计器更新安全、个人空间和语义推理延迟期间环境演化；VLM / world model 不替代独立低层安全数据面。 |
| Agent 运行时能力合同 | 值得与 `KBT-59` 交叉评审 | 评审技能 schema、类型化参数、允许算子、执行前验证和拒绝日志；不提前冻结 `F1 + A1-A8` 精确拓扑。 |
| 通用 manipulation VLA / WAM 推理加速 | 对 Kinbot V1 的边际增量接近饱和 | 只追踪目标 SoC 的 batch-1 `P95 / max / jitter`、峰值内存、持续功耗、热稳态和 fallback，不用 H100 / 4090 平均速度替代产品证据；纯视觉导航规划、低层安全与目标板调度证据仍不足，继续跟踪。 |
| 老人看护 / 健康陪伴 | 本周无高于既有主线的新增证据 | 不硬凑论文；等待真实长期家庭队列、隐私治理或健康闭环的新证据。 |

## 3. 推荐优先级

| 优先级 | 论文 | 建议动作 |
| --- | --- | --- |
| A- | A Comprehensive Survey and Systematic Real-World Evaluation of Embodied Vision-and-Language Navigation | 将实机 sim-real gap、碰撞、`SSR`、低障碍漏检与回溯成功纳入 VLN / 纯视觉导航验证，并为语义停止另做 annotation；不把不等价配置的差异解释为“层级必然优于端到端”。 |
| A- | MEMORA: Embodied Action Memory from Egocentric Videos for Reasoning and Planning | 进入长期记忆专题，评审类型化存储、在线编辑、离线整合、证据 provenance 与原始视频保留边界；不引入在线 30B 记忆服务。 |
| A- | Contract-Grounded Behavior Tree Synthesis via Coding Agents | 与 `KBT-59` 交叉评审能力合同、技能 schema、类型化参数、允许算子和执行前验证；只作为低频任务合成，不替代 F1 独立安全数据面。 |
| A- | Causally Debiased Latent Action Model for Embodied Action Conditioned World Models | 为 world model 增加 zero-action、camera-shift、background shortcut 与 action-following 干预测试；不得只凭视觉质量或模型规模接受 verdict。 |
| A | BadWAM: When World-Action Models Dream Right but Act Wrong | 进入 world-model 离线红队最高优先级，独立审计动作—想象一致性、动作通道漂移和闭环累积；当前攻击成本与任务域不支持在线部署。 |

## 4. 论文卡片

### 4.1 A Comprehensive Survey and Systematic Real-World Evaluation of Embodied Vision-and-Language Navigation

- arXiv：[2607.09792](https://arxiv.org/abs/2607.09792)
- Authors：Liuyi Wang, Kai Sheng, Zongtao He, Jinlong Li, Yongrui Qin, Haojie Dai, Xiangyi Wang, Jingwei Yang, Qingqing Yan, Chengju Liu, Qijun Chen
- Source：arXiv `cs.RO/recent`
- 本轮 listing 口径：`Tue, 14 Jul 2026` recent entry，`cs.RO` new submission；abs 页显示 submitted on 2026-07-09；属于本周 original new 的周度收录。
- Inclusion type：weekly main card / real-world VLN evidence

摘要转述：

论文在梳理 VLN action paradigm 与 model paradigm 的同时，选择代表性的 monolithic RGB-only 与 hierarchical 系统配置，在十类真实场景做 `200` 次轮式机器人闭环任务，每个配置 `100` 次。被测 RGB-only monolithic 配置在仿真中的成功率为 `61%`，实机降到 `22%`，实机 `SSR` 为 `17%`；被测 hierarchical 配置实机成功率为 `51%`、`SSR` 为 `37%`。这里的 `SSR` 同时要求终点距离目标不超过 `3m` 且最终位置语义正确，不等同于独立的“语义停止成功率”。论文进一步揭示碰撞、意图型指令、回溯、低矮障碍与动态环境是实机主要失效来源，而单一成功率会掩盖这些差异。

Kinbot 问题映射：

1. 对应 `mobility_navigation` 与 `safety_compliance_authorization` 中“纯视觉导航从仿真进入家庭实机时，哪些失败必须单独验收”的问题。
2. Phase 5 候选字段：`sim_real_success_gap`、`collision_rate`、`strict_success_rate`、`intent_instruction_success`、`backtracking_success`、`low_obstacle_missed`、`dynamic_scene_encounter`、`obstacle_memory_retained`、`low_level_safety_override`；另增 Kinbot 派生字段 `semantic_stop_annotation_pass`，但必须由单独 stop annotation 产生，不能从论文 `SSR` 直接代换。
3. 被测两组配置在传感、地图、模型与动作范式上并不等价，因此不能把结果简化为“hierarchical 优于 monolithic”，更不能据此把 LiDAR 写成产品 fallback。

资源消耗：

1. 机器人端使用 Jetson Orin Nano，但模型推理依赖远端 `L40`；hierarchical 配置还使用 Mid-360 LiDAR、SLAM、全景视觉与 `Qwen2.5-VL-72B` API。
2. 论文没有证明纯 RGB、断网、`12GB + 32GB` 与目标热约束下能获得同样结果；远端推理链路只适合作为实机失效研究对照。
3. Kinbot 应复用其试验拆分与失败标签，而不是复刻其硬件栈。

优劣势：

1. 优势：少见地把仿真与 `200` 次实机闭环放在同一篇系统评测中，并报告碰撞与严格成功等过程指标。
2. 优势：直接给纯视觉路线提供否证压力，能改善 Phase 5 验收设计。
3. 劣势：两种被测配置不等价，无法把性能差异归因于单一架构因素。
4. 风险：远端大模型、LiDAR 和全景相机若被忽略，会把“实机评测证据”误写成“目标产品可行性证据”。

推荐理由与判断变化：

建议作为 A- 级研究输入。它改变 Kinbot 的是验收证据，而不是传感主线：必须单独测 sim-real gap、碰撞、`SSR`、回溯，并另行标注语义停止；高层 VLN 不能承担底层安全。

主线边界：

本轮不改变纯视觉路线、不新增远端 VLN 主链路，也不把 LiDAR 设为产品 fallback；只进入实机压力测试与字段候选。

### 4.2 MEMORA: Embodied Action Memory from Egocentric Videos for Reasoning and Planning

- arXiv：[2607.14252](https://arxiv.org/abs/2607.14252)
- Authors：Zihao Yu, Xiu Yuan, Chongjie Zhang
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-07-17 官方 listing new submission；abs 页显示 submitted on 2026-07-15；属于最新正式 listing 的周度收录。
- Inclusion type：weekly main card / embodied long-term memory

摘要转述：

论文把具身行动记忆定义为“形成—整合—检索”的生命周期，设置 Environment、Entity、Activity 与 Inferred Knowledge 四类存储。在线 editor 对对象记录执行 `Add / Update / Delete / Noop` 并维护状态历史，离线 consolidation 把重复经验抽象成流程、习惯与个体偏好。`MEMORA-Bench` 基于 `18` 名参与者、`45` 小时第一视角厨房视频，完整系统的记忆问答准确率最高比受控 baseline 提升 `20.5` 个百分点，分布外机器人计划分数最高相对提升 `16.6%`。

Kinbot 问题映射：

1. 对应 `world_state_memory` 中“机器人长期共处时，如何区分对象状态、活动历史、家庭流程与个体偏好，并知道记忆如何被修订”的问题。
2. 它补强 `PreSIST` 的 freshness：last-seen 不应是永久真值；每条高层记忆还需要证据时间、来源条目、编辑动作和整合 lineage。
3. Phase 5 候选字段：`memory_store_type`、`memory_edit_operation`、`entity_state_history`、`memory_evidence_timestamp`、`consolidation_source_ids`、`routine_confidence`、`preference_provenance`、`retrieval_tool_trace`、`memory_record_reduction_ratio`。

资源消耗：

1. 主流程使用 `Qwen2.5-Omni-7B` 感知、`Qwen3-30B-A3B` 在线编辑和 `Qwen3.6-35B-A3B` 离线 Inferred Knowledge enrichment；answer / planning 评测覆盖约 `26B / 27B / 31B / 35B` 的开放模型，并在 `80GB H100 / A100` 节点上通过 vLLM / tensor parallel 运行。MoE 名称中的总参数与 active 参数不能混为同一资源口径。
2. 在一次性模型加载完成后，主 `Qwen3.6-35B-A3B / A100` 配置对 `207` 个目标的端到端检索加规划平均延迟为 `10.40s`、`P90` 为 `13.64s`。在线编辑实现的是 Entity Memory 相对 append-only entity observations 的 per-participant median record compression 约 `18×`，不是原视频或总存储压缩；两项结果都不是 `12GB RAM + 32GB Flash` 在线部署证据。
3. 更适合 Kinbot 的形态是充电期 / 离线整合、低频任务检索与受控摘要；原始第一视角视频不应默认长期保留。

优劣势：

1. 优势：不是无限追加日志，而是可编辑、可追溯、可整合的类型化记忆状态。
2. 优势：同时覆盖空间、对象状态、动作顺序、家庭规律和个体偏好，并量化记录压缩。
3. 劣势：数据集中在厨房和 `18` 名参与者，实机仅两个定性任务，不能证明长期家庭机器人稳定性。
4. 风险：大量第一视角视频会引入隐私、存储和错误偏好固化问题；consolidation 不能抹掉来源证据和删除权。

推荐理由与判断变化：

建议作为 A- 级研究输入。它改变的是长期记忆的数据模型：应从 append-only 片段或静态 last-seen，转为类型化、可编辑、带 provenance 的状态；但不因此新增在线 30B 记忆服务。

主线边界：

本轮只进入长期记忆专题和 Phase 5 字段候选，不改变原始敏感数据端侧处理边界，不建立长期原始视频库。

### 4.3 Contract-Grounded Behavior Tree Synthesis via Coding Agents

- arXiv：[2607.12220](https://arxiv.org/abs/2607.12220)
- Authors：Jonathan Salfity, Robert Blake Anderson, Mitch Pryor
- Source：arXiv `cs.RO/recent`
- 本轮 listing 口径：`Wed, 15 Jul 2026` recent entry，`cs.RO` new submission；abs 页显示 submitted on 2026-07-13；属于本周 original new 的周度收录。
- Inclusion type：weekly main card / agent runtime governance

摘要转述：

编码 Agent 不再只依赖 prompt 猜测机器人能力，而是在合成行为树前从机器人侧 MCP server 读取显式合同：技能库、技能参数、允许的 BT operators 与可选组合模板。生成结果必须经过机器人运行时验证门，检查语法、技能白名单、参数类型与控制结构，验证通过后才允许实例化和执行。论文覆盖 `110` 个模拟任务与 `14` 个 Husarion Panther 实机任务；完整合同下闭源模型接近完美首次验证和高任务成功，小型开放模型在加入模板后也显著恢复 reactive task 成功率。

Kinbot 问题映射：

1. 对应候选递归 Agentic 架构中的语义能力包络、工具权限、类型化端口、运行时验证门和“模型输出不得直达执行器”。
2. 与 `KBT-59` 交叉评审的候选字段：`capability_contract_id`、`skill_schema_version`、`permitted_bt_operator_set`、`typed_parameter_validation`、`out_of_contract_refused`、`runtime_validation_error`、`execution_authority_runtime`、`bt_valid_at_first_attempt`。
3. 合同验证只证明“调用了存在且类型合法的技能”，不能证明自然语言意图正确、任务目标安全或运行期不会碰撞。

资源消耗：

1. 论文报告的 `50-70s`（Sonnet）与 `130-140s`（本地 Gemma 31B，`4 × RTX 6000 Ada`）是“发现并调用机器人 MCP tools + 构造并提交 BT”的端到端时间，不是纯模型合成延迟。
2. 作者对预热 robot-server session 的 preliminary test 报告约 `5-10s`，但这不是正式 latency benchmark，也不能视为已审计稳定时延；系统仍只适合低频任务合成和任务开始前验证，不能进入运动控制周期。
3. Kinbot 可以先实现 schema / validator 与回放测试，不需要把论文中的模型规模或 MCP 形态直接产品化。

优劣势：

1. 优势：机器人侧持有能力合同和最终执行权，能阻断幻觉技能、非法参数与未授权控制结构。
2. 优势：跨 PyTrees 与 ROS 2 / Nav2 / BT.CPP 的模拟和实机验证，接口思想容易转化为工程检查项。
3. 劣势：越界请求拒绝仍不稳定，静态验证不能保证 intent alignment、任务正确性和运行时安全。
4. 风险：若把“BT validated”误写成“任务安全”，会让语义治理替代不应被替代的确定性联锁、限速、碰撞和防夹保护。

推荐理由与判断变化：

建议作为 A- 级研究输入。它把“语义许可 + 运行时验证”细化为可测试能力合同；同时进一步确认 F1 独立硬安全数据面、运行期监控和人工确认边界仍不可被 Agent 合同替代。

主线边界：

只作为 `KBT-59` 候选评审输入，不把 `F1 + A1-A8`、MCP 或行为树写成已冻结拓扑，不新增同步安全单点。

### 4.4 Causally Debiased Latent Action Model for Embodied Action Conditioned World Models

- arXiv：[2607.09185](https://arxiv.org/abs/2607.09185)
- Authors：Yufan Wei, Kun Zhou, Lingjun Mao, Zijun Zhang, Ziming Xu, Ziqiao Xi, Shuang Liang, Ruobing Han, Yuchen Yan, Xinyue Wang, Fan Feng, Biwei Huang
- Source：arXiv `cs.RO/recent`
- 本轮 listing 口径：`Mon, 13 Jul 2026` recent entry，cross-list from `cs.CV`；abs 页显示 submitted on 2026-07-10；属于近期待补录。cross-list 进入主卡的理由是新增 zero-action、camera-shift、shortcut leakage 与 action-following 的干预式评测和治理字段。
- Inclusion type：weekly near-term main card / cross-list world-model controllability

摘要转述：

论文指出 reconstruction-only latent action model 会把背景、相机变化和未被操作物体等 action-irrelevant visual factors 一起编码成“动作”，导致未来画面看起来合理，却不真正服从机器人动作。`CD-LAM` 用 embodiment-centric reconstruction、action-centric contrastive learning 与 latent calibration 三类目标去偏，并增加 latent-action bias、action following 与 robustness 评测。其流程包括 Stage 1 latent-action 去偏 `1k` steps、Stage 2 ACWM 去偏 `2k` steps，以及 Stage 3 paired robot-action adaptation 的最终 checkpoint `3k`（2B）/ `6k`（14B）。`14B` 在约 `3k`（FDCE）/ `4k`（PSNR）updates 已达到 `50k` DreamDojo reference，对应 crossing point 超过 `12×` fewer updates；到 `6k` final checkpoint 才是在两项指标上明确超过 reference。

Kinbot 问题映射：

1. 对应 world model 参与策略筛选或测试 oracle 时的“模型究竟在响应动作，还是在复现背景和相机统计捷径”。
2. Phase 5 候选字段：`wm_zero_action_residual_motion_fdce`、`wm_camera_shift_latent_response`、`wm_shortcut_leakage`、`wm_action_transfer_fdce`、`wm_action_following_score`、`wm_action_adaptation_updates`、`wm_debias_data_hours`、`wm_model_scale`、`wm_training_hardware`。
3. 它补强 `Validate the Dream` 的 `L1`：action sensitivity 不能只看不同动作生成不同画面，还要用 zero-action、camera shift 与背景干预检查是否真因果地跟随动作。

资源消耗：

1. 实验使用 `2B / 14B` backbone 和 `96 × H100` 训练资源；即使适配更新下降，绝对资源仍是研究集群级。
2. 去偏训练使用 SAM3 foreground masks 与粗粒度 primitive labels；Stage 3 依赖 paired robot actions；CoWTracker 只用于 FDCE 评测。论文没有目标 SoC 的 batch-1 延迟、显存、功耗或在线安全证据。
3. 对 Kinbot 的最低成本用法是离线构建 zero-action / camera-shift / background-swap test，而不是训练或部署同规模 ACWM。

优劣势：

1. 优势：用干预明确拆开“画面好看”和“动作可控”，并给出模型扩大本身不能消除动作偏置的证据。
2. 优势：去偏后动作跟随和适配效率同时改善，提供可操作的评测项，而不只是 failure anecdote。
3. 劣势：集中在 manipulation 与大型集群训练，距离轮式家庭导航、纯视觉和端侧部署较远。
4. 风险：前景分割误差会影响去偏训练，CoWTracker 在遮挡、模糊、弱纹理下的误差会影响 FDCE 评测；离线 FDCE 不能直接等价为闭环安全。

推荐理由与判断变化：

建议作为 A- 级研究输入。它改变的是 world-model 可信度检查：模型规模和视觉重建质量不够，必须证明 latent action 没有借用相机 / 背景捷径并真正跟随动作。

主线边界：

本轮只增加离线 assurance 字段和干预测试，不训练 2B / 14B 产品模型，不把 cross-list 的 manipulation 结果直接外推为导航控制能力。

### 4.5 BadWAM: When World-Action Models Dream Right but Act Wrong

- arXiv：[2607.15207](https://arxiv.org/abs/2607.15207)
- Authors：Qi Li, Xingyi Yang, Xinchao Wang
- Source：arXiv `cs.RO/new`
- 本轮 listing 口径：2026-07-17 官方 listing cross submission，cross-list from `cs.LG`；abs 页显示 submitted on 2026-07-16。cross-list 进入主卡的理由是新增 WAM 专属的动作—想象完整性、攻击强度 / 隐蔽性与闭环累积漂移治理项。
- Inclusion type：weekly main card / cross-list world-action security

摘要转述：

论文提出 World-Action Drift Attack：对视觉输入施加小扰动，打破 WAM 的未来想象与实际动作之间的对齐。action-only attack 直接劫持动作；imagination-preserving attack 则在保持预测未来接近 clean imagination 的同时诱导有害动作。闭环 LIBERO 中，action-only WAM 的任务成功率从 `96.5%` 降到 `43.1%`，空间与长时任务下降尤其明显。这直接否定了“只要梦境仍合理，动作就安全”的假设。

Kinbot 问题映射：

1. 对应 `safety_compliance_authorization` 与 `observability_data_governance` 中“如果未来画面用于解释或验证动作，如何确认动作通道没有与想象脱钩”的问题。
2. Phase 5 候选字段：`wm_action_imagination_alignment_error`、`wm_imagination_preserving_attack_success_drop`、`wm_action_channel_drift`、`wm_horizon_segment_drift`、`wm_closed_loop_cumulative_drift`、`wm_input_perturbation_epsilon`、`wm_attack_query_budget`、`wm_attack_runtime_per_replan`、`wm_attack_transfer_success`。
3. 与上周 `Validate the Dream`、本周 `CD-LAM` 组合后，world-model assurance 形成三层：证据 admissibility、训练时因果动作可控性、运行时动作—想象完整性。

资源消耗：

1. `8 × H100` 是论文训练 joint / IDM WAM 变体的资源，不是每次攻击 replan 的硬件需求；默认攻击每次 replan 进行多轮优化并发起约 `17` 次 WAM forward queries。
2. 查询预算从 `1` 增至 `32` 时，分析型攻击原型的每次 replan 耗时约从 `2.54 / 2.71s` 增至 `27.84 / 30.57s`；它只适合离线红队，不是 Kinbot 在线检测方案。
3. 论文没有给出 `12GB + 32GB` 上可部署的防御；目标板最低成本动作是用录制回放检查动作—想象对齐、扰动敏感性和 closed-loop cumulative drift。

优劣势：

1. 优势：命中 WAM 特有攻击面，覆盖 action-only、joint 与 inverse-dynamics 变体，并采用闭环任务而非只看静态 loss。
2. 优势：明确展示 future similarity 可以在动作已危险偏移时保持较好，补足只看视觉 plausibility 的盲区。
3. 劣势：任务集中在 manipulation，攻击访问假设和计算预算较强；部分迁移、防御结论只在子集验证。
4. 风险：论文尚未提供量产可用防御，不能把攻击 benchmark 自身变成在线复杂模块。

推荐理由与判断变化：

建议作为 A 级研究输入，是本周 world-model 最高优先级。它改变的是安全治理：任何用 imagined future 解释、筛选或批准动作的系统，都必须独立检查动作—想象同步，不能把 dream plausibility 当安全信号。

主线边界：

只进入离线红队与 Phase 5 assurance 候选，不让 world model 进入硬安全通过链，不替代 F1 确定性安全数据面。

## 5. 候选排除表

| 论文 | arXiv / listing | 未收录为主卡片原因 | 保留启发 |
| --- | --- | --- | --- |
| Mind the Gap: Promises and Pitfalls of Hierarchical Planning in LeWorldModel | [2607.12547](https://arxiv.org/abs/2607.12547)，7 月 15 日 original `cs.RO` new，current v2 revision 无实质内容差异 | 训练支持外 macro-action 与不可达 subgoal 的诊断很强，但主要是 PushT / Cube、CEM 单次评估约需分钟级，且与本轮两张 world-model failure 卡片在 5 篇上限下竞争；revision 本身不贡献新证据。 | 保留 `wm_macro_action_support_distance`、`wm_subgoal_reachability`、`wm_planner_exploitation_gap`、`wm_horizon_bucket_success`、`wm_planning_wall_time`。 |
| Risk-Aware Belief Control Barrier Functions over Random Finite Sets | [2607.15016](https://arxiv.org/abs/2607.15016)，7 月 17 日 new | 多目标 belief、漏检 / 误检和离散滤波更新安全很相关，但实机是 3D sonar 水下平台，使用 3,000-8,000 粒子、JAX / OSQP 与 RTX 4070；尚不能外推为纯视觉量产 SoC 安全控制。 | 保留 `tracked_object_count_belief`、`bcbf_risk_level`、`discrete_update_safe`、`cbf_qp_slack`、`control_compute_ms`。 |
| Just-In-Time Scene Graph Growth | [2607.13245](https://arxiv.org/abs/2607.13245)，7 月 16 日 cross from `cs.CV` | dormant anchors 与有界 active nodes 对记忆资源很有价值，但依赖 RGB-D、camera pose、9B 模型与 A6000，约 `0.56-0.63s/frame`；与 `MEMORA` 在主卡上重叠。 | 保留 `dormant_anchor_count`、`active_node_peak`、`memory_activation_reason`、`subgraph_hibernated`、`distillation_provenance`。 |
| PIER-Flow | [2607.10288](https://arxiv.org/abs/2607.10288)，本周 original new | Orin Nano 实机平均约 `5.3ms`、最大 `6.65ms` 的披露有价值，但板端没有报告 P95；`P95 1.40ms` 来自 RTX 3090 仿真。输入还包含 LiDAR / 2D 障碍特征，不能改变 V1 纯视觉主线，实机场景规模也有限。 | 保留 `planner_p95_latency_ms`、`planner_max_latency_ms`、`freeze_event_count`、`command_age_ms`、`sensor_input_modality`，并强制绑定硬件与场景。 |
| Jetson-PI | [2607.12659](https://arxiv.org/abs/2607.12659)，本周 original new | 异步感知—执行对齐与 CUDA 优化有价值，但仍是操作型 VLA；Orin `50W` 下优化后总计算延迟约 `412.9ms`、反应时间 `165.1ms`、频率 `6.06Hz`，均不是 P95，也未提供与 Kinbot 目标 SoC、`12GB` 内存及热稳态等价的证据。 | 保留 `observation_action_alignment_ms`、`reaction_time_ms`、`gpu_power_mode_w`、`scheduler_confidence_threshold`、`fallback_trigger_reason`。 |
| DriftWorld | [2607.15065](https://arxiv.org/abs/2607.15065)，7 月 17 日 new | 单 H100 约 `26-30ms/frame` 与策略排序相关性有价值；真实数据集单次前向预测窗为 `1` 帧，Bridge-V2 / RT-1 另做 `8` 帧自回归。虽然主 U-Net 参数量为 `8.73M / 74.2M / 160M`，但完整依赖、峰值显存、长窗稳定性及目标板资源证据不足。 | 保留 `wm_frame_latency_ms`、`wm_rollouts_per_decision`、`wm_policy_rank_corr`，并要求绑定硬件、预测窗、自回归长度和完整峰值显存。 |
| GigaWorld-Policy-0.5 | [2607.13960](https://arxiv.org/abs/2607.13960)，7 月 16 日 new、7 月 17 日 v2 replacement | action-only 部署解码与 RTX 4090 C++ 约 `85ms` 有资源启发，但仍是 manipulation 和高端 GPU；v2 删除一个长时任务并改动均值口径，不能把 `0.80` 当作同口径提升。 | 保留 `training_only_visual_future`、`deployment_action_only`、`evaluation_task_set_version`、`metric_revision_reason`、`evidence_provenance_id`。 |
| GPUSimBench | [2607.13059](https://arxiv.org/abs/2607.13059)，7 月 16 日 recent；abs 页 submitted on 2026-07-06 | GPU simulator 的同次 / 跨次确定性和 provenance 很重要，但属于近期待补录，主要覆盖接触 / 操作物理，不能优先于本周实机导航和 WAM 完整性证据。 | 保留 `simulator_name_version`、`seed`、`intra_run_variability_emd`、`inter_run_variability_emd`、`sim_verdict_evidence_eligible`。 |
| OASIS-Map / SafeRelBench / HUMA | [2607.14899](https://arxiv.org/abs/2607.14899), [2607.14543](https://arxiv.org/abs/2607.14543), [2607.10991](https://arxiv.org/abs/2607.10991) | 分别补充跨 session 对象变化、过程安全与按风险触发 VLM，但与 `PreSIST / MEMORA`、既有安全 benchmark 或慢语义 / 快控制专题重叠；HUMA 仿真 human-collision rate 约 `20.82%-34.48%`、VLM 约 `2.425-5.427s/次`，实机又只提供依赖 depth / OptiTrack 的定性演示。 | 保留 change evidence lineage、`safety_success_rate`、`personal_space_compliance`、`vlm_call_count`、`environment_paused_during_inference`。 |
| OGM-CBF / FEP-Nav revisions | [2405.10703](https://arxiv.org/abs/2405.10703), [2403.01977](https://arxiv.org/abs/2403.01977)，7 月 17 日 replacement | 官方元数据未说明本次 revision 新增了什么 Kinbot 评测、治理或资源项；按 replacement 规则不进入主卡。 | 前者保留 out-of-FoV obstacle memory，后者保留视觉退化在线适应，等待可审计 diff。 |

## 6. 对 Kinbot 的落地 / 文档建议

1. 暂不回写主线架构、`03_decision_log.md` 或 Linear；本轮所有结论仍是研究输入、`KBT-59` 评审输入或 Phase 5 字段候选。
2. 后续更新 Phase 5 回放模板时，可评审四组字段包：
   - 实机 VLN：`sim_real_success_gap`、`collision_rate`、`strict_success_rate`、`backtracking_success`、`low_obstacle_missed`，以及需单独 annotation 的 `semantic_stop_annotation_pass`
   - 长期记忆：`memory_store_type`、`memory_edit_operation`、`memory_evidence_timestamp`、`consolidation_source_ids`、`preference_provenance`
   - Agent 合同：`capability_contract_id`、`skill_schema_version`、`typed_parameter_validation`、`out_of_contract_refused`、`runtime_validation_error`
   - world-model assurance：`wm_zero_action_residual_motion_fdce`、`wm_camera_shift_latent_response`、`wm_shortcut_leakage`、`wm_action_imagination_alignment_error`、`wm_closed_loop_cumulative_drift`
3. 若推进 world-model 专题，建议按 `Validate the Dream -> CD-LAM -> BadWAM` 的顺序做轻量评审：先决定 verdict 是否具备证据资格，再检查训练时 action causality，最后做运行时动作—想象漂移红队。三步尚未全部通过、或任一适用关键门未通过时，world model 只能生成探索场景，不能提供安全通过证据。
4. 若推进长期记忆专题，应把 `PreSIST` 的 freshness、`MEMORA` 的 typed editable stores 和候选 `JIT scene graph` 的 dormant / active budget 放到同一数据治理视图；优先定义 schema、expiry、provenance 和删除权，不先建设大模型服务。
5. 若推进 `KBT-59`，可把合同式 BT 作为接口测试案例，但必须继续维持 confirmed / provisional 边界：能力合同和执行前验证值得评审，具体 MCP、BT 和 `F1 + A1-A8` 精确拓扑仍不得提前冻结。

## 7. 主线与复杂度自检

本轮不回写主线的原因：

1. 五篇论文均未在 Kinbot 自有家庭数据、目标 SoC 和安全回放上复现；其中两篇 world-model 论文来自 manipulation，两篇大模型系统远超量产资源线。
2. 本周的价值在于增加验收字段和否证测试，不是新增在线 VLN、记忆模型、行为树 Agent 或 world model。
3. 当前冻结主线仍是纯视觉、端侧优先、原始敏感数据端侧处理、`12GB RAM + 32GB Flash` 默认量产线、独立硬安全数据面和 `5000 到 6000 元` BOM 目标。

现在的架构是不是太复杂了？

若把 5 篇论文各自产品化成独立模块，答案是“是”。本轮只保留四类轻量增量：实机失败标签、可编辑记忆 schema、能力合同 validator、world-model 离线 assurance tests。它们应复用现有 Phase 5 证据链和 `KBT-59` 评审，不扩张在线 Agent 拓扑或运动控制依赖。

## 8. 来源

1. arXiv `cs.RO/new`：[https://arxiv.org/list/cs.RO/new?show=2000](https://arxiv.org/list/cs.RO/new?show=2000)
2. arXiv `cs.RO/recent?show=2000`：[https://arxiv.org/list/cs.RO/recent?show=2000](https://arxiv.org/list/cs.RO/recent?show=2000)
3. `A Comprehensive Survey and Systematic Real-World Evaluation of Embodied Vision-and-Language Navigation`：[https://arxiv.org/abs/2607.09792](https://arxiv.org/abs/2607.09792)
4. `MEMORA`：[https://arxiv.org/abs/2607.14252](https://arxiv.org/abs/2607.14252)
5. `Contract-Grounded Behavior Tree Synthesis via Coding Agents`：[https://arxiv.org/abs/2607.12220](https://arxiv.org/abs/2607.12220)
6. `CD-LAM`：[https://arxiv.org/abs/2607.09185](https://arxiv.org/abs/2607.09185)
7. `BadWAM`：[https://arxiv.org/abs/2607.15207](https://arxiv.org/abs/2607.15207)
8. `Mind the Gap`：[https://arxiv.org/abs/2607.12547](https://arxiv.org/abs/2607.12547)
9. `Risk-Aware Belief Control Barrier Functions over Random Finite Sets`：[https://arxiv.org/abs/2607.15016](https://arxiv.org/abs/2607.15016)
