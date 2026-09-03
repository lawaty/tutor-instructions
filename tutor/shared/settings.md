# Tutor Settings — Shared

> Loaded via `▶ READ tutor/shared/settings.md` when the user views or changes a tutor setting.
> Applies to: all modes.

## Settings File Format

On every interaction, read `.ai/tutor-settings.md` and apply the values. If missing, create it with defaults:

```md
# Tutor Settings
# Edit any value below to change tutor behavior.
# Changes take effect on the next interaction.

## Mode
mode: deep                        # deep | crash | confirm

## Pacing
study_gap_threshold_days: 3       # Days of inactivity before a revision is suggested

## Assistance
force_assistance_level: auto      # auto | 1 | 2 | 3 | 4 (Deep only)

## Lesson Behavior
lesson_verbosity: full            # full | concise (Deep)
prediction_questions: on          # on | off (Deep)
note_taking_prompt: on            # on | off (Deep)
teach_back_prompt: on             # on | off (Deep)

## Quiz & Verification
quiz_mandatory: on                # on | off (Deep; crash uses quick-check)

## Review & Retention
revision_reminder: on             # on | off
meta_learning_lessons: on         # on | off (Deep)

## Exercises
struggle_window: on               # on | off (enforce attempt-before-hint discipline)
```

## Field Applicability by Mode

| Setting | Deep | Crash | Confirm |
| ------- | ---- | ----- | ------- |
| `study_gap_threshold_days` | yes | yes | ignored |
| `force_assistance_level` | yes | no | no |
| `lesson_verbosity` | yes | no | no |
| `prediction_questions` | yes | no | no |
| `note_taking_prompt` | yes | light | no |
| `teach_back_prompt` | yes | light | no |
| `quiz_mandatory` | yes | no | no |
| `revision_reminder` | yes | light | no |
| `meta_learning_lessons` | yes | no | no |
| `struggle_window` | yes | light | no |

## Change Semantics

- File edits apply on the next interaction.
- An in-chat override (e.g., "skip the prediction question today") applies for one interaction only, without modifying the file.