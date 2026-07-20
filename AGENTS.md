# AGENTS.md

---

文档版本：v1.63
创建日期：2026-03-21
作者：Codex-架构师

文档变更记录：
- v1.63 | 2026-07-20 | Codex-架构师 | 固化架构图双表示规则：后续新建或实质修改 Mermaid 图时，必须紧随一张语义等价、标明标准视图类型的 SysML v2 风格 SVG 配图，并在新增视图语义时维护可解析的 `view def`。
- v1.62 | 2026-07-19 | Codex-架构师 | 补充岗位 `15 / 22` 招聘基线、岗位 `09` `A+` 特殊关键岗线下真机交流 / 保密边界工作流，并新增对应只读检查命令。
- v1.61 | 2026-07-17 | Codex-架构师 | 校正递归 Agentic 架构的 `confirmed / provisional` 边界：递归责任域方向已确认，`F1 + A1-A8` 与四个收敛机制仍在评审；补充独立硬安全数据面、语义许可租约与新事实源阅读顺序。
- v1.60 | 2026-07-17 | Codex-架构师 | 将 `16_recursive_agentic_robot_system_architecture.md` 设为当前 L1 系统级概念架构首要入口，补充递归式 Agentic 运行时纪律：每个软件运行时子系统采用 Agent Cell，确定性组件作为工具和硬安全内核，禁止自由多 Agent 全连接与权限扩张。
- v1.59 | 2026-07-12 | Codex-架构师 | 补充 `2026-07-12` 论文纪要形成的 Phase 5 动态避障 / 流式 `VLN` / 长期对象记忆 / `world-model` 证据字段候选，候选人战略沟通与反向验证基线，以及岗位 `09 / 10 / 11 / 16` 新增候选工作流，并新增对应只读检查命令。
- v1.58 | 2026-07-05 | Codex-架构师 | 补充 `2026-07-05` 论文纪要形成的 Phase 5 字段包候选、岗位 `01` 第一轮综合面 / 物理 Agent 架构候选口径，以及岗位 `09` 本体 SE 专家深面规则，并新增对应只读检查命令。
- v1.57 | 2026-06-28 | Codex-架构师 | 补充 `V1` 机载药箱 P2 决策稿入口、无手臂最小用药闭环与 Phase 5 证据字段边界，并新增 `2026-06-21` 至 `2026-06-28` 论文纪要形成的 Phase 5 字段包候选及对应只读检查命令。
- v1.56 | 2026-06-21 | Codex-架构师 | 补充 `2026-06-15` 至 `2026-06-20` 论文纪要形成的 Phase 5 字段包候选边界、岗位 `01` AI 工程化 / 应用后端候选筛选和跨岗位相邻适配记录规则，并新增对应只读检查命令。
- v1.55 | 2026-06-14 | Codex-架构师 | 补充 arXiv `cs.RO/new` / `cs.RO/recent` listing 差异口径、候选排除项转补录主卡片边界、近期 Phase 5 字段包 TODO 与岗位 `11` 物理设备 Agent 候选验证规则，并新增对应只读检查命令。
- v1.54 | 2026-06-07 | Codex-架构师 | 补充 A 档论文整合调研评审与全景图的研究输入口径、候选人新增简历筛选的 `91` 台账同步规则，并新增对应只读检查命令；以 TODO 标注 A 档论文字段包回写 Phase 5 模板仍待确认。
- v1.53 | 2026-05-31 | Codex-架构师 | 补充同一 arXiv listing 已被前一日覆盖后的日更补录 / 周度综合判断收敛口径、候选人技术深面后条件推进总经理终面的记录规则，并新增对应只读检查命令；以 TODO 标注 Phase 5 验证证据链 provenance 待确认口径。
- v1.52 | 2026-05-24 | Codex-架构师 | 补充 `08_reviews/27` 双 BOM EMT 成本汇报入口、arXiv 饱和 listing 不硬凑 `3-5` 篇、VLN 年度总结指标口径 TODO，并新增对应只读检查命令。
- v1.51 | 2026-05-17 | Codex-架构师 | 补充 arXiv 同一官方 listing 连续复用后的周度饱和判断、近期待补录元信息标注要求，并新增对应只读检查命令。
- v1.50 | 2026-05-16 | Codex-架构师 | 补充候选人 offer 结果 / 入职承接口径与 arXiv 同一官方 listing 跨日补录的去重、饱和判断要求，并新增候选人流程状态只读检查命令。
- v1.49 | 2026-05-14 | Codex-架构师 | 补充 arXiv 每日论文纪要可采用 `3-5` 篇强相关主卡片 + 候选排除表的精筛口径，并新增对应只读检查命令。
- v1.48 | 2026-05-13 | Codex-架构师 | 补充 arXiv 每日论文纪要需区分最新官方 listing、当日无新批次说明、日更收录与日更补录口径，并更新对应只读检查命令。
- v1.47 | 2026-05-12 | Codex-架构师 | 补充外部设计候选资料输入目录的使用边界与只读清点命令。
- v1.46 | 2026-05-11 | Codex-架构师 | 补充 arXiv 日更补录论文卡片需标注本轮 listing 口径，并新增对应只读清点命令。
- v1.45 | 2026-05-10 | Codex-架构师 | 补充候选人已处理资料归档批次可使用专题后缀命名，并新增对应只读清点命令。
- v1.44 | 2026-05-07 | Codex-架构师 | 补充 arXiv 每日论文纪要的推荐优先级表与未优先收录说明口径，并新增对应只读清点命令。
- v1.43 | 2026-05-06 | Codex-架构师 | 补充奖项提名 / 项目申报输入资料的本地留存、输出交付与主线回写边界，并新增对应只读清点命令。
- v1.42 | 2026-05-04 | Codex-架构师 | 补充 arXiv 无新批次时的日更补录口径、listing 日期说明与对应清点命令。
- v1.41 | 2026-05-03 | Codex-架构师 | 补充 arXiv 每日论文纪要的稳定段落结构、主线回写判断说明与结构清点命令。
- v1.40 | 2026-05-02 | Codex-架构师 | 补充 arXiv 每日论文纪要的既有条目去重、近期待补录与论文卡片字段校验规则，并新增日更标题 / arXiv 编号清点命令。
- v1.39 | 2026-05-01 | Codex-架构师 | 补充候选人输入资料根层待处理、已处理资料本地归档与正式判断回写 `91` 台账的工作流，并新增归档清点命令。
- v1.38 | 2026-04-30 | Codex-架构师 | 补充 `docs/09_research/00_papers/` 作为 arXiv 每日论文纪要目录的维护规则，并新增对应只读检查命令。
- v1.37 | 2026-04-29 | Codex-架构师 | 补充 `02_kinbot_team_recruitment_requirements.csv` 作为招聘评估链的正式基线角色，并明确岗位编号 / 命名调整时的联动回写顺序。
- v1.36 | 2026-04-28 | Codex-架构师 | 补充 `input/01_candidate_resume/` 通过目录级 `.gitignore` 保持候选人原始输入本地留存的工作流，并新增对应忽略规则核对命令。
- v1.35 | 2026-04-27 | Codex-架构师 | 补充 `input/` 与 `output/` 目录级 `README.md` 的只读检查命令，避免新增输入目录说明或交付包入口遗漏索引。
- v1.34 | 2026-04-26 | Codex-架构师 | 补充 `output/` 多文件图包以 `README.md` 作为交付入口的默认约束，并新增对应只读检查命令。
- v1.33 | 2026-04-25 | Codex-架构师 | 补充 `Phase 5` 后段涉及量产导入、发布准备与交付闭环时的默认入口文档，并新增 `docs/06_p5_launch_readiness/` 的只读检查命令。
- v1.32 | 2026-04-24 | Codex-架构师 | 补充 `output/` 交付图包的最小目录约定与只读清点命令，避免 `.DS_Store` 等本地噪声干扰交付入口检查。
- v1.31 | 2026-04-23 | Codex-架构师 | 补充候选人简历输入目录的只读清点命令，避免新增简历、面试总结或转写未同步到 `91` 候选人台账。
- v1.30 | 2026-04-22 | Codex-架构师 | 补充 `08_system_tradeoff_model_and_priority_matrix.md` 作为系统组成冲突、资源消耗与双成本情景评审的默认工作入口，并新增 `P2` 文档入口只读检查命令。
- v1.29 | 2026-04-21 | Codex-架构师 | 吸收董事长汇报反馈：后台服务 / 人工坐席与 `10000 BOM / 29999 定价 / 10000 台首批 / 租售并行` 暂作为 `KBT-57` 承接的战略假设，不覆盖当前已冻结基线。
- v1.28 | 2026-04-20 | Codex-架构师 | 补充 `Step 50` 头部 / 屏幕布局当前主线，并明确候选人新增初试反馈、面试总结或转写输入时应先刷新 `91` 候选人台账。
- v1.27 | 2026-04-17 | Codex-架构师 | 补充 `.DS_Store` 本地辅助文件的提交排除约束，并将 `VLN / NFM` 专题目录的只读检查命令收紧为仅扫描 Markdown，避免 Finder 噪声干扰入口检查。
- v1.26 | 2026-04-16 | Codex-架构师 | 补充 `Phase 5` 当前执行 / 门控入口与 `KBT-55` 的收口边界，并新增 `docs/05_p4_beta_dvt/` 与 `docs/06_p5_launch_readiness/` 的只读检查命令。
- v1.25 | 2026-04-15 | Codex-架构师 | 补充 `plan/task_plan.md` 与 `plan/notes.md` 作为当前默认执行计划 / 工作笔记文件约定，并细化 `logs/` 按环境分层的本地运行日志检查命令。
- v1.24 | 2026-04-14 | Codex-架构师 | 补充 `decision_log/` 派生索引的读取边界、`logs/` 运行日志目录约束，以及对应只读检查命令，避免辅助入口和正式事实源混淆。
- v1.23 | 2026-04-13 | Codex-架构师 | 同步 `08_reviews` 活跃入口纳入 `26` 号 `EMT` 汇报文档，并新增对应只读检查命令，避免评审输入口径落后于目录索引。
- v1.22 | 2026-04-12 | Codex-架构师 | 补充 `VLN / NFM` 专题研究子目录与 CTO 面试题包的当前执行口径，并新增对应只读检查命令。
- v1.21 | 2026-04-11 | Codex-架构师 | 补充团队规划中的候选人筛选与 CTO 统一面试工作流，明确 `90 / 91` 文档作为当前招聘评估链的正式依据。
- v1.20 | 2026-04-10 | Codex-架构师 | 补充仓库内已实际使用的 `plan/` 执行计划工作目录及对应只读检查命令，避免计划型工作流无文档约束。
- v1.19 | 2026-04-09 | Codex-架构师 | 吸收 `Step 48` 的架构精简输入：将当前默认量产资源线更新为 `12GB RAM + 32GB Flash`，并确认 `KBT-32` 继续作为当前唯一开发入口。
- v1.18 | 2026-04-09 | Codex-架构师 | 补充复杂度治理 guardrails：复杂度复盘类文档默认归档、活跃主线文档超长需说明、活跃 `provisional` 必须绑定 Linear 承接，并明确历史留痕不直接计入活跃复杂度 KPI。
- v1.17 | 2026-04-09 | Codex-架构师 | 补充 `docs/superpowers/` 工作计划的执行子技能约束，并将 `.superpowers/` 明确纳入本地辅助目录提交排除范围。
- v1.16 | 2026-04-08 | Codex-架构师 | 补充主线文档分层、`08_reviews` 活跃入口 / 归档规则、`superpowers` active-only 约束，以及 `provisional` 单一承载规则。
- v1.15 | 2026-04-08 | Codex-架构师 | 补充 `docs/superpowers/` 工作文档流转约束，并记录仓库当前可见的 `.claude` repo-local hook 守卫与只读检查命令。
- v1.14 | 2026-04-06 | Codex-架构师 | 补充“在不需要用户确认时不得停在阶段性汇报；每次暂停必须带着重大待确认问题”的协作规则，避免在已批准路线中反复中断。
- v1.13 | 2026-04-06 | Codex-架构师 | 补充“每一轮架构推进都必须显式追问一次‘现在的架构是不是太复杂了？’”的复杂度自检规则，防止主线在革新过程中持续膨胀。
- v1.12 | 2026-04-06 | Codex-架构师 | 补充“用户已明确批准后应持续推进直到下一个必须审批的阶段门，不得重复请求继续授权”的协作规则，并要求在 `AGENTS.md` 中显式固化。
- v1.11 | 2026-04-06 | Codex-架构师 | 补充 `KBT-33` 作为 `KBT-31` 子 issue 的承接边界，明确其只负责双视角一致性与接口稳定性治理细化，不回退重定义系统边界。
- v1.10 | 2026-04-05 | Codex-架构师 | 补充当前 Linear 项目名、`KBT-32` 及后续模块方案评审的双视角一致性固定审阅项，并新增 Markdown / README 入口只读清点命令。
- v1.9 | 2026-04-04 | Codex-架构师 | 补充评审目录 `README.md` 新索引的前置检查要求，明确新增外部评审输入应先纳入本轮分析。
- v1.8 | 2026-04-03 | Codex-架构师 | 补充 VLN / 前瞻技术判断的专项交叉校验流程，并明确关键裁剪评审中的高端产品感复核要求。
- v1.7 | 2026-04-02 | Codex-架构师 | 补充本地待办与 Linear 持续同步要求，并明确后置里程碑逆向约束型文档的使用边界。
- v1.6 | 2026-04-01 | Codex-架构师 | 补充其他线程提交前的文档一致性检查要求，明确检查点与现有只读命令配套关系。
- v1.5 | 2026-03-31 | Codex-架构师 | 补充每轮前置读取的外部评审输入检查与目录 `README.md` 索引同步规则。
- v1.4 | 2026-03-30 | Codex-架构师 | 补充候选人简历输入目录约定与团队规划基线使用边界。
- v1.3 | 2026-03-29 | Codex-架构师 | 补充前置评审清账与 `provisional -> confirmed` 设想包升级流程。
- v1.2 | 2026-03-28 | Codex-架构师 | 补充仓库现有生命周期目录、研究子目录同步约束与 `rg --files` 只读清点命令。
- v1.1 | 2026-03-27 | Codex-架构师 | 补充全生命周期阶段门文档、中文维护约束、目录级变更回写约束与常用只读检查命令。
- v1.0 | 2026-03-21 | Codex-架构师 | 创建仓库级代理协作规范，约束事实源、编辑边界、架构推进纪律、Linear 协作和 Git 维护方式。

