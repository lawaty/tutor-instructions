# Contributing to AI Tutor Instructions

Thank you for your interest in contributing! This project provides a mode-based tutoring system for AI coding assistants, designed around small contexts and lazy-loaded instructions.

## Repository Layout

```
tutor-instructions/
├── AGENT.md              # Repo entry point (thin pointer to the router)
├── setup.sh              # Installer (conflict-safe entry-point creation)
├── tutor/                # The shipped instruction tree
│   ├── README.md         # The router — the single source for routing logic
│   ├── shared/           # Cross-mode logic
│   ├── deep/  crash/  confirm/   # The three modes
├── examples/             # Example syllabi
└── docs + license
```

## The `▶ READ` Convention

The system keeps context small by **lazy-loading** instructions. This is the core of the design — preserve it:

1. Every on-demand reference uses a directive: `▶ READ tutor/deep/quiz-system.md — before creating any quiz file`.
2. Paths are relative to the project root (where the pointer files live).
3. When a trigger is met, read the file BEFORE continuing the current step.
4. Never preload the whole tree; load only on trigger.
5. Read each file at most once per session.

### Rules for Contributors

- **Line budgets**: `tutor/README.md` (the router) ≤ 200 lines; every other file in `tutor/` ≤ 300 lines.
- Every file must start with the standard 3-line header (title, load source/trigger, applies-to).
- Every new file must be **reachable via a `▶ READ` chain from `tutor/README.md`** — no orphan files.
- Use standard markdown headings (`##`/`###`), not decorative rule lines.
- Keep each mode **self-contained**: shared logic lives in `shared/`; modes only calibrate it. Do not duplicate shared logic into mode files.

### Reference Check

After changing files, run this to confirm every `▶ READ` target exists (the `tutor/<mode>/mode.md` placeholder in the router is intentional):

```bash
grep -rhoP '▶ READ *\`?\K[^` —）).:]+(?:\.[a-z]+)' AGENT.md tutor/ | sort -u | while read -r f; do
    [[ "$f" == *"/"* ]] && { [ -f "$f" ] || echo "MISSING: $f"; }
done
```

### Copilot / Framework Names

The instruction content is framework-agnostic — but the playground's `.vscode/settings.json` intentionally keeps `github.copilot.enable: {"*": false}` because it functionally disables AI autocomplete during recall exercises. **Do not remove it**; it is one of several ways to turn off autocomplete and its intent is framework-independent.

## How to Contribute

### 1. Report Issues
Use GitHub Issues; provide clear descriptions, the mode involved, and expected vs. actual behavior.

### 2. Submit Example Syllabi
- Deep: `examples/syllabus-[technology].md`
- Crash (optional): `examples/syllabus-[technology]-crash.md` with time-box annotations

### 3. Improve Instructions / New Modes
- Discuss major changes in an issue first
- Ensure new files follow the `▶ READ` convention and line budgets
- Update `tutor/README.md`’s file index if you add files
- Update docs (README, INSTALL, QUICKSTART) and `setup.sh` if you add entry points or flags

### 4. Documentation
Fix typos, improve setup instructions, add examples.

## Guidelines

### Philosophy
- **Understanding over speed**, **Files over memory**, **Mastery over completion**, **Production realism** — the 13 principles live in `tutor/shared/principles.md`.
- Small contexts matter: never overload a model with the whole tree.

### Code Style
- Keep instructions clear and concise.
- Consistent formatting; standard markdown headings.
- Test all scripts before submitting.

### Testing the Setup Script
```bash
mkdir /tmp/tutor-test && cd /tmp/tutor-test && git init
/path/to/tutor-instructions/setup.sh --yes --dry-run
/path/to/tutor-instructions/setup.sh --yes        # real install
ls AGENT.md AGENTS.md tutor/
# Conflict scenarios: create your own AGENT.md first, re-run, confirm it's preserved
```

### Commit Messages
- Clear, descriptive; start with a verb; reference issues when applicable.

Example:
```
Restructure tutor system into three modes

- Split monolith into tutor/{shared,deep,crash,confirm}
- Add lazy-load router at tutor/README.md
- Rewrite setup.sh for conflict-safe entry points
```

## Example Contributions We Need

- [ ] Crash-mode example syllabi for more frameworks
- [ ] Confirm-mode micro-lesson templates for common topics
- [ ] New agent-framework entry-point templates (setup.sh slots)
- [ ] Translations
- [ ] Improvements to router efficiency / context budgeting

## Questions?

Open an issue with the `question` label, or start a discussion in GitHub Discussions.

## Code of Conduct

Be respectful, constructive, and helpful. We're all here to learn and improve.