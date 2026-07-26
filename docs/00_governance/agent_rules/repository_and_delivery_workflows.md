# 仓库、协作与交付工作流

---

文档版本：v1.0
创建日期：2026-07-20
作者：Codex-架构师

文档变更记录：
- v1.0 | 2026-07-20 | Codex-架构师 | 从根级 `AGENTS.md` 拆出按需读取的 Git、Linear、特殊输入和交付工作流。

---

本文件不是每个任务的必读项。只有涉及项目管理、提交推送、输入资料、交付包、本地计划或 hook 时才读取相应章节。

## 1. Linear

- 项目、里程碑、Issue 和文档默认使用中文。
- 当前项目：`Kinbot OODA 架构到量产预备`。
- 主线文档影响协作边界时，检查 Project / Milestone / Issue 状态、Issue 描述和评论中的文档路径、中央同步文档。
- 关闭 Issue 前确认：结论稳定、用户已审阅、下游已同步、README / CHANGELOG / 决策记录已回写、Linear 索引已同步。
- 本地 `provisional` 和待办应与 Linear 承接项保持一致。

## 2. Git

- 默认在当前分支工作；提交前检查状态和差异。
- 不使用破坏性命令，不覆盖其他线程修改，不强推共享分支。
- 不把 `tmp/`、`logs/`、`.claude/`、`.obsidian/`、`.superpowers/`、`.DS_Store` 和被忽略的输入原件混入提交。
- 提交前检查路径引用、README 索引、旧路线 / 旧术语、Linear 状态和评审入口。
- 推送前检查分支、其他线程未提交成果、README、CHANGELOG 和决策记录。
- 用户要求维护多个分支时，每个分支分别维护、提交和推送。

## 3. 输入资料

- `input/` 只保存用户输入，不直接冻结产品、架构或组织结论。
- 奖项 / 项目申报资料放在 `input/02_award_nominations/` 本地留存，交付稿写入 `output/`；申报叙事只有形成稳定且经确认的判断时才回写主线。
- 外部设计候选放在 `input/03_design_candidates/`；它们是评审输入，不替代 P2、DVT 或主线架构结论。
- 候选人资料遵守 `docs/10_team_planning/AGENTS.md`。

## 4. 计划、日志与交付

- `plan/task_plan.md` 和 `plan/notes.md` 用于当前执行计划与工作笔记，不替代正式文档。
- `logs/` 可按环境分层，本地留存；只有稳定结论才回写正式文档。
- `tmp/` 只放临时产物，不进入版本历史。
- `output/` 放对外交付材料；多文件交付包按日期 / 主题建目录，并以 `README.md` 说明内容和使用方式。
- 使用 `docs/superpowers/` 时，活跃计划放 `plans/`，已被主线吸收的工作文档移入 `archive/`；它们不替代正式架构或阶段门文档。

## 5. Repo-local hook

- 当前可见 hook 配置以 `.claude/settings.json` 为准。
- 已知守卫为 `PreToolUse → Skill → .claude/hooks/check-gstack.sh`。
- `.claude/settings.json` 或 `.claude/hooks/` 变化时，先判断是否影响协作流，再决定是否更新规则。

## 6. 常用检查方式

优先使用最小范围的只读检查：

- `git status --short` 与目标文件差异：识别本轮和其他线程修改。
- `rg --files`：清点目录、索引和文件入口。
- `rg -n '<关键词>' <范围>`：检查旧路径、术语、状态或必填字段。
- `sed -n '<起始>,<结束>p' <文件>`：分段核对长文档。
- `git check-ignore -v <路径>`：确认本地输入和辅助文件不会被提交。

拆分前按人名、日期和字段名维护的大量只读命令保留在 `AGENTS_v1.64_full_archive.md`。它们是历史核查样例，不再作为所有任务的默认上下文。
