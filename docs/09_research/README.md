# Deep Research

---

文档版本：v1.2
创建日期：2026-03-11
作者：Codex-架构师

文档变更记录：
- v1.2 | 2026-04-12 | Codex-架构师 | 重构研究目录命名与编号：新增夜间闭环研究文档索引，补充 `03 / 05` 文档入口，并将 `VLN -> NFM` 专题子目录统一收敛到 `07_vln_model_design/`。
- v1.1 | 2026-03-22 | Codex-架构师 | 补充进迭时空 K3 芯片研究文档索引。
- v1.0 | 2026-03-11 | Codex-架构师 | 文档创建。

---

收纳论文、芯片、技术路线和前沿方向的结构化研究产物。

## 目录角色

作为长期前瞻协作区，为主线架构提供研究输入，而不直接替代系统边界。

## 文档索引

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
