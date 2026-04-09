# 决策记录

---

文档版本：v2.0
创建日期：2026-03-08
作者：Codex-架构师

文档变更记录：
- v2.0 | 2026-04-09 | Codex-架构师 | 将本文重构为当前总日志入口，保留当前有效事实、架构判断、开放问题与后续确认重点；历史决策日志拆分到 `docs/00_governance/decision_log/history/`，并新增派生索引。
- v1.42 | 2026-04-09 | Codex-架构师 | 吸收对 `codex/v1-real-complexity-reduction` 的审阅结论：将 `07` 拉回根入口，明确 `21` 退居 `Phase 3` 评审补充，并收紧安全审批文档主干与后续适配位的边界。
- v1.41 | 2026-04-09 | Codex-架构师 | 吸收 `Step 48` 的架构精简输入：确认 `KBT-32` 继续作为当前唯一开发入口，将默认量产资源线更新为 `12GB RAM + 32GB Flash`，并把 `KBT-32 / KBT-33 / KBT-55` 的承接边界正式化。
- v1.40 | 2026-04-09 | Codex-架构师 | 补记复杂度治理持续维护口径：活跃 `provisional` 改由 Linear issue 正式承接，澄清 `03_decision_log.md` 的历史留痕不直接视为活跃复杂度债，并明确 `02_pdcp_system_architecture_review_package.md` 当前只按阶段评审包管理。
- v1.39 | 2026-04-09 | Codex-架构师 | 回写 `V1` 真实复杂度下降当前轮收口：新增“当前开发承接”判断，明确主闭环收缩为 `Robot + App + 最小云`、穿戴保留为当前受控输入位、人工 / 第三方降为后续适配位，并补记相关文档同步完成。
- v1.38 | 2026-04-09 | Codex-架构师 | 继续回写复杂度控制：明确 `01 / 03 / 06` 的单一职责、`P2-01` 的唯一开发入口角色，并同步刷新根入口、`P1` 目录索引与一处旧归档引用。
- v1.37 | 2026-04-08 | Codex-架构师 | 补记文档事实源与评审入口收敛：根入口切到 current view，`08_reviews` 收敛为少量活跃入口，`superpowers` 改为 active-only + archive，`03` 运行时基线完成正式改名。
- v1.36 | 2026-04-08 | Codex-架构师 | 澄清 `Phase 5` 当前只完成架构侧验证规划与治理预留，不把未发生的实机 / 市场闭环写成已完成，并补记后续收口追踪 issue `KBT-55`。
- v1.35 | 2026-04-08 | Codex-架构师 | 推进 `Phase 5` 到双泳道执行与门控层，补记战略证据包结构、责任分工和 `G5` 对第 `8` 类证据包的判定规则。
- v1.34 | 2026-04-08 | Codex-架构师 | 吸收输入中对 `KBT-54` 的正式接受，补记 `Phase 4.5` 已完成收口并正式进入 `Phase 5`。
- v1.33 | 2026-04-07 | Claude-架构师 | 补记 `Phase 4.5` 增量补强：14 号 §10.1 `FleetView` 候选字段子表、22 号 §5.2 家庭节律观测视图、23 号 §9 机群能力接入点清单已落地，统一在 `KBT-54` 收口路径下承接，不引入新 KBT 编号。
- v1.32 | 2026-04-07 | Codex-架构师 | 补记 `Phase 4.5` 已完成文档层补强、`KBT-53` 已完成、`KBT-54` 已建立，并明确当前主线准备进入 `Phase 5`。
- v1.31 | 2026-04-07 | Codex-架构师 | 启动 `Phase 4.5` 战略野心补强包，补记战略接口预留与 `Phase 5` 战略验证泳道进入主线文档。
- v1.30 | 2026-04-06 | Codex-架构师 | 补记 `Phase 4` 已完成下游同步、`KBT-51` 已关闭、`KBT-52` 已建立，并明确下一步进入 `Phase 5`。
- v1.29 | 2026-04-06 | Codex-架构师 | 补记 `KBT-50` 已完成、`KBT-51` 已建立，并明确 `Phase 3` 已形成可收口阶段产物。
- v1.28 | 2026-04-06 | Codex-架构师 | 补记 `05_world_state_schema.md` 已升级为七实体目标模型主文档，并形成 `Phase 3` 收口包，准备进入阶段收口确认。
- v1.27 | 2026-04-06 | Codex-架构师 | 吸收 `Step 47` 第 `7/8` 条更新，补记路线 B 升为 `Phase 3` 的正式目标方向，并冻结 `CareEvent / Task` 的边界规则。
- v1.26 | 2026-04-06 | Codex-架构师 | 补记 `Step 47` 已接受 `KBT-49` 并关闭 `Phase 2`，同时建立 `KBT-50` 与路线 A 的结构级候选方案，继续推进 `Phase 3`。
- v1.25 | 2026-04-06 | Codex-架构师 | 补记 `KBT-49` 作为 `Phase 2` 实际收口确认 issue 建立，并明确 `Phase 3` 已按“状态模型 / 数据模型决策准备”方式启动。
- v1.24 | 2026-04-06 | Codex-架构师 | 清理治理入口中的旧 `OODA` 总法残留，并补记其已被“家庭共居智能体 + 多执行范式”现行口径覆盖。
- v1.23 | 2026-04-06 | Codex-架构师 | 补记 `P2` 缺口分析、工程化基线、选型与降本文档的 `Phase 2` 术语对齐，避免工程线继续把旧 `OODA` 总图当作唯一组织口径。
- v1.22 | 2026-04-06 | Codex-架构师 | 补记协作规则收紧与 `02 / P2-01` 的 `Phase 2` 对齐结论，明确 `PDCP` 评审包和模块下发基线已统一到家庭共居智能体总图、多执行范式与离散业务状态面的表达。
- v1.21 | 2026-04-06 | Codex-架构师 | 补记 `Step 47` 的最新头部承载输入以及 `08-13` 下游文档的 `Phase 2` 对齐结论，明确健康、陪伴、安全与服务链已统一到多执行范式和跨范式审批边界口径。
- v1.20 | 2026-04-06 | Codex-架构师 | 补记 `05 / 07` 的 `Phase 2` 对齐结论，明确 `World State` 当前不提前冻结 `9 -> 7`，审批接口提升为跨执行范式硬边界。
- v1.19 | 2026-04-06 | Codex-架构师 | 补记 `04 / 06` 的下游对齐结论，明确一级模块属于 `WHAT` 轴，状态机只描述离散决策业务面。
- v1.18 | 2026-04-06 | Codex-架构师 | 补记 `01_overall_architecture.md` 已按 `Step 47` 要求将头部从实体架构视图中独立出来，并明确以空间承载子视图实现，不新增一级实体域。
- v1.17 | 2026-04-06 | Codex-架构师 | 补记 `Step 47` 的 Phase 2 审阅输入，明确 `05 / 14 / 03` 已获确认，`01` 需继续把头部从实体架构视图中独立出来。
- v1.16 | 2026-04-06 | Codex-架构师 | 补记 `Step 47` 对原则层提案的确认，以及革新路线 `Phase 2` 的总图 / 运行时重组已启动。
- v1.15 | 2026-04-06 | Codex-架构师 | 补记革新路线 `Phase 1` 已启动，明确《系统架构原则》已升级为 Kinbot 专属原则层，作为后续总架构重组的正式上游约束。
- v1.14 | 2026-04-06 | Codex-架构师 | 补记 `16 / 17 / 05_system_architecture_principles` 的收敛判断，明确 `16` 是上游问题重写输入，`17` 是候选施工图，正式执行前必须先过收敛闸门。
- v1.13 | 2026-04-06 | Codex-架构师 | 补记当前线程接任后的宏观架构革新方向，明确系统级范式重写、`OODA` 降阶与“家庭共居智能体”北极星的阶段性判断。
- v1.12 | 2026-04-03 | Codex-架构师 | 吸收 Step46，补记 `VLN -> NFM` 演进、`semantic_global_frame / local_metric_frame` 双帧、基础空间长期记忆前置与 `SLAM` 退到局部执行支撑层等正式判断。
- v1.11 | 2026-04-01 | Codex-架构师 | 补记团队招聘优化表新增“应用后端架构师”和“高级结构工程师”两类岗位的正式组织判断。
- v1.10 | 2026-04-01 | Codex-架构师 | 吸收 Step 43 关于团队构建的更新，补记本体 `SE`、具身智能前瞻算法、`OpenClaw / Agent` 软件主链与招聘节奏分层原则。
- v1.9 | 2026-03-26 | Codex-架构师 | 回退上一轮提前写入主线的状态机正式决策，当前方案 C 继续停留在评审文档阶段，待方案收口后再进入主线冻结。
- v1.8 | 2026-03-26 | Codex-架构师 | 补记状态机主状态修订、方案 C 正式收敛和任务上下文栈等协同构件进入主线的正式决策。
- v1.7 | 2026-03-26 | Codex-战略承接人 | 吸收 Step42，补记集团概念评审、首发战略切口、制胜理论与分阶段投入机制相关正式事实与架构判断。
- v1.6 | 2026-03-23 | Codex-架构师 | 吸收 Step41，补记“一代 Agent 增强平面”相关正式事实与架构判断，明确长期记忆、技能化、连接器与受控任务编排进入主线，自主创造新技能继续停留在研究线。
- v1.5 | 2026-03-23 | Codex-架构师 | 吸收最新架构收敛决策，补记两芯片硬件基线、`1` 双目 + `2` 单目视觉主线、头部多自由度、单麦阵与稳健底盘基线，以及相关架构判断。
- v1.4 | 2026-03-22 | Codex-架构师 | 吸收 Step38，补记验证 Demo 的三芯片职责分层、8 个独立视觉模组、双麦阵成因、重量修正与主线吸收边界。
- v1.3 | 2026-03-20 | Codex-架构师 | 吸收硬件专家线程的最新内存价格反馈，补记 `C1` 子桶拆分、默认量产内存线与前瞻验证线的架构收敛结论。
- v1.2 | 2026-03-17 | Codex-架构师 | 继续吸收 Step36，补齐纯视觉对比基线、三级能力模式、服务轻量化与成本收紧相关正式判断。
- v1.1 | 2026-03-17 | Codex-架构师 | 吸收 Step36，更新 BOM、团队规模、价值排序，并记录纯视觉不过线时延迟节奏与受控回流预留。
- v1.0 | 2026-03-08 | Codex-架构师 | 文档创建。

