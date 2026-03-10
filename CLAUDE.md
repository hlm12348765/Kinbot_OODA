# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

Kinbot_OODA 是面向家庭室内场景的智能移动交互机器人系统设计项目。当前处于架构设计阶段（PDCP），目标在 2026-12-31 达到量产预备状态。

## 协作规则

### 每轮开始前必做

1. **检查 `docs/REQUIREMENTS.MD` 顶部"对 Codex 的要求"** 是否有更新
2. 所有文档和 Linear 协作条目统一用**中文**维护

### 文档维护权限

- `docs/REQUIREMENTS.MD` 由用户独占维护，**不得修改**
- 其他文档由 Claude 持续推进和维护

### 信息不足时的处理

当信息不足但推进不能停时，先形成"**架构师设想包**"，再提交审核。不要停滞等待。

### 产品定位检查

每一阶段都要检查系统各实体元素的组合，判断整机与服务是否仍然呈现"**聪明、温暖、精致**"的高端产品感，并能支撑 **20000 到 30000 元**售价区间。

## 核心架构原则

### OODA 主循环

系统以 OODA（Observe、Orient、Decide、Act）为主循环，已冻结为"**多尺度、并发、可中断、可动态调度**"的正式基线。

### 双视角基线

系统架构在 PDCP 节点采用"**双视角基线**"：
- 产品实体架构视图（机器人本体作为软硬一体产品实体显式纳入）
- 运行时功能架构视图

### 核心架构要素

- **World State**：统一的运行时结构化状态，作为认知中枢
- **安全/合规/授权**：作为动作前置门控
- **高频安全闭环**：保证运动安全
- **端云协同**：扩展知识和服务能力
- **R4 关系与服务环**：已进入一代正式架构层
- **OODA Scale Scheduler**：已提升为一级架构能力

### 架构分解规则

每一层级的实体个数控制在 **7±2 个**（即 5～9 个）。

## 项目管理

### 时间线

- 项目时间线按 2026-01-01 起算
- 目标 2026-03-31 完成产品定义与架构冻结
- 目标 2026-12-31 达到量产预备状态
- 2027-01 作为 MVP 验证与验收窗口

### 方法论

- 全生命周期管理参考 **IPD（集成产品开发）**流程
- 在每一个阶段完成计划转阶段时必须显性地提交审查
- 当前主优先级：PDCP 系统架构评审与总体方案下发

### 协作工具

- 阶段性待办和 issue 同步到 **Linear**
- 当前 Linear 项目：`Kinbot OODA 架构到量产预备`
- 涉及 VLN 路线和前瞻技术判断时，与专门的 VLN 技术评估线程通过独立 issue 交叉协作

## 文档结构

### 核心文档（推荐阅读顺序）

1. `docs/REQUIREMENTS.MD` - 产品需求、边界和工程约束（用户独占维护）
2. `docs/RULES.MD` - 系统架构设计原则
3. `docs/ARCHITECTURE.md` - 机器人 OODA 总体架构
4. `docs/VLN_ROLE_AND_PLAN.md` - VLN 在 OODA 中的角色分析与规划
5. `docs/WORKFLOW.md` - 从架构到落地的推进工作流
6. `docs/LIFECYCLE_WORKFLOW.md` - 全生命周期工作流与阶段门
7. `docs/OODA_MULTI_SCALE_ARCHITECTURE.md` - 多尺度动态 OODA 架构基线

### 架构设计文档

- `docs/MODULE_BOUNDARIES.md` - 模块分层与模块边界
- `docs/WORLD_STATE_SCHEMA.md` - 世界状态与核心实体结构
- `docs/DECISION_STATE_MACHINE.md` - 系统决策状态机
- `docs/SAFETY_COMPLIANCE_AUTHORIZATION_API.md` - 安全/合规/授权接口

### 功能域文档

