# Kinbot_OODA 决策记录

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
| F-001 | 场景 | 家庭室内场景 | confirmed | `docs/REQUIREMENTS.MD` |
| F-002 | 核心任务 | 多模态交互陪伴、健康管理、安全保障 | confirmed | `docs/REQUIREMENTS.MD` |
| F-003 | 系统边界 | 移动交互机器人，不要求物理操作 | confirmed | `docs/REQUIREMENTS.MD` |
| F-004 | 移动形态 | 轮式移动，需要通过家庭低矮门槛 | confirmed | `docs/REQUIREMENTS.MD` |
| F-005 | 交互方式 | 语音、屏幕、灯光、手势、手机 App、远程控制 | confirmed | `docs/REQUIREMENTS.MD` |
| F-006 | 交互风格 | 偏陪伴型、社交型机器人 | confirmed | `docs/REQUIREMENTS.MD` |
| F-007 | 决策优先级 | 安全 > 合规 > 用户指令 > 任务完成率 > 效率 > 能耗 | confirmed | `docs/REQUIREMENTS.MD` |
| F-008 | 自主权边界 | 已授权行为需要做到完全自主 | confirmed | `docs/REQUIREMENTS.MD` |
| F-009 | 数据边界 | 原始视觉、语音、生物特征本地处理、匿名化、加密存储 | confirmed | `docs/REQUIREMENTS.MD` |
| F-010 | 端云原则 | 直接处理视觉、语音和运动安全的能力必须在端侧 | confirmed | `docs/REQUIREMENTS.MD` |
| F-011 | 离线原则 | 断网时运动和安全能力不应受影响 | confirmed | `docs/REQUIREMENTS.MD` |
| F-012 | 工程目标 | 续航 > 4 小时，尺寸建议不超过 50 x 50 x 120 cm，预算 6000 到 8000 元，MVP 时间点 2027 年 1 月 | confirmed | `docs/REQUIREMENTS.MD` |
| F-013 | 首发目标用户 | 首发聚焦独居老人或子女不在身边的老两口，后续代际再扩展到普通家庭 | confirmed | `docs/REQUIREMENTS.MD` Step 2 |
| F-014 | 首发市场 | 中国大陆 | confirmed | `docs/REQUIREMENTS.MD` Step 2 |
| F-015 | 健康管理方向 | 目标包含生命体征接入、跌倒/异常检测、结合历史医疗档案的问诊与医疗联动、用药管理和买药 | confirmed | `docs/REQUIREMENTS.MD` Step 2 |
| F-016 | 夜间自主边界 | 未授权或无异常情况下，夜间保持静默，但传感器全开 | confirmed | `docs/REQUIREMENTS.MD` Step 2 |
| F-017 | 主动靠近策略 | 允许主动靠近用户，但不追求高召回率 | confirmed | `docs/REQUIREMENTS.MD` Step 2 |
| F-018 | 打断策略 | 可在遵守社会公认礼仪的前提下有限度地主动打断，并允许谨慎探索“俏皮”人设 | confirmed | `docs/REQUIREMENTS.MD` Step 2 |
| F-019 | 异常上报边界 | 用户授权后允许自动上报异常 | confirmed | `docs/REQUIREMENTS.MD` Step 2 |
| F-020 | 资源约束 | 未来几个月团队规模可达 60 人以上，允许部分硬件 ODM，自研强项在消费电子、AI、大模型、多模态交互，未来一年资金量级 8000 万到 1 亿元人民币 | confirmed | `docs/REQUIREMENTS.MD` Step 2 |
| F-021 | 首版主价值排序 | 健康管理 > 陪伴交互 > 老人看护 > 家庭安全巡护 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| F-022 | 医疗档案来源 | 语音交互输入、手机 App 上传、纸质报告识别 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| F-023 | 医疗联动深度 | 首版包含交互式问诊、家属提醒、在线问诊转接、互联网医院开方购药、日常用药管理、紧急用药管理 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| F-024 | 购药能力 | 进入 MVP | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| F-025 | 高风险异常上报链路 | 默认先提醒家属，力争打通社区/物业；120 联动希望支持，但不作为第一期强要求 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| F-026 | 访客权限 | 默认允许发起交互，其他功能需老人本人授权后可用 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| F-027 | 保姆权限 | 需要单独的保姆模式，机器人与保姆形成分工协同关系，用于完成老人本人交代的事务 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| F-028 | 老人本人权限 | 在不违反最高优先级原则前提下，老人本人为最高权限主体，身份信息需绑定 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| F-029 | 子女权限 | 在绑定和授权后可与老人本人有同等权限 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| F-030 | 生命体征接入策略 | 一期优先绑定穿戴设备获取实时信息，同时保留血压计等外设的软件接入接口，医疗判断综合当时可获得的全部信息 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| F-031 | 紧急用药动作边界 | 一期动作边界为提醒取药、送药到人、提醒服药并确认、联系子女告知信息，不考虑更强自主处置 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| F-032 | 老人与子女冲突仲裁 | 老人与子女同权时，如出现冲突命令，必须二次确认 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| F-033 | 保姆模式协同范围 | 提醒、拿药、叫人、记录、汇报、远程确认等动作先预留 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| F-034 | 120 联动接口 | 一期架构层需要预留标准接口 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| F-035 | 端侧算力获取方式 | 以成本、周期、质量最优方式获取板子，购买或自研均可，具备自研能力 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| F-036 | 底盘策略 | 底盘预计自研，底盘本身尽量只承担动力职责并减少传感器堆叠 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| F-037 | 穿戴外设策略 | 穿戴生命体征外设不自研 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| F-038 | 相机策略 | 相机优先找供应商，尽量采用简单配置，不优先采购昂贵体积大的成品深度相机，并考虑自研深度估计模型 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| F-039 | 麦克风阵列策略 | 麦克风阵列自研 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| F-040 | 穿戴与设备兼容优先级 | 一期优先兼容现成手表/手环，其次蓝牙血压计、蓝牙血糖仪，再后是 UWB 雷达设备 | confirmed | `docs/REQUIREMENTS.MD` Step 5 |
| F-041 | 穿戴设备交付模式 | 希望首发时作为套餐一部分推荐或打包标准设备 | confirmed | `docs/REQUIREMENTS.MD` Step 5 |
| F-042 | 互联网医院与购药策略 | 首期以平台接入、复用、生态合作为主，不投入大量伴生系统自研 | confirmed | `docs/REQUIREMENTS.MD` Step 5 |
| F-043 | 保姆模式拿药要求 | 保姆模式下本体必须具备储物仓和递送能力 | confirmed | `docs/REQUIREMENTS.MD` Step 5 |
| F-044 | 120 接口挂载侧 | 优先通过手机 App 和手机能力拨打；同时争取让机器人具备入网拨号能力，前提是法规允许 | confirmed | `docs/REQUIREMENTS.MD` Step 5 |
| F-045 | 纸质医疗报告复核策略 | OCR 入库不做强制人工复核，但提供人工复核服务作为付费可选项 | confirmed | `docs/REQUIREMENTS.MD` Step 5 |
| F-046 | 协作同步方式 | `docs/WORKFLOW.md` 中的阶段性待办和 issue 已同步到 Linear 项目 `Kinbot OODA 架构到量产预备` | confirmed | 本轮协作同步 |
| F-047 | 文档与协作语言要求 | 本地 Markdown 文档和关联到 Linear 的项目、里程碑、issue、文档统一用中文撰写 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-048 | 项目总目标时间点 | 本机器人系统目标在 2026 年 12 月 31 日达到量产预备状态 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-049 | 当前与目标团队规模 | 当前团队约 25 到 30 人；在该周期内研发团队预计扩展到 100 人以上 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-050 | 架构弹性要求 | 当前架构按量产目标设计，但必须保留灵活性以应对具身智能行业和技术路线的快速变化 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-051 | 一期穿戴品牌优先级 | 一期优先兼容的小型穿戴品牌暂定为小米、华为 | provisional | `docs/REQUIREMENTS.MD` Step 6 |
| F-052 | 后台人工服务需求 | 需要后台人工服务体系，可参考医院在线问诊模式 | confirmed | `docs/REQUIREMENTS.MD` Step 6 |
| F-053 | UWB 一期候选用途 | UWB 雷达一期候选用途包括用户粗略位置估计、静止/运动状态判断，以及心率等信息监测 | provisional | `docs/REQUIREMENTS.MD` Step 6 |
| F-054 | 机器人直接拨号范围 | 机器人入网打电话当前只做架构预留，不进入一期预研范围 | confirmed | `docs/REQUIREMENTS.MD` Step 6 |
| F-055 | 储物仓机构边界 | 储物仓应跟随机器人整体外形，在尽量紧凑的内部布置基础上保留灵活空间，不为药品特意做大体积专用仓 | confirmed | `docs/REQUIREMENTS.MD` Step 6 |
| F-056 | 递送能力边界 | 递送服务主要依靠机器人自主运动完成，不引入复杂机械操作 | confirmed | `docs/REQUIREMENTS.MD` Step 6 |
| F-057 | OCR 人工复核执行方 | 付费人工复核优先由公司关联团队承接，并尽量复用现有平台能力 | confirmed | `docs/REQUIREMENTS.MD` Step 6 |
| F-058 | 项目起始时间 | 项目时间线按 2026 年 1 月 1 日起算 | confirmed | Linear 项目更新 |
| F-059 | 前两个月阶段定位 | 2026 年 1 到 2 月主要用于收集需求，并在 Demo 上验证概念设想 | confirmed | 用户本轮说明 |
| F-060 | 样机基础 | 所有讨论中的核心功能已经在真实自研机器人样机上做过粗放 Demo | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-061 | 产研基础 | 团队具备丰富的消费电子产研经验，覆盖平板类和 IoT 类产品 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-062 | 模型能力基础 | 团队具备 VLM、VLN 能力，与行业 SOTA 差距约不到一年 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-063 | 目标系统边界 | 目标系统是机器人；穿戴、智能家居、手机 App、后台云服务等属于伴生系统 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-064 | 手表实时生命体征限制 | 不同品牌手表若要实时获取心率，通常依赖心率广播或官方 SDK；前者影响用户正常使用，后者需要合作认证 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| F-065 | 一期穿戴型号现状 | 一期尚未形成明确的穿戴设备具体型号清单 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| F-066 | 生命体征实时性策略倾向 | 对心率、血压、血氧等数据的实时性要求可适当降低，必要时可采用问诊式获取 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| F-067 | 后台人工服务首线角色 | 后台人工服务的首线角色为公司客服运营坐席，其他角色由其转接 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| F-068 | UWB 候选价值排序 | UWB 一期候选用途优先级为活动状态判断 > 粗定位 > 生命体征监测 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| F-069 | 第三方平台责任 | 买药、外卖、内容服务等交付由第三方平台负责 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| F-070 | 机器人对第三方链路的责任 | 机器人必须确保与第三方平台之间传递的信息准确，并对引入的平台做严格审核 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| F-071 | 储物仓必须能力 | 储物仓必须具备防夹手、电动开关能力和开关仓状态记录 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| F-072 | 储物仓应有能力 | 储物仓应具备储物记录和交接确认能力 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| F-073 | 储物仓可选能力 | 储物仓可选防误取和防错拿能力 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| F-074 | 量产预备定义 | 2026-12-31 的量产预备状态定义为产品定型、小批量试点、随时可以开发布会 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| F-075 | 线程协作要求 | 另一个 Codex 线程作为 VLN 前瞻技术专家，需要与本线程的系统架构工作协同 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-076 | 分层复杂度约束 | 架构分解时每一层级的实体个数应控制在约 7 个，允许范围为 5 到 9 个 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-077 | 生命体征数据新鲜度 | 心率延迟不超过 1 分钟；血氧与心率同级；血压按需测量，但要求每日均有更新 | confirmed | `docs/REQUIREMENTS.MD` Step 8 |
| F-078 | 人工服务转接条件与时效 | 当用户不会操作、机器人无法识别需求或用户处于紧急状态时，客服运营坐席需要介入或转接；响应时效不超过 3 分钟 | confirmed | `docs/REQUIREMENTS.MD` Step 8 |
| F-079 | 当前样机本体基线 | 当前样机尺寸为 1139 x 500 x 600 mm，自重约 50 kg，采用两轮差速加万向轮底盘，具备机身升降、机身俯仰和头部俯仰三个附加自由度，带电动抽屉式储物仓 | confirmed | `docs/REQUIREMENTS.MD` Step 8 |
| F-080 | 当前样机导航基线 | 当前样机已实现基于 VLN + 激光 SLAM + 导航算法的导航闭环，SLAM 负责建图和位姿输出，VLN 基于 ASM 地图、实时视觉观测和位姿做动作推理，但当前存在反应慢、行走犹豫的问题 | confirmed | `docs/REQUIREMENTS.MD` Step 8 |
| F-081 | 当前样机能力分布 | 当前样机已具备成熟麦克风阵列、自然语音交互、可用问诊能力，以及“心率广播外设触发 + VLN 寻人 + 储物仓推出”的紧急给药 Demo；身份识别效果不够好，家属 App 和云服务仍为空白 | confirmed | `docs/REQUIREMENTS.MD` Step 8 |
| F-082 | 第三方平台准入方式 | 第三方平台按白名单审核接入 | confirmed | `docs/REQUIREMENTS.MD` Step 8 |
| F-083 | 小批量试点基线 | 小批量试点预期为 100 台、100 户、运行 1 个月 | confirmed | `docs/REQUIREMENTS.MD` Step 8 |
| F-084 | 穿戴受限时的兜底交互 | 当穿戴实时数据能力受限时，一期需要更多依赖问诊式交互 | confirmed | `docs/REQUIREMENTS.MD` Step 8 |
| F-085 | 陪伴默认人设 | 一代机器人默认采用“亲切家人型”人设，并允许基于对用户的了解做有限个性化调整 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| F-086 | 主动交互授权边界 | 长时间沉默、情绪低落等主动交互需用户授权；久坐久卧、到点提醒、回家问候可按条件主动发起，其中夜间回家问候需采用柔和灯光和低音量 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| F-087 | 长期记忆范围 | 重要纪念日、健康历史、用户习惯偏好、用户主动提起的重要家庭事件允许长期记忆；原始对话默认不长期保存，除非对应上述归档片段或用户主动要求记忆 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| F-088 | 一代安全保障优先级 | 一代安全保障优先覆盖久卧不起、摔倒、厨房明火/水烟/燃气泄漏、陌生人闯入、夜间离床、门窗未关 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| F-089 | 低电量降级设想 | 低电量时应先提醒用户，并在任务与回充之间做剩余电量规划；若剩余电量不足以支撑回充，则对用户做强提醒，并在用户响应前暂停并挂起当前任务 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| F-090 | 定位异常降级设想 | 定位异常时优先静默自恢复；若无法找回，则结合当前观测重新定位 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| F-091 | 其他关键降级设想 | 传感器失效需按传感器类别设计降级策略；网络断开由端侧能力接管；储物仓卡滞时暂停运动并提醒用户检查夹手风险 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| F-092 | 样机保留方向 | 最希望保留的方向是全向观测能力但减少传感器数量、电动开合储物仓、屏幕交互能力 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| F-093 | 样机重构方向 | 最希望重构的方向是整机减重到 40 kg 以下、更强的多模态交互，以及能基于连续历史信息做高层综合决策的导航栈 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| F-094 | 需求文档编辑边界 | `docs/REQUIREMENTS.MD` 仅由用户本人修改，Codex 线程只读取、不编辑该文件 | confirmed | 用户本轮说明 |
| F-095 | VLN 文档维护边界 | `docs/VLN_ROLE_AND_PLAN.md` 由负责 VLN 前瞻技术规划的独立线程维护，当前线程不更新该文件 | confirmed | 用户本轮说明 |
| F-096 | 记忆治理可见性 | 老人本人和子女允许在 App 中查看、修改和删除长期记忆；修改时需要提醒可能影响后续功能 | confirmed | `docs/REQUIREMENTS.MD` Step 10 |
| F-097 | 陪伴配置权限 | 纪念日、提醒、主动交互频率和人设强度等配置只允许老人本人和子女调整；冲突时需确认 | confirmed | `docs/REQUIREMENTS.MD` Step 10 |
| F-098 | 空间动作边界 | 卫生间默认保守处理，除非明确发现紧急场景，否则机器人不进入；第一代机器人不考虑走出入户门 | confirmed | `docs/REQUIREMENTS.MD` Step 10 |
| F-099 | 安全事件自动动作 | 陌生人闯入允许主动驱离预案；夜间离床经授权后允许柔和灯光查看；门窗未关允许提醒用户、推送 App，并在条件允许时联动智能家居关闭 | confirmed | `docs/REQUIREMENTS.MD` Step 10 |
| F-100 | 故障恢复与停机边界 | 低电量、定位异常、关键传感器失效时希望系统更积极恢复；当失效状态导致机器人无法识别任何障碍物时，必须停止运动 | confirmed | `docs/REQUIREMENTS.MD` Step 10 |
| F-101 | 伴生系统职责分工 | 家属 App 承接信息推送、联络和远程控制指令；云服务承接问诊和买药等体系服务；后台运营坐席承接人工联络；穿戴提供运动状态和生命体征；智能家居提供环境事件 | confirmed | `docs/REQUIREMENTS.MD` Step 10 |
| F-102 | 全生命周期规划要求 | 工作流必须覆盖从需求形成到上市运营和下一代回灌，并在 Linear 中可见 | confirmed | 用户本轮说明 |
| F-103 | 自主设想权限 | 当问题尚未澄清但推进不能停时，允许 Codex 先提出自己的设想，再提交用户审核 | confirmed | 用户本轮说明 |
| F-104 | IPD 参考要求 | 全生命周期管理需要参考 IPD（集成产品开发）流程 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-105 | 架构冻结时间要求 | 产品定义与架构冻结争取在 2026-03-31 达成 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| F-106 | OODA 革新要求 | 需要理解并革新 OODA 在 AGI 与具身智能时代的用法，并考虑单轮 OODA 跨越的时间尺度、空间尺度及其动态调整能力 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |

