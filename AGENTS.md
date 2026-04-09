# AGENTS.md

---

文档版本：v1.19
创建日期：2026-03-21
作者：Codex-架构师

文档变更记录：
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

- 一代价值排序：`健康管理 > 陪伴交互 > 家庭安全巡护 > 老人看护`
- 一代收敛策略：`核心闭环强、服务闭环轻、技术突破集中`
- 一代传感主线：纯视觉
- 深度相机 / 激光雷达：仅研发对比基线与真值参考链路，不作为产品 fallback
- 若纯视觉不过线：优先延迟产品节奏，而不是回退主动传感主线
- 默认数据边界：原始敏感数据端侧处理，仅预留受控回流能力
- 当前默认量产资源线：`12GB RAM + 32GB Flash`
- `12GB + 64GB`：边界验证线
- `16GB + 64GB` 及以上：前瞻验证线或未来 `Pro SKU`
- 每一轮涉及成本、功耗、结构、交互或伴生系统裁剪的评审，都必须同步复核是否损伤“聪明、温暖、精致”的高端产品感，以及是否仍能支撑 `20000 到 30000 元` 售价区间

## 7. 架构推进方式

- 先检查 `input/00_requirements/00_user_requirements_input.md` 顶部“对 Codex 的要求”是否有变化，再读取需求输入与当前主线文档
- 若 `CLAUDE.md` 或 `docs/08_reviews/01_architect_review_and_plan.md` 有新增内容，也作为外部评审输入纳入本轮分析
- 若 `docs/08_reviews/README.md` 有新增索引，需先判断新增评审文档是否影响当前主线；相关时应作为本轮外部评审输入纳入分析
- 先检查前置评审项与 Linear 中仍处于 `In Review` 的 issue 是否已清账；未关闭时必须先强提醒
- 本地文档中的阶段性待办和 issue 应持续同步到 Linear，并与本地文档状态保持一致
- `KBT-32` 及后续模块方案评审，必须把“双视角一致性检查”作为固定审阅项，防止本体实体架构与运行时功能架构重新漂移
- `KBT-33` 继续作为 `KBT-31` 子 issue 保留，只承接双视角一致性与接口稳定性策略的治理细化，不回退重定义系统边界
- 先判断本轮新增输入会影响哪些主线文档
- 涉及 `VLN` 路线、导航推理和相关前瞻技术判断时，应通过独立 Linear issue 与 `VLN` 专项线程交叉校验，并在需要时回写 `docs/09_research/01_vln_role_analysis_and_technical_plan.md`
- 若当前线程使用 `superpowers` 生成工作计划或规格草稿，应统一落到 `docs/superpowers/` 及其 `plans/` 子目录；该目录只承接工作文档，不替代主线架构、评审或量产基线文档
- 若当前线程执行 `docs/superpowers/` 中的实现计划，应按计划头部约束优先使用 `superpowers:subagent-driven-development`；若不适合并行拆解，则使用 `superpowers:executing-plans` 按任务顺序推进
- `docs/superpowers/` 新增或调整文档后，需同步回写 `docs/superpowers/README.md`；若其影响仓库总入口或阶段入口，再同步检查根目录 `README.md` 与 `CHANGELOG.md`
- 根 `README.md` 只维护当前视图、当前有效入口、当前阶段门入口与历史资料指针，不再平铺全部历史评审或长阅读清单
- 当前主线事实源默认收敛为 `05_system_architecture_principles.md -> 01_overall_architecture.md -> 03_execution_paradigms_runtime_baseline.md -> 合同/专题层 -> 03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`
- `docs/02_p1_architecture/14_family_co_living_agent_paradigm.md` 只保留背景 / 决策来路锚点角色；`docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md` 只保留阶段评审包角色，不再作为并列主入口
- `docs/08_reviews/` 默认只保留 `21 / 25 / 24 / archive README` 作为活跃入口；其余历史评审稿、旧阶段收口稿与革新决策链文档进入 `archive/`
- `docs/08_reviews/` 中新增的复杂度复盘、阶段后总结与类似“总结型评审”文档，默认也进入 `archive/`，不扩张活跃评审入口
- `docs/superpowers/plans/` 只保留尚未被主线吸收的工作文档；已被主线吸收的计划应迁入 `docs/superpowers/archive/`
- 活跃主线文档默认目标控制在 `500` 行左右；若超过 `600` 行，必须在文档定位、目录索引或相关治理文档中说明其继续保留为单文件的理由
- 先更新系统级文档，再更新下游方案文档
- 最后回写 `docs/00_governance/03_decision_log.md` 和 `CHANGELOG.md`
- 允许为后置里程碑提前起草逆向约束型文档，但不得据此跳过当前阶段门或把后置结论伪装成当前已冻结事实
- 用户一旦明确批准某个提案、阶段方案或文档方向，代理应继续按已批准路线推进，直到遇到下一个必须由用户审查 / 批准的阶段门；不得在同一路线上反复以“若你要”“如果你要”之类措辞请求继续授权
- 若当前工作不需要用户作出新的重大判断、阶段门批准或风险取舍，代理不得仅因“阶段性汇报”而停下等待；每次暂停都必须明确携带一个需要用户确认的重大问题
- 每一轮架构推进都必须显式追问一次：`现在的架构是不是太复杂了？` 若答案倾向于“是”，应优先考虑减少层级、收缩实体数、压缩接口面或延后冻结，而不是继续叠加概念与结构

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