- `docs/HEALTH_EVENT_PIPELINE.md` - 健康事件管线、补采逻辑与升级链路
- `docs/COMPANION_INTERACTION_STRATEGY.md` - 陪伴交互策略、人设边界与长期记忆规则
- `docs/SAFETY_RISK_MATRIX.md` - 一代安全风险域、降级策略与空间规则
- `docs/APP_CLOUD_OPS_MINIMAL_LOOP.md` - 家属 App、云服务与后台运营坐席的一代最小闭环

### 评审与基线文档

- `docs/PDCP_SYSTEM_ARCHITECTURE_REVIEW_PACKAGE.md` - 面向 IPD/PDCP 节点的完整系统架构评审包
- `docs/OVERALL_SOLUTION_AND_MODULE_DESIGN_BASELINE.md` - PDCP 通过后用于各模块展开架构与总体方案设计的下发基线
- `docs/ARCHITECTURE_RULES_REVIEW.md` - 总体架构与架构原则的符合度检查

### 工程化文档

- `docs/DEMO_TO_MASS_PRODUCTION_GAPS.md` - 当前样机 Demo 到量产预备状态的能力缺口
- `docs/ENGINEERING_NPI_BASELINE.md` - 工程化与 NPI 准备基线
- `docs/HARDWARE_SOFTWARE_SELECTION_MATRIX.md` - 一代软硬件选型矩阵
- `docs/COST_STRUCTURE_AND_TECH_DOWNPATH.md` - 整机 BOM 滚动成本基线与降本主战场
- `docs/POWER_BUDGET_AND_EFFICIENCY_STRATEGY.md` - 整机功耗预算与能效控制策略
- `docs/MASS_PRODUCTION_READINESS_CRITERIA.md` - 2026-12-31 量产预备判定标准
- `docs/MVP_VALIDATION_PLAN.md` - 量产预备与 2027-01 MVP 验证窗口
- `docs/PRODUCTION_INTRO_LAUNCH_AND_DELIVERY_CLOSURE.md` - 量产导入、发布准备与交付闭环

### 其他文档

- `docs/DECISION_LOG.md` - 已确认决策、开放问题与后续问题清单
- `docs/TERMINOLOGY.md` - 项目术语表
- `CHANGELOG.md` - 变更日志

## 文档编写规范

### 图示要求

对存在明确结构分解的架构文档，**优先配套直观图示**。重视架构图，文档中多用直观的图示。

### 文档引用

文档允许通过 `#[[file:<relative_file_name>]]` 引用其他文件（如 OpenAPI spec、GraphQL spec）。

## 术语约定

- **World State**：统一的运行时结构化状态
- **World Model**：如后续引入，专指用于预测或仿真未来环境和任务动态的模型
- **PDCP**：Product Definition & Concept Phase（产品定义与概念阶段）
- **IPD**：Integrated Product Development（集成产品开发）
- **NPI**：New Product Introduction（新产品导入）
- **OODA**：Observe、Orient、Decide、Act
- **VLN**：Vision-and-Language Navigation
- **VLM**：Vision-Language Model

## 当前工作重点

- 当前主优先级：PDCP 系统架构评审与总体方案下发
- 当前正在补充评审 KBT-31：PDCP 系统架构评审包，重点是"机器人本体实体架构 + 本体能力接口面"
- KBT-32 总体方案与模块方案下发基线等待 KBT-31 关闭后再进入主评审
- 当前问题澄清按"健康管理、陪伴交互、安全保障"三条主线并行推进

## 团队与资源

- 当前团队约 25-30 人，周期内预计扩展到 100 人以上
- 周期内预算约 8000 万 - 1 亿人民币
- 整机物料成本目标：6000-8000 元人民币

## 已有基础

- 所有讨论中的核心功能已经在真实自研机器人样机上做过粗放 Demo
- 具备较强的消费电子产研经验，覆盖平板类和 IoT 类产品
- 具备 VLM、VLN 能力，与行业 SOTA 差距约不到一年