---

## 1. 文档定位

本文档用于约束在本仓库内工作的 AI 代理。

关注内容：

- 如何读取需求与事实源
- 如何推进系统架构与总体方案
- 如何与其他线程、Linear 和评审文档协作
- 如何维护提交、分支和版本

不替代：

- `README.md`：仓库总览与文档索引
- `CHANGELOG.md`：全仓更新记录
- `CLAUDE.md`：Claude 专用说明
- `input/00_requirements/00_user_requirements_input.md`：用户需求与审阅事实源

## 2. 项目上下文

- 项目名称：Kinbot
- 当前阶段：产品需求基本完成后的系统架构设计与技术研判阶段
- 当前主线：`P1 / PDCP`
- 当前目标：形成完整系统架构基线，并下发总体方案与模块方案基线
- 当前量产预备目标：`2026-12-31`
- 当前整机 `BOM` 目标：`5000 到 6000 元`

## 3. 事实源优先级

代理在判断“什么是当前有效事实”时，按以下优先级执行：

1. 用户在当前对话中的最新明确指令
2. `input/00_requirements/00_user_requirements_input.md`
3. `docs/00_governance/03_decision_log.md`
4. `docs/00_governance/01_workflow.md`
5. `docs/00_governance/02_lifecycle_workflow_and_gates.md`
6. 当前主线架构与方案文档
7. 评审文档与研究文档
8. 代理自己的推断

规则：

- 高优先级与低优先级冲突时，以前者为准
- 不得把代理历史推断高于用户输入
- 若真实仓库状态与文档不一致，先核对真实状态，再回写主线文档

## 4. 编辑边界

### 4.1 禁止直接修改

- `input/00_requirements/00_user_requirements_input.md`
- `CLAUDE.md`

除非用户明确要求，否则不得修改上述文件。

### 4.2 默认允许修改

- `docs/` 下正式文档
- 根目录 `README.md`
- 根目录 `CHANGELOG.md`
- 本文件 `AGENTS.md`

### 4.3 对其他线程产物的处理

- 可以吸收其他线程结论
- 不得无说明覆盖其他线程的明确修改
- 若引用其他线程专项结论，应在主线文档中标注来源
- 目录级变更统一只在根目录 `CHANGELOG.md` 记录，不在各子目录重复维护目录级变更日志
- 候选人资料等输入型目录只保存输入，不在输入目录内直接冻结组织结论；正式判断应回写到独立评估线程或其输出文档

## 5. 文档格式要求

所有由 Codex 创建或维护的正式文档，默认采用以下头部结构：

- 文档标题
- 分隔线
- 文档版本
- 创建日期
- 作者
- 文档变更记录
- 分隔线

作者命名规则：

- 架构主线程：`Codex-架构师`
- 硬件专项：`Codex-硬件专家`
- VLN 专项：`Codex-VLN技术专家`
- 其他线程：`Codex-角色名`

每份被维护的文档，最前面都应维护简版变更记录，至少包含：

- 版本号
- 更新日期
- 更新人
- 主要更新内容

## 6. 当前主线架构纪律

当前工作必须默认继承这些主线：

- 当前 L1 系统级概念架构首要评审入口为 `docs/02_p1_architecture/16_recursive_agentic_robot_system_architecture.md`；`01 / 03 / 04 / 14` 保留为迁移参考。递归方向与旧架构冲突时以 `16` 为准，但 `16` 中标为 `provisional / in review` 的精确拓扑不得提前写成冻结事实
- 已确认的软件主线是：Kinbot 是跨信息空间与物理空间的超级 Agent，具有独立使命和责任边界的 L1/L2 软件运行时责任域采用 Agent Cell；七构件元模型、五项递归判据、`F1 + A1-A8` 九实体、四个收敛机制、确定性叶子分类和三层在线护栏当前仍是 `KBT-59` 待评审候选
- 已确认的判定原则是：无独立使命、目标、状态和恢复责任的普通技术组件不得为了“全部 Agentic”而伪装成 Agent；驱动、协议栈、模型服务、底层控制器和硬实时安全联锁等具体叶子分类仍需在 `KBT-59` 中评审
- 候选递归架构默认采用结构父子目标委派；A3、A4、A7、A8 分别承接共享语义冲突、跨域根任务、语义许可与资源策略的最终解释权，并通过缓存、租约、分区和确定性执行层避免成为同步单点；禁止自由多 Agent 全连接、外部系统直控本体、子 Agent 扩大权限或模型输出直达执行器
- `KBT-59` 候选架构必须证明：F1 具备不依赖 A1/A5/A7、模型、消息总线和网络的确定性安全数据面；A7 只审批语义能力包络与高风险副作用，不审批每个电机周期，也不能替代安全 MCU、看门狗、限速、碰撞 / 失稳和防夹保护。评审通过前不得把该拓扑写成已实现事实
- 一代价值排序：`健康管理 > 陪伴交互 > 家庭安全巡护 > 老人看护`
- 一代收敛策略：`核心闭环强、服务闭环轻、技术突破集中`
- 一代传感主线：纯视觉
- 头部 / 屏幕布局主线：`V1` 默认采用“紧凑轻量头部 + 躯干内容屏”，高集成度带屏头仅作为头颈高速链路、`EMI`、寿命或可维护性阶段门不过线时的 `Plan B`
- 深度相机 / 激光雷达：仅研发对比基线与真值参考链路，不作为产品 fallback
- 若纯视觉不过线：优先延迟产品节奏，而不是回退主动传感主线
- 默认数据边界：原始敏感数据端侧处理，仅预留受控回流能力
- 董事长汇报反馈已作为 `KBT-57` 战略假设承接：后台服务 / 人工坐席可能从“后续适配位”升级为与机器人本体产品联动立项的能力；非隐私性结构化数据可评估受控回流与持续进化闭环
- 当前默认量产资源线：`12GB RAM + 32GB Flash`
- `12GB + 64GB`：边界验证线
- `16GB + 64GB` 及以上：前瞻验证线或未来 `Pro SKU`
- 当前整机 `BOM` 冻结基线仍为 `5000 到 6000 元`；`10000 元 BOM / 29999 元定价 / 首批 10000 台 / 销售与租赁并行` 仅作为 `KBT-57` 待业务拆解的战略分支，不得直接改写当前量产基线
- 每一轮涉及成本、功耗、结构、交互或伴生系统裁剪的评审，都必须同步复核是否损伤“聪明、温暖、精致”的高端产品感，以及是否仍能支撑 `20000 到 30000 元` 售价区间

