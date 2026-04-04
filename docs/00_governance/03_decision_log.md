# 决策记录

---

文档版本：v1.12
创建日期：2026-03-08
作者：Codex-架构师

文档变更记录：
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

## 2. 已确认事实

| ID | 主题 | 当前记录 | 状态 | 来源 |
| --- | --- | --- | --- | --- |
| F-001 | 场景 | 家庭室内场景 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-002 | 核心任务 | 多模态交互陪伴、健康管理、安全保障 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-003 | 系统边界 | 移动交互机器人，不要求物理操作 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-004 | 移动形态 | 轮式移动，需要通过家庭低矮门槛 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-005 | 交互方式 | 语音、屏幕、灯光、手势、手机 App、远程控制 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-006 | 交互风格 | 偏陪伴型、社交型机器人 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-007 | 决策优先级 | 安全 > 合规 > 用户指令 > 任务完成率 > 效率 > 能耗 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-008 | 自主权边界 | 已授权行为需要做到完全自主 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-009 | 数据边界 | 原始视觉、语音、生物特征本地处理、匿名化、加密存储 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-010 | 端云原则 | 直接处理视觉、语音和运动安全的能力必须在端侧 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-011 | 离线原则 | 断网时运动和安全能力不应受影响 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-012 | 工程目标 | 续航 > 4 小时，尺寸建议不超过 50 x 50 x 120 cm，预算 5000 到 6000 元，MVP 时间点 2027 年 1 月 | confirmed | `input/00_requirements/00_user_requirements_input.md` |
| F-013 | 首发目标用户 | 首发聚焦独居老人或子女不在身边的老两口，后续代际再扩展到普通家庭 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2 |
| F-014 | 首发市场 | 中国大陆 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2 |
| F-015 | 健康管理方向 | 目标包含生命体征接入、跌倒/异常检测、结合历史医疗档案的问诊与医疗联动、用药管理和买药 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2 |
| F-016 | 夜间自主边界 | 未授权或无异常情况下，夜间保持静默，但传感器全开 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2 |
| F-017 | 主动靠近策略 | 允许主动靠近用户，但不追求高召回率 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2 |
| F-018 | 打断策略 | 可在遵守社会公认礼仪的前提下有限度地主动打断，并允许谨慎探索“俏皮”人设 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2 |
| F-019 | 异常上报边界 | 用户授权后允许自动上报异常 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2 |
| F-020 | 资源约束 | 未来几个月团队规模可达 60 人以上，允许部分硬件 ODM，自研强项在消费电子、AI、大模型、多模态交互，未来一年资金量级 8000 万到 1 亿元人民币 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 2 |
| F-021 | 首版主价值排序 | 健康管理 > 陪伴交互 > 家庭安全巡护 > 老人看护 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 36 |
| F-022 | 医疗档案来源 | 语音交互输入、手机 App 上传、纸质报告识别 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| F-023 | 医疗联动深度 | 首版包含交互式问诊、家属提醒、在线问诊转接、互联网医院开方购药、日常用药管理、紧急用药管理 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| F-024 | 购药能力 | 进入 MVP | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| F-025 | 高风险异常上报链路 | 默认先提醒家属，力争打通社区/物业；120 联动希望支持，但不作为第一期强要求 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| F-026 | 访客权限 | 默认允许发起交互，其他功能需老人本人授权后可用 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| F-027 | 保姆权限 | 需要单独的保姆模式，机器人与保姆形成分工协同关系，用于完成老人本人交代的事务 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| F-028 | 老人本人权限 | 在不违反最高优先级原则前提下，老人本人为最高权限主体，身份信息需绑定 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| F-029 | 子女权限 | 在绑定和授权后可与老人本人有同等权限 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 3 |
| F-030 | 生命体征接入策略 | 一期优先绑定穿戴设备获取实时信息，同时保留血压计等外设的软件接入接口，医疗判断综合当时可获得的全部信息 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| F-031 | 紧急用药动作边界 | 一期动作边界为提醒取药、送药到人、提醒服药并确认、联系子女告知信息，不考虑更强自主处置 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| F-032 | 老人与子女冲突仲裁 | 老人与子女同权时，如出现冲突命令，必须二次确认 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| F-033 | 保姆模式协同范围 | 提醒、拿药、叫人、记录、汇报、远程确认等动作先预留 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| F-034 | 120 联动接口 | 一期架构层需要预留标准接口 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| F-035 | 端侧算力获取方式 | 以成本、周期、质量最优方式获取板子，购买或自研均可，具备自研能力 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| F-036 | 底盘策略 | 底盘预计自研，底盘本身尽量只承担动力职责并减少传感器堆叠 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| F-037 | 穿戴外设策略 | 穿戴生命体征外设不自研 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| F-038 | 相机策略 | 相机优先找供应商，尽量采用简单配置，不优先采购昂贵体积大的成品深度相机，并考虑自研深度估计模型 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| F-039 | 麦克风阵列策略 | 麦克风阵列自研 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 4 |
| F-040 | 穿戴与设备兼容优先级 | 一期优先兼容现成手表/手环，其次蓝牙血压计、蓝牙血糖仪，再后是 UWB 雷达设备 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 5 |
| F-041 | 穿戴设备交付模式 | 希望首发时作为套餐一部分推荐或打包标准设备 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 5 |
| F-042 | 互联网医院与购药策略 | 首期以平台接入、复用、生态合作为主，不投入大量伴生系统自研 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 5 |
| F-043 | 保姆模式拿药要求 | 保姆模式下本体必须具备储物仓和递送能力 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 5 |
| F-044 | 120 接口挂载侧 | 优先通过手机 App 和手机能力拨打；同时争取让机器人具备入网拨号能力，前提是法规允许 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 5 |
| F-045 | 纸质医疗报告复核策略 | OCR 入库不做强制人工复核，但提供人工复核服务作为付费可选项 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 5 |
| F-046 | 协作同步方式 | `docs/00_governance/01_workflow.md` 中的阶段性待办和 issue 已同步到 Linear 项目 `Kinbot OODA 架构到量产预备` | confirmed | 本轮协作同步 |
| F-047 | 文档与协作语言要求 | 本地 Markdown 文档和关联到 Linear 的项目、里程碑、issue、文档统一用中文撰写 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-048 | 项目总目标时间点 | 本机器人系统目标在 2026 年 12 月 31 日达到量产预备状态 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-049 | 当前与目标团队规模 | 当前团队约 25 到 30 人；在该周期内研发团队预计扩展到 60 到 80 人 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 36 |
| F-050 | 架构弹性要求 | 当前架构按量产目标设计，但必须保留灵活性以应对具身智能行业和技术路线的快速变化 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-051 | 一期穿戴品牌优先级 | 一期优先兼容的小型穿戴品牌暂定为小米、华为 | provisional | `input/00_requirements/00_user_requirements_input.md` Step 6 |
| F-052 | 后台人工服务需求 | 需要后台人工服务体系，可参考医院在线问诊模式 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 6 |
| F-053 | UWB 一期候选用途 | UWB 雷达一期候选用途包括用户粗略位置估计、静止/运动状态判断，以及心率等信息监测 | provisional | `input/00_requirements/00_user_requirements_input.md` Step 6 |
| F-054 | 机器人直接拨号范围 | 机器人入网打电话当前只做架构预留，不进入一期预研范围 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 6 |
| F-055 | 储物仓机构边界 | 储物仓应跟随机器人整体外形，在尽量紧凑的内部布置基础上保留灵活空间，不为药品特意做大体积专用仓 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 6 |
| F-056 | 递送能力边界 | 递送服务主要依靠机器人自主运动完成，不引入复杂机械操作 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 6 |
| F-057 | OCR 人工复核执行方 | 付费人工复核优先由公司关联团队承接，并尽量复用现有平台能力 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 6 |
| F-058 | 项目起始时间 | 项目时间线按 2026 年 1 月 1 日起算 | confirmed | Linear 项目更新 |
| F-059 | 前两个月阶段定位 | 2026 年 1 到 2 月主要用于收集需求，并在 Demo 上验证概念设想 | confirmed | 用户本轮说明 |
| F-060 | 样机基础 | 所有讨论中的核心功能已经在真实自研机器人样机上做过粗放 Demo | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-061 | 产研基础 | 团队具备丰富的消费电子产研经验，覆盖平板类和 IoT 类产品 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-062 | 模型能力基础 | 团队具备 VLM、VLN 能力，与行业 SOTA 差距约不到一年 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-063 | 目标系统边界 | 目标系统是机器人；穿戴、智能家居、手机 App、后台云服务等属于伴生系统 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-064 | 手表实时生命体征限制 | 不同品牌手表若要实时获取心率，通常依赖心率广播或官方 SDK；前者影响用户正常使用，后者需要合作认证 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| F-065 | 一期穿戴型号现状 | 一期尚未形成明确的穿戴设备具体型号清单 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| F-066 | 生命体征实时性策略倾向 | 对心率、血压、血氧等数据的实时性要求可适当降低，必要时可采用问诊式获取 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| F-067 | 后台人工服务首线角色 | 后台人工服务的首线角色为公司客服运营坐席，其他角色由其转接 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| F-068 | UWB 候选价值排序 | UWB 一期候选用途优先级为活动状态判断 > 粗定位 > 生命体征监测 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| F-069 | 第三方平台责任 | 买药、外卖、内容服务等交付由第三方平台负责 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| F-070 | 机器人对第三方链路的责任 | 机器人必须确保与第三方平台之间传递的信息准确，并对引入的平台做严格审核 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| F-071 | 储物仓必须能力 | 储物仓必须具备防夹手、电动开关能力和开关仓状态记录 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| F-072 | 储物仓应有能力 | 储物仓应具备储物记录和交接确认能力 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| F-073 | 储物仓可选能力 | 储物仓可选防误取和防错拿能力 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| F-074 | 量产预备定义 | 2026-12-31 的量产预备状态定义为产品定型、小批量试点、随时可以开发布会 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 7 |
| F-075 | 线程协作要求 | 另一个 Codex 线程作为 VLN 前瞻技术专家，需要与本线程的系统架构工作协同 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-076 | 分层复杂度约束 | 架构分解时每一层级的实体个数应控制在约 7 个，允许范围为 5 到 9 个 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-077 | 生命体征数据新鲜度 | 心率延迟不超过 1 分钟；血氧与心率同级；血压按需测量，但要求每日均有更新 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 8 |
| F-078 | 人工服务转接条件与时效 | 当用户不会操作、机器人无法识别需求或用户处于紧急状态时，客服运营坐席需要介入或转接；响应时效不超过 3 分钟 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 8 |
| F-079 | 当前样机本体基线 | 当前样机尺寸为 1139 x 500 x 600 mm，自重约 50 kg，采用两轮差速加万向轮底盘，具备机身升降、机身俯仰和头部俯仰三个附加自由度，带电动抽屉式储物仓 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 8 |
| F-080 | 当前样机导航基线 | 当前样机已实现基于 VLN + 激光 SLAM + 导航算法的导航闭环，SLAM 负责建图和位姿输出，VLN 基于 ASM 地图、实时视觉观测和位姿做动作推理，但当前存在反应慢、行走犹豫的问题 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 8 |
| F-081 | 当前样机能力分布 | 当前样机已具备成熟麦克风阵列、自然语音交互、可用问诊能力，以及“心率广播外设触发 + VLN 寻人 + 储物仓推出”的紧急给药 Demo；身份识别效果不够好，家属 App 和云服务仍为空白 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 8 |
| F-082 | 第三方平台准入方式 | 第三方平台按白名单审核接入 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 8 |
| F-083 | 小批量试点基线 | 小批量试点预期为 100 台、100 户、运行 1 个月 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 8 |
| F-084 | 穿戴受限时的兜底交互 | 当穿戴实时数据能力受限时，一期需要更多依赖问诊式交互 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 8 |
| F-085 | 陪伴默认人设 | 一代机器人默认采用“亲切家人型”人设，并允许基于对用户的了解做有限个性化调整 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| F-086 | 主动交互授权边界 | 长时间沉默、情绪低落等主动交互需用户授权；久坐久卧、到点提醒、回家问候可按条件主动发起，其中夜间回家问候需采用柔和灯光和低音量 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| F-087 | 长期记忆范围 | 重要纪念日、健康历史、用户习惯偏好、用户主动提起的重要家庭事件允许长期记忆；原始对话默认不长期保存，除非对应上述归档片段或用户主动要求记忆 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| F-088 | 一代安全保障优先级 | 一代安全保障优先覆盖久卧不起、摔倒、厨房明火/水烟/燃气泄漏、陌生人闯入、夜间离床、门窗未关 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| F-089 | 低电量降级设想 | 低电量时应先提醒用户，并在任务与回充之间做剩余电量规划；若剩余电量不足以支撑回充，则对用户做强提醒，并在用户响应前暂停并挂起当前任务 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| F-090 | 定位异常降级设想 | 定位异常时优先静默自恢复；若无法找回，则结合当前观测重新定位 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| F-091 | 其他关键降级设想 | 传感器失效需按传感器类别设计降级策略；网络断开由端侧能力接管；储物仓卡滞时暂停运动并提醒用户检查夹手风险 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| F-092 | 样机保留方向 | 最希望保留的方向是全向观测能力但减少传感器数量、电动开合储物仓、屏幕交互能力 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| F-093 | 样机重构方向 | 最希望重构的方向是整机减重到 40 kg 以下、更强的多模态交互，以及能基于连续历史信息做高层综合决策的导航栈 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 9 |
| F-094 | 需求文档编辑边界 | `input/00_requirements/00_user_requirements_input.md` 仅由用户本人修改，Codex 线程只读取、不编辑该文件 | confirmed | 用户本轮说明 |
| F-095 | VLN 文档协作边界 | `docs/09_research/01_vln_role_analysis_and_technical_plan.md` 来源于独立 `VLN` 专项线程，现已纳入版本控制；当前线程以其为正式技术输入，并可在后续需要时继续维护 | confirmed | 用户本轮说明 |
| F-096 | 记忆治理可见性 | 老人本人和子女允许在 App 中查看、修改和删除长期记忆；修改时需要提醒可能影响后续功能 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 10 |
| F-097 | 陪伴配置权限 | 纪念日、提醒、主动交互频率和人设强度等配置只允许老人本人和子女调整；冲突时需确认 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 10 |
| F-098 | 空间动作边界 | 卫生间默认保守处理，除非明确发现紧急场景，否则机器人不进入；第一代机器人不考虑走出入户门 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 10 |
| F-099 | 安全事件自动动作 | 陌生人闯入允许主动驱离预案；夜间离床经授权后允许柔和灯光查看；门窗未关允许提醒用户、推送 App，并在条件允许时联动智能家居关闭 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 10 |
| F-100 | 故障恢复与停机边界 | 低电量、定位异常、关键传感器失效时希望系统更积极恢复；当失效状态导致机器人无法识别任何障碍物时，必须停止运动 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 10 |
| F-101 | 伴生系统职责分工 | 家属 App 承接信息推送、联络和远程控制指令；云服务承接问诊和买药等体系服务；后台运营坐席承接人工联络；穿戴提供运动状态和生命体征；智能家居提供环境事件 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 10 |
| F-102 | 全生命周期规划要求 | 工作流必须覆盖从需求形成到上市运营和下一代回灌，并在 Linear 中可见 | confirmed | 用户本轮说明 |
| F-103 | 自主设想权限 | 当问题尚未澄清但推进不能停时，允许 Codex 先提出自己的设想，再提交用户审核 | confirmed | 用户本轮说明 |
| F-104 | 人工服务经济性约束 | 用户接受保留客服运营坐席作为一代首线人工服务提案，但明确指出该能力的实际覆盖形态仍会受公司经营投入产出比影响 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 26 |
| F-105 | `KBT-13` 时效定义修正 | 用户要求澄清“医疗专业主体 `10 分钟` 内给出接单结果”的定义；其含义应是服务已受理，而不是已经给出首轮专业回复 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 26 |
| F-106 | 验证 Demo 三芯片职责分层 | `RK3576` 负责交互主控，`S100Pro` 负责整机视觉接入、导航控制与算法运行，`AT32F457VET7` 负责整机电机 / 传动控制（除底盘）及 `IMU`、超声波等传感器接入 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 38 |
| F-107 | 验证 Demo 视觉模组事实 | 验证 Demo 采用 `8` 个独立视觉模组：`4` 个高位双目环视模组和 `4` 个低位超广角模组；高位双目约 `75cm`，作为 `VLN` 主观测输入；低位超广角约 `18cm`，原计划用于地面观测与 `SLAM` 匹配，但实际未有效用上；长焦相机同样未有效用上 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 38 |
| F-108 | 验证 Demo 双麦阵成因 | `6` 麦阵位于头顶，但圆形大屏上沿对其形成遮挡和反射，因此又在颈部增加 `8` 麦阵进行修补 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 38 |
| F-109 | 验证 Demo 重量修正 | 验证 Demo 整机重量修正为 `50kg`，此前 `70kg` 为输入错误 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 38 |
| F-110 | 验证 Demo 电池与热配置 | `466.2Wh + 被动散热` 为验证 Demo 真实实装配置 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 38 |
| F-106 | IPD 参考要求 | 全生命周期管理需要参考 IPD（集成产品开发）流程 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-107 | 架构冻结时间要求 | 产品定义与架构冻结争取在 2026-03-31 达成 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-108 | OODA 革新要求 | 需要理解并革新 OODA 在 AGI 与具身智能时代的用法，并考虑单轮 OODA 跨越的时间尺度、空间尺度及其动态调整能力 | confirmed | `input/00_requirements/00_user_requirements_input.md` 对 Codex 的要求 |
| F-109 | `KBT-10` 审阅结论 | 用户已在 `Step27` 接受 `R1` 到 `R7` 七个能力包、接受无机械臂的一代递送边界，并接受把结构、重量、功耗、外观纳入同一条工程护栏 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 27 |
| F-110 | 储物仓措辞修正要求 | 用户指出“仓门卡滞审计”措辞生硬，需要改成更直观、非生造词的表达，并解释其含义 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 27 |
| F-111 | 穿戴兼容冻结需求 | 当前主线在 `KBT-10` 之后切到 `KBT-15`，需要独立冻结一期穿戴设备兼容范围、接入模式与数据字段，而不是把它混在健康总线里继续漂移 | confirmed | 当前工作流推进 |
| F-112 | `KBT-15` 审阅结论 | 用户已接受把一期兼容范围冻结到“设备类别 + 品牌层 + 产品线层”，接受 5 类接入模式，接受 7 类字段分组，并接受 `UWB` 继续保留为观察线 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 27 |
| F-113 | `UWB` 样品即将到位 | 用户近期将拿到 `UWB` 外设样品，后续测试结果会回写 `input/00_requirements/00_user_requirements_input.md` 作为新的架构输入 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 27 |
| F-114 | `KBT-14` 审阅结论 | 用户已接受 `UWB` 的一代角色冻结为“主线不进入、增强线待样品验证、生命体征继续保留研究观察线”，并接受粗定位边界、活动状态边界和 `S1-S5` 样品验证门 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 28 |
| F-115 | `KBT-16` 恢复主评审 | `KBT-14` 收口后，下一优先级恢复为 `KBT-16` 量产预备判定标准 | confirmed | 当前工作流推进 |
| F-116 | `KBT-16` 审阅结论 | 用户已接受 `G5` 的 `7` 个判定域、当前 `7` 条通过条件，以及“小批量试点可执行 + 随时可以开发布会”的硬定义；对 `功耗` 的疑问实质上是要求说明其与续航、发热等强感知属性的关系 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 30 |
| F-117 | `KBT-12` 审阅结论 | 用户已接受 `V1-V7` 七个验证域、`100 台 / 100 户 / 1 个月` 四层试点框架与 `P / W / B` 规则，并要求把睡眠监测提升为 `必须有`，把找物能力提升为 `应该有` | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 31 |
| F-118 | `KBT-12` 可选能力扩展 | 用户同意将“阿尔茨海默症相关交互测试与缓解功能、外出未归、美好瞬间记录、休闲娱乐”收敛到一代 `MVP` 的 `可以有` 范围 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 31 |
| F-119 | 当前阶段定位修正 | 用户明确指出当前项目仍处于“产品需求基本完成后的系统架构设计与技术研判阶段”，当前目标是形成完整系统架构设计、提交 `PDCP` 评审，并下发总体方案供各模块展开设计 | confirmed | 用户本轮说明 |
| F-120 | `KBT-31` 审阅意见 | 用户在 `Step32` 中接受完整产品系统边界、四条一级业务闭环、部署边界和 `PDCP` 作为系统边界冻结门的定位，但指出当前总体架构基线过于偏向软件 / 算法视角，要求把机器人本体作为软硬一体产品实体显式纳入系统架构，并在此基础上重新审视一级接口面是否足以支撑模块并行设计 | confirmed | `Step32` |
| F-121 | Claude 协作评审输入 | 用户在“对 Codex 的要求”第 `12` 条中要求认真与 Claude Code 协作，并在第二轮 `KBT-31` 审阅中明确指定 [docs/08_reviews/01_architect_review_and_plan.md](../08_reviews/01_architect_review_and_plan.md) 作为外部架构评审输入 | confirmed | `docs/00_governance/06_claude.md`、`Step32` |
| F-122 | `KBT-31` 第三轮审阅结论 | 用户在 `Step33` 中接受完整产品系统边界、四条一级业务闭环、端侧 / 云侧 / 伴生系统部署边界，以及“双视角一致性检查机制 + Body Capability Contract + 接口稳定性策略”共同构成当前一级接口与治理基线，并接受 `PDCP` 通过后不再回退重定义系统边界 | confirmed | `Step33` |
| F-123 | 纯视觉对比基线原则 | 深度相机 / 激光雷达只做研发对比基线与真值参考链路，不作为产品级 fallback | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 36 |
| F-124 | 纯视觉不过线的节奏原则 | 若纯视觉路线不过线，优先延迟产品节奏，而不是回退主动传感主线 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 36 |
| F-125 | 当前内存与存储价格工作口径 | 当前工作口径按 `1 USD ≈ 6.9 CNY`、`LPDDR5 ≈ 15 USD / GB`、`eMMC ≈ 15 USD / 32GB` 粗算，用于评估 `C1` 子桶压力 | confirmed | `docs/03_p2_feasibility/04_hardware_software_selection_matrix.md` |
| F-126 | 一代算力与控制域收敛方向 | 验证平台中的 `RK3576` 与 `S100Pro` 职责必须合并到一颗主控 `SoC` 上；一代硬件架构至少收敛到“主控 `SoC` + 实时控制 `MCU`”两芯片 | confirmed | 用户本轮说明 |
| F-127 | 一代视觉与主动传感收敛方向 | 一代默认主线删除 `4` 固态激光雷达与 `4` 超广角相机，主视觉组合进一步收敛为 `1` 组双目 + `2` 个单目 | confirmed | 用户本轮说明 |
| F-128 | 一代近场传感删减方向 | 底部超声波与药箱 `ToF` 不进入一代默认主线，需通过其他避障与仓门安全方案补足闭环 | confirmed | 用户本轮说明 |
| F-129 | 一代头部架构方向 | 相机优先放在头部，头部自由度明确增加，用头部运动提高视野覆盖率并增强拟人感 | confirmed | 用户本轮说明 |
| F-130 | 一代声学收敛方向 | 麦克风阵列收敛为 `1` 个并优先放在头部；扬声器优先放在头部或接近头部的躯干位置 | confirmed | 用户本轮说明 |
| F-131 | 一代本体自由度与底盘方向 | 不追求躯干复杂自由度；底盘可评估全向方案，但当前设计基线继续保留“两轮差速 + 全向轮” | confirmed | 用户本轮说明 |
| F-132 | 一代 Agent 能力抽象方式 | 接受把 `OpenClaw / Claude Code / Codex` 这类 AI 生产力工具抽象为 Kinbot 的 Agent 增强平面，而不是直接写成产品一级模块 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 41 |
| F-133 | 一代 Agent 正式范围 | 一代正式纳入长期记忆、技能化能力组织、连接器抽象与受控任务编排 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 41 |
| F-134 | 自主创造新技能边界 | “自主创造新技能”继续停留在研究线，不作为一代正式承诺 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 41 |
| F-135 | 集团概念评审时点 | 集团董事长已将机器人方向定义为集团长期跃迁的重要方向，当前即将进入集团正式概念评审 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 42 |
| F-136 | 家庭机器人首发目标家庭 | `Kinbot` 首发目标家庭进一步收敛为独居老人或子女不在身边的老两口家庭 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 42 |
| F-137 | 家庭机器人首发核心问题 | `Kinbot V1` 首发核心问题进一步收敛为老人慢病管理与用药协同 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 42 |
| F-138 | EMT 必须审批项 | 本次概念评审必须拿到的结论是首发核心功能与场景切口，以及 `10` 个月 / `9000` 万 / `55` 人总盘子的分阶段投入机制 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 42 |
| F-139 | EMT 最好一并确认项 | 本次概念评审最好一并确认该方向作为战略级投入下的首款产品定位，以及进入市场的方式与节奏 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 42 |
| F-140 | 本体团队建设优先级 | 本体团队亟需经验丰富、系统思维强、尽可能横跨硬件与结构并对本体成果负责的 `SE` | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 43 |
| F-141 | 算法团队建设优先级 | 算法团队亟需具原创能力、思维活跃、对具身智能充满热情的人才，以模型和数据方法弥补几何与规则路线的薄弱并创造弯道超车机会 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 43 |
| F-142 | 软件团队建设优先级 | 软件团队亟需构建机器人的 `OpenClaw`，并利用 `AI Agent` 最前沿技术重构系统与应用开发模式 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 43 |
| F-143 | 招聘节奏原则 | 招聘优先级 `1 / 2 / 3 / 4` 需要显式拉开；对没想清楚或偏传统保留方法的岗位，可降低优先级或推迟预期入职时间，并随新方法进展复审 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 43 |
| F-144 | 应用后端架构岗位补充 | 当前团队招聘需求需补充 `应用后端架构师`，用于承接家庭机器人应用侧后端架构、AI 能力与业务系统融合，以及可观测与持续交付体系建设 | confirmed | 用户本轮指令 |
| F-145 | 高级结构岗位补充 | 当前团队招聘需求需补充 `高级结构工程师`，用于承接机器人本体结构、传动、布局、工艺与试产闭环，补强本体高端产品感与工程落地能力 | confirmed | 用户本轮指令 |
| F-146 | 导航前瞻路线升级 | 模型应从 `VLN` 向 `NFM`（导航基础模型）演进，不再分散地解决问题，并应减小 `SLAM + 路径规划` 这类经典算法在高层认知中的占比，非必要不保留 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 46 |
| F-147 | `NFM` 重点能力 | 当前前瞻技术主线必须重视 `NFM` 中的空间智能与长期记忆建设 | confirmed | `input/00_requirements/00_user_requirements_input.md` Step 46 |

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
| A-061 | 经典串行单环 OODA 不足以描述 Kinbot 的运行机制，Kinbot 一代正式采用多尺度、并发、可中断、可动态调度的 OODA | confirmed | `KBT-28` 审阅结论 |
| A-062 | `Orient` 在 Kinbot 中不应只承担情境理解，还应承担对 `Observe` 结果的认知评价、尺度选择、时域压缩和子环切换 | confirmed | `KBT-28` 审阅结论 |
| A-063 | `R4 关系与服务环` 是一代正式架构层，而不是仅作为运营层补充 | confirmed | `KBT-28` 审阅结论 |
| A-064 | `OODA Scale Scheduler` 需要以一级架构能力身份出现，并成为运行时主导子环切换入口 | confirmed | `KBT-28` 审阅结论 |
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
| A-086 | 一代量产默认线应先按 `8GB RAM + 64GB Flash` 组织；`12GB + 64GB` 只作边界验证线，`16GB + 64GB` 及以上只作前瞻验证线或未来 `Pro SKU` 候选 | confirmed | 硬件专家线程最新评估反馈 |
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

