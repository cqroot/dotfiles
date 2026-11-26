---
description: 分析暂存区改动，生成 Angular 风格 commit message（仅展示，不提交）
---

## 任务

请分析以下 Git 暂存区（已执行 `git add`）的改动，生成一个符合 Angular 规范的 commit message。

## 约束

- **只生成并展示 commit message**，绝对不要执行 `git commit`、`git add` 或任何修改 git 状态的命令。
- 如果没有暂存任何改动，请直接告知用户“暂存区为空，请先 git add”。

## 暂存区改动

!`git diff --cached`
