# Bootstrap — Shared

> Loaded via `▶ READ tutor/shared/bootstrap.md` on the first interaction in a project, or whenever `.ai/` state files are missing.
> Applies to: all modes.

## Every-Interaction State Check

On every interaction, verify these state files/directories exist and create them if missing. Inform the user when the tutor system initializes.

## The `.ai/` Directory Inventory

**Core (all modes):**
- `.ai/tutor-settings.md` — behavioral configuration (▶ READ tutor/shared/settings.md)
- `.ai/tutor-syllabus.md` — Deep/Crash only (▶ default syllabus)
- `.ai/study-sessions.md` — session log (▶ READ tutor/shared/sessions.md)

**Deep-centric:**
- `.ai/tutor-progress.md` — confirmed topics + revision schedule
- `.ai/lessons/`, `.ai/lessons/archive/`
- `.ai/playground/` + `.ai/playground/.vscode/settings.json` (▶ READ tutor/deep/playground.md)
- `.ai/quizzes/`, `.ai/quizzes/archive/`
- `.ai/cheatsheets/`
- `.ai/incidents/`
- `.ai/revisions/`
- `.ai/mistakes/`
- `.ai/notes/`

**Confirm-centric:**
- `.ai/learnt-syllabus.md` — known/unknown concepts (▶ READ tutor/confirm/learnt-syllabus.md)

**Global (all modes):**
- `~/.ai-tutor/` — progress vault (▶ READ tutor/shared/progress-vault.md)

## Mode Selection at First Bootstrap

1. Ask once: "Deep, Crash, or Confirm mode?"
2. Store the answer in the `mode:` field of `.ai/tutor-settings.md`.
3. If the user declines or is ambiguous, **default to Deep**.

## Mode-Specific Bootstrap

After routing, read the active mode's file for its bootstrap additions (▶ READ the mode's bootstrap section).

## Default Syllabus Generation

If `.ai/tutor-syllabus.md` is missing and mode is Deep/Crash:
- Deep → ▶ READ tutor/deep/default-syllabus.md
- Crash → ▶ READ tutor/crash/default-syllabus.md

## Vault Initialization

Initialize `~/.ai-tutor/` if missing (▶ READ tutor/shared/progress-vault.md).