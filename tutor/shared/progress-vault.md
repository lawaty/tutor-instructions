# Progress Vault — Shared

> Loaded via `▶ READ tutor/shared/progress-vault.md` when confirming a topic, or at session start when `~/.ai-tutor/` exists.
> Applies to: all modes.

## Vault Structure

On first initialization, create `~/.ai-tutor/`:

```
~/.ai-tutor/
├── global-progress.md          # Master progress across all projects
├── cheatsheets/                # All cheat sheets (accumulated across projects)
├── projects/                   # Per-project snapshots
│   └── [project-name]/
│       ├── progress.md         # Snapshot of .ai/tutor-progress.md
│       └── syllabus.md         # Copy of the project's syllabus
├── stats.md                    # Aggregate learning statistics
└── README.md                   # Self-documenting vault explanation
```

## Global Progress Format

```md
# Global Learning Progress

**Last updated**: [Date]
**Total topics confirmed**: [N]
**Projects tracked**: [N]

## Confirmed Skills (cross-project)

### [Technology/Framework]

| Topic | Confirmed Date | Project | Quiz Score | Cheat Sheet |
| ----- | -------------- | ------- | ---------- | ----------- |

## Topics Needing Review

| Topic | Last Failed | Project | Reason |
| ----- | ----------- | ------- | ------ |
```

## Sync Protocol

**On session start (every interaction):**
1. Check if `~/.ai-tutor/` exists; if so, read `global-progress.md`.
2. Cross-reference with `.ai/tutor-progress.md` (Deep/Crash) or `.ai/learnt-syllabus.md` (Confirm).
3. If the vault has topics confirmed in other projects that match, offer optional carry-over (opt-in).
4. If local progress is newer, sync it up.

**On topic confirmation:**
1. Update local progress.
2. Update `~/.ai-tutor/global-progress.md`.
3. Update `~/.ai-tutor/projects/[project]/`.
4. Copy/update cheat sheet to `~/.ai-tutor/cheatsheets/`.
5. If Git-backed: `git add -A && git commit` — **never auto-push**.

## Stats Tracking

Track aggregate stats: total sessions, topics confirmed, quizzes taken, average score, monthly summaries, strengths, and areas for improvement.

## Vault Rules

1. **Never lose data** — the vault only adds, never deletes progress.
2. **User controls sync** — auto-commit locally, push/pull is manual.
3. **Carry-over is opt-in** — always ask before marking vault topics as confirmed.
4. **Technology-aware** — topics are grouped by technology ("Middleware (Laravel)" ≠ "Middleware (Express)").
5. **Portable** — plain Markdown files, no special tools required.

**Confirm mode**: the learnt-syllabus entries (concept + technology scope) sync here too, so known concepts persist across projects.