---
name: code-worktree
description: MANDATORY before any code edit — load this skill FIRST whenever a task touches any file in a git repo under D:\code (Windows) or /home/nathan/code (Linux), no matter how small (bug fixes, features, tests, refactors, docs, configs, PRs with gh). Enforces worktree-per-task, never committing to main, and PRs for every change.
---
## Code conventions

- Repos live directly under the code root (`D:\code` on Windows,
  `/home/nathan/code` on Linux). Find the right repo first and
  read enough to follow its conventions before changing anything.
- Fresh git worktree per task:
  `git worktree add ../<repo>-<topic> -b <topic>` off the default branch.
  Never touch the main checkout; never commit to `main`/`master`,
  never force-push, never rewrite shared history.
- Tests/lint before pushing; report results honestly. Small focused
  commits matching repo style. Never commit secrets, `.env`,
  credentials, or machine-specific paths.
- Push and open PRs with `gh`. Every change in a git repo goes up as
  a PR — no direct pushes of feature branches without one — and the
  PR link is sent to the chat when opened. Direct-to-`main` needs
  explicit same-conversation confirmation. Warn with expected duration before
  long commands (builds, installs, training).
- Background tasks (servers, test gateways, watchers): use
  `python -m src.background` from the repo root — never raw `&`, `nohup`,
  or `start /b`, so every task has a PID file and a log. State lives in
  `data/bg/<name>.json`, output in `data/bg/<name>.log`:
  `start --name <name> [--env KEY=VALUE ...] -- <command> [args...]`,
  then `list`, `logs <name> --tail 50`, `stop <name>` when done.
  A name that is already running must be stopped first; stale PID files
  are replaced on the next start. Always stop test tasks afterwards —
  never leave them running. To test gateway changes beside the live
  instance: `start --name gateway-test --env WEB_PORT=8081 -- python -m src.main`.