优先使用 Mermaid。

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
- 不得把 `tmp/`、`.claude/`、`.obsidian/`、`.superpowers/` 等本地辅助目录混入正式提交
- 不得随意使用破坏性 Git 命令

常用只读检查命令：

- `git status`：检查当前工作区与待提交内容
- `rg --files README.md docs input`：快速清点当前纳管文档与目录结构，检查是否有新增文档 / 子目录尚未同步索引
- `find docs input -name README.md -o -name "*.md" | sed 's#^./##' | sort`：快速清点当前 Markdown / README 入口，检查新增文档是否已进入目录索引视图
- `find docs/superpowers -name "*.md" | sed 's#^./##' | sort`：快速检查 `superpowers` 工作文档及其索引是否已纳入仓库视图
- `rg -n "<pattern>" README.md docs input`：检查索引、旧路径、术语和主线残留
- `sed -n '1,200p' <file>`：分段核对长文档头部、变更记录和关键段落
- `sed -n '1,200p' .claude/settings.json`：核对当前仓库可见的 repo-local hook 配置
- `find .claude -maxdepth 3 -type f | sed 's#^./##' | sort`：清点当前仓库内可见的 `.claude` 配置、hook 与日志文件

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
- `input/01_candidate_resume/`：候选人简历与相关输入资料；独立评估线程应以 `docs/10_team_planning/01_development_team_proposal.md` 作为团队能力基线
- `docs/00_governance/`：工作流、决策记录、治理原则
- `docs/01_p0_concept/`：概念期分析、输入评估、商业判断
- `docs/02_p1_architecture/`：系统架构、PDCP、一级模块与接口
- `docs/03_p2_feasibility/`：总体方案、选型、成本、功耗、专项可行性
- `docs/04_p3_alpha_evt/`：Alpha / EVT 阶段文档入口
- `docs/05_p4_beta_dvt/`：Beta / DVT 阶段验证与放行文档
- `docs/06_p5_launch_readiness/`：量产预备、发布准备与交付闭环
- `docs/07_p6_operations/`：上市后运营与回灌阶段文档入口
- `docs/08_reviews/`：活跃评审输入与历史归档；当前默认活跃入口以该目录 `README.md` 为准
- `docs/09_research/`：Deep Research、论文、芯片、前沿专项
- `docs/09_research/` 下允许按专题建立子目录，例如 `vln_model_design/`；新增子目录或子文档后，需同步检查父级 `README.md`、根目录 `README.md` 与 `CHANGELOG.md`
- `docs/10_team_planning/`：团队规划主基线
- `docs/superpowers/`：当前线程使用 `superpowers` 技能生成的计划 / 规格工作文档；活跃工作文档只保留在 `plans/`，已吸收文档进入 `archive/`，新增文档后需同步该目录 `README.md`
- `output/`：对外交付材料
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