---

## 1. 用途

本文件用于持续记录：

- 已确认的项目事实
- 关键架构决策
- 仍未关闭的问题
- 下一轮需要用户回答的重点问题

状态约定：

- `confirmed`：已由用户明确确认
- `provisional`：当前工作假设，后续仍可调整
- `open`：尚未确认，必须继续澄清

补充说明：

- 本文件与 archive 文档中的 `provisional` 历史留痕默认只用于追溯，不直接视为当前活跃复杂度债。
- 只有当某个 `provisional` 仍出现在活跃主线 / 活跃评审中，且绑定了明确的 Linear 承接项时，才按“活跃 provisional”治理。

## 1.1 使用方式

当前目录结构收敛为：

1. 本文件继续作为唯一正式总入口，承接当前有效事实、判断、开放问题与下一轮确认重点。
2. 历史时间序列决策日志拆分到 `docs/00_governance/decision_log/history/`。
3. 面向快速导航的派生索引放到 `docs/00_governance/decision_log/`，但它们不构成新的并列事实源。

## 2. 已确认事实

| ID    | 主题               | 当前记录                                                                                                                                                                             | 状态          | 来源                                                                |
| ----- | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- | ----------------------------------------------------------------- |
| F-001 | 场景               | 家庭室内场景                                                                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-002 | 核心任务             | 多模态交互陪伴、健康管理、安全保障                                                                                                                                                                | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-003 | 系统边界             | 移动交互机器人，不要求物理操作                                                                                                                                                                  | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-004 | 移动形态             | 轮式移动，需要通过家庭低矮门槛                                                                                                                                                                  | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-005 | 交互方式             | 语音、屏幕、灯光、手势、手机 App、远程控制                                                                                                                                                          | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-006 | 交互风格             | 偏陪伴型、社交型机器人                                                                                                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-007 | 决策优先级            | 安全 > 合规 > 用户指令 > 任务完成率 > 效率 > 能耗                                                                                                                                                 | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-008 | 自主权边界            | 已授权行为需要做到完全自主                                                                                                                                                                    | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-009 | 数据边界             | 原始视觉、语音、生物特征本地处理、匿名化、加密存储                                                                                                                                                        | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-010 | 端云原则             | 直接处理视觉、语音和运动安全的能力必须在端侧                                                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-011 | 离线原则             | 断网时运动和安全能力不应受影响                                                                                                                                                                  | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-012 | 工程目标             | 续航 > 4 小时，尺寸建议不超过 50 x 50 x 120 cm，预算 5000 到 6000 元，MVP 时间点 2027 年 1 月                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md`             |
| F-013 | 首发目标用户           | 首发聚焦独居老人或子女不在身边的老两口，后续代际再扩展到普通家庭                                                                                                                                                 | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 2      |
| F-014 | 首发市场             | 中国大陆                                                                                                                                                                             | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 2      |
| F-015 | 健康管理方向           | 目标包含生命体征接入、跌倒/异常检测、结合历史医疗档案的问诊与医疗联动、用药管理和买药                                                                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 2      |
| F-016 | 夜间自主边界           | 未授权或无异常情况下，夜间保持静默，但传感器全开                                                                                                                                                         | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 2      |
| F-017 | 主动靠近策略           | 允许主动靠近用户，但不追求高召回率                                                                                                                                                                | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 2      |
| F-018 | 打断策略             | 可在遵守社会公认礼仪的前提下有限度地主动打断，并允许谨慎探索“俏皮”人设                                                                                                                                             | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 2      |
| F-019 | 异常上报边界           | 用户授权后允许自动上报异常                                                                                                                                                                    | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 2      |
| F-020 | 资源约束             | 未来几个月团队规模可达 60 人以上，允许部分硬件 ODM，自研强项在消费电子、AI、大模型、多模态交互，未来一年资金量级 8000 万到 1 亿元人民币                                                                                                    | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 2      |
| F-021 | 首版主价值排序          | 健康管理 > 陪伴交互 > 家庭安全巡护 > 老人看护                                                                                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 36     |
| F-022 | 医疗档案来源           | 语音交互输入、手机 App 上传、纸质报告识别                                                                                                                                                          | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 3      |
| F-023 | 医疗联动深度           | 首版包含交互式问诊、家属提醒、在线问诊转接、互联网医院开方购药、日常用药管理、紧急用药管理                                                                                                                                    | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 3      |
| F-024 | 购药能力             | 进入 MVP                                                                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 3      |
| F-025 | 高风险异常上报链路        | 默认先提醒家属，力争打通社区/物业；120 联动希望支持，但不作为第一期强要求                                                                                                                                          | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 3      |
| F-026 | 访客权限             | 默认允许发起交互，其他功能需老人本人授权后可用                                                                                                                                                          | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 3      |
| F-027 | 保姆权限             | 需要单独的保姆模式，机器人与保姆形成分工协同关系，用于完成老人本人交代的事务                                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 3      |
| F-028 | 老人本人权限           | 在不违反最高优先级原则前提下，老人本人为最高权限主体，身份信息需绑定                                                                                                                                               | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 3      |
| F-029 | 子女权限             | 在绑定和授权后可与老人本人有同等权限                                                                                                                                                               | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 3      |
| F-030 | 生命体征接入策略         | 一期优先绑定穿戴设备获取实时信息，同时保留血压计等外设的软件接入接口，医疗判断综合当时可获得的全部信息                                                                                                                              | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 4      |
| F-031 | 紧急用药动作边界         | 一期动作边界为提醒取药、送药到人、提醒服药并确认、联系子女告知信息，不考虑更强自主处置                                                                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 4      |
| F-032 | 老人与子女冲突仲裁        | 老人与子女同权时，如出现冲突命令，必须二次确认                                                                                                                                                          | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 4      |
| F-033 | 保姆模式协同范围         | 提醒、拿药、叫人、记录、汇报、远程确认等动作先预留                                                                                                                                                        | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 4      |
| F-034 | 120 联动接口         | 一期架构层需要预留标准接口                                                                                                                                                                    | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 4      |
| F-035 | 端侧算力获取方式         | 以成本、周期、质量最优方式获取板子，购买或自研均可，具备自研能力                                                                                                                                                 | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 4      |
| F-036 | 底盘策略             | 底盘预计自研，底盘本身尽量只承担动力职责并减少传感器堆叠                                                                                                                                                     | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 4      |
| F-037 | 穿戴外设策略           | 穿戴生命体征外设不自研                                                                                                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 4      |
| F-038 | 相机策略             | 相机优先找供应商，尽量采用简单配置，不优先采购昂贵体积大的成品深度相机，并考虑自研深度估计模型                                                                                                                                  | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 4      |
| F-039 | 麦克风阵列策略          | 麦克风阵列自研                                                                                                                                                                          | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 4      |
| F-040 | 穿戴与设备兼容优先级       | 一期优先兼容现成手表/手环，其次蓝牙血压计、蓝牙血糖仪，再后是 UWB 雷达设备                                                                                                                                         | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 5      |
| F-041 | 穿戴设备交付模式         | 希望首发时作为套餐一部分推荐或打包标准设备                                                                                                                                                            | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 5      |
| F-042 | 互联网医院与购药策略       | 首期以平台接入、复用、生态合作为主，不投入大量伴生系统自研                                                                                                                                                    | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 5      |
| F-043 | 保姆模式拿药要求         | 保姆模式下本体必须具备储物仓和递送能力                                                                                                                                                              | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 5      |
| F-044 | 120 接口挂载侧        | 优先通过手机 App 和手机能力拨打；同时争取让机器人具备入网拨号能力，前提是法规允许                                                                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 5      |
| F-045 | 纸质医疗报告复核策略       | OCR 入库不做强制人工复核，但提供人工复核服务作为付费可选项                                                                                                                                                  | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 5      |
| F-046 | 协作同步方式           | `docs/00_governance/01_workflow.md` 中的阶段性待办和 issue 已同步到 Linear 项目 `Kinbot OODA 架构到量产预备`                                                                                          | confirmed   | 本轮协作同步                                                            |
| F-047 | 文档与协作语言要求        | 本地 Markdown 文档和关联到 Linear 的项目、里程碑、issue、文档统一用中文撰写                                                                                                                                | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-048 | 项目总目标时间点         | 本机器人系统目标在 2026 年 12 月 31 日达到量产预备状态                                                                                                                                               | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-049 | 当前与目标团队规模        | 当前团队约 25 到 30 人；在该周期内研发团队预计扩展到 60 到 80 人                                                                                                                                         | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 36     |
| F-050 | 架构弹性要求           | 当前架构按量产目标设计，但必须保留灵活性以应对具身智能行业和技术路线的快速变化                                                                                                                                          | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-051 | 一期穿戴品牌优先级        | 一期优先兼容的小型穿戴品牌暂定为小米、华为                                                                                                                                                            | provisional | `input/00_requirements/00_user_requirements_input.md` Step 6      |
| F-052 | 后台人工服务需求         | 需要后台人工服务体系，可参考医院在线问诊模式                                                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 6      |
| F-053 | UWB 一期候选用途       | UWB 雷达一期候选用途包括用户粗略位置估计、静止/运动状态判断，以及心率等信息监测                                                                                                                                       | provisional | `input/00_requirements/00_user_requirements_input.md` Step 6      |
| F-054 | 机器人直接拨号范围        | 机器人入网打电话当前只做架构预留，不进入一期预研范围                                                                                                                                                       | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 6      |
| F-055 | 储物仓机构边界          | 储物仓应跟随机器人整体外形，在尽量紧凑的内部布置基础上保留灵活空间，不为药品特意做大体积专用仓                                                                                                                                  | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 6      |
| F-056 | 递送能力边界           | 递送服务主要依靠机器人自主运动完成，不引入复杂机械操作                                                                                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 6      |
| F-057 | OCR 人工复核执行方      | 付费人工复核优先由公司关联团队承接，并尽量复用现有平台能力                                                                                                                                                    | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 6      |
| F-058 | 项目起始时间           | 项目时间线按 2026 年 1 月 1 日起算                                                                                                                                                          | confirmed   | Linear 项目更新                                                       |
| F-059 | 前两个月阶段定位         | 2026 年 1 到 2 月主要用于收集需求，并在 Demo 上验证概念设想                                                                                                                                           | confirmed   | 用户本轮说明                                                            |
| F-060 | 样机基础             | 所有讨论中的核心功能已经在真实自研机器人样机上做过粗放 Demo                                                                                                                                                 | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-061 | 产研基础             | 团队具备丰富的消费电子产研经验，覆盖平板类和 IoT 类产品                                                                                                                                                   | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-062 | 模型能力基础           | 团队具备 VLM、VLN 能力，与行业 SOTA 差距约不到一年                                                                                                                                                 | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-063 | 目标系统边界           | 目标系统是机器人；穿戴、智能家居、手机 App、后台云服务等属于伴生系统                                                                                                                                             | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-064 | 手表实时生命体征限制       | 不同品牌手表若要实时获取心率，通常依赖心率广播或官方 SDK；前者影响用户正常使用，后者需要合作认证                                                                                                                               | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 7      |
| F-065 | 一期穿戴型号现状         | 一期尚未形成明确的穿戴设备具体型号清单                                                                                                                                                              | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 7      |
| F-066 | 生命体征实时性策略倾向      | 对心率、血压、血氧等数据的实时性要求可适当降低，必要时可采用问诊式获取                                                                                                                                              | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 7      |
| F-067 | 后台人工服务首线角色       | 后台人工服务的首线角色为公司客服运营坐席，其他角色由其转接                                                                                                                                                    | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 7      |
| F-068 | UWB 候选价值排序       | UWB 一期候选用途优先级为活动状态判断 > 粗定位 > 生命体征监测                                                                                                                                              | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 7      |
| F-069 | 第三方平台责任          | 买药、外卖、内容服务等交付由第三方平台负责                                                                                                                                                            | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 7      |
| F-070 | 机器人对第三方链路的责任     | 机器人必须确保与第三方平台之间传递的信息准确，并对引入的平台做严格审核                                                                                                                                              | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 7      |
| F-071 | 储物仓必须能力          | 储物仓必须具备防夹手、电动开关能力和开关仓状态记录                                                                                                                                                        | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 7      |
| F-072 | 储物仓应有能力          | 储物仓应具备储物记录和交接确认能力                                                                                                                                                                | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 7      |
| F-073 | 储物仓可选能力          | 储物仓可选防误取和防错拿能力                                                                                                                                                                   | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 7      |
| F-074 | 量产预备定义           | 2026-12-31 的量产预备状态定义为产品定型、小批量试点、随时可以开发布会                                                                                                                                         | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 7      |
| F-075 | 线程协作要求           | 另一个 Codex 线程作为 VLN 前瞻技术专家，需要与本线程的系统架构工作协同                                                                                                                                        | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-076 | 分层复杂度约束          | 架构分解时每一层级的实体个数应控制在约 7 个，允许范围为 5 到 9 个                                                                                                                                            | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-077 | 生命体征数据新鲜度        | 心率延迟不超过 1 分钟；血氧与心率同级；血压按需测量，但要求每日均有更新                                                                                                                                            | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 8      |
| F-078 | 人工服务转接条件与时效      | 当用户不会操作、机器人无法识别需求或用户处于紧急状态时，客服运营坐席需要介入或转接；响应时效不超过 3 分钟                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 8      |
| F-079 | 当前样机本体基线         | 当前样机尺寸为 1139 x 500 x 600 mm，自重约 50 kg，采用两轮差速加万向轮底盘，具备机身升降、机身俯仰和头部俯仰三个附加自由度，带电动抽屉式储物仓                                                                                             | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 8      |
| F-080 | 当前样机导航基线         | 当前样机已实现基于 VLN + 激光 SLAM + 导航算法的导航闭环，SLAM 负责建图和位姿输出，VLN 基于 ASM 地图、实时视觉观测和位姿做动作推理，但当前存在反应慢、行走犹豫的问题                                                                                 | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 8      |
| F-081 | 当前样机能力分布         | 当前样机已具备成熟麦克风阵列、自然语音交互、可用问诊能力，以及“心率广播外设触发 + VLN 寻人 + 储物仓推出”的紧急给药 Demo；身份识别效果不够好，家属 App 和云服务仍为空白                                                                                   | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 8      |
| F-082 | 第三方平台准入方式        | 第三方平台按白名单审核接入                                                                                                                                                                    | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 8      |
| F-083 | 小批量试点基线          | 小批量试点预期为 100 台、100 户、运行 1 个月                                                                                                                                                     | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 8      |
| F-084 | 穿戴受限时的兜底交互       | 当穿戴实时数据能力受限时，一期需要更多依赖问诊式交互                                                                                                                                                       | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 8      |
| F-085 | 陪伴默认人设           | 一代机器人默认采用“亲切家人型”人设，并允许基于对用户的了解做有限个性化调整                                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 9      |
| F-086 | 主动交互授权边界         | 长时间沉默、情绪低落等主动交互需用户授权；久坐久卧、到点提醒、回家问候可按条件主动发起，其中夜间回家问候需采用柔和灯光和低音量                                                                                                                  | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 9      |
| F-087 | 长期记忆范围           | 重要纪念日、健康历史、用户习惯偏好、用户主动提起的重要家庭事件允许长期记忆；原始对话默认不长期保存，除非对应上述归档片段或用户主动要求记忆                                                                                                            | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 9      |
| F-088 | 一代安全保障优先级        | 一代安全保障优先覆盖久卧不起、摔倒、厨房明火/水烟/燃气泄漏、陌生人闯入、夜间离床、门窗未关                                                                                                                                   | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 9      |
| F-089 | 低电量降级设想          | 低电量时应先提醒用户，并在任务与回充之间做剩余电量规划；若剩余电量不足以支撑回充，则对用户做强提醒，并在用户响应前暂停并挂起当前任务                                                                                                               | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 9      |
| F-090 | 定位异常降级设想         | 定位异常时优先静默自恢复；若无法找回，则结合当前观测重新定位                                                                                                                                                   | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 9      |
| F-091 | 其他关键降级设想         | 传感器失效需按传感器类别设计降级策略；网络断开由端侧能力接管；储物仓卡滞时暂停运动并提醒用户检查夹手风险                                                                                                                             | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 9      |
| F-092 | 样机保留方向           | 最希望保留的方向是全向观测能力但减少传感器数量、电动开合储物仓、屏幕交互能力                                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 9      |
| F-093 | 样机重构方向           | 最希望重构的方向是整机减重到 40 kg 以下、更强的多模态交互，以及能基于连续历史信息做高层综合决策的导航栈                                                                                                                          | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 9      |
| F-094 | 需求文档编辑边界         | `input/00_requirements/00_user_requirements_input.md` 仅由用户本人修改，Codex 线程只读取、不编辑该文件                                                                                                | confirmed   | 用户本轮说明                                                            |
| F-095 | VLN 文档协作边界       | `docs/09_research/01_vln_role_analysis_and_technical_plan.md` 来源于独立 `VLN` 专项线程，现已纳入版本控制；当前线程以其为正式技术输入，并可在后续需要时继续维护                                                               | confirmed   | 用户本轮说明                                                            |
| F-096 | 记忆治理可见性          | 老人本人和子女允许在 App 中查看、修改和删除长期记忆；修改时需要提醒可能影响后续功能                                                                                                                                     | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 10     |
| F-097 | 陪伴配置权限           | 纪念日、提醒、主动交互频率和人设强度等配置只允许老人本人和子女调整；冲突时需确认                                                                                                                                         | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 10     |
| F-098 | 空间动作边界           | 卫生间默认保守处理，除非明确发现紧急场景，否则机器人不进入；第一代机器人不考虑走出入户门                                                                                                                                     | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 10     |
| F-099 | 安全事件自动动作         | 陌生人闯入允许主动驱离预案；夜间离床经授权后允许柔和灯光查看；门窗未关允许提醒用户、推送 App，并在条件允许时联动智能家居关闭                                                                                                                 | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 10     |
| F-100 | 故障恢复与停机边界        | 低电量、定位异常、关键传感器失效时希望系统更积极恢复；当失效状态导致机器人无法识别任何障碍物时，必须停止运动                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 10     |
| F-101 | 伴生系统职责分工         | 家属 App 承接信息推送、联络和远程控制指令；云服务承接问诊和买药等体系服务；后台运营坐席承接人工联络；穿戴提供运动状态和生命体征；智能家居提供环境事件                                                                                                    | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 10     |
| F-102 | 全生命周期规划要求        | 工作流必须覆盖从需求形成到上市运营和下一代回灌，并在 Linear 中可见                                                                                                                                            | confirmed   | 用户本轮说明                                                            |
| F-103 | 自主设想权限           | 当问题尚未澄清但推进不能停时，允许 Codex 先提出自己的设想，再提交用户审核                                                                                                                                         | confirmed   | 用户本轮说明                                                            |
| F-104 | 人工服务经济性约束        | 用户接受保留客服运营坐席作为一代首线人工服务提案，但明确指出该能力的实际覆盖形态仍会受公司经营投入产出比影响                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 26     |
| F-105 | `KBT-13` 时效定义修正  | 用户要求澄清“医疗专业主体 `10 分钟` 内给出接单结果”的定义；其含义应是服务已受理，而不是已经给出首轮专业回复                                                                                                                       | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 26     |
| F-106 | 验证 Demo 三芯片职责分层  | `RK3576` 负责交互主控，`S100Pro` 负责整机视觉接入、导航控制与算法运行，`AT32F457VET7` 负责整机电机 / 传动控制（除底盘）及 `IMU`、超声波等传感器接入                                                                                  | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 38     |
| F-107 | 验证 Demo 视觉模组事实   | 验证 Demo 采用 `8` 个独立视觉模组：`4` 个高位双目环视模组和 `4` 个低位超广角模组；高位双目约 `75cm`，作为 `VLN` 主观测输入；低位超广角约 `18cm`，原计划用于地面观测与 `SLAM` 匹配，但实际未有效用上；长焦相机同样未有效用上                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 38     |
| F-108 | 验证 Demo 双麦阵成因    | `6` 麦阵位于头顶，但圆形大屏上沿对其形成遮挡和反射，因此又在颈部增加 `8` 麦阵进行修补                                                                                                                                  | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 38     |
| F-109 | 验证 Demo 重量修正     | 验证 Demo 整机重量修正为 `50kg`，此前 `70kg` 为输入错误                                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 38     |
| F-110 | 验证 Demo 电池与热配置   | `466.2Wh + 被动散热` 为验证 Demo 真实实装配置                                                                                                                                                 | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 38     |
| F-106 | IPD 参考要求         | 全生命周期管理需要参考 IPD（集成产品开发）流程                                                                                                                                                        | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-107 | 架构冻结时间要求         | 产品定义与架构冻结争取在 2026-03-31 达成                                                                                                                                                       | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-108 | OODA 革新要求        | 需要理解并革新 OODA 在 AGI 与具身智能时代的用法，并考虑单轮 OODA 跨越的时间尺度、空间尺度及其动态调整能力                                                                                                                    | confirmed   | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-109 | `KBT-10` 审阅结论    | 用户已在 `Step27` 接受 `R1` 到 `R7` 七个能力包、接受无机械臂的一代递送边界，并接受把结构、重量、功耗、外观纳入同一条工程护栏                                                                                                        | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 27     |
| F-110 | 储物仓措辞修正要求        | 用户指出“仓门卡滞审计”措辞生硬，需要改成更直观、非生造词的表达，并解释其含义                                                                                                                                          | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 27     |
| F-111 | 穿戴兼容冻结需求         | 当前主线在 `KBT-10` 之后切到 `KBT-15`，需要独立冻结一期穿戴设备兼容范围、接入模式与数据字段，而不是把它混在健康总线里继续漂移                                                                                                         | confirmed   | 当前工作流推进                                                           |
| F-112 | `KBT-15` 审阅结论    | 用户已接受把一期兼容范围冻结到“设备类别 + 品牌层 + 产品线层”，接受 5 类接入模式，接受 7 类字段分组，并接受 `UWB` 继续保留为观察线                                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 27     |
| F-113 | `UWB` 样品即将到位     | 用户近期将拿到 `UWB` 外设样品，后续测试结果会回写 `input/00_requirements/00_user_requirements_input.md` 作为新的架构输入                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 27     |
| F-114 | `KBT-14` 审阅结论    | 用户已接受 `UWB` 的一代角色冻结为“主线不进入、增强线待样品验证、生命体征继续保留研究观察线”，并接受粗定位边界、活动状态边界和 `S1-S5` 样品验证门                                                                                                | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 28     |
| F-115 | `KBT-16` 恢复主评审   | `KBT-14` 收口后，下一优先级恢复为 `KBT-16` 量产预备判定标准                                                                                                                                          | confirmed   | 当前工作流推进                                                           |
| F-116 | `KBT-16` 审阅结论    | 用户已接受 `G5` 的 `7` 个判定域、当前 `7` 条通过条件，以及“小批量试点可执行 + 随时可以开发布会”的硬定义；对 `功耗` 的疑问实质上是要求说明其与续航、发热等强感知属性的关系                                                                                | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 30     |
| F-117 | `KBT-12` 审阅结论    | 用户已接受 `V1-V7` 七个验证域、`100 台 / 100 户 / 1 个月` 四层试点框架与 `P / W / B` 规则，并要求把睡眠监测提升为 `必须有`，把找物能力提升为 `应该有`                                                                               | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 31     |
| F-118 | `KBT-12` 可选能力扩展  | 用户同意将“阿尔茨海默症相关交互测试与缓解功能、外出未归、美好瞬间记录、休闲娱乐”收敛到一代 `MVP` 的 `可以有` 范围                                                                                                                  | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 31     |
| F-119 | 当前阶段定位修正         | 用户明确指出当前项目仍处于“产品需求基本完成后的系统架构设计与技术研判阶段”，当前目标是形成完整系统架构设计、提交 `PDCP` 评审，并下发总体方案供各模块展开设计                                                                                              | confirmed   | 用户本轮说明                                                            |
| F-120 | `KBT-31` 审阅意见    | 用户在 `Step32` 中接受完整产品系统边界、四条一级业务闭环、部署边界和 `PDCP` 作为系统边界冻结门的定位，但指出当前总体架构基线过于偏向软件 / 算法视角，要求把机器人本体作为软硬一体产品实体显式纳入系统架构，并在此基础上重新审视一级接口面是否足以支撑模块并行设计                                      | confirmed   | `Step32`                                                          |
| F-121 | Claude 协作评审输入    | 用户在“对 Codex 的要求”第 `12` 条中要求认真与 Claude Code 协作，并在第二轮 `KBT-31` 审阅中明确指定 [docs/08_reviews/01_architect_review_and_plan.md](../08_reviews/01_architect_review_and_plan.md) 作为外部架构评审输入 | confirmed   | `docs/00_governance/06_claude.md`、`Step32`                        |
| F-122 | `KBT-31` 第三轮审阅结论 | 用户在 `Step33` 中接受完整产品系统边界、四条一级业务闭环、端侧 / 云侧 / 伴生系统部署边界，以及“双视角一致性检查机制 + Body Capability Contract + 接口稳定性策略”共同构成当前一级接口与治理基线，并接受 `PDCP` 通过后不再回退重定义系统边界                                | confirmed   | `Step33`                                                          |
| F-123 | 纯视觉对比基线原则        | 深度相机 / 激光雷达只做研发对比基线与真值参考链路，不作为产品级 fallback                                                                                                                                       | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 36     |
| F-124 | 纯视觉不过线的节奏原则      | 若纯视觉路线不过线，优先延迟产品节奏，而不是回退主动传感主线                                                                                                                                                   | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 36     |
| F-125 | 当前内存与存储价格工作口径    | 当前工作口径按 `1 USD ≈ 6.9 CNY`、`LPDDR5 ≈ 15 USD / GB`、`eMMC ≈ 15 USD / 32GB` 粗算，用于评估 `C1` 子桶压力                                                                                        | confirmed   | `docs/03_p2_feasibility/04_hardware_software_selection_matrix.md` |
| F-126 | 一代算力与控制域收敛方向     | 验证平台中的 `RK3576` 与 `S100Pro` 职责必须合并到一颗主控 `SoC` 上；一代硬件架构至少收敛到“主控 `SoC` + 实时控制 `MCU`”两芯片                                                                                            | confirmed   | 用户本轮说明                                                            |
| F-127 | 一代视觉与主动传感收敛方向    | 一代默认主线删除 `4` 固态激光雷达与 `4` 超广角相机，主视觉组合进一步收敛为 `1` 组双目 + `2` 个单目                                                                                                                     | confirmed   | 用户本轮说明                                                            |
| F-128 | 一代近场传感删减方向       | 底部超声波与药箱 `ToF` 不进入一代默认主线，需通过其他避障与仓门安全方案补足闭环                                                                                                                                      | confirmed   | 用户本轮说明                                                            |
| F-129 | 一代头部架构方向         | 相机优先放在头部，头部自由度明确增加，用头部运动提高视野覆盖率并增强拟人感                                                                                                                                            | confirmed   | 用户本轮说明                                                            |
| F-130 | 一代声学收敛方向         | 麦克风阵列收敛为 `1` 个并优先放在头部；扬声器优先放在头部或接近头部的躯干位置                                                                                                                                        | confirmed   | 用户本轮说明                                                            |
| F-131 | 一代本体自由度与底盘方向     | 不追求躯干复杂自由度；底盘可评估全向方案，但当前设计基线继续保留“两轮差速 + 全向轮”                                                                                                                                     | confirmed   | 用户本轮说明                                                            |
| F-132 | 一代 Agent 能力抽象方式  | 接受把 `OpenClaw / Claude Code / Codex` 这类 AI 生产力工具抽象为 Kinbot 的 Agent 增强平面，而不是直接写成产品一级模块                                                                                            | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 41     |
| F-133 | 一代 Agent 正式范围    | 一代正式纳入长期记忆、技能化能力组织、连接器抽象与受控任务编排                                                                                                                                                  | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 41     |
| F-134 | 自主创造新技能边界        | “自主创造新技能”继续停留在研究线，不作为一代正式承诺                                                                                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 41     |
| F-135 | 集团概念评审时点         | 集团董事长已将机器人方向定义为集团长期跃迁的重要方向，当前即将进入集团正式概念评审                                                                                                                                        | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 42     |
| F-136 | 家庭机器人首发目标家庭      | `Kinbot` 首发目标家庭进一步收敛为独居老人或子女不在身边的老两口家庭                                                                                                                                           | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 42     |
| F-137 | 家庭机器人首发核心问题      | `Kinbot V1` 首发核心问题进一步收敛为老人慢病管理与用药协同                                                                                                                                              | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 42     |
| F-138 | EMT 必须审批项        | 本次概念评审必须拿到的结论是首发核心功能与场景切口，以及 `10` 个月 / `9000` 万 / `55` 人总盘子的分阶段投入机制                                                                                                              | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 42     |
| F-139 | EMT 最好一并确认项      | 本次概念评审最好一并确认该方向作为战略级投入下的首款产品定位，以及进入市场的方式与节奏                                                                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 42     |
| F-140 | 本体团队建设优先级        | 本体团队亟需经验丰富、系统思维强、尽可能横跨硬件与结构并对本体成果负责的 `SE`                                                                                                                                        | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 43     |
| F-141 | 算法团队建设优先级        | 算法团队亟需具原创能力、思维活跃、对具身智能充满热情的人才，以模型和数据方法弥补几何与规则路线的薄弱并创造弯道超车机会                                                                                                                      | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 43     |
| F-142 | 软件团队建设优先级        | 软件团队亟需构建机器人的 `OpenClaw`，并利用 `AI Agent` 最前沿技术重构系统与应用开发模式                                                                                                                          | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 43     |
| F-143 | 招聘节奏原则           | 招聘优先级 `1 / 2 / 3 / 4` 需要显式拉开；对没想清楚或偏传统保留方法的岗位，可降低优先级或推迟预期入职时间，并随新方法进展复审                                                                                                          | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 43     |
| F-144 | 应用后端架构岗位补充       | 当前团队招聘需求需补充 `应用后端架构师`，用于承接家庭机器人应用侧后端架构、AI 能力与业务系统融合，以及可观测与持续交付体系建设                                                                                                               | confirmed   | 用户本轮指令                                                            |
| F-145 | 高级结构岗位补充         | 当前团队招聘需求需补充 `高级结构工程师`，用于承接机器人本体结构、传动、布局、工艺与试产闭环，补强本体高端产品感与工程落地能力                                                                                                                 | confirmed   | 用户本轮指令                                                            |
| F-146 | 导航前瞻路线升级         | 模型应从 `VLN` 向 `NFM`（导航基础模型）演进，不再分散地解决问题，并应减小 `SLAM + 路径规划` 这类经典算法在高层认知中的占比，非必要不保留                                                                                                 | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 46     |
| F-147 | `NFM` 重点能力       | 当前前瞻技术主线必须重视 `NFM` 中的空间智能与长期记忆建设                                                                                                                                                 | confirmed   | `input/00_requirements/00_user_requirements_input.md` Step 46     |

## 3. 当前架构性判断

| ID | 判断 | 状态 | 依据 |
| --- | --- | --- | --- |
| A-001 | 术语上应把当前统一的运行时认知中枢称为 `World State` 或 `World State Store`；`World Model` 仅在需要表示可预测环境/任务动态的模型时使用 | confirmed | 本轮术语修订 |
| A-002 | 动作前三重门控是最高优先级架构决策 | confirmed | `README.md`, `docs/02_p1_architecture/01_overall_architecture.md` |
| A-003 | 系统需要多时间尺度闭环，不能依赖单一推理平面 | confirmed | `docs/02_p1_architecture/01_overall_architecture.md` |
| A-004 | 后续应优先稳定接口面，而不是过早锁死中间件和模型选型 | confirmed | `docs/02_p1_architecture/01_overall_architecture.md`, `docs/08_reviews/02_architecture_principles_alignment_check.md` |
| A-005 | 当前仓库仍缺模块接口、核心数据结构、团队边界、验证指标和技术选型 | confirmed | `README.md`, `docs/08_reviews/02_architecture_principles_alignment_check.md` |
| A-006 | 产品一代的主问题已经从“泛家庭移动交互”收敛为“中国大陆居家养老/老人看护” | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2 |
| A-007 | 健康管理不再只是提醒能力，而是会直接牵引医疗档案接入、异常识别、问诊联动和用药闭环，因此健康能力必须单列为一级系统流 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2 |
| A-008 | 团队规模和资金量级支持按平台化方式切分模块，不必按纯原型项目的最小堆叠方式设计 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2 |
| A-009 | 一代产品的 MVP 核心不是导航能力本身，而是围绕老人健康闭环组织的感知、交互、联动和执行能力 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| A-010 | 陪伴交互虽然排在第二，但它在系统中不是装饰能力，而是健康管理的高频入口和长期依从性增强器 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| A-011 | 家庭安全巡护被排在第四，意味着首版不应为巡逻场景过度堆叠硬件和算法预算 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| A-012 | 紧急用药管理进入 MVP，意味着世界状态和任务系统必须显式表示药物、储位、禁忌、时效和给药前提 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| A-013 | 权限模型已经从单用户授权演进为多角色授权系统，至少要支持老人本人、子女、保姆、访客四类主体 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| A-014 | 当前架构更适合采用“穿戴优先 + 外设接口保留”的生命体征接入路线，而不是本体自带重型医疗传感器堆叠 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| A-015 | 一期紧急用药仍属于“提醒/递送/确认/告知”闭环，不应扩展成更强的医疗自主处置系统 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| A-016 | 本体硬件策略应聚焦自研底盘、自研麦克风阵列、供应商相机和非自研穿戴外设 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| A-017 | 首期穿戴设备不应走纯 BYOD 模式，而应优先形成“机器人 + 推荐设备套餐”的交付方式，以减少接入碎片化 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 5 |
| A-018 | 购药与互联网医院应按生态接入方式落地，这要求云侧服务网关和审计模型优先支持第三方平台模式，而不是自建医疗闭环 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 5 |
| A-019 | 机器人本体储物仓和递送能力已经从“可选想法”提升为保姆模式和送药流程的硬需求 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 5 |
| A-020 | 纸质报告 OCR 入库允许无强制人工复核，意味着系统必须支持来源标记、置信度和可选付费复核状态 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 5 |
| A-021 | 本地 repo 文档应继续作为需求和架构事实源，Linear 负责协作、评审和执行状态跟踪，两者需保持同步 | confirmed | 本轮协作同步 |
| A-022 | 项目管理基线应从单纯 MVP 推进，升级为“2026-12-31 量产预备 + 2027 年 1 月 MVP 验证窗口”的双节点节奏 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| A-023 | 文档和协作系统统一中文化，有助于后续百人团队协作、跨角色评审和对外沟通一致性 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| A-024 | 后台人工服务已从可选扩展能力变为首版系统闭环的一部分，云侧服务网关和 App 侧必须预留人工接入、转接和审计状态 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 6 |
| A-025 | UWB 雷达在一期只能作为候选感知增强路线，是否纳入首版 BOM 必须以技术成熟度和成本评估结论为准 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 6 |
| A-026 | 储物仓应按通用递送空间设计，而不是按单一药品容器定制，这会直接影响结构设计和上装布局 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 6 |
| A-027 | 项目不再是“从零开始定义概念”，而是要基于既有样机 Demo、消费电子经验和现有模型能力做量产化架构收敛 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| A-028 | 伴生系统应作为围绕机器人协同的外部系统处理，不应稀释“机器人本体是目标系统”的架构主线 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| A-029 | 一期健康链路不能把“持续实时手表心率”当作硬依赖，必须接受较低实时性并支持问诊式或补采式数据获取 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| A-030 | 后台人工服务的第一入口应按客服运营坐席设计，接口层要重点支持接入、转接、超时和责任切换，而不是直接假设医生在线常驻 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| A-094 | 当前团队构建的最高优先级应从“泛 owner 平铺”进一步收敛为“本体 `SE` + 具身智能前瞻路线 + `OpenClaw / Agent` 软件主链 + 系统集成测试”四条组织主轴 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 43，`docs/10_team_planning/01_development_team_proposal.md` |
| A-095 | 经典算法路线应从“默认主攻”调整为与具身智能路线并行竞争、配合补位的角色，其招聘节奏应服从前瞻路线进展 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 43，`docs/10_team_planning/01_development_team_proposal.md` |
| A-096 | 机器人软件团队应按 `Agent-native` 方式重构系统与应用开发模式，而不是沿用传统 `App / 后台 / 端侧应用` 各自为战的扩编逻辑 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 41，Step 43 |
| A-097 | `应用后端架构师` 应定位为 `S6` 应用后端与 AI 融合架构位，重点负责把大模型、多模态和语音能力编织进业务主链，并与已单列在招的云服务 / 运营平台架构负责人形成“平台底座 + 应用后端”双层分工 | confirmed | 用户本轮指令，`docs/10_team_planning/02_recruitment_requirements_optimized.csv` |
| A-098 | `高级结构工程师` 不应被定义为单纯出图支持岗位，而应作为本体完整竞争力的关键承接位，负责把传动、空间、工艺、装配和试产收敛成可量产、可感知的整机结构质量 | confirmed | 用户本轮指令，`docs/10_team_planning/02_recruitment_requirements_optimized.csv` |
| A-099 | 在当前开发承接层，`V1` 主闭环已收缩为“机器人本体 + 家属 App + 最小云”；人工服务、在线问诊、第三方履约与公共应急只保留后续适配位，不进入当前主链验收 | confirmed | `codex/v1-real-complexity-reduction` 本轮文档收口 |
| A-100 | 穿戴与健康外设继续保留为当前 `V1` 的受控输入位，用于生命体征、补采与健康判断；它们不是当前伴生系统主链中的独立服务闭环 | confirmed | `codex/v1-real-complexity-reduction` 本轮文档收口 |
| A-101 | 在当前开发承接层，只把离散决策与事件驱动作为必交付主链；连续流式与长周期演化继续保留研究线 / 接口位 | confirmed | `codex/v1-real-complexity-reduction` 本轮文档收口 |
| A-102 | 离散决策业务面当前已将 `主动接近 / 用药服务 / 保姆协同` 合并为 `执行服务`，以减少状态面复杂度并稳定下游接口 | confirmed | `codex/v1-real-complexity-reduction` 本轮文档收口 |
| A-031 | 第三方平台的责任边界必须在接口和审计模型里显式表达，否则后续合规和售后责任会失真 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| A-032 | 储物仓的一代能力优先级应先满足防夹手、开关控制和状态记录，再规划交接确认，最后再考虑防误取和防错拿 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| A-033 | “量产预备”在本项目里不应被理解为纯文档完成，而应理解为产品定型并具备小批量试点与发布准备状态 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| A-034 | `Step8` 已经给出了健康事件管线第一版所需的关键输入，因此下一轮澄清重点不应继续单线深挖健康，而应并行转向陪伴交互和安全保障 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 8 |
| A-035 | 陪伴交互不能被当作 UI 细节，它需要单独澄清主动发起边界、打断礼仪、人设强度、长期记忆和多角色共享边界 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2, Step 3, Step 8 |
| A-036 | 安全保障不能被简化为避障，它至少还需要家庭危险源清单、空间分级、时间规则、异常升级和降级停机矩阵 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 1, Step 2, Step 8 |
| A-037 | 当前样机更强的是本体集成、导航和语音，更弱的是身份效果、App 和云服务，因此后续系统设计要把资源从单纯本体能力扩展到整机闭环与伴生系统闭环 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 8 |
| A-038 | 当前样机的多雷达多深度相机配置更接近概念验证平台，量产架构需要后续单独评估哪些传感器组合必须保留，哪些可以降配 | provisional | `input/00_requirements/00_user_requirements_input.md` Step 8 |
| A-039 | 涉及 VLN 技术路线的判断，应与前瞻技术专家线程交叉校验；本线程继续负责机器人整机系统架构、接口和产品闭环 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| A-040 | 后续文档和模块继续扩展时，应把每层实体数控制在约 7 个，避免为了完整性牺牲可读性和团队可协作性 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| A-041 | 一代陪伴交互应采用“亲切家人型为默认、有限个性化为增强”的边界，而不是开放式自由人格生成 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| A-042 | 主动交互的核心目标不是提高陪伴召回率，而是在不打扰前提下提升依从性、情绪陪伴效果和健康/安全闭环触达率 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| A-043 | 长期记忆应保存“结构化归档结果”而不是原始对话，这要求记忆系统支持摘要归档、可追溯来源和按角色共享控制 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| A-044 | 一代安全保障优先顺序已经明确偏向“生命与照护风险”而不是“财产与周界风险”，因此验证与传感器预算应优先覆盖久卧不起、摔倒和厨房风险 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| A-045 | 定位异常恢复不能把 VLN 当作无边界兜底能力；更合理的架构是由受限恢复流程调用语义导航策略提供候选语义线索，并始终受本地定位与运动安全链约束 | confirmed | `docs/09_research/01_vln_role_analysis_and_technical_plan.md`, `input/00_requirements/00_user_requirements_input.md` Step 9 |
| A-046 | VLN 在 Kinbot 中应继续定位为 `Orient -> Decide` 之间的语义导航策略层，而不是替代 `SLAM + 局部规划 + 避障` 的底盘级安全控制层 | confirmed | `docs/09_research/01_vln_role_analysis_and_technical_plan.md` |
| A-047 | 当前样机的保留与重构方向表明，一代量产化路线应从“重传感器验证平台”收敛到“更轻量传感器配置 + 更强语义与多模态能力”的平台 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9, `docs/09_research/01_vln_role_analysis_and_technical_plan.md` |
| A-048 | 当前线程对 VLN 技术规划采取“引用结论、不维护文件”的协作方式；VLN 细节在独立 issue 与独立线程中推进 | confirmed | 用户本轮说明 |
| A-049 | 一代 MVP 不能只冻结机器人本体，还必须冻结家属 App、云服务和后台运营坐席的最小闭环，否则授权、记忆治理和异常升级都无法闭环 | confirmed | 本轮伴生系统文档 |
| A-050 | 验证平台“三芯片职责分层”的真正遗产是功能分层思想，而不是三芯片硬件表象；一代应保留职责分层，但收敛为两芯片硬件架构，以降低表面复杂度并逼近必备复杂度 | confirmed | 用户本轮说明，`docs/00_governance/05_system_architecture_principles.md` |
| A-051 | 一代当前正在把“多固定视角堆叠”转向“少相机 + 头部主动观察”，这意味着复杂度正从器件数量转移到头部机电一体化、主动视线控制和调度能力 | confirmed | 用户本轮说明，`docs/08_reviews/10_kinbot_architecture_evolution_analysis.md` |
| A-052 | 删除底部超声波和药箱 `ToF` 后，近场安全不应简单回退到新主动传感器堆叠，而应优先通过近场视觉、接触式保护、仓门状态和电流 / 位置反馈补足最低闭环 | confirmed | 用户本轮说明，`docs/00_governance/05_system_architecture_principles.md` |
| A-053 | 单麦阵收敛不是单纯降配，而是要求头部视觉、屏幕、声学和结构真正一体化收敛；若这一步做不好，会直接损伤“聪明、温暖、精致”的产品感 | confirmed | 用户本轮说明，`docs/00_governance/05_system_architecture_principles.md` |
| A-054 | 躯干自由度收缩、底盘稳健基线保留，意味着一代必须把拟人感和差异化更多压到头部与交互，而不是分散到整机多部位自由度 | confirmed | 用户本轮说明 |
| A-050 | 记忆已经从“系统内部状态”变成“用户可治理资产”，因此记忆写入、纠错、删除和功能影响提示必须进入 App 与审计设计 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 10 |
| A-051 | 多角色配置模型已进一步收敛为“老人本人和子女可配置，保姆只在授权范围内执行”，这会直接影响 App 权限模型和冲突确认流程 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 10 |
| A-052 | 第一代机器人必须显式建立“卫生间高敏感、入户门不越界”的空间动作边界，否则健康与安全链会在真实家庭里频繁越界 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 10 |
| A-053 | 陌生人闯入、夜间离床和门窗未关这三类事件已经具备第一版自动动作边界，后续可以开始冻结默认升级链和测试项，而不是继续停留在概念层 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 10 |
| A-054 | 故障状态下的策略不应只强调保守停机，还应允许受约束的积极恢复；但一旦障碍物识别能力失效，运动必须硬停 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 10 |
| A-055 | 一代健康链已经具备足够输入，可以单独冻结“健康事件管线与升级链路”，并将其作为后续 Demo 到量产能力缺口分析的基线文档 | confirmed | 本轮健康事件文档 |
| A-056 | 当前项目虽然以 2026-12-31 量产预备为主节点，但工作流必须提前规划上市运营、质量闭环和下一代回灌，否则前段架构会短视 | confirmed | 用户本轮说明 |
| A-057 | 在信息不足但不值得停工等待时，最有效的协作方式不是继续空问，而是先形成“架构师设想包”并进入评审 | confirmed | 用户本轮说明 |
| A-058 | 全生命周期协作在 Linear 中应至少体现为阶段里程碑、主文档和跨阶段 issue，而不只是当前架构 issue 列表 | confirmed | 用户本轮说明 |
| A-059 | 生命周期管理当前应按“参考 IPD + 面向机器人整机服务系统裁剪”的方式推进，而不是只保留抽象阶段描述 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| A-060 | 当前周期里，“产品定义与架构冻结”应被视作硬阶段门，目标日期为 `2026-03-31` | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| A-061 | 在 `KBT-28` 阶段，经典串行单环 `OODA` 被扩展为多尺度、并发、可中断、可动态调度的阶段性主线；该总法已于 `2026-04-06` 被“家庭共居智能体 + 多执行范式”口径覆盖 | confirmed | `KBT-28` 审阅结论 |
| A-062 | `Orient` 在 Kinbot 中不应只承担情境理解，还应承担对 `Observe` 结果的认知评价、尺度选择、时域压缩和子环切换 | confirmed | `KBT-28` 审阅结论 |
| A-063 | 在 `KBT-28` 阶段，长期关系与服务优化曾按独立执行环写入主线；当前该表达已被长周期演化范式与关系治理口径吸收，不再作为顶层总法标签 | confirmed | `KBT-28` 审阅结论 |
| A-064 | 在 `KBT-28` 阶段，旧离散调度器曾被上提为运行时主导切换入口；当前 `Phase 2` 已将其改写为运行时层的执行范式协调机制，不再作为顶层主线概念单列 | confirmed | `KBT-28` 审阅结论 |
| A-065 | 在更低 BOM 和更小团队约束下，一代应按“核心闭环强、服务闭环轻、技术突破集中”收敛，而不是默认所有闭环同等重做 | confirmed | `Step36`、当前架构提案 |
| A-066 | 纯视觉路线在当前项目中不仅是选型结论，还是产品差异化与技术突破点，因此不应预设主动传感 fallback | confirmed | `Step36` |
| A-067 | `KBT-18` 不应按零散功能列缺口，而应按“整机平台、R1、R2、R3、R4、伴生系统、工程化”7 个能力域来评估 | confirmed | `Step13` 对 `KBT-18` 的审阅意见 |
| A-068 | 当前样机到量产预备的最大差距不是单点算法能力，而是产品闭环、伴生系统闭环和工程化体系 | provisional | 本轮缺口分析 |
| A-069 | 当前三类阻断项默认收敛为：伴生系统与人工运营闭环、整机平台与成本收敛、工程化与 NPI 基线 | confirmed | `Step14` |
| A-068 | 储物仓能力应保留，但现有传动机构过大过重，需要作为工程化重构项单列推进 | confirmed | `Step13` 对 `KBT-18` 的审阅意见 |
| A-069 | 整机外观形态重构已是既定工程动作，应进入 `E2` 整机平台基线，而不是留作后续工业设计附属项 | confirmed | `Step13` 对 `KBT-18` 的审阅意见 |
| A-070 | `E4 伴生系统与服务运营基线` 的优先级体现在先冻结接口、职责和交付面，不意味着伴生系统可以反向锁死本体硬件路线 | confirmed | `Step14` |
| A-071 | 一代软硬件选型当前可先收敛为“量产主线、验证加速备线、前瞻观察线”三层结构，再在 `G2` 前最终定型 | provisional | 本轮选型矩阵草案 |
| A-072 | 当前线程后续必须执行“前置评审清账”机制：前置 issue 未关闭时，后续 issue 可以起草，但不得被当成最终冻结结果 | confirmed | `Step16` |
| A-073 | 模块分解与一级实体分解均应尽量控制在 `5～9` 个；超过上限时，应先压缩顶层结构再继续推进评审 | confirmed | `Step16` |
| A-074 | 对已评审通过且存在明确结构分解的文档，应补充直观架构图，并把图示视为正式架构表达的一部分 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| A-075 | 每一阶段都要检查系统各实体元素的组合，判断整机与服务是否仍然呈现“聪明、温暖、精致”的高端产品感，并能支撑 `20000 到 30000 元` 售价区间 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求第 10 条与 `Step24` |
| A-076 | 当 Codex 暂停并等待用户输入时，必须提出明确的审阅需求，至少指出要审阅的 issue、文档或具体提案位置，不能只给模糊的推进提示 | confirmed | 用户本轮明确要求 |
| A-077 | 后置里程碑中的约束型文档允许提前起草，但它们只用于逆向约束前置设计，不代表项目已经越过前置里程碑；当前主优先级必须回到尚未关闭的前置里程碑 | confirmed | 用户本轮对 Milestone 顺序的质疑 |
| A-078 | 当前主线正式采纳“三线吸收法”：继续以现有系统级架构保持稳定边界，同时吸收《架构重审与替代提案》的技术结构优化输入，以及《关系中心架构提案》的关系质量评价与产品原则输入 | confirmed | `docs/08_reviews/05_two_claude_proposals_review_and_next_steps.md` |
| A-079 | 算力调度器需要从方法论能力进一步落入总体架构与 `PDCP` 主评审视图，并与 `TTFT / TPS / 热稳态持续 TPS` 一起成为后续总体方案与模块设计的显式输入 | confirmed | `docs/08_reviews/05_two_claude_proposals_review_and_next_steps.md` |
| A-080 | `World State` 在 `PDCP` 节点继续保持统一状态平面，但后续总体方案应按执行态与安全态、任务上下文态、长期关系与服务态三类继续分层演进 | confirmed | `docs/08_reviews/05_two_claude_proposals_review_and_next_steps.md` |
| A-081 | 安全能力在后续总体方案中应按分层免疫体系组织，至少区分本体防护与故障保护、运动安全与环境安全、业务授权与合规安全、服务协同与审计安全四层 | confirmed | `docs/08_reviews/05_two_claude_proposals_review_and_next_steps.md` |
| A-082 | “关系质量”应被纳入总体方案、模块方案和体验验收的正式评价框架，但不冻结为新的超级核心引擎，也不让所有能力绕经单一关系核心 | confirmed | `docs/08_reviews/05_two_claude_proposals_review_and_next_steps.md`, `docs/08_reviews/08_relation_centered_architecture_proposal.md` |
| A-083 | `PDCP` 会前必须显式对齐需求侧硬约束，不再默认这些约束只散落在用户需求文档中；至少要在主线架构文档里显式表达产品与业务、系统边界、治理、数据与部署、工程与项目管理五类硬约束 | confirmed | `docs/08_reviews/09_pdcp_requirement_constraints_and_blockers_proposal.md` |
| A-084 | `D1 / D6 / D7` 继续作为 `PDCP` 后续总体方案与模块设计的一级阻断输入；此外，成本-性能-产品感统一决策、双视角一致性落地、接口冻结范围清单与夜间低照实证能力，已升级为当前关键路径关注项 | confirmed | `docs/08_reviews/09_pdcp_requirement_constraints_and_blockers_proposal.md` |
| A-085 | 当前 `C1` 的主矛盾已从“选哪颗芯片”进一步转为“`RAM / Flash` 能否在 `5000 到 6000 元` 整机 `BOM` 约束下支撑默认量产线” | confirmed | `docs/03_p2_feasibility/04_hardware_software_selection_matrix.md`, `docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md` |
| A-086 | 一代量产默认线当前更新为 `12GB RAM + 32GB Flash`；`12GB + 64GB` 只作边界验证线，`16GB + 64GB` 及以上只作前瞻验证线或未来 `Pro SKU` 候选 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 48 |
| A-087 | 为避免架构层级继续膨胀，一代应把长期记忆、技能化、连接器与受控任务编排压缩为跨模块 Agent 增强平面，而不是新增一级模块 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 41, `docs/02_p1_architecture/01_overall_architecture.md` |
| A-088 | 一代应把技能化理解为能力组织与受控组合，而不是开放式自主代理；固定技能与组合技能进入主线，候选新技能保留在研究线 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 41 |
| A-089 | 连接器抽象需要成为手机、App、云服务、智能家居和第三方平台接入的统一边界，否则服务扩展会继续退化为点对点耦合 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 41, `docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md` |
| A-090 | 面向集团 `EMT` 的未来家庭机器人方向，应优先被定义为“家庭中的具身照护协调节点”，而不是泛家庭机器人或自主医疗终端 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 42, `docs/08_reviews/13_future_home_robot_vision_charter_for_emt.md` |
| A-091 | `Kinbot V1` 的核心价值不应是替代医生决定吃什么药，而应是在家庭内连续完成“提醒、到人、递药引导、确认、问询升级、补药 / 挂号”的具身协同闭环 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 42, `docs/08_reviews/13_future_home_robot_vision_charter_for_emt.md` |
| A-092 | 集团在家庭机器人方向的 `right to win`，来自医疗理解、`AI` 交互、机器人载体与规模交付四种能力的组合，而不是任一单点能力最强 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 42, `docs/08_reviews/13_future_home_robot_vision_charter_for_emt.md` |
| A-093 | 本次概念评审的资源审批不应采用一次性 `all-in` 方式，而应在确认 `10` 个月 / `9000` 万 / `55` 人总盘子的前提下，按阶段门分批释放 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 42, `docs/08_reviews/13_future_home_robot_vision_charter_for_emt.md` |
| A-094 | 当前导航智能主线应从“`VLN` 能力增强”升级为“`VLN -> NFM` 演进”；`VLN` 在一代中被定义为 `NFM` 的指令驱动语义导航能力切片，而不是最终问题定义 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 46, `docs/09_research/01_vln_role_analysis_and_technical_plan.md` |
| A-095 | 一代 `NFM` 主要落在 `Orient / Decide`，统一承接空间理解、粗粒度全局定位、搜索恢复与长时空间记忆；`SLAM / 路径规划` 继续保留在 `local_metric_frame`、局部执行与安全支撑层 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 46, `docs/02_p1_architecture/01_overall_architecture.md` |
| A-096 | 长期记忆需要正式分层：基础空间长期记忆（`semantic_global_frame / topometric memory / target belief / drift alert`）应前置进入 `P0/P1`，个性化 / 行为长期记忆后置到 `P2` | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 46, `docs/09_research/vln_model_design/kinbot_vln_model_detailed_design.md` |

## 4. 尚未关闭的关键问题

| ID | 问题 | 为什么关键 | 状态 |
| --- | --- | --- | --- |
| Q-001 | 不同健康事件的 `L1` 到 `L4` 风险阈值如何量化 | 决定健康事件自动动作和升级策略 | open |
| Q-002 | 家属 App 允许下发哪些远程控制指令，哪些必须禁止 | 决定伴生系统远控边界和安全责任 | open |
| Q-003 | 智能家居一期优先接入哪些设备类型和协议 | 决定环境风险闭环范围和接口优先级 | open |
| Q-004 | 卫生间、卧室、厨房、入户门是否需要细化成正式的空间规则表 | 决定空间模型、健康确认链和安全测试用例 | open |
| Q-005 | 低电量、定位异常、关键传感器失效的量化阈值如何定义 | 决定功能安全状态机和量产验证标准 | open |
| Q-006 | 如何按 `W1 静默待机 / W2 静止陪伴交互 / W3 连续运动 / W4 连续运动中的陪伴交互` 冻结 `C5` 工作基线，并在 `C4` 低传感路线下显式记账 `C1 / C2 / C5` 的成本与功耗转移 | 决定一代成本与功耗是否既可收敛，又不会因为“压低底盘传感器”而隐性放大算力、视觉和热设计压力 | open |
| Q-007 | 上市后质量、人工服务、版本治理和下一代回灌机制要做到什么深度 | 决定全生命周期后段的组织和系统投入 | open |
| Q-008 | 客服运营坐席最终采用自建、外包、平台合作还是分时混合覆盖，服务可用时段如何定义 | 决定一代人工服务 `OPEX`、可用性声明和后续服务经济性约束 | open |
| Q-009 | 一期首批套餐或白名单的具体型号何时冻结 | 决定 `KBT-15` 的商务接入节奏、交付复杂度和售后支持范围 | open |
| Q-010 | `UWB` 样品测试通过门应采用哪些量化指标 | 决定 `KBT-14` 是否能从观察线升级为增强线 | open |
| Q-011 | `G5` 量产预备门的 7 域与 7 条通过条件是否需要进一步细化为阶段门量化项 | 决定 `KBT-16` 是否能从概念门进入执行门 | open |
| Q-012 | 睡眠监测、找物能力与 `P / W / B` 放行规则是否需要继续量化到执行阈值 | 决定 `KBT-12` 后续执行计划能否进入更细化模板 | open |

## 5. 下一轮优先向用户确认的问题

建议下一轮优先围绕仍未关闭的高代价开放问题继续清账：

1. `Q-001`：不同健康事件的 `L1-L4` 风险阈值如何量化？
2. `Q-002`：家属 App 允许下发哪些远程控制指令，哪些必须禁止？
3. `Q-006`：如何冻结 `C5` 工作基线，并显式记账 `C4 -> C1 / C2 / C5` 的成本与功耗转移？
4. `Q-008`：客服运营坐席最终采用自建、外包、平台合作还是分时混合覆盖，服务可用时段如何定义？
5. `Q-010`：`UWB` 样品测试通过门应采用哪些量化指标？
6. `Q-011`：`G5` 量产预备门的 `7` 域与 `7` 条通过条件是否需要进一步细化为阶段门量化项？

## 6. 历史分卷与派生索引

本文件不再直接承载全量时间序列决策日志。当前请按以下入口使用：

### 6.1 历史时间分卷

1. [2026_q1_decisions.md](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/00_governance/decision_log/history/2026_q1_decisions.md)
2. [2026_q2_decisions.md](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/00_governance/decision_log/history/2026_q2_decisions.md)

### 6.2 派生索引

1. [decision_log/README.md](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/00_governance/decision_log/README.md)
2. [01_active_fact_index.md](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/00_governance/decision_log/01_active_fact_index.md)
3. [02_architecture_judgment_index.md](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/00_governance/decision_log/02_architecture_judgment_index.md)
4. [03_open_question_index.md](/Users/archimboldi/Documents/myproject/AI%20project/Codex%20Project/Kinbot_OODA/docs/00_governance/decision_log/03_open_question_index.md)

## 7. 后续记录规则

- 新确认的信息，先写入“已确认事实”或“当前架构性判断”。
- 新的高代价选择，写入“决策日志”。
- 未关闭且会影响后续设计的问题，写入“尚未关闭的关键问题”。
- 每轮结束后，把“下一轮优先向用户确认的问题”收敛到不超过 6 个。