## 7. 架构推进方式

- 先检查 `input/00_requirements/00_user_requirements_input.md` 顶部“对 Codex 的要求”是否有变化，再读取需求输入与当前主线文档
- 若需要快速定位当前有效事实、架构判断或开放问题，可先读取 `docs/00_governance/decision_log/` 下的派生索引，但不得将其视为与 `03_decision_log.md` 并列的正式事实源
- 若 `CLAUDE.md` 或 `docs/08_reviews/01_architect_review_and_plan.md` 有新增内容，也作为外部评审输入纳入本轮分析
- 若 `docs/08_reviews/README.md` 有新增索引，需先判断新增评审文档是否影响当前主线；相关时应作为本轮外部评审输入纳入分析
- 先检查前置评审项与 Linear 中仍处于 `In Review` 的 issue 是否已清账；未关闭时必须先强提醒
- 本地文档中的阶段性待办和 issue 应持续同步到 Linear，并与本地文档状态保持一致
- `KBT-32` 及后续模块方案评审，必须把“双视角一致性检查”作为固定审阅项，防止本体实体架构与运行时功能架构重新漂移
- `KBT-33` 继续作为 `KBT-31` 子 issue 保留，只承接双视角一致性与接口稳定性策略的治理细化，不回退重定义系统边界
- 先判断本轮新增输入会影响哪些主线文档
- 若当前线程处理奖项提名、项目申报、荣誉申报或外部申报材料，原始模板与用户输入优先放在 `input/02_award_nominations/` 本地留存，交付稿优先写入 `output/`；申报叙事中的技术亮点、商业判断或量产口径默认不直接回写主线事实源，只有形成经用户确认的稳定产品 / 架构判断时，才同步 `README.md`、`CHANGELOG.md`、`03_decision_log.md` 或相关主线文档。
- 若当前线程处理外部设计候选、结构 / 交互 / 造型方案或类似 PDF 输入，应优先放在 `input/03_design_candidates/` 作为原始资料入口；候选方案默认只是评审输入，不直接升级为产品或架构事实，只有形成经评审确认的稳定取舍时才回写主线文档、`03_decision_log.md`、`CHANGELOG.md` 或 Linear。TODO：确认该目录内大文件是否需要目录级 `.gitignore` 或交付归档规则。
- 若当前线程处理 arXiv / 论文检索或每日论文纪要，应优先写入 `docs/09_research/00_papers/`，按 `YYYY-MM-DD_kinbot_arxiv_daily.md` 命名，并同步该目录 `README.md` 与 `docs/09_research/README.md`；论文纪要默认只是研究输入，只有影响主线判断时才回写主线文档、`03_decision_log.md` 或 Linear。
- 若当前线程从每日论文纪要中汇总 `A / A-` 论文形成整合调研评审，应优先写入 `docs/09_research/00_papers/YYYY-MM-DD_kinbot_a_grade_paper_integrated_review.md`，可配套 `YYYY-MM-DD_kinbot_a_grade_paper_panorama.svg` 作为全景信息图，并同步 `docs/09_research/00_papers/README.md`、`docs/09_research/README.md` 与 `CHANGELOG.md`；该类文档默认仍是研究输入，应把主题簇、主线影响判断和 Phase 5 验证字段包收敛成候选建议，不得直接把论文结论升级为主线事实或在线产品模块。
- 新增 arXiv 每日论文纪要前，应先核对同目录既有日更文档中的论文标题与 arXiv 编号；优先覆盖当日 `recent` 新出现且未进入前序纪要的论文，必要时可补入近几日漏收但需标注补录口径。每篇论文卡片至少保留摘要转述、Kinbot 问题映射、资源消耗、优劣势、推荐理由与来源链接，避免大段复制原摘要。
- 若 arXiv 官方 `cs.RO/new` 或 `cs.RO/recent` 在本轮检索时尚未出现以当日为 listing 日期的新 Robotics 批次，仍可按当日日期形成每日纪要，但必须在文档变更记录与“检索口径”中写明本轮检索日期、官方最新 listing 日期、entries 总数、`new / cross / replacement` 数量，以及采用“最新官方 listing + 当日未出现新批次说明”或“日更补录”的原因与时间窗；该类纪要默认按研究输入处理，不因 listing 口径本身回写主线。
- 若 arXiv 官方 `cs.RO/new` 与 `cs.RO/recent` 显示的条目数或顶部日期不一致，应以 `cs.RO/new` 作为正式 Robotics listing、entries 总数与 `new / cross / replacement` 计数口径；`cs.RO/recent` 只作为顶部日期、近期待补录和重复主题复核辅助，并在“检索口径”中写清差异，例如 `recent` 只显示 `new + cross` 前若干条、不含 `replacement`。
- 若 arXiv 每日论文纪要从同一官方 listing 中连续收录或补录 `new submission`、`cross submission` 或 `replacement` 条目，应在每篇论文卡片元信息中保留 `本轮 listing 口径`，写清官方 listing 日期、条目类型和属于日更收录还是日更补录，避免后续误判为当日新批次或主线事实变化。
- 若连续多个每日论文纪要复用同一官方 Robotics listing，应先排除前序主卡片已收录的论文标题与 arXiv 编号，并在“本轮总判断”或“周度滚动判断”中说明已饱和 / 接近饱和主题；重复度高的泛 `VLA`、world model、manipulation 或自动驾驶条目优先进入候选排除表，不因跨日补录扩张产品级模型层。
- 若同一官方 Robotics listing 已被连续多日覆盖，本轮又转为 `cs.RO/recent` 近期待补录，应在每篇补录论文卡片的 `本轮 listing 口径` 中写明 `cs.RO/recent` entry 日期、`近期待补录` 和 abs 页 `Submitted on` 日期；不得把该类条目误写成最新 `cs.RO/new` listing 的当日新批次。
- 若同一官方 Robotics listing 已进入饱和阶段，每日论文纪要应从继续扩张论文数量切换为周度综合判断：用表格或清单区分已饱和、接近专题成熟、仍值得专题跟踪的主题，并把新增论文收敛为轻量验证动作或专题候选；若只有 `2-3` 篇论文仍有明确增量，不必硬凑 `3-5` 篇，不得因补录论文继续新增产品级在线组件或主线概念。
- 若同一官方 Robotics listing 已在前一日按精筛主卡片覆盖，本轮继续复用该 listing 时，应在“检索口径”中显式列出前一轮已收录主卡片或其直接重复主题，再按“日更补录 + 周度综合判断”处理剩余增量；主卡片只保留未被前一轮覆盖且能新增 Kinbot 字段、验证项或治理判断的论文，重复或低增量候选进入候选排除表。
- 前序纪要候选排除表中的论文，后续可因重新审视发现明确 Kinbot 验证字段、失败模式或治理项而升级为同一 listing 的补录主卡片；升级时必须说明“从排除转收录”的新增理由，并继续标注不新增在线子系统、不改写主线事实的边界。
- 若本轮 Robotics listing 中真正能改变 Kinbot 判断的论文有限，可不固定凑满 `10` 篇；优先保留 `3-5` 篇强相关主卡片，并增设“候选排除表”收纳有价值但未进入主卡片的条目。`replacement` / `cross submission` 仅在新增 Kinbot 评测项、治理项或端侧资源判断时才进入主卡片，避免把重复主题硬写成主线变化。
- arXiv 每日论文纪要的“本轮总判断”中应保留 `推荐优先级` 表，按论文价值给出建议动作；若本轮有技术价值高但不适合 Kinbot 一代主线的相邻候选，应在“检索口径”中补 `未优先收录说明`，明确排除原因，避免误写成传感主线、形态边界或 Phase 5 门控变化。
- arXiv 每日论文纪要应保留 `检索口径 -> 本轮总判断 -> 论文卡片 -> 候选排除表（若采用精筛口径） -> 对 Kinbot 的落地 / 文档建议 -> 来源` 的基本结构；若本轮不回写主线，应显式说明未进入主线的原因或复杂度自检判断。
- 涉及 `VLN` 路线、导航推理和相关前瞻技术判断时，应通过独立 Linear issue 与 `VLN` 专项线程交叉校验，并在需要时回写 `docs/09_research/01_vln_role_analysis_and_technical_plan.md`
- 若当前线程处理 `VLN -> NFM`、长期记忆、导航基础问题或数据设计等专题深化，应优先在 `docs/09_research/07_vln_model_design/` 下推进；当专题结论影响主线时，再回写 `docs/09_research/01_vln_role_analysis_and_technical_plan.md`、相关主线文档与索引
- 若当前线程处理 VLN 项目年度总结、历史指标复盘或外部协作文档导入，应核对 `docs/09_research/07_annual_summary_of_vln_project.md` 是否已同步 `docs/09_research/README.md` 与 `CHANGELOG.md`；在索引未同步前仅作为待整理研究输入。引用其中 `SR / SPL / 成功率` 时必须保留任务类型、prompt、阈值、测评集和模型版本，避免把 `ObjectNav` 与 `InstanceImageNav`、自建集与 `HM3D` 结果直接比较。TODO：确认该年度总结最终应回写 `01_vln_role_analysis_and_technical_plan.md` 还是保留为归档型研究输入。
- 若当前线程使用 `superpowers` 生成工作计划或规格草稿，应统一落到 `docs/superpowers/` 及其 `plans/` 子目录；该目录只承接工作文档，不替代主线架构、评审或量产基线文档
- 若当前线程执行 `docs/superpowers/` 中的实现计划，应按计划头部约束优先使用 `superpowers:subagent-driven-development`；若不适合并行拆解，则使用 `superpowers:executing-plans` 按任务顺序推进
- `docs/superpowers/` 新增或调整文档后，需同步回写 `docs/superpowers/README.md`；若其影响仓库总入口或阶段入口，再同步检查根目录 `README.md` 与 `CHANGELOG.md`
- 若当前线程处理候选人筛选、面试建议或招聘评估回写，应以 `docs/10_team_planning/90_cto_unified_interview_framework.md` 作为统一面试框架，以 `docs/10_team_planning/91_candidate_screening_and_interview_advice.md` 作为滚动候选人判断台账，并与 `02_kinbot_team_recruitment_requirements.csv` 保持口径一致
- 若当前线程新增岗位、调整岗位编号 / 名称，或修改候选人输入文件命名规则，应先更新 `docs/10_team_planning/02_kinbot_team_recruitment_requirements.csv`，再同步 `input/01_candidate_resume/README.md`、`91_candidate_screening_and_interview_advice.md` 与相关目录索引，避免招聘基线与输入命名脱节
- 若当前线程新增或刷新候选人面试题包、项目介绍话术或战略判断题，应先读取 `91_candidate_screening_and_interview_advice.md` 的 `1.1 家庭机器人战略沟通与反向验证基线`；面试中应先问候选人原生判断，再按背景差异化介绍项目，最后回到岗位责任。第一代轮式无臂量产主线与人形 / 双臂前瞻线可并行，但不得把候选人复述项目口径当成战略理解，也不得把内部战略口径扩写为对外可核实事实。
- 若候选人新增输入仅为简历筛选，也应在 `91_candidate_screening_and_interview_advice.md` 同步顶部输入清单、当前流程状态口径、总表、候选人逐一判断小节和末尾建议动作；需按岗位与成熟度区分 `建议专业面 / 技术深面 / 技术一面 / 专家面 / 暂不直接 CTO 面`，并保留面试题包或下一轮验证题，避免把简历初筛误写成已完成面试结论。
- 若岗位 `01` 架构师 / 高级开发候选人的新增资料主轴是大数据、车联网 `IoT`、计量计费、支付账务、`AI` 工程化、`AI-Native` 研发提效或 `DataAgent`，应先按应用后端 / 平台架构专业面验证服务边界、可观测、高可用、灰度、端云设备状态、`AI` 能力接入、评测闭环和真实 owner 边界；不得因简历出现 `RAG / Agent / LangGraph / MCP` 等关键词就直接跳过专业面、升级为 `CTO` 面或改写为岗位 `11` 主推。
- 若岗位 `01` 架构师 / 高级开发候选人的新增资料主轴是车联网设备云、`OTA`、远程诊断、自动化测试或端云联调，可采用第一轮综合面合并验证技术深度、架构 owner、设备云迁移和阶段适配度；线上面试可控制在 `50` 分钟内，不强制画图 / 白板，改用口头分层说明、关键链路追问和现场选题，但仍需压实 `AI` 工程化、多模态 / `Agent`、团队管理、base 与完整架构 owner 证据。
- 若岗位 `01` 候选人的新增资料主轴是生产级无人机 `Agent`、`Agent Runtime`、`HITL`、工具调用、可观测评测或高并发应用后端，应先按应用后端与 `AI` 融合架构准 owner 验证真实 owner 边界、上线规模、安全恢复、评测闭环和后端底座；可同步作为岗位 `11` 强相关候选人观察，但最终必须拆清主定位是岗位 `01` 架构准 owner 还是岗位 `11` 机器人 Agent 应用 owner。
- 若候选人新增初试反馈、技术面总结、`CTO` 面总结或录音转写，应先吸收到 `91_candidate_screening_and_interview_advice.md`，区分“简历筛选判断”与“面试后判断”，再刷新推进建议、风险点和下一轮问题
- 若候选人在技术深面后从 `CTO` 二面建议转为总经理终面，应在 `91_candidate_screening_and_interview_advice.md` 中同步更新顶部流程状态、总表、候选人小节和末尾建议；需区分 `B+ 条件推进总经理终面` 与 `A 档无保留强推`，并把终面验证重点从技术名词深挖切换到 Maker 动机、亲自落地意愿、必要汇报协同、薪资 / base、岗位定位和 offer 评审条件。
- 若岗位 `11` 大模型应用 / Agent 开发候选人新增资料涉及无人机、物理设备 Tool 调用、`Plan-Execute-Verify`、安全校验、`AgentOps / APO` 或 `AI-Native` 编码，应在 `91_candidate_screening_and_interview_advice.md` 中拆清真实 owner 边界、工具参数 / 权限 / 幂等 / 回滚 / 审计、人机确认、评估闭环和家庭机器人迁移风险，避免只按 `LangGraph / MCP / ADK` 等框架名给出推进判断。
- 若同一候选人需要同时补充主岗位与相邻岗位适配判断，应在 `91_candidate_screening_and_interview_advice.md` 中拆清“主岗位推进建议”和“相邻能力观察”两层；`部分适配`、`可作为支撑候选人观察` 或 `AI 工具链相邻能力` 不等于岗位 `11` 机器人 Agent 主链路主推，也不应冲掉原主岗位的专业面建议。
- 若岗位 `09` 本体 SE 候选人的新增资料主轴是人形 / 轮足 / 消费机器人硬件负责人、车载域控、无人机硬件平台、电源电池、主控 / 域控或供应商资源整合，应优先按“本体 SE 综合面”组织，由用户本人同轮完成系统工程专家验证、`CTO` 阶段适配和组织授权判断；题包重心应放在系统约束、跨结构 / 控制 / 热 / 量产冲突裁决、阶段门、验证闭环、组织授权、角色边界、base / 出差和前三个月落地机制，而不是只深挖板卡或硬件细节。
- 若岗位 `09` 本体 SE 候选人达到 `A+` 特殊关键岗或应以“机器人本体与硬件体系负责人 / 本体研发负责人”定位，应优先按 `90-120` 分钟线下双向契合交流组织，以办公环境、实验室和真机作为共同讨论对象，不走常规连续问答面；需提前准备路线、屏幕、账号、拍摄和资料分级，交流中拆清角色契约、授权、团队、工作地点、长期激励和竞业 / 保密边界，尚未冻结的 `F1 + A1-A8` 拓扑不得包装为已定架构。
- 若岗位 `10` 结构传动候选人的新增资料主轴是人形 / 机械臂结构、`URDF`、仿真、模型训练接口或双臂前瞻，应先按结构专业面验证能否承担独立双臂前瞻线、可信数字本体与 `sim-to-real` 协同；必须拆清其 `URDF` 工作是文件导出、仿真可运行，还是已形成质量 / 惯量 / 关节 / 碰撞体参数校验和真机回归闭环，不得因人形机器人或 `URDF` 关键词直接升级为 `CTO` 面，也不得改变第一代轮式无臂量产主线。
- 若岗位 `11` 大模型应用 / Agent 开发候选人的新增资料主轴是浏览器 `UI Agent`、自动化测试 Agent、`LangGraph`、工具调用、云端批量执行、`CI` 质量门禁或全栈平台工程，可作为年轻高潜 Agent 应用工程师进入技术一面；需验证真实 owner、状态建模、工具参数 / 权限 / 幂等 / 回滚 / 审计、失败恢复、评测闭环和从浏览器工具迁移到物理工具的安全边界，不应因此改写为岗位 `01` 架构师或岗位 `16` 系统集成测试负责人主推。
- 若岗位 `15` 新增候选人资料或 JD 口径发生变化，应以 `docs/10_team_planning/02_kinbot_team_recruitment_requirements.csv` 与 `docs/10_team_planning/93_motion_control_algorithm_engineer_jd.md` 为基线，并同步 `input/01_candidate_resume/README.md` 命名规则；当前岗位 `15` 是高级运动控制算法工程师（SoC），重点验证 SoC 侧状态估计、经典控制产品化、渐进深度强化学习、`SIL / HIL / 真机` 评测闭环，以及 SoC 算法层与 MCU 硬实时执行层边界；历史 `15_运动控制_杨锦生` 资料不追溯改名。
- 若岗位 `16` 系统集成测试负责人候选人的新增资料主轴是智能硬件软件测试、整机功能测试、清洁机器人 / 洗烘联动测试、测试 `PO` 或小团队缺陷推动，应拆清“系统集成测试负责人”与“软件测试 / 整机功能测试骨干”两层；只有具备本体、端侧、云侧、`App`、服务链路、`SIL / HIL / E2E`、故障注入、试点质量闭环和系统质量红线证据时，才按岗位 `16` 负责人主推。
- 若岗位 `22` 高级 Agent 架构师（具身智能 Agentic System）新增候选人、offer 沟通或流程收口，应以 `docs/10_team_planning/92_senior_agent_architect_jd.md` 与 `91_candidate_screening_and_interview_advice.md` 为基线，验证 `Agentic System` 总体架构、`Agent Runtime`、`Tool / Action` 安全、`AgentOps / 评测` 和 Agent 团队技术牵引；必须写清与岗位 `01` 应用后端架构、岗位 `11` Agent 应用开发的边界，不能因 `RAG / UI Agent / VLA / MCP` 或平台工程关键词直接升级为岗位 `22`，不匹配时也不得默认转入岗位 `11 / 14`。
- 若候选人进入 offer 接受、放弃、未到 offer 即结束或已录用校招生入职定位阶段，应在 `91_candidate_screening_and_interview_advice.md` 顶部流程状态口径、总表与对应候选人小节同步记录；历史“可推进 / 强推进”评价只作为能力判断留痕，不得误读为当前仍在流程中。已接受 offer 的候选人应转入入职承接、mentor / owner 安排和阶段目标对齐；放弃 offer 或流程结束者只保留历史评价，重新打开前需重新确认候选人意愿、岗位口径和招聘优先级。
- 若候选人已接受 offer 后发生入职前放弃、转向其他公司 / 岗位或入职承接定位变化，应同步刷新 `91_candidate_screening_and_interview_advice.md` 的当前已接受 offer 名单、放弃 / 流程结束清单、候选人小节和末尾建议动作；未确认的公司、岗位或去向信息应标注为用户口径 / 待确认，不得写成公开可核实事实。
- 候选人输入资料根层只作为新增待处理入口；已被 `91_candidate_screening_and_interview_advice.md` 吸收的简历、面试总结和录音转写应移动到 `input/01_candidate_resume/archive/` 下对应批次目录本地归档，默认使用 `YYYY-MM-DD_processed/`；若同日需按岗位族群、专题或批次拆分，可使用 `YYYY-MM-DD_<topic>_processed/`。归档内容不冻结正式结论，正式判断仍以 `91` 台账为准
- 若当前线程需要新增或回写 CTO 面试题包，默认按 `90_cto_unified_interview_framework.md` 的现行标准为每位候选人准备 `10` 道候选题，现场选 `6 到 8` 道，并将显式 `Kinbot` 代入题限制为默认最多 `1` 道
- 根 `README.md` 只维护当前视图、当前有效入口、当前阶段门入口与历史资料指针，不再平铺全部历史评审或长阅读清单
- 当前主线事实源默认收敛为 `05_system_architecture_principles.md -> 16_recursive_agentic_robot_system_architecture.md -> 05_world_state_schema.md / 06_decision_state_machine.md / 07_safety_compliance_authorization_api.md 与专题层 -> 待迁移的 03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`；`01 / 03 / 04 / 14` 仅作为迁移参考
- 涉及成本、重量、尺寸、功耗、药箱、屏幕、交互、运动性能、端侧资源、后台服务 / 坐席或数据治理之间的系统组成取舍时，应默认先使用 `docs/03_p2_feasibility/08_system_tradeoff_model_and_priority_matrix.md` 的“硬门槛 -> 价值评分 -> 资源消耗 -> 风险转移 -> 双成本情景”模型，再回写对应 `S1-S7` 工作包或主线文档。
- 若当前线程处理 `V1` 机载药箱 / 储物仓工程化、用药闭环、开仓检测或防夹评审，应默认读取 `docs/02_p1_architecture/13_medication_storage_and_indoor_delivery_requirements.md` 与 `docs/03_p2_feasibility/10_v1_onboard_medicine_box_decision_draft.md`；当前 P2 工作口径为前向轻量电动浅抽屉 / 托盘 + 最小取放检测，无机械臂，用户自取 / 放回，机器人负责到人、驻停、开仓、提示、检测、记录和升级；`已取出` 与 `已服用` 必须拆分，防夹、锁止、开仓不移动和物品取放状态是工程硬门槛，药箱 `ToF`、云侧视觉裁决、多格自动盘点和机械臂递药不得作为默认主线。
- 当前主线已进入 `Phase 5：验证口径与治理闭环`；涉及验证规划、量产预备门控、试点进入条件或战略证据包判断时，应默认以 `docs/05_p4_beta_dvt/01_mvp_validation_plan.md` 与 `docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md` 作为当前执行 / 门控入口
- TODO：近期论文纪要已多次提示 `Phase 5` 仿真 / 回放 / 实机试验证据链需要 provenance 与最小元数据字段；后续处理验证报告、试验目录或回放数据模板时，应先判断是否需要记录 `validation_artifact_id`、`scenario_config_hash`、`sim_runtime_version`、`postprocess_version`、`evidence_lineage_complete` 与 `fair_metadata_complete`，但在主线文档确认前不得把完整 provenance 平台写成既定交付范围。
- TODO：`2026-06-04` A 档论文整合评审已把 `A / A-` 论文收敛为纯视觉导航、记忆、安全治理、端侧资源、交互澄清和验证证据链六类 Phase 5 字段包；后续处理 Phase 5 验证模板时，应先判断是否吸收为最小字段集合，但在用户确认或阶段门评审前不得把整合评审建议写成已冻结验证模板。
- TODO：`2026-06-09` 至 `2026-06-13` 论文纪要继续把导航线索、近人安全、端侧实时执行、对象级端云语义地图、稀疏人工反馈安全、纯视觉导航安全、测试时算力路由、手势 grounding、协作辅助时机和约束冲突最小违背收敛为 Phase 5 最小字段包；后续处理 Phase 5 验证模板、家庭样机试点或回放报告时，应按字段级候选评审，不得直接升级为在线 `VLA / world model`、完整 benchmark / 观测平台、触觉硬件基线或传感主线变化。
- TODO：`2026-06-15` 至 `2026-06-20` 论文纪要继续把目标相关证据地图、户型图弱先验冲突、延迟证据记忆、`latent OOD`、阶段级端侧资源画像、选择性远端 `Agent` 恢复、缺失模态降级、`breadcrumb` 返回、状态难度查询预算、长期导航证据、视觉尺度安全、健康感知可靠性、`AI sandbox` 证据边界、任务规划形式化验证、导航失败预警、故障诊断、概率时序安全、慢 `VLM` / 快规划和失败证据库收敛为 Phase 5 最小字段包；后续处理 Phase 5 验证模板、家庭样机试点、导航回放、健康感知验证、端侧资源 profiling 或故障复盘时，应按字段级候选评审，不得直接升级为在线导航大模型、完整主动诊断控制器、`AI sandbox` / 形式化验证平台、实时 `VLM` 控制链路、`RAG` 自动故障仲裁或传感 / `VLA` 主线变化。
- TODO：`2026-06-21`、`2026-06-22` 与 `2026-06-28` 论文纪要继续把数据 provenance / traceability、纯视觉 last-meter 对齐、局部安全 fallback、家庭对象长期位置记忆、策略失败可解释预测、自适应视觉伺服资源调度、长程导航时空记忆、长程任务记忆检索、`VLA` 安全诊断、低延迟 `VLM` 证据一致性和测试 oracle 收敛为 Phase 5 字段包候选；后续处理 Phase 5 验证模板、家庭样机试点、导航 / 找物回放、端侧视觉语言资源评估或安全诊断报告时，应按字段级候选评审，不得直接升级为完整数据标准平台、在线 `world model`、`VLA` failure detector / 安全裁决器、视觉伺服策略替换、端侧大记忆库、云端实时视觉问答链路或在线多 agent 测试生成平台。
- TODO：`2026-07-05` 论文纪要继续把低层语言导航接口、端侧闭环推理 runtime、视觉语言延迟攻击、家庭找物个性化边界和纯 RGB 参考轨迹导航收敛为 Phase 5 字段包候选；后续处理 `VLN / NFM` 低层接口、端侧 runtime profiling、安全负例回放、找物 / 长期记忆或参考轨迹导航验证时，应按字段级候选评审，不得直接升级为在线 `VLA / WAM / world model` 主链路、指定 C++ runtime 产品选型、人格画像 / 长期原始轨迹采集、纯图像示教替代定位规划基线或云端实时视觉语言控制链路。
- TODO：`2026-07-12` 论文纪要继续把纯视觉动态避障 `TTC`、流式 `VLN` 上下文预算、长期对象记忆 freshness、`world-model` verdict admissibility 和长时 action-faithful policy evaluation 收敛为 Phase 5 字段包候选；后续处理近人安全回放、`VLN / NFM` 低延迟专题、找物 / 长期记忆、`world model` 离线评测或仿真证据链时，应按字段级候选评审，不得直接升级为在线 `world model`、`31B` 记忆推理服务、`Video-LLM` 导航主链路、`WMBench` 平台或世界模型安全裁决器。未声明 envelope / horizon、未能 `OOD` 拒绝或未验证 `sim-real` transfer 的 world-model verdict 不得计入 Phase 5 安全通过证据。
- TODO：`input/00_requirements/00_user_requirements_input.md` 已出现 `Step 52` 工作计划阶段性刷新；后续处理本体结构、双目视觉、`VLN` 数据集、机器人 `Agent` 系统、9 月家庭样机试点或 12 月设计定型 / 百台目标时，应先判断是否需要回写 `plan/task_plan.md`、`plan/notes.md`、`Phase 5` 文档与 Linear，不得把未同步计划误写为已完成事实。
- 若当前线程进一步涉及量产导入、发布准备、对外交付组织或交付闭环责任划分，应同步读取 `docs/06_p5_launch_readiness/02_production_introduction_launch_and_delivery_closure.md`，避免 `Phase 5` 后段工作仅按门控标准理解、遗漏导入与交付链路设计
- 当前 `Phase 5` 只冻结架构侧验证规划、双泳道门控和治理预留；不得把未发生的实机 / 市场闭环表述成已完成事实，后续真实收口默认由 `KBT-55` 承接
- 涉及后台服务 / 人工坐席立项联动、非隐私数据回流、`10000` 元 BOM 战略分支、`29999` 元定价、首批 `10000` 台或租售并行时，默认引用 `KBT-57`，并标注为 `provisional`，不得写成已确认决策
- `docs/02_p1_architecture/14_family_co_living_agent_paradigm.md` 只保留背景 / 决策来路锚点角色；`docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md` 只保留阶段评审包角色，不再作为并列主入口
- 涉及 `EMT` 成本锚定、`6000 / 10000` 元双 BOM 情景、技术降本路径、行业成本对标或成本上修优先级时，应同步读取 `docs/03_p2_feasibility/09_cost_scenario_comparison_report.md` 与 `docs/08_reviews/27_kinbot_cost_anchor_and_bom_scenarios_for_emt.md`；`27` 号文档是面向 `EMT` 的汇报稿，不替代 `09` 号工程分析底稿。引用用户线下口径或非公开估算时必须标注来源口径，不得写成公开可验证事实。
- `docs/08_reviews/` 默认只保留 `21 / 25 / 24 / 26 / 27 / archive README` 作为活跃入口；其余历史评审稿、旧阶段收口稿与革新决策链文档进入 `archive/`
- `docs/08_reviews/` 中新增的复杂度复盘、阶段后总结与类似“总结型评审”文档，默认也进入 `archive/`，不扩张活跃评审入口
- `docs/superpowers/plans/` 只保留尚未被主线吸收的工作文档；已被主线吸收的计划应迁入 `docs/superpowers/archive/`
- 活跃主线文档默认目标控制在 `500` 行左右；若超过 `600` 行，必须在文档定位、目录索引或相关治理文档中说明其继续保留为单文件的理由
- 先更新系统级文档，再更新下游方案文档
- 最后回写 `docs/00_governance/03_decision_log.md` 和 `CHANGELOG.md`
- 允许为后置里程碑提前起草逆向约束型文档，但不得据此跳过当前阶段门或把后置结论伪装成当前已冻结事实
- 用户一旦明确批准某个提案、阶段方案或文档方向，代理应继续按已批准路线推进，直到遇到下一个必须由用户审查 / 批准的阶段门；不得在同一路线上反复以“若你要”“如果你要”之类措辞请求继续授权
- 若当前工作不需要用户作出新的重大判断、阶段门批准或风险取舍，代理不得仅因“阶段性汇报”而停下等待；每次暂停都必须明确携带一个需要用户确认的重大问题
- 每一轮架构推进都必须显式追问一次：`现在的架构是不是太复杂了？` 若答案倾向于“是”，应优先考虑减少层级、收缩实体数、压缩接口面或延后冻结，而不是继续叠加概念与结构。但是要避免每进行一次任务就问一次，仅在对架构做出修改时才问。

