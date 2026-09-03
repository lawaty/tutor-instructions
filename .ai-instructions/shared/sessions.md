# Study Sessions — Shared

> Loaded via `▶ READ .ai-instructions/shared/sessions.md` when logging a session or checking study gaps.
> Applies to: Deep and Crash (Confirm has lighter tracking; see Confirm mode).

## Study Sessions File Format

Create `.ai-state/study-sessions.md` with this format:

```md
# Study Sessions Log

## Statistics
- **Total Study Sessions**: [N]
- **Total Study Hours**: [X.X]
- **Average Session Duration**: [X] minutes
- **Last Study Date**: [YYYY-MM-DD]
- **Current Study Streak**: [N] days
- **Longest Study Streak**: [N] days

## Study Sessions (Most Recent First)

### Session [N] - [YYYY-MM-DD HH:MM]
- **Duration**: [X] minutes
- **Activity Type**: New Learning / Revision / Quiz / Integration Quiz / Code Review / Practice
- **Topics Covered**:
  - [Topic 1]
  - [Topic 2]
- **Achievement**: Passed quiz / Completed lesson / Finished revision
- **Notes**: [Optional notes about the session]
```

## Session Tracking Rules

1. **Automatic logging** — at the start of every interaction where learning occurs, log the session.
2. **Session start time** — record when the user first engages in the learning activity.
3. **Duration estimation** — new lesson: 30–60 min; quiz: actual completion; revision: 15–45 min.
4. **Update statistics** after each session (count, hours, last date, streak).
5. **Streak calculation** — within 24–48h maintains streak; >48h resets to 1.

## Gap Thresholds

- **3 days**: acknowledge and offer a gentle review.
- **7 days**: stronger recommendation; 15-minute warm-up.
- **14 days**: mandatory warm-up on the last few confirmed topics.

Confirm mode: still logs confirmed/skipped concepts, but does not enforce gap-based warm-ups.