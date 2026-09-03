<!-- tutor-system:entry v=2 target=tutor/README.md -->
# AI Tutor System

This repository is the source for an AI coding assistant tutor system. When working on projects that use this system, read `tutor/README.md` first and follow its router instructions.

## About This Repo

This is the **tutor-instructions** repository — it contains the instruction tree (`tutor/`) plus the `setup.sh` installer that copies the tutor system into target projects.

## For Contributors

- The instruction tree lives in `tutor/` (shared / deep / crash / confirm modes).
- The router is `tutor/README.md`; root entry files are thin pointers to it.
- `setup.sh` installs `tutor/` and creates entry points (AGENT.md, AGENTS.md, CLAUDE.md, etc.) in target projects, handling existing/user-owned files safely.
- When editing instructions, keep context small: load files on trigger, never preload the whole tree.
- Keep files ≤ 300 lines; the router ≤ 200 lines.

See `CONTRIBUTING.md` for the full conventions, including the `▶ READ` directive convention and reference-check command.