## 3. 当前架构性判断

| ID | 判断 | 状态 | 依据 |
| --- | --- | --- | --- |
| A-001 | 术语上应把当前统一的运行时认知中枢称为 `World State` 或 `World State Store`；`World Model` 仅在需要表示可预测环境/任务动态的模型时使用 | confirmed | 本轮术语修订 |
| A-002 | 动作前三重门控是最高优先级架构决策 | confirmed | `README.md`, `docs/ARCHITECTURE.md` |
| A-003 | 系统需要多时间尺度闭环，不能依赖单一推理平面 | confirmed | `docs/ARCHITECTURE.md` |
| A-004 | 后续应优先稳定接口面，而不是过早锁死中间件和模型选型 | confirmed | `docs/ARCHITECTURE.md`, `docs/ARCHITECTURE_RULES_REVIEW.md` |
| A-005 | 当前仓库仍缺模块接口、核心数据结构、团队边界、验证指标和技术选型 | confirmed | `README.md`, `docs/ARCHITECTURE_RULES_REVIEW.md` |
| A-006 | 产品一代的主问题已经从“泛家庭移动交互”收敛为“中国大陆居家养老/老人看护” | confirmed | `docs/REQUIREMENTS.MD` Step 2 |
| A-007 | 健康管理不再只是提醒能力，而是会直接牵引医疗档案接入、异常识别、问诊联动和用药闭环，因此健康能力必须单列为一级系统流 | confirmed | `docs/REQUIREMENTS.MD` Step 2 |
| A-008 | 团队规模和资金量级支持按平台化方式切分模块，不必按纯原型项目的最小堆叠方式设计 | confirmed | `docs/REQUIREMENTS.MD` Step 2 |
| A-009 | 一代产品的 MVP 核心不是导航能力本身，而是围绕老人健康闭环组织的感知、交互、联动和执行能力 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| A-010 | 陪伴交互虽然排在第二，但它在系统中不是装饰能力，而是健康管理的高频入口和长期依从性增强器 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| A-011 | 家庭安全巡护被排在第四，意味着首版不应为巡逻场景过度堆叠硬件和算法预算 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| A-012 | 紧急用药管理进入 MVP，意味着世界状态和任务系统必须显式表示药物、储位、禁忌、时效和给药前提 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| A-013 | 权限模型已经从单用户授权演进为多角色授权系统，至少要支持老人本人、子女、保姆、访客四类主体 | confirmed | `docs/REQUIREMENTS.MD` Step 3 |
| A-014 | 当前架构更适合采用“穿戴优先 + 外设接口保留”的生命体征接入路线，而不是本体自带重型医疗传感器堆叠 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| A-015 | 一期紧急用药仍属于“提醒/递送/确认/告知”闭环，不应扩展成更强的医疗自主处置系统 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| A-016 | 本体硬件策略应聚焦自研底盘、自研麦克风阵列、供应商相机和非自研穿戴外设 | confirmed | `docs/REQUIREMENTS.MD` Step 4 |
| A-017 | 首期穿戴设备不应走纯 BYOD 模式，而应优先形成“机器人 + 推荐设备套餐”的交付方式，以减少接入碎片化 | confirmed | `docs/REQUIREMENTS.MD` Step 5 |
| A-018 | 购药与互联网医院应按生态接入方式落地，这要求云侧服务网关和审计模型优先支持第三方平台模式，而不是自建医疗闭环 | confirmed | `docs/REQUIREMENTS.MD` Step 5 |
| A-019 | 机器人本体储物仓和递送能力已经从“可选想法”提升为保姆模式和送药流程的硬需求 | confirmed | `docs/REQUIREMENTS.MD` Step 5 |
| A-020 | 纸质报告 OCR 入库允许无强制人工复核，意味着系统必须支持来源标记、置信度和可选付费复核状态 | confirmed | `docs/REQUIREMENTS.MD` Step 5 |
| A-021 | 本地 repo 文档应继续作为需求和架构事实源，Linear 负责协作、评审和执行状态跟踪，两者需保持同步 | confirmed | 本轮协作同步 |
| A-022 | 项目管理基线应从单纯 MVP 推进，升级为“2026-12-31 量产预备 + 2027 年 1 月 MVP 验证窗口”的双节点节奏 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| A-023 | 文档和协作系统统一中文化，有助于后续百人团队协作、跨角色评审和对外沟通一致性 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| A-024 | 后台人工服务已从可选扩展能力变为首版系统闭环的一部分，云侧服务网关和 App 侧必须预留人工接入、转接和审计状态 | confirmed | `docs/REQUIREMENTS.MD` Step 6 |
| A-025 | UWB 雷达在一期只能作为候选感知增强路线，是否纳入首版 BOM 必须以技术成熟度和成本评估结论为准 | confirmed | `docs/REQUIREMENTS.MD` Step 6 |
| A-026 | 储物仓应按通用递送空间设计，而不是按单一药品容器定制，这会直接影响结构设计和上装布局 | confirmed | `docs/REQUIREMENTS.MD` Step 6 |
| A-027 | 项目不再是“从零开始定义概念”，而是要基于既有样机 Demo、消费电子经验和现有模型能力做量产化架构收敛 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| A-028 | 伴生系统应作为围绕机器人协同的外部系统处理，不应稀释“机器人本体是目标系统”的架构主线 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| A-029 | 一期健康链路不能把“持续实时手表心率”当作硬依赖，必须接受较低实时性并支持问诊式或补采式数据获取 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| A-030 | 后台人工服务的第一入口应按客服运营坐席设计，接口层要重点支持接入、转接、超时和责任切换，而不是直接假设医生在线常驻 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| A-031 | 第三方平台的责任边界必须在接口和审计模型里显式表达，否则后续合规和售后责任会失真 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| A-032 | 储物仓的一代能力优先级应先满足防夹手、开关控制和状态记录，再规划交接确认，最后再考虑防误取和防错拿 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| A-033 | “量产预备”在本项目里不应被理解为纯文档完成，而应理解为产品定型并具备小批量试点与发布准备状态 | confirmed | `docs/REQUIREMENTS.MD` Step 7 |
| A-034 | `Step8` 已经给出了健康事件管线第一版所需的关键输入，因此下一轮澄清重点不应继续单线深挖健康，而应并行转向陪伴交互和安全保障 | confirmed | `docs/REQUIREMENTS.MD` Step 8 |
| A-035 | 陪伴交互不能被当作 UI 细节，它需要单独澄清主动发起边界、打断礼仪、人设强度、长期记忆和多角色共享边界 | confirmed | `docs/REQUIREMENTS.MD` Step 2, Step 3, Step 8 |
| A-036 | 安全保障不能被简化为避障，它至少还需要家庭危险源清单、空间分级、时间规则、异常升级和降级停机矩阵 | confirmed | `docs/REQUIREMENTS.MD` Step 1, Step 2, Step 8 |
| A-037 | 当前样机更强的是本体集成、导航和语音，更弱的是身份效果、App 和云服务，因此后续系统设计要把资源从单纯本体能力扩展到整机闭环与伴生系统闭环 | confirmed | `docs/REQUIREMENTS.MD` Step 8 |
| A-038 | 当前样机的多雷达多深度相机配置更接近概念验证平台，量产架构需要后续单独评估哪些传感器组合必须保留，哪些可以降配 | provisional | `docs/REQUIREMENTS.MD` Step 8 |
| A-039 | 涉及 VLN 技术路线的判断，应与前瞻技术专家线程交叉校验；本线程继续负责机器人整机系统架构、接口和产品闭环 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| A-040 | 后续文档和模块继续扩展时，应把每层实体数控制在约 7 个，避免为了完整性牺牲可读性和团队可协作性 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| A-041 | 一代陪伴交互应采用“亲切家人型为默认、有限个性化为增强”的边界，而不是开放式自由人格生成 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| A-042 | 主动交互的核心目标不是提高陪伴召回率，而是在不打扰前提下提升依从性、情绪陪伴效果和健康/安全闭环触达率 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| A-043 | 长期记忆应保存“结构化归档结果”而不是原始对话，这要求记忆系统支持摘要归档、可追溯来源和按角色共享控制 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| A-044 | 一代安全保障优先顺序已经明确偏向“生命与照护风险”而不是“财产与周界风险”，因此验证与传感器预算应优先覆盖久卧不起、摔倒和厨房风险 | confirmed | `docs/REQUIREMENTS.MD` Step 9 |
| A-045 | 定位异常恢复不能把 VLN 当作无边界兜底能力；更合理的架构是由受限恢复流程调用语义导航策略提供候选语义线索，并始终受本地定位与运动安全链约束 | confirmed | `docs/VLN_ROLE_AND_PLAN.md`, `docs/REQUIREMENTS.MD` Step 9 |
| A-046 | VLN 在 Kinbot 中应继续定位为 `Orient -> Decide` 之间的语义导航策略层，而不是替代 `SLAM + 局部规划 + 避障` 的底盘级安全控制层 | confirmed | `docs/VLN_ROLE_AND_PLAN.md` |
| A-047 | 当前样机的保留与重构方向表明，一代量产化路线应从“重传感器验证平台”收敛到“更轻量传感器配置 + 更强语义与多模态能力”的平台 | confirmed | `docs/REQUIREMENTS.MD` Step 9, `docs/VLN_ROLE_AND_PLAN.md` |
| A-048 | 当前线程对 VLN 技术规划采取“引用结论、不维护文件”的协作方式；VLN 细节在独立 issue 与独立线程中推进 | confirmed | 用户本轮说明 |
| A-049 | 一代 MVP 不能只冻结机器人本体，还必须冻结家属 App、云服务和后台运营坐席的最小闭环，否则授权、记忆治理和异常升级都无法闭环 | confirmed | 本轮伴生系统文档 |
| A-050 | 记忆已经从“系统内部状态”变成“用户可治理资产”，因此记忆写入、纠错、删除和功能影响提示必须进入 App 与审计设计 | confirmed | `docs/REQUIREMENTS.MD` Step 10 |
| A-051 | 多角色配置模型已进一步收敛为“老人本人和子女可配置，保姆只在授权范围内执行”，这会直接影响 App 权限模型和冲突确认流程 | confirmed | `docs/REQUIREMENTS.MD` Step 10 |
| A-052 | 第一代机器人必须显式建立“卫生间高敏感、入户门不越界”的空间动作边界，否则健康与安全链会在真实家庭里频繁越界 | confirmed | `docs/REQUIREMENTS.MD` Step 10 |
| A-053 | 陌生人闯入、夜间离床和门窗未关这三类事件已经具备第一版自动动作边界，后续可以开始冻结默认升级链和测试项，而不是继续停留在概念层 | confirmed | `docs/REQUIREMENTS.MD` Step 10 |
| A-054 | 故障状态下的策略不应只强调保守停机，还应允许受约束的积极恢复；但一旦障碍物识别能力失效，运动必须硬停 | confirmed | `docs/REQUIREMENTS.MD` Step 10 |
| A-055 | 一代健康链已经具备足够输入，可以单独冻结“健康事件管线与升级链路”，并将其作为后续 Demo 到量产能力缺口分析的基线文档 | confirmed | 本轮健康事件文档 |
| A-056 | 当前项目虽然以 2026-12-31 量产预备为主节点，但工作流必须提前规划上市运营、质量闭环和下一代回灌，否则前段架构会短视 | confirmed | 用户本轮说明 |
| A-057 | 在信息不足但不值得停工等待时，最有效的协作方式不是继续空问，而是先形成“架构师设想包”并进入评审 | confirmed | 用户本轮说明 |
| A-058 | 全生命周期协作在 Linear 中应至少体现为阶段里程碑、主文档和跨阶段 issue，而不只是当前架构 issue 列表 | confirmed | 用户本轮说明 |
| A-059 | 生命周期管理当前应按“参考 IPD + 面向机器人整机服务系统裁剪”的方式推进，而不是只保留抽象阶段描述 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| A-060 | 当前周期里，“产品定义与架构冻结”应被视作硬阶段门，目标日期为 `2026-03-31` | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |
| A-061 | 经典串行单环 OODA 不足以描述 Kinbot 的运行机制，Kinbot 一代正式采用多尺度、并发、可中断、可动态调度的 OODA | confirmed | `KBT-28` 审阅结论 |
| A-062 | `Orient` 在 Kinbot 中不应只承担情境理解，还应承担对 `Observe` 结果的认知评价、尺度选择、时域压缩和子环切换 | confirmed | `KBT-28` 审阅结论 |
| A-063 | `R4 关系与服务环` 是一代正式架构层，而不是仅作为运营层补充 | confirmed | `KBT-28` 审阅结论 |
| A-064 | `OODA Scale Scheduler` 需要以一级架构能力身份出现，并成为运行时主导子环切换入口 | confirmed | `KBT-28` 审阅结论 |
| A-065 | `KBT-18` 不应按零散功能列缺口，而应按“整机平台、R1、R2、R3、R4、伴生系统、工程化”7 个能力域来评估 | confirmed | `Step13` 对 `KBT-18` 的审阅意见 |
| A-066 | 当前样机到量产预备的最大差距不是单点算法能力，而是产品闭环、伴生系统闭环和工程化体系 | provisional | 本轮缺口分析 |
| A-067 | 当前三类阻断项默认收敛为：伴生系统与人工运营闭环、整机平台与成本收敛、工程化与 NPI 基线 | confirmed | `Step14` |
| A-068 | 储物仓能力应保留，但现有传动机构过大过重，需要作为工程化重构项单列推进 | confirmed | `Step13` 对 `KBT-18` 的审阅意见 |
| A-069 | 整机外观形态重构已是既定工程动作，应进入 `E2` 整机平台基线，而不是留作后续工业设计附属项 | confirmed | `Step13` 对 `KBT-18` 的审阅意见 |
| A-070 | `E4 伴生系统与服务运营基线` 的优先级体现在先冻结接口、职责和交付面，不意味着伴生系统可以反向锁死本体硬件路线 | confirmed | `Step14` |
| A-071 | 一代软硬件选型当前可先收敛为“量产主线、验证加速备线、前瞻观察线”三层结构，再在 `G2` 前最终定型 | provisional | 本轮选型矩阵草案 |
| A-072 | 当前线程后续必须执行“前置评审清账”机制：前置 issue 未关闭时，后续 issue 可以起草，但不得被当成最终冻结结果 | confirmed | `Step16` |
| A-073 | 模块分解与一级实体分解均应尽量控制在 `5～9` 个；超过上限时，应先压缩顶层结构再继续推进评审 | confirmed | `Step16` |
| A-074 | 对已评审通过且存在明确结构分解的文档，应补充直观架构图，并把图示视为正式架构表达的一部分 | confirmed | `docs/REQUIREMENTS.MD` 对 Codex 的要求 |

