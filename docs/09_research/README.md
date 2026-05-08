# Deep Research

---

文档版本：v1.12
创建日期：2026-03-11
作者：Codex-架构师

文档变更记录：
- v1.12 | 2026-05-08 | Codex-架构师 | 新增 2026-05-08 Kinbot arXiv 每日论文纪要索引，补充资源约束规划、巡护运行时监控、模糊指令导航澄清、目标导航语义补全、可见性保持、主动社会规范判断、VLN 漂移修正、感知不确定性校准、world action model 自适应执行和长期自主性研究输入。
- v1.11 | 2026-05-07 | Codex-架构师 | 新增 2026-05-07 Kinbot arXiv 每日论文纪要索引，在官方尚未出现 2026-05-07 Robotics 新批次时，按补录口径补充长程规划、物理可行性、部分可观测安全控制、结构化评测、任务条件传感配置、LLM 工具执行与 world model 人工纠偏研究输入。
- v1.10 | 2026-05-06 | Codex-架构师 | 新增 2026-05-06 Kinbot arXiv 每日论文纪要索引，补充端侧语言模型、混合关键性运行时、开放词汇语义地图、长期情景记忆、视觉 SLAM 退化评测、具身安全、设计期不确定性分析、单智能体运行时、协作行为评测和机器人视频 world model 对齐研究输入。
- v1.9 | 2026-05-05 | Codex-架构师 | 新增 2026-05-05 Kinbot arXiv 每日论文纪要索引，补充技能编排验证、语言条件导航数据集、VLA 可解释性、预测式时空场景图、端侧 GEMM、fleet-scale 持续学习、潜在 world-action model、机器人 world model 综述和高帧率人类动作理解研究输入。
- v1.8 | 2026-05-04 | Codex-架构师 | 新增 2026-05-04 Kinbot arXiv 每日论文纪要索引，补充执行中途异常处理、可达安全、端侧概率安全评估、稀疏 3D 重建、策略学习、humanoid 行为预演、低成本触觉和发育式多模态经验研究输入。
- v1.7 | 2026-05-03 | Codex-架构师 | 新增 2026-05-03 Kinbot arXiv 每日论文纪要索引，补充端侧 VLA / VLM 部署、语义图定位、安全监控、LLM 机器人威胁建模、主动具身智能体和世界动作模型研究输入。
- v1.6 | 2026-05-02 | Codex-架构师 | 新增 2026-05-02 Kinbot arXiv 每日论文纪要索引，补充家庭多方 HRI、开放词汇占用图、早期动作识别、异步 VLA 导航安全、动态避障与人类视频机器人学习研究输入。
- v1.5 | 2026-05-01 | Codex-架构师 | 新增 2026-05-01 Kinbot arXiv 每日论文纪要索引，补充健康助手安全、VLN 分层规划、家用服务闭环执行、技能更新治理与 4D world-action model 研究输入。
- v1.4 | 2026-04-30 | Codex-架构师 | 新增 2026-04-30 Kinbot arXiv 每日论文纪要索引，补充纯视觉导航、在线空间记忆、局部规划安全和跨界面协同研究输入。
- v1.3 | 2026-04-29 | Codex-架构师 | 新增 `00_papers` 论文研究目录索引，用于收纳每日 arXiv 论文纪要。
- v1.2 | 2026-04-12 | Codex-架构师 | 重构研究目录命名与编号：新增夜间闭环研究文档索引，补充 `03 / 05` 文档入口，并将 `VLN -> NFM` 专题子目录统一收敛到 `07_vln_model_design/`。
- v1.1 | 2026-03-22 | Codex-架构师 | 补充进迭时空 K3 芯片研究文档索引。
- v1.0 | 2026-03-11 | Codex-架构师 | 文档创建。

---

收纳论文、芯片、技术路线和前沿方向的结构化研究产物。

## 目录角色

作为长期前瞻协作区，为主线架构提供研究输入，而不直接替代系统边界。

## 文档索引

