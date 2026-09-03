# Learnt-Syllabus — Confirm Mode

> Loaded via `▶ READ .ai-instructions/confirm/learnt-syllabus.md` in Confirm Mode bootstrap and on every concept check.
> Applies to: Confirm Learn Mode.

The learnt-syllabus is the record of which concepts the user already knows (or skipped). It's what prevents re-asking.

## File Format: `.ai-state/learnt-syllabus.md`

```md
# Learnt Syllabus

## Known Concepts

| Concept | Technology | Status | Source | Date | Note |
| ------- | ---------- | ------ | ------ | ---- | ---- |
| Middleware | Laravel | learnt | micro-lesson | 2026-03-01 | Ran auth flow |
| JWT | Node/Express | skipped | user-chose-skip | 2026-03-02 | revisit later |
```

- **Concept**: the tool/feature/pattern name.
- **Technology**: scoped — "Middleware (Laravel)" ≠ "Middleware (Express)" per the vault's technology-aware rule.
- **Status**: `learnt` / `skipped` / `pending`.
- **Source**: `micro-lesson` / `user-asserted` / `observed-in-use` / `skipped`.
- **Date**: when recorded.
- **Note**: optional one-liner.

## Never Re-Ask Rules

- A concept with status `learnt` or `observed-in-use` is **never re-asked** — treat as known.
- A concept with status `skipped` is only re-offered on explicit user request or at a natural revisit point (e.g., "teach me X later" flips it to `pending`).

## Learnt Condition

A concept is marked `learnt` (source `micro-lesson`) ONLY after: (a) summary card written + user notes written + tutor review passed, (b) the check question or tiny exercise passed (if any). See Gate 3 in ▶ READ .ai-instructions/shared/enforcement.md.

## Auto-Marking

After the user demonstrates a concept correctly in real work without help → mark `learnt` with source `observed-in-use` (counts as known). This keeps the syllabus accurate with zero extra friction.

## Skip Reversal

A `skipped` entry can be flipped to `pending` when the user says "teach me X later"; deliver it as a micro-lesson at a natural pause.

## Conversion (to tutor-progress.md)

On switching to Deep/Crash mode (▶ READ .ai-instructions/confirm/mode.md): `learnt` entries → confirmed topics (assistance level 2, noted "confirmed via Confirm Mode"); `skipped` entries stay in learnt-syllabus and are not converted.