## 4. 尚未关闭的关键问题

| ID | 问题 | 为什么关键 | 状态 |
| --- | --- | --- | --- |
| Q-001 | 不同健康事件的 `L1` 到 `L4` 风险阈值如何量化 | 决定健康事件自动动作和升级策略 | open |
| Q-002 | 家属 App 允许下发哪些远程控制指令，哪些必须禁止 | 决定伴生系统远控边界和安全责任 | open |
| Q-003 | 智能家居一期优先接入哪些设备类型和协议 | 决定环境风险闭环范围和接口优先级 | open |
| Q-004 | 卫生间、卧室、厨房、入户门是否需要细化成正式的空间规则表 | 决定空间模型、健康确认链和安全测试用例 | open |
| Q-005 | 低电量、定位异常、关键传感器失效的量化阈值如何定义 | 决定功能安全状态机和量产验证标准 | open |
| Q-006 | 一代端侧算力主线最终应在国产 SoC 主控与国产 AI 协处理器路线中如何收敛 | 决定算法迁移、热设计、BOM 和供应链主路线 | open |
| Q-007 | 上市后质量、人工服务、版本治理和下一代回灌机制要做到什么深度 | 决定全生命周期后段的组织和系统投入 | open |

## 5. 下一轮优先向用户确认的问题

