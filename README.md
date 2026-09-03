# AI Tutor Instructions System

This repository contains a structured tutor system that transforms your AI coding assistant into a senior technical mentor focused on **teaching** rather than just implementing solutions. It is **framework-agnostic** — it works with any coding agent that reads `AGENT.md`/`AGENTS.md` (or your preferred instruction file).

## 🎯 What This Does

When integrated into your project, the AI will:
- ✅ Teach you the concepts you need, in one of three modes you choose
- ✅ Only load the instructions relevant to the current mode (small contexts, works with small models)
- ✅ Track what you know so it never re-asks about confirmed concepts
- ✅ Work alongside your existing project files without overwriting them

## ✨ The Three Modes

| Mode | Purpose | Pace | Best For |
| ---- | ------- | ---- | -------- |
| **Deep Learn** | Comprehensive, long-term mastery — full lessons, file-based quizzes, spaced repetition, playground, meta-learning | Thorough | Committing to really learn a stack/framework |
| **Crash Learn** | Fast-track, actionable — each lesson completable in a few hours or less, minimal theory, quick-check | Speed | Getting productive fast on a narrow task |
| **Confirm** | Just-in-time — no course; before each non-trivial action, confirms you know the concepts, offers a 5–15 min micro-lesson or a recorded skip | Async with your work | Working on real projects, learning as you go |

You pick a mode once (default **Deep**); switch anytime in chat or via `.ai/tutor-settings.md`.

## 🚀 Quick Start

Run this from your project root — works for **both fresh installs and updates**:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/lawaty/tutor-instructions/main/setup.sh)
```

The script installs the `tutor/` instruction tree and creates entry-point files (`AGENT.md` + `AGENTS.md` by default). If your project already has its own `AGENT.md`/`AGENTS.md`/`CLAUDE.md`, it **never overwrites them** — it offers to append a small marked pointer block, or you can skip and add it manually.

### Alternative Methods

See **[INSTALL.md](INSTALL.md)** for clone-based install, `--mode`/`--frameworks` flags, and conflict behavior.

## 📁 What Gets Created

```
your-project/
├── AGENT.md                     # Thin pointer → tutor/README.md (yours or appended to yours)
├── AGENTS.md                    # Cross-tool standard pointer
├── tutor/
│   ├── README.md                # The router — loads only what's needed
│   ├── shared/                  # Cross-mode logic (bootstrap, principles, etc.)
│   ├── deep/                    # Deep Learn Mode
│   ├── crash/                   # Crash Learn Mode
│   └── confirm/                 # Confirm Mode
│   └── .tutor-manifest          # Ownership marker (never hand-edit)
├── .ai/                         # Runtime STATE (your data — never overwritten)
│   ├── tutor-settings.md        # mode + behavior settings
│   ├── tutor-syllabus.md        # (Deep/Crash) your syllabus
│   ├── tutor-progress.md        # (Deep/Crash) confirmed topics
│   ├── learnt-syllabus.md       # (Confirm) known/unknown concepts
│   └── lessons/  quizzes/  playground/  cheatsheets/  ...
└── ~/.ai-tutor/                 # Global progress vault (cross-project)
```

## 🧠 How It Works

### Small Contexts by Design

The system is a **lazy-loaded router**. The entry files are tiny pointers; the router at `tutor/README.md` is ~60 lines. Individual modes load their own instructions and drill down into sub-files only when needed:

```
AGENT.md ──▶ tutor/README.md ──▶ tutor/<mode>/mode.md ──▶ sub-files on trigger
```

An agent never ingests the whole tree at once — it loads the router plus only the relevant mode file. This keeps context small and usable with small free models.

### State vs. Instructions Are Separated

- **Instructions** (`tutor/`) are updated by the installer.
- **State** (`.ai/`, `~/.ai-tutor/`) is your data and is **never touched** by the installer.

## 🎓 Modes in Action

- **Deep**: strict tutor — lesson doc, "try it yourself" in the playground, file-based quiz (must pass), progress confirmation, spaced repetition, adaptive assistance levels, cheat sheets.
- **Crash**: fast-lane tutor — brief → demo → do → quick-check → confirm. Time-boxed; a simple review list replaces the spaced-repetition algorithm.
- **Confirm**: just-in-time tutor — before a non-trivial action, asks "Do you know X, or want a 5-minute rundown?" and records results in `.ai/learnt-syllabus.md` so it never re-asks about the same concept.

## 🔧 Customization

- **Mode**: edit `mode:` in `.ai/tutor-settings.md`, or just say "switch to crash mode".
- **Syllabus**: edit `.ai/tutor-syllabus.md` (Deep/Crash) to set topics and authoritative sources.
- **Confirm known concepts**: entries live in `.ai/learnt-syllabus.md`.

## 🛡️ Compatibility with Existing Projects

The installer treats every instruction file as **owned** (by this system) or **user-owned**:
- Owned (ours) → safely rewritten/updated.
- User-owned → **never overwritten**; a small marked pointer block is appended (with your consent) or skipped with a manual snippet shown.

Backup your own `AGENT.md`? Not needed — the installer never destroys it. It also handles case-insensitive filesystems (macOS) and symlinked entry files safely. See [INSTALL.md](INSTALL.md#conflict-handling).

## 💡 Example Interaction (Deep Mode)

```
You: "Build a Laravel API endpoint with validation and policies"

Agent: "I've checked your progress. To build this you need:
       1. Laravel Validation
       2. Authorization Policies
       Let's start with Validation... [teaches, then creates a quiz file]
       Open .ai/quizzes/validation-quiz.md and fill it in."
```

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Suggestions welcome via issues/PRs.

## 📄 License

MIT License — feel free to use and modify for your projects.

## 🔗 Links

- [GitHub Repository](https://github.com/lawaty/tutor-instructions)
- [Issues](https://github.com/lawaty/tutor-instructions/issues)