当信息不足但推进不能停时：

- 允许先形成提案或工作假设
- 必须明确标注为提案 / 假设 / 候选 / `provisional`
- 应按“本地文档先记 `provisional` -> Linear 建立评审 issue / comment -> 用户确认后升级为 `confirmed`”的方式推进
- 活跃 `provisional` 必须绑定明确的 Linear 承接项，至少写清内容、位置、冻结条件、目标阶段门与 owner；缺失这些信息的 orphan provisional 应优先清账
- 详细 `provisional` 内容只能在受控载体中展开：原则附录、活跃评审总包、受控附录、`docs/09_research/` 与 `docs/superpowers/` 工作文档；其他主线文档只允许保留摘要与指针
- `docs/00_governance/03_decision_log.md` 与 archive 文档中的历史 `provisional` 留痕默认不直接计入活跃复杂度 KPI
- 不得把未审阅内容伪装成已冻结事实

## 8. 图示要求

涉及以下内容的文档，应尽量补图：

- 结构分解
- 架构关系
- 流程关系
- 分层关系
- 阶段门或闭环关系

Mermaid 可作为快速编辑源，并要做美化。后续每次新建或实质修改 Mermaid 图时，必须同时满足：

- 在 Mermaid 后紧随一张语义等价的 SysML v2 风格 SVG 配图；需要汇报时同时提供 PNG。
- 按语义选择 `GeneralView`、`InterconnectionView`、`ActionFlowView`、`StateTransitionView`、`SequenceView`、`GridView` 等合适的标准视图类型，并在图头或图注中明确标出；不得只做外观模仿。
- 两种表示中的实体、过程、操作数、关系方向、分支条件和边界必须一致；SysML 配图可为可读性合并重复 usage，但不得改变架构语义。
- 新增视图类型或新的正式模型语义时，应新增或更新可解析的 `.sysml` `view def`，并完成语法校验。
- Mermaid 负责快速维护，SysML v2 配图负责正式评审；发现不一致时，先核对模型语义，再同步修正两种表示。

