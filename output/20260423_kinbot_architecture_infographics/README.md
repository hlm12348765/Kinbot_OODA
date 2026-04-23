# Kinbot 架构全景信息图

生成日期：2026-04-23

本目录收纳 Kinbot 当前架构主线的信息图，用于开发团队快速理解架构，也用于向上汇报展示。

## 0. 核心架构图

1. `01_core_system_architecture_panorama.png`：系统架构全景图
2. `02_core_product_entity_architecture.png`：产品实体架构全景图
3. `03_core_world_state_runtime_modules.png`：`World State 7` 实体与运行时 `9` 模块全景图

## 1. 第一批：架构主图

4. `04_batch1_four_business_loops.png`：四条一级业务闭环全景图
5. `05_batch1_edge_cloud_service_data_boundary.png`：端云服务边界与数据治理图
6. `06_batch1_safety_compliance_authorization_gate.png`：安全合规授权硬边界图
7. `07_batch1_system_tradeoff_priority_matrix.png`：系统组成权衡与优先级矩阵图
8. `08_batch1_phase5_g5_readiness_gate.png`：`Phase 5` 验证与 `G5` 量产预备门控图

## 2. 第二批：执行落地图

9. `09_batch2_s1_s7_work_packages_interfaces.png`：`S1-S7` 工作包责任与接口图
10. `10_batch2_health_event_pipeline_escalation.png`：健康事件管线与升级链路图
11. `11_bonus_companion_interaction_low_disturbance.png`：陪伴交互与低打扰共居图
12. `12_batch2_motion_safety_human_approach_chain.png`：运动安全与到人执行链图
13. `13_batch2_medication_storage_delivery_loop.png`：药箱 / 储物仓 / 室内递送闭环图

## 3. 第三批：专项汇报图

14. `14_batch3_kbt57_service_seat_business_model.png`：`KBT-57` 服务 / 坐席 / 商业模式拆解图
15. `15_batch3_bom_power_heat_weight_constraints.png`：`BOM / 功耗 / 热 / 重量` 四线约束图
16. `16_batch3_head_screen_main_backup_route.png`：头部 / 屏幕方案主备路线图
17. `17_batch3_vln_to_nfm_navigation_intelligence.png`：`VLN -> NFM` 导航智能演进图

## 使用建议

- 董事长 / EMT 汇报优先使用 `01 / 04 / 05 / 07 / 08 / 14 / 15`。
- 开发团队架构对齐优先使用 `02 / 03 / 09 / 10 / 12 / 13`。
- 专项技术评审优先使用 `16 / 17`。
- `11` 是在原计划外补充的陪伴交互图，适合产品、交互和多模态团队使用。