- `00_papers/README.md`：论文研究目录。核心主题：arXiv 论文检索、摘要转述、工程适配判断和推荐结论。
- `00_papers/2026-05-08_kinbot_arxiv_daily.md`：2026-05-08 Kinbot arXiv 每日论文纪要。核心主题：资源约束规划、巡护运行时监控、模糊指令导航澄清、目标导航语义补全、可见性保持、主动社会规范判断、VLN 漂移修正、感知不确定性校准、world action model 自适应执行和长期自主性。
- `00_papers/2026-05-07_kinbot_arxiv_daily.md`：2026-05-07 Kinbot arXiv 每日论文纪要。核心主题：长程规划、物理可行性约束、部分可观测安全控制、结构化评测、对抗场景生成、任务条件传感配置、LLM 工具执行和 world model 人工纠偏。
- `00_papers/2026-05-06_kinbot_arxiv_daily.md`：2026-05-06 Kinbot arXiv 每日论文纪要。核心主题：端侧语言模型、混合关键性运行时、开放词汇语义地图、长期情景记忆、视觉 SLAM 退化评测、具身安全、设计期不确定性分析、单智能体运行时、协作行为评测和机器人视频 world model 对齐。
- `00_papers/2026-05-05_kinbot_arxiv_daily.md`：2026-05-05 Kinbot arXiv 每日论文纪要。核心主题：技能编排验证、语言条件导航数据集、VLA 可解释性、预测式时空场景图、端侧 GEMM、fleet-scale 持续学习、潜在 world-action model、机器人 world model 综述和高帧率人类动作理解。
- `00_papers/2026-05-04_kinbot_arxiv_daily.md`：2026-05-04 Kinbot arXiv 每日论文纪要。核心主题：执行中途异常处理、可达安全、端侧概率安全评估、稀疏 3D 重建、低样本策略学习、humanoid 行为预演、低成本触觉和发育式多模态经验。
- `00_papers/2026-05-03_kinbot_arxiv_daily.md`：2026-05-03 Kinbot arXiv 每日论文纪要。核心主题：端侧 VLA / VLM 部署、语义图定位、LLM 机器人威胁建模、运行期安全监控、主动具身智能体、VLN 空间转移学习和世界动作模型。
- `00_papers/2026-05-02_kinbot_arxiv_daily.md`：2026-05-02 Kinbot arXiv 每日论文纪要。核心主题：家庭多方 HRI、开放词汇占用图、早期动作识别、异步 VLA 导航安全、动态障碍避让、VLA 目标可达性、潜在物理推理和人类视频机器人学习。
- `00_papers/2026-05-01_kinbot_arxiv_daily.md`：2026-05-01 Kinbot arXiv 每日论文纪要。核心主题：健康助手安全、零样本 VLN 分层规划、家用服务闭环执行、社交导航、技能更新治理、神经符号任务规划、安全可达导航和 4D world-action model。
- `00_papers/2026-04-30_kinbot_arxiv_daily.md`：2026-04-30 Kinbot arXiv 每日论文纪要。核心主题：纯视觉拓扑-度量导航、在线语义空间记忆、局部规划安全、端侧具身推理和跨界面协同。
- `00_papers/2026-04-29_kinbot_arxiv_daily.md`：2026-04-29 Kinbot arXiv 每日论文纪要。核心主题：纯视觉深度、VLN/VLA 运行时、端侧资源、语义空间记忆和老人健康安全。
- `01_vln_role_analysis_and_technical_plan.md`：VLN角色分析与技术规划。核心主题：VLN 在 Kinbot 中的角色分析、路线判断和技术规划。
- `02_uwb_phase1_maturity_and_integration_value.md`：UWB一期技术成熟度与接入价值评估。核心主题：UWB 一期成熟度、样品验证门和接入价值评估。
- `03_kbt22_vln_special_task_intake_and_breakdown.md`：KBT-22 导航专项任务承接与拆解。核心主题：VLN / NFM 专家线程的任务边界、拆解方式与交付要求。
- `04_spacemit_k3_chip_assessment_for_embodied_ai.md`：进迭时空 K3 芯片信息整合与具身智能适配评估。核心主题：K3 芯片事实整合、端侧大模型推理能力、具身智能机器人应用优劣势与 Kinbot 适配判断。
- `05_head_stereo_camera_observation_scheme_and_parameter_requirements.md`：头部主双目视觉观测方案与参数需求。核心主题：头部主双目职责边界、参数计算方法和推荐指标。
- `06_kinbot_nighttime_closed_loop_plan.md`：家庭机器人夜间稳态定位与任务闭环方案。核心主题：纯视觉路线下夜间不开灯场景的定位稳态、任务闭环、隐私策略与服务闭环设计。
- `07_vln_model_design/README.md`：`VLN -> NFM` 专题研究目录。核心主题：模型设计、预算、差距分析、长期记忆、长程任务和导航基础问题的数据设计。

## 维护规则

1. 文档内容继续使用中文撰写。
2. 文件名使用英文小写、数字前缀和生命周期目录组织。
3. 目录级变更统一只在根目录 `CHANGELOG.md` 中记录。
4. 当目录内新增文档时，需同步回写本 `README.md` 的文档索引。
