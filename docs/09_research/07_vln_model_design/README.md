# `VLN -> NFM` 专题研究

---

文档版本：v1.0
创建日期：2026-04-12
作者：Codex-VLN技术专家

文档变更记录：
- v1.0 | 2026-04-12 | Codex-架构师 | 建立 `07_vln_model_design/` 目录索引，统一专题研究文件的编号与导航。

---

## 1. 目录定位

本目录用于收纳 `VLN -> NFM` 相关的专题研究文档，包括：

1. 模型设计与预算；
2. 当前实现差距分析；
3. 长期记忆、长程任务与导航基础问题的数据设计；
4. 只作为研究输入，不直接替代主线架构冻结文档。

## 2. 文件索引

- `01_kinbot_vln_model_detailed_design.md`：`VLN -> NFM` 模型详细设计。核心主题：模型结构、训练路线、蒸馏部署与能力迭代。
- `02_vln_4b_tps_and_bandwidth_budget.md`：4B 模型 TPS、带宽与频率预算。核心主题：端侧 student 模型的输入吞吐、输出吞吐、带宽与运行频率设计。
- `03_vln_implementation_gap_analysis.md`：架构目标与现有实现对照核查。核心主题：当前 `VLN -> NFM` 目标与原型实现的缺口对照。
- `04_vln_vla_comparison_table_review.md`：VLN vs VLA 技术对比表格审查。核心主题：对比表准确性与领域趋势复核。
- `05_kinbot_long_term_memory_design.md`：长期记忆设计。核心主题：长期记忆与七实体、三层状态、共享状态投影的关系。
- `06_kinbot_long_term_task_design.md`：长程任务设计。核心主题：长程任务的研究抽象、持久化状态与异常升级接口位。
- `07_kinbot_navigation_fundamental_problems_and_data_design.md`：导航基础问题定义与数据设计。核心主题：导航侧问题定义、共享状态依赖和数据规划。
