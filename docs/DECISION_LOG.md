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

## 4. 尚未关闭的关键问题

| ID | 问题 | 为什么关键 | 状态 |
| --- | --- | --- | --- |
| Q-001 | 一期准备兼容哪些穿戴设备或协议 | 决定设备生态和软件接口设计 | open |
| Q-002 | 互联网医院与购药合作是平台接入还是自建闭环 | 决定云架构、合规责任和上线速度 | open |
| Q-003 | 是否需要医生介入、客服介入或远程人工接管 | 决定 App、云架构和审计链路 | open |
| Q-004 | 保姆模式中的“拿药”是否意味着机器人需要本体储物仓和递送能力 | 决定机构设计和任务边界 | open |
| Q-005 | 120 标准接口准备对接哪类主体：手机、社区平台、运营平台还是官方能力 | 决定接口设计 | open |
| Q-006 | 深度估计是纯视觉路线还是需要为后续低成本深度传感器预留接口 | 决定感知栈演进路线 | open |
| Q-007 | 穿戴设备在产品上是 BYOD 绑定，还是配套发放标准设备 | 决定商务模式和接入复杂度 | open |
| Q-008 | 纸质医疗报告识别后是否必须人工复核 | 决定 OCR 流程和医疗信息入库风险 | open |

## 5. 下一轮优先向用户确认的问题

建议先只确认以下第一批问题，避免一次问得过散：

1. 一期准备兼容哪些穿戴设备或协议：现成手表/手环、医疗级穿戴、蓝牙血压计、血糖仪，优先级怎么排？
2. 穿戴设备是默认让用户自带绑定，还是希望首发时配套推荐或打包标准设备？
3. 互联网医院和购药链路，你更倾向平台接入还是逐步自建深度闭环？
4. 保姆模式里的“拿药”，你是否要求机器人本体必须具备储物仓和递送能力？
5. 120 标准接口准备优先挂在哪一侧：家属 App、云平台、社区/物业平台，还是手机系统能力？
6. 纸质医疗报告识别后，你是否要求必须有人在 App 里做人工复核后才能入库？

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

## 7. 后续记录规则

- 新确认的信息，先写入“已确认事实”或“当前架构性判断”。
- 新的高代价选择，写入“决策日志”。
- 未关闭且会影响后续设计的问题，写入“尚未关闭的关键问题”。
- 每轮结束后，把“下一轮优先向用户确认的问题”收敛到不超过 6 个。
