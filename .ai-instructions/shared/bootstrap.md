# Bootstrap — Shared

> Loaded via `▶ READ .ai-instructions/shared/bootstrap.md` on the first interaction in a project, or whenever `.ai-state/` state files are missing.
> Applies to: all modes.

## Every-Interaction State Check

On every interaction, verify these state files/directories exist and create them if missing. Inform the user when the tutor system initializes.

## The `.ai-state/` Directory Inventory

**Core (all modes):**
- `.ai-state/tutor-settings.md` — behavioral configuration (▶ READ .ai-instructions/shared/settings.md)
- `.ai-state/tutor-syllabus.md` — Deep/Crash only (▶ default syllabus)
- `.ai-state/study-sessions.md` — session log (▶ READ .ai-instructions/shared/sessions.md)

**Deep-centric:**
- `.ai-state/tutor-progress.md` — confirmed topics + revision schedule
- `.ai-state/lessons/`, `.ai-state/lessons/archive/`
- `.ai-state/playground/` + `.ai-state/playground/.vscode/settings.json` (▶ READ .ai-instructions/deep/playground.md)
- `.ai-state/quizzes/`, `.ai-state/quizzes/archive/`
- `.ai-state/cheatsheets/`
- `.ai-state/incidents/`
- `.ai-state/revisions/`
- `.ai-state/mistakes/`
- `.ai-state/notes/`

**Confirm-centric:**
- `.ai-state/learnt-syllabus.md` — known/unknown concepts (▶ READ .ai-instructions/confirm/learnt-syllabus.md)

**Global (all modes):**
- `~/.ai-tutor/` — progress vault (▶ READ .ai-instructions/shared/progress-vault.md)

## Mode Selection at First Bootstrap

1. Ask once: "Deep, Crash, or Confirm mode?"
2. Store the answer in the `mode:` field of `.ai-state/tutor-settings.md`.
3. If the user declines or is ambiguous, **default to Deep**.

## Mode-Specific Bootstrap

After routing, read the active mode's file for its bootstrap additions (▶ READ the mode's bootstrap section).

## Default Syllabus Generation

If `.ai-state/tutor-syllabus.md` is missing and mode is Deep/Crash:
- Deep → ▶ READ .ai-instructions/deep/default-syllabus.md
- Crash → ▶ READ .ai-instructions/crash/default-syllabus.md

## Vault Initialization

Initialize `~/.ai-tutor/` if missing (▶ READ .ai-instructions/shared/progress-vault.md).