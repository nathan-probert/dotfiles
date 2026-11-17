# MANDATORY: load the `code-worktree` skill before any repo work

The instant a task involves reading, creating, editing, or deleting any file
inside a git repository (anything under `/home/nathan/code` or elsewhere),
invoke the `code-worktree` skill FIRST — before the first edit, and before
committing, pushing, or opening a PR.

- This is not a judgment call and has no size threshold: "small" edits and
  typo fixes count. Config/docs-only changes count.
- If you already loaded a different skill (e.g. `opencode`) at session start,
  that does NOT satisfy this rule. Re-check and load `code-worktree` the
  moment the task turns out to involve a repo.
- Everything the skill mandates follows automatically once it is loaded:
  fresh worktree per task, never committing to main, tests before push, and
  every change going up as a PR via `gh` with the link posted to chat.
- If you ever notice you've made repo edits without having loaded the skill,
  stop and load it before doing anything else (including committing).