建议下一轮优先按 `KBT-32` 当前提案继续清账：

1. 是否接受 `S1-S7` 这 `7` 个总体方案工作包？
2. 是否接受“每个模块必须提交 `7` 类产物”的下发要求？
3. 是否接受当前模块方案评审顺序，尤其是 `S4 / S5` 优先？
4. 是否接受“技术研判是输入约束，不反向重写系统边界”这一原则？
5. 是否接受 `PDCP` 通过后，模块先交“模块架构 + 接口草案”，再进入更细总体方案？
6. 是否接受 `D1 / D6 / D7` 与 `KBT-33` 治理要求作为 `KBT-32` 的显式输入？

## 6. 决策日志

| Date | ID | Topic | Decision / Update | Status |
| --- | --- | --- | --- | --- |
| 2026-03-08 | D-001 | 推进方法 | 从总体架构阶段进入“工作流 + 决策日志 + 逐层细化文档”的推进模式 | confirmed |
| 2026-03-08 | D-002 | 文档治理 | 当前阶段先补充流程和决策沉淀文档，再开始模块边界和核心数据结构设计 | confirmed |
| 2026-03-08 | D-003 | 产品聚焦 | 一代产品聚焦中国大陆居家养老场景，首发目标用户为独居老人或子女不在身边的老两口 | confirmed |
| 2026-03-08 | D-004 | 健康能力边界 | 一代产品意图已包含生命体征接入、跌倒/异常检测、问诊与医疗联动、用药管理和买药，但其中医疗和购药闭环的合规边界仍需细化 | confirmed |
| 2026-03-08 | D-005 | 自主行为边界 | 夜间默认静默但传感器全开；允许低侵入地主动靠近；允许礼貌且谨慎的主动打断；授权后允许自动上报异常 | confirmed |
| 2026-03-08 | D-006 | 实施条件 | 团队规模和资金条件支持平台化模块切分，并允许部分硬件 ODM | confirmed |
| 2026-03-08 | D-007 | 主价值排序 | 一代产品按“健康管理 > 陪伴交互 > 老人看护 > 家庭安全巡护”推进，资源优先保障健康闭环和陪伴入口 | confirmed |
| 2026-03-08 | D-008 | 医疗档案输入 | 历史医疗信息首版通过语音输入、App 上传和纸质报告识别进入系统 | confirmed |
| 2026-03-08 | D-009 | 医疗与购药闭环 | 首版包含交互式问诊、家属提醒、在线问诊转接、互联网医院开方购药、日常用药管理和紧急用药管理 | confirmed |
| 2026-03-08 | D-010 | 默认上报链路 | 高风险异常默认先联动家属，再争取打通社区/物业；120 联动暂不作为一期硬要求 | confirmed |
| 2026-03-08 | D-011 | 多角色权限 | 权限模型至少支持访客、保姆、老人本人、子女四类主体，并允许保姆模式和老人/子女高权限模型 | confirmed |
| 2026-03-08 | D-012 | 术语规范 | 当前统一的运行时认知中枢统一称为 `World State`；`World Model` 仅在表示可预测环境/任务动态的模型时使用 | confirmed |
| 2026-03-08 | D-013 | 一期生命体征接入 | 优先绑定穿戴设备获取实时信息，同时保留血压计等外设的软件接口 | confirmed |
| 2026-03-08 | D-014 | 一期紧急用药边界 | 机器人一期只做提醒取药、送药到人、提醒服药并确认、联系子女，不扩展更强自主处置 | confirmed |
| 2026-03-08 | D-015 | 权限冲突处理 | 老人与子女同权时，冲突命令必须二次确认 | confirmed |
| 2026-03-08 | D-016 | 硬件获取策略 | 底盘倾向自研，麦克风阵列自研，穿戴外设不自研，相机优先供应商并考虑自研深度估计模型，端侧算力按成本/周期/质量最优策略获取 | confirmed |
| 2026-03-08 | D-017 | 穿戴设备策略 | 一期按“套餐推荐/打包设备”推进，兼容优先级为手表手环 > 蓝牙血压计 > 蓝牙血糖仪 > UWB 雷达设备 | confirmed |
| 2026-03-08 | D-018 | 医疗与购药生态 | 互联网医院和购药链路以平台接入、复用和生态合作为主 | confirmed |
| 2026-03-08 | D-019 | 储物仓与递送 | 保姆模式和送药流程要求机器人本体具备储物仓和递送能力 | confirmed |
| 2026-03-08 | D-020 | 120 接口路线 | 优先通过手机 App/手机能力拨打，机器人直接入网拨号作为法规允许前提下的争取方向 | confirmed |
| 2026-03-08 | D-021 | 纸质报告复核 | OCR 入库不强制人工复核，但提供付费人工复核服务 | confirmed |
| 2026-03-08 | D-022 | 协作同步 | `docs/00_governance/01_workflow.md` 的阶段性待办和架构产物 issue 已同步到 Linear 项目 `Kinbot OODA 架构到量产预备`，本地 repo 作为事实源，Linear 作为协作系统 | confirmed |
| 2026-03-08 | D-023 | 中文化要求 | 本地 Markdown 文档和 Linear 项目、里程碑、issue、文档统一使用中文维护 | confirmed |
| 2026-03-08 | D-024 | 项目总目标 | 项目以 2026-12-31 达到量产预备状态为主节点，并以 2027 年 1 月作为 MVP 验证窗口 | confirmed |
| 2026-03-08 | D-025 | 后台人工服务 | 首版系统需要后台人工服务能力，并按在线问诊式人工协同预留状态和审计接口 | confirmed |
| 2026-03-08 | D-026 | UWB 路线 | UWB 作为一期候选感知增强路线保留，但是否纳入首版要在技术成熟度评估后决定 | confirmed |
| 2026-03-08 | D-027 | 机器人拨号范围 | 机器人直接入网打电话仅做架构预留，不进入一期预研 | confirmed |
| 2026-03-08 | D-028 | 储物仓边界 | 储物仓按紧凑、通用、灵活空间设计，递送链路依赖机器人运动而非复杂机械操作 | confirmed |
| 2026-03-08 | D-029 | 人工复核执行方式 | OCR 付费人工复核优先由公司关联团队承接，并复用现有平台能力 | confirmed |
| 2026-03-08 | D-030 | 项目时间线起点 | 项目按 2026-01-01 起算，其中 2026 年 1 到 2 月主要做需求收集和 Demo 概念验证 | confirmed |
| 2026-03-08 | D-031 | 目标系统边界 | 机器人是目标系统，穿戴、智能家居、手机 App、后台云服务属于伴生系统 | confirmed |
| 2026-03-08 | D-032 | 穿戴数据策略 | 一期不把持续实时手表心率作为硬依赖，必要时接受问诊式、补采式或较低实时性的数据路径 | confirmed |
| 2026-03-08 | D-033 | 人工服务首线 | 后台人工服务首线为客服运营坐席，其他角色通过转接进入 | confirmed |
| 2026-03-08 | D-034 | UWB 价值排序 | UWB 一期候选用途按“活动状态判断 > 粗定位 > 生命体征监测”排序 | confirmed |
| 2026-03-08 | D-035 | 第三方责任边界 | 第三方平台负责交付，机器人负责准入审核、信息准确传递和审计记录 | confirmed |
| 2026-03-08 | D-036 | 储物仓能力分级 | 储物仓一代按“必须有 / 应该有 / 可以有”分层建设，先做防夹手、电动开关和开关状态记录 | confirmed |
| 2026-03-08 | D-037 | 量产预备定义 | 量产预备状态定义为产品定型、小批量试点、随时可以开发布会 | confirmed |
| 2026-03-08 | D-038 | 健康数据时效 | 一期按“心率和血氧不超过 1 分钟延迟、血压每日更新”的口径定义第一版数据新鲜度约束 | confirmed |
| 2026-03-08 | D-039 | 人工服务响应 | 客服运营坐席作为首线人工服务，在用户不会操作、机器人无法理解需求或用户处于紧急状态时介入或转接，目标响应时效不超过 3 分钟 | confirmed |
| 2026-03-08 | D-040 | 样机现状基线 | 当前样机的本体、导航、语音、问诊和紧急给药 Demo 能力已作为后续量产化架构收敛的现实基线 | confirmed |
| 2026-03-08 | D-041 | 外部平台准入 | 第三方平台按白名单审核接入 | confirmed |
| 2026-03-08 | D-042 | 小批量试点基线 | 小批量试点暂按 100 台、100 户、运行 1 个月作为基线设想 | confirmed |
| 2026-03-08 | D-043 | 澄清节奏调整 | 在健康链路拿到第一版足够约束后，后续问题澄清改为“健康、陪伴交互、安全保障”三条线并行推进，不再单线深挖健康 | confirmed |
| 2026-03-08 | D-044 | 线程协作方式 | 涉及 VLN 技术路线的判断与评估时，本线程需与前瞻技术专家线程协作并交叉校验 | confirmed |
| 2026-03-08 | D-045 | 分层复杂度控制 | 后续架构文档和系统拆分继续遵守“每层约 7 个实体，允许范围 5 到 9 个”的复杂度约束 | confirmed |
| 2026-03-08 | D-046 | 陪伴默认策略 | 一代机器人默认采用亲切家人型陪伴人设，并允许在边界内做有限个性化调整 | confirmed |
| 2026-03-08 | D-047 | 主动交互边界 | 长时间沉默和情绪低落等主动交互需用户授权；久坐久卧、到点提醒和回家问候可按条件自动触发，其中夜间回家问候需柔和灯光和低音量 | confirmed |
| 2026-03-08 | D-048 | 记忆策略 | 长期记忆保留纪念日、健康历史、用户习惯偏好和重要家庭事件；原始对话默认不长期保存 | confirmed |
| 2026-03-08 | D-049 | 安全优先级 | 一代安全保障优先覆盖久卧不起、摔倒、厨房危险、陌生人闯入、夜间离床和门窗未关 | confirmed |
| 2026-03-08 | D-050 | 降级策略方向 | 低电量、定位异常、传感器失效、网络断开和储物仓卡滞已形成第一版降级方向，但仍需进一步量化阈值和停用条件 | confirmed |
| 2026-03-08 | D-051 | 样机保留与重构方向 | 量产化阶段优先保留全向观测能力、电动储物仓和屏幕；优先重构整机重量、多模态交互能力和高层导航决策能力 | confirmed |
| 2026-03-08 | D-052 | VLN 边界吸收 | 结合 VLN 专项规划，Kinbot 继续采用“语义导航策略层 + 经典导航执行层”的分层路线，不让 VLN 直接接管底盘级安全控制 | confirmed |
| 2026-03-08 | D-053 | 文档编辑边界 | `input/00_requirements/00_user_requirements_input.md` 作为用户维护的需求事实源，由用户独占编辑；Codex 只读取并基于其继续推进其他文档 | confirmed |
| 2026-03-08 | D-054 | VLN 协作边界 | `docs/09_research/01_vln_role_analysis_and_technical_plan.md` 作为独立线程维护的专项规划文档，当前线程只引用其结论，不再更新该文件 | confirmed |
| 2026-03-08 | D-055 | 伴生系统闭环推进 | 新增一代 App、云服务与后台运营坐席最小闭环文档，用于冻结伴生系统的 MVP 边界、接口和失败回退策略 | confirmed |
| 2026-03-08 | D-056 | 健康事件主线冻结 | 新增健康事件管线文档，用于冻结一代健康信号来源、补采方式、风险分级、升级链路和降级约束 | confirmed |
| 2026-03-08 | D-057 | 记忆治理升级 | 长期记忆正式收敛为“用户可治理资产”，老人本人和子女可在 App 中查看、修改和删除，但系统必须提示功能影响 | confirmed |
| 2026-03-08 | D-058 | 配置权限收敛 | 纪念日、提醒、主动交互频率和人设强度等配置只允许老人本人和子女调整，冲突时进入待确认 | confirmed |
| 2026-03-08 | D-059 | 空间边界收敛 | 第一代机器人按“卫生间默认不进入、入户门不越界”冻结空间动作边界，明确高敏感空间例外只能由紧急场景触发 | confirmed |
| 2026-03-08 | D-060 | 安全自动动作边界 | 陌生人闯入、夜间离床和门窗未关三类事件，已形成第一版自动动作边界，可进入后续接口和验证设计 | confirmed |
| 2026-03-08 | D-061 | 运动保护底线 | 即使系统允许更积极恢复，只要失效状态导致机器人无法识别任何障碍物，运动必须立即停止 | confirmed |
| 2026-03-08 | D-062 | 全生命周期规划 | 新增全生命周期工作流文档，用 7 个阶段覆盖需求形成、架构冻结、工程化、量产导入、上市运营和下一代回灌 | confirmed |
| 2026-03-08 | D-063 | 设想驱动推进 | 当关键问题尚未关闭但推进不能停时，允许先形成“架构师设想包”，以 `provisional` 方式进入本地文档和 Linear 评审 | confirmed |
| 2026-03-08 | D-064 | Linear 生命周期映射 | Linear 不再只承接架构 issue，还要显式承接阶段门、工程化、量产导入、上市运营与回灌等跨阶段协作面 | confirmed |
| 2026-03-08 | D-065 | IPD 约束吸收 | 全生命周期工作流明确参考 IPD，并把 `2026-03-31` 作为当前周期“产品定义与架构冻结”的目标日期 | confirmed |
| 2026-03-08 | D-066 | OODA 方法论升级 | Kinbot 总体方法论已从固定单环 OODA 升级为“多尺度、并发、可中断、可动态调度”的 OODA，并作为正式基线继续推进 | confirmed |
| 2026-03-08 | D-067 | `R4` 正式入架构 | `R4 关系与服务环` 已被确认为一代正式架构层，承接长期记忆、习惯学习、提醒策略优化和服务编排 | confirmed |
| 2026-03-08 | D-068 | `Orient` 升级 | `Orient` 已正式升级为“情境理解 + 认知评价 + 尺度选择”层，而不只是事实解释层 | confirmed |
| 2026-03-08 | D-069 | 调度器升级 | `OODA Scale Scheduler` 已确认为一级架构能力，并将向状态机、安全矩阵、陪伴交互和后续接口设计同步 | confirmed |
| 2026-03-08 | D-070 | Demo 缺口主文档 | 新增 `docs/03_p2_feasibility/02_demo_to_mass_production_gaps.md`，将当前样机到量产预备的差距收敛为 7 个能力域、3 类阻断项和一份默认优先级排序 | confirmed |
| 2026-03-08 | D-071 | `KBT-18` 审阅结论 | 用户已确认 7 个能力域组织方式，接受 `D1` 与 `D7` 为阻断项，并要求把 `D6` 的阻断理由写实后再最终冻结 | confirmed |
| 2026-03-08 | D-072 | 储物仓工程动作 | 储物仓能力继续保留，但现有电动传动机构过大过重，应进入工程化重构清单 | confirmed |
| 2026-03-08 | D-073 | 外观形态工程动作 | 整机外观形态重构已是既定工程动作，应纳入 `P2` 整机平台与结构收敛范围 | confirmed |
| 2026-03-08 | D-074 | 工程化与 NPI 主文档 | 新增 `docs/03_p2_feasibility/03_engineering_npi_baseline.md`，将 `KBT-24` 收敛为 7 个工程化与 `NPI` 基线包、`G2` 七项放行条件和一份默认优先级排序 | confirmed |
| 2026-03-08 | D-075 | `KBT-18` 最终收口 | 用户已接受 `D6` 的阻断理由，因此 `KBT-18` 可作为正式基线关闭 | confirmed |
| 2026-03-08 | D-076 | `KBT-24` 审阅结论 | 用户已接受 7 个工程化与 `NPI` 基线包、`E4` 第一优先级、`E2` 既定重构动作和 `G2` 七项放行条件；同时强调伴生系统不能过度约束本体硬件 | confirmed |
| 2026-03-08 | D-077 | 软硬件选型主文档 | 新增 `docs/03_p2_feasibility/04_hardware_software_selection_matrix.md`，将一代选型收敛为 7 个选型域、三层路线结构和一组 `G2` 前置验证项 | provisional |
| 2026-03-08 | D-078 | `KBT-11` 审阅结论 | 一代端侧算力必须改为中国芯片主线；量产视觉主线改为双目 + 单目 `3 到 5` 个相机，自研深度估计；深度相机和激光雷达在 `EVT` 后退出量产主线 | confirmed |
| 2026-03-08 | D-079 | 前置评审清账机制 | 后续架构推进必须强提醒未关闭的前置 issue；前置未关闭时，后续 issue 只能起草，不能直接当成最终冻结结果 | confirmed |
| 2026-03-08 | D-080 | `KBT-5` 审阅结论 | 一级模块数量已按审阅意见从 `10` 压缩到 `9`，`world_state_memory` 命名和强制边界规则保持有效 | confirmed |
| 2026-03-08 | D-081 | `KBT-6` 审阅结论 | 世界状态一级实体已按审阅意见压缩到 `9`，并已作为当前正式基线关闭 | confirmed |
| 2026-03-08 | D-082 | `KBT-7` 评审焦点 | `KBT-7` 当前评审重点已收敛为两点：一是明确分层状态机与行为树的边界，二是显式枚举高风险异常与关键安全故障 | confirmed |
| 2026-03-08 | D-083 | `KBT-7` 控制结构结论 | 一代顶层 `Decision` 正式采用“分层状态机管理顶层模式，行为树管理叶子执行”的控制结构 | confirmed |
| 2026-03-08 | D-084 | `KBT-7` 枚举化结论 | 状态机层已正式冻结 7 类高风险异常和 7 类关键安全故障，供后续接口、验证与量产门复用 | confirmed |
| 2026-03-08 | D-085 | `KBT-7` 最终收口 | 用户已在 `Step18` 接受 `KBT-7` 的控制结构与两组一级枚举，因此 `KBT-7` 可作为正式基线关闭 | confirmed |
| 2026-03-08 | D-086 | `KBT-8` 当前评审焦点 | `KBT-8` 当前评审重点已收敛为三点：一是是否显式支持 `fault_protection_required`，二是是否把 `A1-A7/F1-F7` 纳入审批上下文，三是是否接受新的原因码骨架 | confirmed |
| 2026-03-08 | D-087 | `KBT-8` 接口强化结论 | 审批接口显式支持 `fault_protection_required` 返回结果，并支持 `state_transition_hint` 把关键安全故障直接映射到 `故障保护` | confirmed |
| 2026-03-08 | D-088 | `KBT-8` 最终收口 | 用户已在 `Step19` 接受 `fault_protection_required`、`A1-A7/F1-F7` 审批上下文映射与当前原因码骨架，因此 `KBT-8` 可作为正式基线关闭 | confirmed |
| 2026-03-08 | D-089 | `KBT-11` 恢复正式评审 | 当前核心状态与接口冻结前置项已关闭，`KBT-11` 恢复为当前技术路线评估主线，并重新进入正式评审通道 | confirmed |
| 2026-03-09 | D-090 | `KBT-11` Step20 审阅结论 | 用户原则上接受主线 / 备线 / 观察线分层，但要求更重端侧多模态模型正式进入主线评估，当前参数量按 `4B / 7B / 8B` 三档考虑，并评估 `FP8` 量化 | confirmed |
| 2026-03-09 | D-091 | `KBT-11` 端侧算力收敛边界 | 用户不同意当前就把一代端侧算力收敛到 `RK3588 + RK18xx 类协处理器` 或 `RK3576 + AI 协处理器` 双路线，要求优先寻找中国大算力端侧芯片方案 | confirmed |
| 2026-03-09 | D-092 | `KBT-11` 视觉主线复核 | 用户再次确认双目 + 单目 `3 到 5` 个相机 + 自研深度估计继续作为一代量产视觉主线 | confirmed |
| 2026-03-09 | D-093 | `KBT-11` 当前架构提案 | 当前提案将一代端侧算力主线改成“中国大算力端侧芯片专项评估”，并将 `RK3588 + RK18xx 类协处理器`、`RK3576 + AI 协处理器` 与 `RK3588` 单 SoC 下调为工程 / 成本 / 简化备线 | provisional |
| 2026-03-09 | D-094 | `KBT-11` 成本分配提案 | 当前提案新增 7 个成本桶，作为一代量产定型的初版成本约束；后续已在 `Step21` 后转入滚动修正 | provisional |
| 2026-03-09 | D-095 | `KBT-11` 第二轮审阅结论 | 用户已在 `Step21` 接受中国大算力专项主线、`RK` 备线下调、端侧 `4B / 7B / 8B + FP8` 主线评估、以及双目 + 单目量产主线视觉路线 | confirmed |
| 2026-03-09 | D-096 | 成本方向性修正 | 用户要求对成本分配继续滚动修正：`C1` 预计上修约 `300` 元，`C3` 存在下修空间，`C5` 预计上修，并要求单独 issue 持续确认最终分布 | confirmed |
| 2026-03-09 | D-097 | 成本分析补充文档 | 新增 `docs/03_p2_feasibility/05_cost_structure_and_technology_downpath.md`，将滚动 BOM 基线、降本主战场、控涨项和关键技术路径单独沉淀 | confirmed |
| 2026-03-09 | D-098 | `KBT-11` 最终收口 | `KBT-11` 作为“软硬件选型矩阵”已完成第二轮审阅收口，当前选型主线和备线结构可作为正式基线关闭 | confirmed |
| 2026-03-09 | D-099 | 成本协作拆分 | 新增 `KBT-29` 单独承接整机 BOM 成本结构、降本路线和变更触发规则，避免把路线评审与持续成本控制混在同一 issue 中 | confirmed |
| 2026-03-09 | D-100 | `KBT-29` 审阅结论 | 用户已在 `Step22` 接受把 `C1 / C3 / C5` 的方向性修正纳入滚动成本基线，接受 `C2 / C6 / C7` 作为一代显式降本主战场，并接受把 BOM 成本结构与降本路线拆成独立 issue 持续跟踪 | confirmed |
| 2026-03-09 | D-101 | `C5` 基线状态 | 用户明确指出 `C5` 当前建议区间偏低，因此 `C5` 当前只能给出工作区间，尚未形成完全冻结的成本基线 | confirmed |
| 2026-03-09 | D-102 | `C4` 成本转移约束 | 在当前成本目标下，`C4` 更可能采用轮速计、`IMU`、超声波等简单传感器组合；因此任何压低 `C4` 的方案，都必须显式评估其对 `C1 / C2 / C5` 的成本转移 | confirmed |
| 2026-03-09 | D-103 | 功耗议题拆分 | 新增 `KBT-30` 单独承接整机功耗预算、能效控制和 `C5` 工作基线冻结，避免功耗问题继续稀释 `KBT-29` 的成本结构主线 | confirmed |
| 2026-03-09 | D-104 | `KBT-29` 第二轮审阅结论 | 用户已在 `Step23` 接受 `C1 / C3 / C5` 的方向性修正正式进入滚动成本基线，接受 `C2 / C6 / C7` 继续作为一代显式降本主战场，并接受 `C5` 只给工作区间、`C4` 低传感路线必须显式评估成本转移 | confirmed |
| 2026-03-09 | D-105 | `KBT-29` 最终收口 | `KBT-29` 作为整机成本结构与技术降本路线评审项，已在 `Step23` 完成第二轮审阅收口；后续成本主线转由 `KBT-30` 继续承接功耗预算、能效控制和 `C5` 基线冻结 | confirmed |
| 2026-03-09 | D-106 | 高端产品感知护栏 | 以后每一阶段都必须同时检查系统各实体组合是否仍然呈现“聪明、温暖、精致”的高端产品感，并能支撑 `20000 到 30000 元` 售价区间，不能只以 `BOM` 收敛作为通过条件 | confirmed |
| 2026-03-09 | D-107 | `Step24` 售价监控基线 | 用户要求把整机售价也纳入基线持续监控，当前监控区间按 `20000 到 30000 元` 管理，而不再只写“约 `30000 元`” | confirmed |
| 2026-03-09 | D-108 | `KBT-30` 四工况基线 | 用户要求 `C5` 的工作基线按 `W1 静默待机 / W2 静止陪伴交互 / W3 连续运动 / W4 连续运动中的陪伴交互` 四类工况分别定义 | confirmed |
| 2026-03-09 | D-109 | 阶段门检查表升级 | 用户要求对 `6000 到 8000 元` BOM 约束下的每次显著降本动作，都附带“高端产品感知检查表”作为阶段门输入，并同步判断其对 `20000 到 30000 元` 售价区间的影响 | confirmed |
| 2026-03-09 | D-110 | 历史评审 issue 清账 | 本轮重新检查系统设计工作流与现存 issue 后，`KBT-9 / KBT-19 / KBT-20 / KBT-21` 已按“基线已形成、后续问题另行跟踪”的原则关闭，避免 Linear 长期滞留与本地事实源脱节 | confirmed |
| 2026-03-09 | D-111 | `KBT-30` 审阅结论 | 用户已在 `Step25` 接受双基线约束、接受 `C5` 四类工况划分，并接受混合工况功耗预算方法；同时要求将代表性时间占比调整为 `20 / 40 / 20 / 20` | confirmed |
| 2026-03-09 | D-112 | 高端产品感知维度调整 | 用户要求将高端产品感知检查表中的 `温暖感 / 从容感 / 服务感` 调整为 `舒适感 / 轻盈感 / 支持感`，并要求显式考虑 `安静感` 与 `宽敞感` 的归属 | confirmed |
| 2026-03-09 | D-113 | `KBT-30` 最终收口 | `KBT-30` 作为整机功耗预算与能效控制策略评审项，已在 `Step25` 完成当前轮次收口；后续进入实测冻结与阶段门化，不再停留在概念评审层 | confirmed |
| 2026-03-09 | D-114 | `KBT-16` 主文档启动 | 新增 `docs/06_p5_launch_readiness/01_mass_production_readiness_criteria.md`，将 `2026-12-31` 量产预备状态收敛为 `G5` 量产预备门、`7` 个判定域和 `7` 条通过条件的第一版提案 | provisional |
| 2026-03-09 | D-115 | Milestone 越界原因澄清 | 当前出现“先推进到量产准备里程碑”的观感，原因不是项目真的跨阶段推进，而是把 `KBT-18 / KBT-24 / KBT-16` 这类后置里程碑中的逆向约束型文档提前起草，用来给前置架构与技术路线提供反压约束 | confirmed |
| 2026-03-09 | D-116 | 当前优先级回调 | 为保持 IPD 阶段门纪律，当前主优先级已回调到尚未清账的前置里程碑：先清 `核心状态与接口冻结` 中的 `KBT-13 / KBT-10`，再清 `技术路线评估` 中的 `KBT-15 / KBT-14`，之后才恢复 `KBT-16 / KBT-12` 为主评审项 | confirmed |
| 2026-03-09 | D-117 | VLN 文档纳入主线版本控制 | `VLN` 专项线程已完成，`docs/09_research/01_vln_role_analysis_and_technical_plan.md` 现纳入主线版本控制，并可由当前线程继续作为正式技术输入引用与维护 | confirmed |
| 2026-03-09 | D-118 | `KBT-13` 主文档启动 | 新增 `docs/02_p1_architecture/12_human_service_and_telemedicine_boundaries.md`，用于冻结一代后台人工服务、在线问诊、第三方履约与公共应急之间的角色边界、接入链路、媒体策略和审计要求 | provisional |
| 2026-03-09 | D-119 | `KBT-13` 当前架构提案 | 一代人工服务链建议采用“机器人本地服务 -> 客服运营坐席 -> 医疗专业主体 / 第三方履约”的 4 层接力结构，媒体策略按“结构化上下文优先、音频优先、默认不启视频”冻结 | provisional |
| 2026-03-09 | D-120 | `KBT-13` 审阅结论 | 用户已在 `Step26` 接受 `KBT-13` 的 4 层接力结构、音频优先媒体策略与角色责任切分，同时要求把“客服运营坐席的服务经济性约束”写成显式风险，并澄清“接单结果”不等于首轮专业回复 | confirmed |
| 2026-03-09 | D-121 | 人工服务时效定义修正 | `客服 3 分钟响应` 被定义为首线人工主体已接入或明确接管会话；`医疗专业主体 10 分钟内给出接单结果` 被定义为服务已受理并返回结构化状态，而不是已给出专业建议 | confirmed |
| 2026-03-09 | D-122 | `KBT-13` 最终收口 | `KBT-13` 作为后台人工服务与在线问诊协同边界评审项，已在 `Step26` 完成当前轮次收口；后续只保留服务经济性与首轮专业回复时效作为运营侧继续收敛问题 | confirmed |
| 2026-03-09 | D-123 | `KBT-10` 主文档启动 | 新增 `docs/02_p1_architecture/13_medication_storage_and_indoor_delivery_requirements.md`，把一代储药与室内递送要求收敛为 7 个能力包、一条端到端主链和一组工程护栏 | provisional |
| 2026-03-09 | D-124 | `KBT-10` 审阅结论 | 用户已在 `Step27` 接受 `R1` 到 `R7` 七个能力包、接受无机械臂的一代递送边界，并接受把结构、重量、功耗、外观纳入同一条工程护栏 | confirmed |
| 2026-03-09 | D-125 | 储物仓措辞修正 | 将“仓门卡滞审计”改写为“仓门异常事件记录与回溯”，并明确其含义是为售后定位、问题复现和质量闭环保留结构化事件记录 | confirmed |
| 2026-03-09 | D-126 | `KBT-10` 最终收口 | `KBT-10` 作为储药与室内递送要求评审项，已在 `Step27` 完成当前轮次收口；后续只保留“防误取 / 防错拿是否上调”和“最小开仓感知组合”作为工程侧继续收敛问题 | confirmed |
| 2026-03-09 | D-127 | `KBT-15` 主文档启动 | 新增 `docs/03_p2_feasibility/07_phase1_wearable_compatibility_and_data_fields.md`，用于冻结一期穿戴设备兼容范围、接入模式、新鲜度约束和首版数据字段 | provisional |
| 2026-03-09 | D-128 | `KBT-15` 审阅结论 | 用户已接受“设备类别 + 品牌层 + 产品线层”的冻结深度，接受 5 类接入模式、7 类字段分组，并接受 `UWB` 继续保留为观察线 | confirmed |
| 2026-03-09 | D-129 | `KBT-15` 最终收口 | `KBT-15` 作为一期穿戴设备兼容范围与数据字段评审项，已在当前轮次完成收口；后续只保留“具体型号白名单”和“实际接入验证结果”作为工程与商务侧继续收敛问题 | confirmed |
| 2026-03-09 | D-130 | `KBT-14` 主文档启动 | 新增 `docs/09_research/02_uwb_phase1_maturity_and_integration_value.md`，用于冻结 `UWB` 在一代中的角色、成熟度判断、样品验证门和接入价值边界 | provisional |
| 2026-03-09 | D-131 | `UWB` 当前架构结论 | 一代 `UWB` 当前不进入主线，不进入主导航硬依赖；粗定位和活动状态判断最多作为样品验证后的增强线候选，生命体征继续保留研究观察线 | provisional |
| 2026-03-09 | D-132 | `KBT-14` 审阅结论 | 用户已在 `Step28` 接受 `UWB` 的一代角色冻结、粗定位边界、活动状态边界和 `S1-S5` 样品验证门 | confirmed |
| 2026-03-09 | D-133 | `KBT-14` 最终收口 | `KBT-14` 作为 `UWB` 技术成熟度与接入价值评审项，已在当前轮次完成收口；后续只保留样品实测结果和量化通过阈值作为技术验证侧继续收敛问题 | confirmed |
| 2026-03-09 | D-134 | `KBT-16` 恢复主评审 | 按既定前置顺序，`KBT-14` 收口后恢复 `KBT-16` 为当前主评审项 | confirmed |
| 2026-03-09 | D-135 | `KBT-16` 审阅结论 | 用户已在 `Step30` 接受 `G5` 的 `7` 个判定域、当前 `7` 条通过条件，以及“小批量试点可执行 + 随时可以开发布会”的硬定义；同时要求明确解释 `功耗` 之所以与 `BOM / 售价` 同级，是因为它直接影响续航、发热等用户强感知属性 | confirmed |
| 2026-03-09 | D-136 | `KBT-16` 功耗同级约束解释 | `功耗` 被提升为量产预备同级约束，不是因为它是财务指标，而是因为它直接牵动续航、发热、噪声、充电和长期体验，并反向约束整机热设计与形态 | confirmed |
| 2026-03-09 | D-137 | `KBT-16` 最终收口 | `KBT-16` 作为量产预备判定标准评审项，已在当前轮次完成收口；后续只保留 `G5` 量化细化问题作为执行门继续收敛项 | confirmed |
| 2026-03-09 | D-138 | `KBT-12` 主文档启动 | 新增 `docs/05_p4_beta_dvt/01_mvp_validation_plan.md`，用于冻结一代 `MVP` 范围划分、验证域、试点执行框架和放行规则 | provisional |
| 2026-03-10 | D-139 | `KBT-12` 审阅结论 | 用户已在 `Step31` 接受 `V1-V7`、四层试点框架与 `P / W / B` 规则，并要求把睡眠监测提升为 `必须有`，把找物能力提升为 `应该有`，同时将阿尔茨海默症相关交互测试、外出未归、美好瞬间记录和休闲娱乐收敛到 `可以有` | confirmed |
| 2026-03-10 | D-140 | 睡眠监测一代边界 | 一代 `MVP` 中的睡眠监测能力，当前收敛为“夜间离床、未按习惯起床和基础睡眠节律观察”，不承诺医疗级睡眠分期 | confirmed |
| 2026-03-10 | D-141 | `KBT-12` 最终收口 | `KBT-12` 作为量产预备与 `MVP` 验证计划评审项，已在当前轮次完成收口；后续只保留睡眠监测、找物和 `P / W / B` 量化阈值作为执行侧继续收敛问题 | confirmed |
| 2026-03-10 | D-142 | `KBT-25` 主文档启动 | 新增 `docs/06_p5_launch_readiness/02_production_introduction_launch_and_delivery_closure.md`，用于冻结量产导入、发布准备与交付闭环的状态定义、工作包和阻断项 | provisional |
| 2026-03-10 | D-143 | 当前主线阶段纠正 | 当前阶段正式纠正为“产品需求基本完成后的系统架构设计与技术研判阶段”，当前首要交付物是 `PDCP` 系统架构评审包与总体方案下发基线，而不是量产导入准备 | confirmed |
| 2026-03-10 | D-144 | `KBT-25` 降级为远期约束输入 | `KBT-25` 当前继续保留，但不再作为主评审线；其文档只作为后段生命周期约束输入，待 `PDCP` 架构冻结与模块方案下发完成后再恢复主线地位 | confirmed |
| 2026-03-10 | D-145 | `PDCP` 双文档启动 | 新增 `docs/02_p1_architecture/02_pdcp_system_architecture_review_package.md` 与 `docs/03_p2_feasibility/01_overall_solution_and_module_design_baseline.md`，分别承接系统架构评审和总体方案下发 | confirmed |
| 2026-03-10 | D-146 | `KBT-31` 审阅结论吸收 | 用户已在 `Step32` 接受完整产品系统边界、一级业务闭环、部署边界和 `PDCP` 作为系统边界冻结门的定位，但要求把机器人本体作为软硬一体产品实体显式纳入系统架构，并在此基础上重审一级接口面 | confirmed |
| 2026-03-10 | D-147 | `PDCP` 双视角架构提案 | 当前系统架构提案升级为“双视角基线”：一张图表达机器人本体作为产品实体的 `6` 个本体实体域，另一张图表达多尺度 `OODA + 9` 个一级模块的运行时功能架构 | provisional |
| 2026-03-10 | D-148 | 本体能力接口面提案 | 为支撑模块并行设计，当前提案在既有一级接口面之外补入 `Body Capability Contract`，将运动执行、感知采集、交互器件、电源与热状态、储物仓与仓门、平台健康与故障收敛为 `6` 组一级本体能力接口 | provisional |
| 2026-03-10 | D-149 | `KBT-32` 顺序约束 | 在 `KBT-31` 关闭前，`KBT-32` 不进入当前主评审；总体方案与模块方案下发必须建立在 `PDCP` 系统架构评审关闭之后 | confirmed |
| 2026-03-10 | D-150 | Claude 协作机制吸收 | `docs/00_governance/06_claude.md` 与 `docs/08_reviews/01_architect_review_and_plan.md` 现作为外部架构评审输入源纳入当前轮工作流；其中系统架构层意见直接吸收，模块执行层意见转入后续 issue | confirmed |
| 2026-03-10 | D-151 | 双视角一致性治理提案 | 为防止本体实体架构与运行时功能架构在后续模块设计中重新漂移，当前提案把“双视角一致性检查机制”纳入 `PDCP` 基线，并要求后续模块方案显式声明其依赖和约束的本体实体域 | provisional |
| 2026-03-10 | D-152 | 一级接口稳定性策略提案 | 当前提案把 `Body Capability Contract`、接口 `owner`、接口版本号和架构评审变更门共同纳入一级接口稳定性策略，在 `PDCP` 关闭前先冻结接口抽象与责任边界，不追求过早冻结全部实现细节 | provisional |
| 2026-03-10 | D-153 | `PDCP` 架构阻断输入提案 | 结合外部架构评审意见，当前提案显式把 `D1 端侧算力平台未收敛`、`D6 整机平台与关键器件基线未冻结`、`D7 伴生系统最小闭环缺失` 作为 `PDCP` 后续总体方案与模块设计的三项一级阻断输入 | provisional |
| 2026-03-10 | D-154 | `KBT-31` 第三轮审阅结论 | 用户已在 `Step33` 接受完整产品系统边界、一级业务闭环、部署边界以及“双视角一致性检查机制 + Body Capability Contract + 接口稳定性策略”共同构成当前一级接口与治理基线 | confirmed |
| 2026-03-10 | D-155 | `KBT-31` 最终收口 | `KBT-31` 作为 `PDCP` 系统架构评审包，已在第三轮审阅后完成当前轮次收口；当前主评审项恢复为 `KBT-32` 总体方案与模块方案下发基线 | confirmed |
| 2026-03-10 | D-156 | `KBT-32` 输入升级 | `KBT-32` 当前显式继承双视角总体架构、双视角一致性检查机制、一级接口稳定性策略，以及 `D1 / D6 / D7` 三项一级阻断输入 | confirmed |
| 2026-03-10 | D-157 | `KBT-11` 后修订结论 | `KBT-11` 关闭后发生一次正式基线修订：一代端侧算力主线进一步收窄为 `地瓜 S100 Pro（128 TOPS 版本）` 主线评估 + `RK` 工程/成本备线，并明确 `Atlas 200I A2` 与 `BM1688 / MLU220-M.2 / 同等级小算力芯片` 不进入一期候选池 | confirmed |
| 2026-03-10 | D-158 | 端侧算力需求定义升级 | 一代端侧算力需求的首要定义方式，正式升级为真实板级 `TTFT / TPS / 热稳态持续 TPS` 与任务模板约束；`TOPS` 仅保留为候选筛选指标，不再作为一期主决策依据 | confirmed |
| 2026-03-10 | D-159 | `VLN` 量化责任下发 | `VLN` 专家线程需承接 `P1 / P2 / P3` 任务模板、结构化动作输出、`N_out`、目标 `TTFT / TPS` 与“模型规模 × 输入规模 × 是否可上线”判定表，并将结果回写到 `S1 / S4 / S7` | confirmed |
| 2026-03-10 | D-160 | `KBT-32` 输入补强 | 总体方案与模块方案下发基线现显式吸收 `TTFT / TPS` 驱动的端侧算力定义，并要求 `S1 / S4 / S7` 共同承接相关验收口径与任务模板 | confirmed |
| 2026-03-10 | D-161 | 跨线程 Codex 协作规范 | 其他线程如修改已关闭 issue 对应文档，必须同步回写 `docs/00_governance/03_decision_log.md`、`README.md`、`CHANGELOG.md`、对应 Linear issue / 评论和下游承接文档，避免“单文件已改、工作流未闭环” | confirmed |
| 2026-03-17 | D-162 | Claude 提案吸收策略正式入主线 | 依据《两位 Claude 提案对比审阅与下一步计划》，主线架构正式采纳“三线吸收法”：保留当前系统级稳定边界，同时把技术结构优化与关系质量评价框架吸收到总体架构和 `PDCP` 评审包中 | confirmed |
| 2026-03-17 | D-163 | `PDCP` 主文档补入需求侧硬约束 | 依据《PDCP评审准备：需求侧约束总表、阻断问题沟通提案》，当前主线架构文档和 `PDCP` 评审包已显式补入需求侧硬约束总表，并把 `D1 / D6 / D7` 与关键路径关注项一并前置到会前评审语境中 | confirmed |
| 2026-03-17 | D-164 | 一代纯视觉传感器方案正式进入架构基线 | 依据量产主线收敛结果，一代传感器方案现作为正式架构提案进入总体架构与 `PDCP` 文档：量产主线采用“双目 + 单目 `3 到 5` 个相机 + 自研深度估计 + 多目几何融合”，不把深度相机与激光雷达作为量产依赖 | confirmed |
| 2026-03-17 | D-165 | 纯视觉主线的阶段边界与风险转移 | 深度相机与激光雷达只允许作为研发对比基线与真值参考链路；纯视觉主线带来的主要压力转移到 `C1` 端侧算力、`C5` 功耗与热设计、自动标定、低照鲁棒性和夜间闭环验证 | confirmed |
| 2026-03-17 | D-166 | `KBT-32` 吸收需求侧硬约束与纯视觉主线 | 总体方案与模块方案下发基线现正式继承需求侧硬约束总表、纯视觉传感器主线、算力调度器一级化、世界状态后续分层演进、分层免疫式安全与关系质量评价框架，不再只继承早期双视角和接口冻结结果 | confirmed |
| 2026-03-17 | D-167 | `S1-S7` 新增共同交付要求 | `S1-S7` 当前必须显式回应纯视觉路线的低照验证、自动标定、图像质量监测、夜间闭环和关系质量评价；其中 `S1 / S4 / S5 / S7` 为纯视觉主线核心承接方，`S3 / S5 / S6 / S7` 为关系质量与高端产品感核心承接方 | confirmed |
| 2026-03-17 | D-168 | Step36 成本与组织约束修订 | 当前一代整机 `BOM` 目标已从 `6000 到 8000 元` 下修为 `5000 到 6000 元`；团队规模目标由 `100+` 回调到 `60 到 80`，因此总体架构需从“高配完整系统”收敛为“核心闭环优先的轻高端系统” | confirmed |
| 2026-03-17 | D-169 | 一代主价值排序修订 | 当前主价值排序更新为“健康管理 > 陪伴交互 > 家庭安全巡护 > 老人看护”；一代主链由“健康 + 陪伴”主导，安全与看护更多表现为辅链与组合结果 | confirmed |
| 2026-03-17 | D-170 | 纯视觉主线不设产品 fallback | 深度相机与激光雷达在当前主线中只做研发对比基线与真值参考链路，不作为产品级 fallback；如果纯视觉不过线，优先调整产品节奏，而不是回退主动传感主线 | confirmed |
| 2026-03-17 | D-171 | 受控回流预留 | 默认仍坚持原始敏感数据端侧处理，但架构层允许预留“授权 + 脱敏 + 加密 + 时效受限 + 用途受限”的受控回流接口，不把其写成当前默认主基线 | confirmed |
| 2026-03-20 | D-172 | `C1` 子桶与内存路线收敛 | 当前 `C1` 必须拆成 `SoC / RAM / Flash / 高速外围` 四个子桶单独管理；其中 `RAM` 已成为一代默认量产线的首要成本驱动项 | confirmed |
| 2026-03-20 | D-173 | 一代默认量产内存线冻结 | 当前主线把 `8GB RAM + 64GB Flash` 作为一代默认量产线，把 `12GB + 64GB` 定义为边界验证线，把 `16GB + 64GB` 及以上定义为前瞻验证线或未来 `Pro SKU` 候选 | confirmed |
| 2026-03-20 | D-174 | 架构与方案下发吸收内存约束 | 总体架构、`PDCP` 评审包与 `S1-S7` 下发基线现正式吸收“默认量产线 vs 前瞻验证线”分层，不再默认让更重端侧模型路线直接进入一期量产标准配置 | confirmed |
| 2026-03-22 | D-175 | 验证 Demo 平台定位收敛 | 验证 Demo 正式收敛为“高冗余验证平台”，其价值在于本体能力验证、主动传感研发对比基线和纯视觉真值参考链，而不是一代量产架构前身 | confirmed |
| 2026-03-22 | D-176 | 高位主观测经验进入主线 | 验证 Demo 已证明高位双目主观测对 `VLN` 与环境理解有明确价值，因此一代主线继续坚持“头部 / 上半身优先承载核心视觉器件”的空间架构方向 | confirmed |
| 2026-03-22 | D-177 | 低位 / 长焦观测不直接继承 | 验证 Demo 中低位 `4` 超广角与长焦相机未真正进入主闭环，因此产品主线不继承其器件配置，只继承“地面补盲需求”和“中远距识别需求”这两类待重新论证的能力需求 | confirmed |
| 2026-03-22 | D-178 | 头部声学反向约束进入主线 | 验证 Demo 的双麦阵并存来自圆形大屏对头顶麦阵的遮挡与反射，这被正式视为头部视觉 / 屏幕 / 声学 / 结构未协同收敛的反向样本，一代产品不得继续采用“先定造型、再叠加麦阵修补”的方式 | confirmed |
| 2026-03-22 | D-179 | Demo 经验下发到 `PDCP` 与 `S1-S7` | 当前主线已要求 `PDCP` 和总体方案下发基线同步吸收验证 Demo 的三芯片职责分层、高位主观测经验、主动传感真值链定位，以及验证平台器件淘汰边界 | confirmed |
| 2026-03-23 | D-180 | 一代硬件表层架构继续收敛 | 当前主线正式把一代本体关键硬件架构收敛为“主控 `SoC` + 实时控制 `MCU`”两芯片基线，不再维持验证平台的 `RK3576 + S100Pro + MCU` 三芯片硬件表象 | confirmed |
| 2026-03-23 | D-181 | 一代纯视觉器件组合进一步收窄 | 当前主线将一代默认视觉组合进一步明确为 `1` 组双目 + `2` 个单目；`4` 固态激光雷达、`4` 超广角、底部超声波和药箱 `ToF` 不进入一代默认主线 | confirmed |
| 2026-03-23 | D-182 | 一代头部主动观察基线 | 当前主线明确把“头部多自由度 + 头部相机集中布置”定义为一代主动观察与拟人表达核心，以头部运动提升视野覆盖率并降低固定视角器件数量 | confirmed |
| 2026-03-23 | D-183 | 一代声学与结构收敛基线 | 当前主线把单麦阵头部优先和扬声器头部 / 上躯干优先定义为一代声学基线，不再接受双麦阵修补式架构 | confirmed |
| 2026-03-23 | D-184 | 一代本体自由度与底盘基线 | 当前主线明确不追求躯干复杂自由度；底盘可评估全向路线，但产品设计基线继续保留“两轮差速 + 全向轮” | confirmed |
| 2026-04-03 | D-185 | Step46 前瞻路线吸收 | 当前导航智能主线正式从“`VLN` 能力增强”升级为“`VLN -> NFM` 演进”；`VLN` 被降维定义为 `NFM` 中的指令驱动语义导航切片 | confirmed |
| 2026-04-03 | D-186 | 空间双帧正式进入主线 | `World State` 与 `NFM` 路线正式吸收 `semantic_global_frame + local_metric_frame` 双帧协同；`SLAM / VSLAM` 主要服务局部执行、局部安全和短时重定位，不再作为长期记忆与全局认知的默认真值源 | confirmed |
| 2026-04-03 | D-187 | 长期记忆分层重写 | 基础空间长期记忆（`room graph / target belief / topometric memory / drift alert`）前置到 `P0/P1`；个性化 / 行为长期记忆后置到 `P2` | confirmed |

## 7. 后续记录规则

- 新确认的信息，先写入“已确认事实”或“当前架构性判断”。
- 新的高代价选择，写入“决策日志”。
- 未关闭且会影响后续设计的问题，写入“尚未关闭的关键问题”。
- 每轮结束后，把“下一轮优先向用户确认的问题”收敛到不超过 6 个。