建议下一轮优先按评审顺序继续清账：

1. 你是否接受 `KBT-7` 采用“分层状态机管理顶层模式，行为树管理叶子执行”的收敛方式？
2. 你是否接受 `KBT-7` 当前给出的 7 类高风险异常枚举？
3. 你是否接受 `KBT-7` 当前给出的 7 类关键安全故障枚举？
4. 低电量、定位异常、关键传感器失效这 3 类故障，你希望分别用什么阈值切换到“受限继续 / 挂起任务 / 故障保护”？
5. 智能家居一期优先接入哪些设备类型和协议？
6. 后台人工服务、家属 App 和云服务之间，是否还需要进一步明确“谁持有哪类用户上下文”的边界？

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
| 2026-03-08 | D-022 | 协作同步 | `docs/WORKFLOW.md` 的阶段性待办和架构产物 issue 已同步到 Linear 项目 `Kinbot OODA 架构到量产预备`，本地 repo 作为事实源，Linear 作为协作系统 | confirmed |
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
| 2026-03-08 | D-053 | 文档编辑边界 | `docs/REQUIREMENTS.MD` 作为用户维护的需求事实源，由用户独占编辑；Codex 只读取并基于其继续推进其他文档 | confirmed |
| 2026-03-08 | D-054 | VLN 协作边界 | `docs/VLN_ROLE_AND_PLAN.md` 作为独立线程维护的专项规划文档，当前线程只引用其结论，不再更新该文件 | confirmed |
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
| 2026-03-08 | D-070 | Demo 缺口主文档 | 新增 `docs/DEMO_TO_MASS_PRODUCTION_GAPS.md`，将当前样机到量产预备的差距收敛为 7 个能力域、3 类阻断项和一份默认优先级排序 | confirmed |
| 2026-03-08 | D-071 | `KBT-18` 审阅结论 | 用户已确认 7 个能力域组织方式，接受 `D1` 与 `D7` 为阻断项，并要求把 `D6` 的阻断理由写实后再最终冻结 | confirmed |
| 2026-03-08 | D-072 | 储物仓工程动作 | 储物仓能力继续保留，但现有电动传动机构过大过重，应进入工程化重构清单 | confirmed |
| 2026-03-08 | D-073 | 外观形态工程动作 | 整机外观形态重构已是既定工程动作，应纳入 `P2` 整机平台与结构收敛范围 | confirmed |
| 2026-03-08 | D-074 | 工程化与 NPI 主文档 | 新增 `docs/ENGINEERING_NPI_BASELINE.md`，将 `KBT-24` 收敛为 7 个工程化与 `NPI` 基线包、`G2` 七项放行条件和一份默认优先级排序 | confirmed |
| 2026-03-08 | D-075 | `KBT-18` 最终收口 | 用户已接受 `D6` 的阻断理由，因此 `KBT-18` 可作为正式基线关闭 | confirmed |
| 2026-03-08 | D-076 | `KBT-24` 审阅结论 | 用户已接受 7 个工程化与 `NPI` 基线包、`E4` 第一优先级、`E2` 既定重构动作和 `G2` 七项放行条件；同时强调伴生系统不能过度约束本体硬件 | confirmed |
| 2026-03-08 | D-077 | 软硬件选型主文档 | 新增 `docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md`，将一代选型收敛为 7 个选型域、三层路线结构和一组 `G2` 前置验证项 | provisional |
| 2026-03-08 | D-078 | `KBT-11` 审阅结论 | 一代端侧算力必须改为中国芯片主线；量产视觉主线改为双目 + 单目 `3 到 5` 个相机，自研深度估计；深度相机和激光雷达在 `EVT` 后退出量产主线 | confirmed |
| 2026-03-08 | D-079 | 前置评审清账机制 | 后续架构推进必须强提醒未关闭的前置 issue；前置未关闭时，后续 issue 只能起草，不能直接当成最终冻结结果 | confirmed |
| 2026-03-08 | D-080 | `KBT-5` 审阅结论 | 一级模块数量已按审阅意见从 `10` 压缩到 `9`，`world_state_memory` 命名和强制边界规则保持有效 | confirmed |
| 2026-03-08 | D-081 | `KBT-6` 审阅结论 | 世界状态一级实体已按审阅意见压缩到 `9`，并已作为当前正式基线关闭 | confirmed |
| 2026-03-08 | D-082 | `KBT-7` 评审焦点 | `KBT-7` 当前评审重点已收敛为两点：一是明确分层状态机与行为树的边界，二是显式枚举高风险异常与关键安全故障 | confirmed |
| 2026-03-08 | D-083 | `KBT-7` 控制结构提案 | 当前建议以“分层状态机管理顶层模式，行为树管理叶子执行”作为一代顶层 `Decision` 控制结构 | provisional |
| 2026-03-08 | D-084 | `KBT-7` 枚举化提案 | 当前建议在状态机层显式冻结 7 类高风险异常和 7 类关键安全故障，供后续接口、验证与量产门复用 | provisional |

## 7. 后续记录规则

- 新确认的信息，先写入“已确认事实”或“当前架构性判断”。
- 新的高代价选择，写入“决策日志”。
- 未关闭且会影响后续设计的问题，写入“尚未关闭的关键问题”。
- 每轮结束后，把“下一轮优先向用户确认的问题”收敛到不超过 6 个。