## 9. Linear 协作规则

Linear 是正式项目管理软件。

本地 Markdown 文档和 Linear 项目、里程碑、Issue、文档默认统一用中文维护。

当前 Linear 项目默认对齐为 `Kinbot OODA 架构到量产预备`。

当主线文档发生影响协作边界的变化时，必须检查是否需要同步：

- Project / Milestone / Issue 状态
- Issue 描述中的文档索引
- Issue comment 中的旧路径
- 中央同步文档

关闭 Issue 前至少确认：

- 文档已形成稳定结论
- 用户已审阅通过
- 下游承接文档已同步
- `README.md` / `CHANGELOG.md` / `docs/00_governance/03_decision_log.md` 已回写
- Linear 索引已同步

## 10. Git 与提交规则

- 默认在当前工作分支上工作
- 提交前检查 `git status`
- 不得把 `tmp/`、`logs/`、`.claude/`、`.obsidian/`、`.superpowers/`、`input/02_award_nominations/`、`.DS_Store` 等本地辅助目录或文件混入正式提交
- 不得随意使用破坏性 Git 命令

常用只读检查命令：

- `git status`：检查当前工作区与待提交内容
- `rg --files README.md docs input`：快速清点当前纳管文档与目录结构，检查是否有新增文档 / 子目录尚未同步索引
- `find plan -name "*.md" | sed 's#^./##' | sort`：快速检查 `plan/` 下的执行计划、阶段记录和工作笔记是否需要继续推进、归档或转入正式文档
- `find plan -maxdepth 1 -type f | sed 's#^./##' | sort`：快速检查当前线程是否已使用默认的 `plan/task_plan.md` 与 `plan/notes.md` 文件约定
- `find docs input -name README.md -o -name "*.md" | sed 's#^./##' | sort`：快速清点当前 Markdown / README 入口，检查新增文档是否已进入目录索引视图
- `find input output -maxdepth 2 -name README.md | sed 's#^./##' | sort`：快速检查输入目录说明与交付包入口 `README.md` 是否齐备，避免新增目录后只补文件不补入口说明
- `find docs/00_governance/decision_log -maxdepth 2 -type f | sed 's#^./##' | sort`：快速检查决策日志派生索引与历史分卷是否有新增入口待纳入治理索引或主线引用
- `find docs/superpowers -name "*.md" | sed 's#^./##' | sort`：快速检查 `superpowers` 工作文档及其索引是否已纳入仓库视图
- `find docs/08_reviews -maxdepth 1 -type f | sed 's#^./##' | sort`：快速检查活跃评审入口是否与 `docs/08_reviews/README.md` 一致，尤其关注 `21 / 24 / 25 / 26 / 27` 是否仍为当前有效输入
- `rg -n "27_kinbot|成本锚|双 BOM|6000|10000|科沃斯|八界|成本上修|技术降本" README.md docs/08_reviews/README.md docs/08_reviews/27_kinbot_cost_anchor_and_bom_scenarios_for_emt.md docs/03_p2_feasibility/09_cost_scenario_comparison_report.md`：快速检查 `08_reviews/27` 是否已作为 EMT 成本汇报入口同步，并核对双 BOM、行业参照和成本上修口径是否一致
- `find docs/03_p2_feasibility -maxdepth 1 -name "*.md" | sed 's#^./##' | sort`：快速检查 `P2` 总体方案、选型、成本、功耗、权衡模型与工程化文档入口是否有新增或索引漂移
- `rg -n "10_v1_onboard|机载药箱|前向.*浅抽屉|取出.*服用|retrieved|taken_confirmed|防夹|开仓不移动|药箱 .*ToF|A-111|Q-017" README.md docs/00_governance/03_decision_log.md docs/03_p2_feasibility/README.md docs/03_p2_feasibility/10_v1_onboard_medicine_box_decision_draft.md docs/02_p1_architecture/13_medication_storage_and_indoor_delivery_requirements.md`：快速检查 `V1` 机载药箱决策稿入口、P2 工作口径、取出 / 服用拆分、防夹硬门槛和主线回写边界是否一致
- `find docs/09_research/00_papers -maxdepth 1 -name "*.md" | sed 's#^./##' | sort`：快速检查 arXiv 每日论文纪要和目录索引是否有新增入口待纳入研究目录视图
- `find docs/09_research/00_papers -maxdepth 1 \\( -name "*a_grade_paper_integrated_review.md" -o -name "*a_grade_paper_panorama.svg" \\) | sed 's#^./##' | sort`：快速检查 A 档论文整合调研评审与全景信息图是否已有交付入口，避免只新增图或综述而未同步索引
- `rg -n "A 档论文|A / A-|主题簇|全景信息图|Phase 5 验证字段|论文不等于主线事实|字段包" docs/09_research/00_papers/*a_grade_paper_integrated_review.md docs/09_research/00_papers/README.md docs/09_research/README.md`：快速检查 A 档论文整合评审是否保留研究输入边界、主题收敛和父级索引
- `rg -n "^### 3\\.|arXiv \\|" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md`：快速清点每日论文纪要中已收录的论文标题与 arXiv 编号，新增或补录前用于避免重复收录
- `rg -n "^## [0-9]+\\. (检索口径|本轮总判断|论文卡片|.*建议|复杂度自检|本轮未进入主线|来源)" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md`：快速检查每日论文纪要是否保留检索、判断、卡片、建议、复杂度 / 主线回写说明与来源段落
- `rg -n "推荐优先级|复杂度自检|未优先收录说明|本轮未进入主线的原因" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md`：快速检查每日论文纪要是否保留推荐排序、复杂度自检、候选排除说明与主线不回写理由
- `rg -n "候选排除表|3-5 篇|不再固定凑满|不硬凑|只收录.*[23] 篇|replacement 主卡片|cross submission" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md`：快速检查每日论文纪要是否按精筛口径记录主卡片数量约束、候选排除表、饱和后低篇数收录与 replacement / cross 收录边界
- `rg -n "本轮 listing 口径|new submission|cross submission|replacement|日更收录|日更补录" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md`：快速检查日更论文卡片是否标注官方 listing 日期、条目类型与收录 / 补录口径，避免把跨日补录误判为当日新批次
- `rg -n "本轮检索日期|官方.*listing|entries|new submissions|cross submissions|replacement submissions|当日未出现新批次|日更收录|日更补录|补查|近期待补录" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md`：快速检查每日论文纪要是否记录真实检索日期、官方最新批次、条目数量和收录 / 补录口径，尤其用于官方无同日新批次但仍生成日更时
- `rg -n "cs.RO/new.*正式|cs.RO/recent.*辅助|showing first|new \\+ cross|不含 replacement|前一轮.*候选排除|重新审视|补录主卡片" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md`：快速检查 `cs.RO/new` / `cs.RO/recent` 差异口径，以及前序候选排除项是否有明确理由升级为补录主卡片
- `rg -n "周度综合判断|周度滚动判断|已饱和|接近饱和|接近专题成熟|近期待补录|recent entry|Submitted on" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md`：快速检查同一官方 listing 连续复用后是否保留周度饱和判断、近期待补录说明和 `cs.RO/recent` 条目元信息
- `rg -n "前一轮已收录|前一日按精筛|已从同一官方 listing|直接重复主题|validation_artifact_id|scenario_config_hash|evidence_lineage_complete|fair_metadata_complete" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md docs/05_p4_beta_dvt docs/06_p5_launch_readiness`：快速检查同一官方 listing 被前序纪要覆盖后的补录说明，以及 Phase 5 验证证据链 provenance 字段是否仍停留在研究输入或 TODO 口径
- `rg -n "navigation_clue_set|near_person_control_barrier|strict_latency_bound|object_level_sparse_map|unsafe_region_warning|segmentation_safety_finetune|test_time_compute_route|gesture_grounding_trace|human_readiness_gate|constraint_priority_order" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md docs/05_p4_beta_dvt docs/06_p5_launch_readiness`：快速检查近期论文纪要收敛出的 Phase 5 字段包是否仍为候选输入，避免被误写成已冻结验证模板或在线子系统
- `rg -n "goal_relevance_mean|floor_plan_alignment_confidence|latent_ood_score|agentic_recovery_invocation_gate|missing_modality_mask|breadcrumb_node_sequence|state_difficulty_score|spatiotemporal_relation_edge|action_scale_factor|respiratory_signal_quality_index|sandbox_fidelity_level|mission_ltl_verification_result|navigation_failure_early_warning|fault_mode_candidate_set|probabilistic_stl_satisfaction_interval|vlm_planner_query_latency_ms|failure_case_embedding_id" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md docs/05_p4_beta_dvt docs/06_p5_launch_readiness`：快速检查 `2026-06-15` 至 `2026-06-20` 论文纪要收敛出的 Phase 5 字段包是否仍为候选输入，避免被误写成在线导航大模型、完整主动诊断控制器、`AI sandbox` / 形式化验证平台、实时 `VLM` 控制链路或 `RAG` 自动故障仲裁系统
- `rg -n "robot_body_config_id|task_scene_action_outcome_trace|edge_alignment_success|object_alignment_success|open_space_heading_candidate|object_location_multimodal_distribution|failure_prediction_cross_model_transfer|coarse_to_fine_visual_servo_phase|spatiotemporal_memory_event_id|memory_retrieval_hit_rate|task_context_retrieval_hit|safety_scenario_category|diagnostic_coverage_rate|doubly_correct_rate|test_oracle_generation_method|oracle_disagreement_rate" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md docs/05_p4_beta_dvt docs/06_p5_launch_readiness`：快速检查 `2026-06-21` 至 `2026-06-28` 论文纪要收敛出的 Phase 5 字段包是否仍为候选输入，避免被误写成完整数据标准平台、在线 `world model`、`VLA` 安全裁决器、端侧大记忆库或在线测试生成平台
- `rg -n "visible_sector_flow_success|planner_frequency_hz|reference_trajectory_alignment|runtime_contract_version|batch1_latency_ms|control_loop_jitter_ms|peak_memory_mib|fallback_runtime_mode|lvml_latency_attack_case_id|visual_text_trigger_detected|critical_path_deadline_violation|object_location_rigidity_score|personalization_enabled_reason|privacy_review_required|image_space_trajectory_alignment|cross_embodiment_success|local_planner_handoff_success" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md docs/05_p4_beta_dvt docs/06_p5_launch_readiness`：快速检查 `2026-07-05` 论文纪要收敛出的低层导航接口、端侧 runtime、延迟攻击、找物个性化和参考轨迹导航字段是否仍为候选输入，避免被误写成在线 `VLA / WAM / world model` 主链路、指定 runtime 选型或人格画像 / 长期原始轨迹采集
- `rg -n "min_ttc_margin_ms|ttc_under_1s_detected|evasive_direction_correct|vln_fast_window_tokens|vln_slow_memory_tokens|object_persistence_probability|last_seen_pose_expiry|wm_admissibility_level|wm_verdict_accepted_as_evidence|wm_policy_ranking_alignment|long_horizon_action_fidelity|real_sim_success_gap" docs/09_research/00_papers/20*_kinbot_arxiv_daily.md docs/05_p4_beta_dvt docs/06_p5_launch_readiness`：快速检查 `2026-07-12` 论文纪要收敛出的动态避障、流式 `VLN`、对象记忆 freshness、`world-model` 可采信等级和长时 action fidelity 字段是否仍为候选输入，避免被误写成在线 `world model`、`31B` 记忆服务、`Video-LLM` 导航主链路或安全裁决器
- `find docs/09_research -maxdepth 1 -name "*.md" | sed 's#^./##' | sort`：快速检查 `docs/09_research/` 根层研究文档是否有新增入口待同步父级索引、根索引或 `CHANGELOG.md`
- `rg -n "任务类型|ObjectNav|InstanceImageNav|SR|SPL|Qwen3-VL|ASM|零样本|HM3D|自建" docs/09_research/07_annual_summary_of_vln_project.md`：快速检查 VLN 年度总结中的指标口径，避免把不同任务、测评集、prompt 或模型版本的结果直接混用
- `find docs/09_research/07_vln_model_design -maxdepth 1 -name "*.md" | sed 's#^./##' | sort`：快速检查 `VLN / NFM` 专题子目录是否有新增研究文档待纳入索引或吸收进主线，并避免 `.DS_Store` 等本地噪声文件干扰
- `find docs/10_team_planning -maxdepth 1 \\( -name "*.md" -o -name "*.csv" \\) | sed 's#^./##' | sort`：快速检查招聘基线、CTO 面试框架和候选人建议文档是否有新增输入或索引漂移
- `rg -n "当前流程状态口径|已接受 offer|已放弃 offer|入职前放弃 offer|未到谈 offer 阶段|入职承接|流程结果|具体公司待确认" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查候选人 offer / 流程结束 / 入职前状态反转是否已刷新，避免把历史推进建议误读为当前仍在流程中
- `rg -n "新增简历筛选|待专业面|待技术深面|待技术一面|待专家面|建议进入.*(专业面|技术深面|技术一面|专家面)|暂不建议直接.*CTO" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查新增简历筛选是否已按岗位和成熟度给出下一轮验证入口，避免把简历初筛误写成面试后判断
- `rg -n "岗位 .01.|应用后端专业面|架构技术一面|AI 工程化|AI-Native|DataAgent|计量计费|车联网|支付 / 账户|不建议按岗位 .01.|暂不建议直接.*CTO" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查岗位 `01` 新增候选人是否按应用后端 / 平台架构专业面验证，避免被 `AI / Agent / RAG` 关键词误升级为 `CTO` 面或岗位 `11` 主推
- `rg -n "陈智|第一轮综合面|50.*分钟|不用画图|车联网云平台|设备接入|OTA|远程诊断|自动化测试|端云联调|架构 owner|base 匹配" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查车联网 / 设备云型岗位 `01` 候选人的第一轮综合面口径是否已同步，避免遗漏口头分层、关键链路追问和阶段适配验证
- `rg -n "郑春斌|无人机.*Agent|Agent Runtime|HITL|Checkpoint / Resume|工具调用|可观测评测|岗位 .11.*强|真实 owner 边界|上线规模|主定位" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查生产级物理 Agent 型岗位 `01` 候选人是否已拆清应用后端 / `AI` 融合架构主定位与岗位 `11` 相邻观察边界
- `rg -n "技术深面|条件推进总经理终面|无保留.*强推|Maker|亲自落地|汇报协同|薪资 / base|岗位定位" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查候选人技术深面后的总经理终面建议、条件推进口径和组织匹配验证点是否已同步
- `rg -n "物理设备工具调用|Plan-Execute-Verify|AgentOps|APO|owner 边界|AI-Native|工具参数|权限|幂等|回滚|审计" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查岗位 `11` 物理世界 Agent 候选人是否已拆清执行链路、安全校验、评估闭环和真实主责边界
- `rg -n "相邻候选|部分适配|不建议作为岗位 11 主推|不建议作为机器人 Agent 主链路|Agent 后端支撑|AI 工具链相邻|DataAgent / RAG / NL2SQL" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查跨岗位相邻适配判断是否已拆清主岗位推进建议与岗位 `11` 支撑观察边界
- `rg -n "家庭机器人战略沟通|反向验证|统一事实|差异化入口|先问|第一代.*无机械臂|双臂前瞻|角色化战略|复述项目口径" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查候选人面试题包是否已吸收项目战略沟通与反向验证基线，避免把项目介绍话术、内部战略口径或候选人复述误写成独立判断
- `rg -n "李炜|刘振华|瞿孝杰|本体 .*SE.*综合面|用户本人同轮|系统工程专家验证|硬件负责人升级|系统工程一号位|组织授权判断" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查岗位 `09` 本体 SE 候选人是否已按综合面口径从硬件负责人履历转入系统工程一号位验证，避免只按板卡或硬件平台细节评估
- `rg -n "范文华|A\\+ 档|特殊关键岗|机器人本体与硬件体系负责人|本体研发负责人|线下双向契合交流|实验室与真机|线下展示与保密边界|参观前按.*保密清单" docs/10_team_planning/91_candidate_screening_and_interview_advice.md input/01_candidate_resume/README.md CHANGELOG.md`：快速检查岗位 `09` `A+` 特殊关键岗是否已按线下真机交流、角色契约和保密边界刷新，而不是被压回常规本体 `SE` 问答面
- `rg -n "蔡勇|双臂前瞻|URDF / 仿真 / 模型训练接口|可信数字本体|参数可信|sim-to-real|不改变第一代轮式无臂|URDF.*直接升级" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查岗位 `10` 结构候选人是否已拆清双臂前瞻线、可信 `URDF` / 仿真和模型训练接口验证，不因人形或 `URDF` 关键词直接升级
- `rg -n "李胜男|年轻高潜 Agent|AI 自动化测试平台|浏览器工具调用|云端批量执行|CI 质量门禁|不建议按岗位 .01.|不建议按岗位 .16.|物理工具调用" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查岗位 `11` 年轻高潜 Agent 候选人是否已拆清真实 owner、工具安全和物理迁移边界，避免误写成岗位 `01` 架构师或岗位 `16` 系统集成测试负责人
- `rg -n "岗位 .15.|高级运动控制算法工程师|SoC|状态估计|经典控制|深度强化学习|SIL / HIL / 真机|MCU|15_运动控制算法" docs/10_team_planning/02_kinbot_team_recruitment_requirements.csv docs/10_team_planning/93_motion_control_algorithm_engineer_jd.md docs/10_team_planning/README.md input/01_candidate_resume/README.md`：快速检查岗位 `15` 是否仍按 SoC 侧运动控制算法基线、真机评测闭环和输入命名规则维护
- `rg -n "李才|软件测试 / 整机功能测试骨干|测试小组长候选人|系统集成测试负责人.*不建议|SIL / HIL / E2E|故障注入|试点质量闭环|系统质量红线|执行骨干" docs/10_team_planning/91_candidate_screening_and_interview_advice.md`：快速检查岗位 `16` 相邻测试候选人是否已区分系统集成测试负责人与软件 / 整机功能测试骨干，避免把执行骨干误升级为负责人
- `rg -n "岗位 .22.|高级 Agent 架构师|具身智能 Agentic System|Agentic System 总体架构|Agent Runtime|Tool / Action 安全|AgentOps / 评测|郑春斌|韩兵兵|不按岗位 22|不默认转入岗位 11" docs/10_team_planning/02_kinbot_team_recruitment_requirements.csv docs/10_team_planning/91_candidate_screening_and_interview_advice.md docs/10_team_planning/92_senior_agent_architect_jd.md docs/10_team_planning/README.md input/01_candidate_resume/README.md`：快速检查岗位 `22` 架构 owner 基线、与岗位 `01 / 11` 边界、offer 沟通或不匹配收口是否已同步
- `find input/01_candidate_resume -maxdepth 1 -type f | sed 's#^./##' | rg '\.(pdf|md|txt)$' | rg -v '(^|/)README\.md$' | sort`：快速检查候选人简历、初试反馈、面试总结或录音转写是否有根层新增待处理输入需吸收到 `91_candidate_screening_and_interview_advice.md`
- `find input/01_candidate_resume/archive -maxdepth 1 -mindepth 1 -type d | sed 's#^./##' | sort`：快速检查候选人已处理资料归档批次目录是否按日期或 `日期 + 专题后缀` 组织，避免同日多批资料混放
- `find input/01_candidate_resume -path '*/archive/*' -type f | sed 's#^./##' | rg '\.(pdf|md|txt)$' | sort`：快速检查已处理候选人输入资料是否已进入本地归档目录，避免根层待处理入口长期堆积
- `git check-ignore -v input/.DS_Store input/01_candidate_resume/.DS_Store input/01_candidate_resume/<candidate-file> input/01_candidate_resume/archive/<processed-file>`：快速核对 Finder 噪声、候选人原始输入与已处理归档是否仍按本地忽略规则处理，避免误把输入型原件纳入正式版本维护
- `find input/02_award_nominations -maxdepth 2 -type f | sed 's#^./##' | sort`：快速检查奖项提名、项目申报或荣誉申报输入资料是否仍作为本地输入留存，并判断是否已有对应 `output/` 交付稿
- `git check-ignore -v input/02_award_nominations/ input/02_award_nominations/<award-file>`：快速核对奖项提名、项目申报或荣誉申报输入资料是否仍按本地忽略规则处理
- `find input/03_design_candidates -maxdepth 2 -type f | sed 's#^./##' | rg -v '(^|/)\\.DS_Store$' | sort`：快速检查外部设计候选、结构 / 交互 / 造型方案等原始输入是否有新增资料待评审或待纳入目录索引
- `find docs/05_p4_beta_dvt docs/06_p5_launch_readiness -maxdepth 1 -type f | sed 's#^./##' | sort`：快速检查 `Phase 5` 当前执行 / 门控入口与量产预备文档是否有新增入口或索引漂移
- `find docs/06_p5_launch_readiness -maxdepth 1 -name "*.md" | sed 's#^./##' | sort`：快速检查 `Phase 5` 后段的量产导入、发布准备与交付闭环文档入口是否有新增或索引漂移
- `find output -maxdepth 2 -type f | sed 's#^./##' | rg -v '(^|/)\\.DS_Store$' | sort`：快速检查 `output/` 对外交付材料与图包 `README.md` 是否有新增入口，并避免 Finder 噪声干扰
- `find output -maxdepth 2 -name README.md | sed 's#^./##' | sort`：快速检查 `output/` 下多文件交付包或图包是否已补齐 `README.md` 作为交付入口
- `rg -n "<pattern>" README.md docs input`：检查索引、旧路径、术语和主线残留
- `sed -n '1,200p' <file>`：分段核对长文档头部、变更记录和关键段落
- `sed -n '1,200p' .claude/settings.json`：核对当前仓库可见的 repo-local hook 配置
- `find .claude -maxdepth 3 -type f | sed 's#^./##' | sort`：清点当前仓库内可见的 `.claude` 配置、hook 与日志文件
- `find logs -type f | sed 's#^./##' | sort`：快速检查本地运行日志是否新增，需要时再决定是否提炼结论回写正式文档
- `find logs -maxdepth 2 -type f | sed 's#^./##' | sort`：快速检查按环境分层的本地运行日志目录，例如 `logs/prod/`

提交前文档一致性检查至少覆盖：

- 文件名引用是否仍指向真实路径
- `README.md` 与目录级 `README.md` 索引是否同步
- 是否残留旧路线、旧术语或过期结论
- Linear 状态与本地文档阶段是否一致
- 本地评审入口与外部评审入口是否仍可追溯

推送前检查：

- 当前分支是否正确
- 是否有其他线程的正式文档仍未入仓
- 是否需要更新 `README.md`
- 是否需要更新 `CHANGELOG.md`
- 是否需要更新 `docs/00_governance/03_decision_log.md`

若用户要求维护多个分支，则每个分支分别维护、分别提交、分别推送。

## 11. 目录约定

- `input/`：用户人工输入
- 任一目录新增文档或输入资料后，需先同步回写该目录 `README.md` 的文档索引；若影响仓库总索引或阶段入口，再同步检查根目录 `README.md` 与 `CHANGELOG.md`
- `input/01_candidate_resume/`：候选人简历与相关输入资料；根层作为新增待处理资料入口，已处理资料按 `archive/YYYY-MM-DD_processed/` 归档，必要时可按 `archive/YYYY-MM-DD_<topic>_processed/` 拆分同日不同专题批次；目录内原始 PDF、扫描件、录音转写等输入默认通过目录级 `.gitignore` 本地留存，不纳入正式版本维护；独立评估线程应以 `docs/10_team_planning/01_development_team_proposal.md` 作为团队能力基线，正式候选人判断仍以 `docs/10_team_planning/91_candidate_screening_and_interview_advice.md` 为准
- `input/02_award_nominations/`：奖项提名、项目申报、荣誉申报等原始输入与模板的本地留存目录，默认通过根 `.gitignore` 排除在正式版本维护之外；可引用其内容生成 `output/` 交付稿，但不得把申报表述直接升级为主线已确认事实
- `input/03_design_candidates/`：外部设计候选、结构 / 交互 / 造型方案等原始输入资料入口；默认作为待评审材料，不替代 `docs/03_p2_feasibility/`、`docs/05_p4_beta_dvt/` 或主线架构文档中的正式取舍结论
- `docs/00_governance/`：工作流、决策记录、治理原则
- `docs/00_governance/decision_log/`：`03_decision_log.md` 的派生索引与历史分卷目录；只服务导航与检索，不构成新的并列事实源
- `docs/01_p0_concept/`：概念期分析、输入评估、商业判断
- `docs/02_p1_architecture/`：系统架构、PDCP、一级模块与接口
- `docs/03_p2_feasibility/`：总体方案、选型、成本、功耗、专项可行性
- `docs/04_p3_alpha_evt/`：Alpha / EVT 阶段文档入口
- `docs/05_p4_beta_dvt/`：Beta / DVT 阶段验证与放行文档
- `docs/06_p5_launch_readiness/`：量产预备、发布准备与交付闭环
- `docs/07_p6_operations/`：上市后运营与回灌阶段文档入口
- `docs/08_reviews/`：活跃评审输入与历史归档；当前默认活跃入口以该目录 `README.md` 为准
- `docs/09_research/`：Deep Research、论文、芯片、前沿专项
- `docs/09_research/00_papers/`：arXiv 每日论文纪要与结构化论文评估目录；新增纪要后需同步目录 `README.md` 与父级 `docs/09_research/README.md`，稳定结论影响主线时再回写正式事实源
- `docs/09_research/` 下允许按专题建立子目录，例如 `07_vln_model_design/`；新增子目录或子文档后，需同步检查父级 `README.md`、根目录 `README.md` 与 `CHANGELOG.md`
- `docs/09_research/07_vln_model_design/`：`VLN -> NFM`、长期记忆、导航基础问题与数据设计等专题研究工作目录；新增文档后需同步父级 `README.md`、根目录 `README.md` 与 `CHANGELOG.md`
- `docs/10_team_planning/`：团队规划主基线；其中 `01_development_team_proposal.md` 为组织能力基线，`02_kinbot_team_recruitment_requirements.csv` 为当前岗位编号、命名与筛选口径基线，`90_cto_unified_interview_framework.md` 与 `91_candidate_screening_and_interview_advice.md` 为当前招聘筛选与 CTO 面试工作流入口，`92_senior_agent_architect_jd.md` 和 `93_motion_control_algorithm_engineer_jd.md` 分别承接岗位 `22` 与岗位 `15` 的独立 JD
- `docs/superpowers/`：当前线程使用 `superpowers` 技能生成的计划 / 规格工作文档；活跃工作文档只保留在 `plans/`，已吸收文档进入 `archive/`，新增文档后需同步该目录 `README.md`
- `plan/`：仓库内临时但可持续推进的执行计划工作目录，用于当前线程的 task plan、阶段笔记与审计记录；当前默认执行计划文件为 `plan/task_plan.md`，默认工作笔记文件为 `plan/notes.md`；不替代 `docs/` 正式文档，结论稳定后应回写正式文档或归档清理
- `output/`：对外交付材料；若形成多文件交付包，优先按日期 / 主题建子目录，并补 `README.md` 说明内容组成与使用建议；图包 / 信息图目录同样默认以 `README.md` 作为交付入口
- `logs/`：本地运行日志与排障留痕目录；允许按环境或目标系统分层，例如 `logs/prod/`；默认不进入正式版本历史，只有稳定结论才应回写到 `docs/` 或其他正式载体
- `tmp/`：临时产物，不进入正式版本历史

## 12. Repo-Local Hook 约束

- 当前仓库可见的 repo-local hook 配置以 `.claude/settings.json` 为准
- 现阶段已确认的 hook 守卫为：`PreToolUse -> Skill -> .claude/hooks/check-gstack.sh`
- 该守卫会检查全局 `gstack` 安装目录 `~/.claude/skills/gstack/bin`；若缺失，相关技能调用会被阻断
- 若后续 `.claude/settings.json` 或 `.claude/hooks/` 有新增内容，应先核对是否影响当前协作流，再决定是否回写本文件

## 13. 输出要求

与用户协作时应：

- 直接
- 精确
- 明确说出判断、原因、影响和下一步
- 对已经获得用户明确批准的事项，默认继续执行，不重复请求继续授权；只有在进入新的阶段门、需要用户作价值取舍、或需要修改受限文件 / 边界时才暂停审查

暂停时不要只说“请看一下”，必须明确说明：

- 要审哪份文档
- 重点看哪几个点
- 本轮需要确认什么

## 14. 维护规则

- 若仓库协作方式发生显著变化，应更新本文件
- 重大新增规则，最好同步回写到 `README.md` 或 `docs/00_governance/01_workflow.md`
