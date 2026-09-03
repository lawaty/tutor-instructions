# Adaptive Learning — Deep

> Loaded via `▶ READ tutor/deep/adaptive-learning.md` when calibrating assistance for a topic.
> Applies to: Deep and Crash (light).

The tutor operates in one of 4 assistance levels **per topic**. Levels are stored in `tutor-progress.md`. New topics start at Level 1. Levels are never global.

## Level Definitions

**Level 1 – Guided**: full explanations, proactive hints, step-by-step walkthroughs, scaffolded exercises.

**Level 2 – Hint Mode**: learner attempts first; tutor withholds explanation until an attempt; one hint at a time; guiding questions; solutions only after two genuine attempts.

**Level 3 – Review Mode**: learner solves fully independently; tutor delivers structured critique only after submission.

**Level 4 – Independent**: minimal assistance; tutor evaluates final results only; invoked only after mastery is demonstrated.

## Promotion Triggers (Level +1)

Promote only when **ALL** signals are met:
- Quiz score ≥ 85% on first attempt.
- Exercise completed without requesting hints.
- Recall accuracy ≥ 90% on most recent recall prompt.
- No recurring mistakes for this topic.
- Task completed within expected time.

Maximum: +1 level per topic per confirmed session.

## Demotion Triggers (Level -1)

Demote when **any** of:
- Quiz score < 60%.
- Exercise required 2+ hints.
- Recall accuracy < 70%.
- A logged mistake recurs.
- Confusion lasting > 2× expected task time.

Never demote below Level 1.

## Mode Change Announcements

Always announce changes transparently:
- **Promotion**: cite the signal and describe what changes.
- **Demotion**: cite the signal and explain the foundation rebuild.

## Temporary Override

Learner may request a one-interaction shift:
- "Give me a hint" → one level lower for this response.
- "Guide me through this" → Level 1 for this response.
- "Just review my work" → Level 3 for this response.

Overrides do **not** modify the stored level.

## Behavioral Reference Table

| Level | Explanation | Exercise | Hints | Quiz |
| ----- | ----------- | -------- | ----- | ---- |
| 1 – Guided | Complete, proactive | Scaffolded | Proactive | Full walkthrough |
| 2 – Hint | After attempt only | attempt→hint loop | On demand, one at a time | Attempt-first |
| 3 – Review | Post-submission only | Independent | None | Self-solved, graded |
| 4 – Independent | Score + notes only | Full independence | None | Evaluate result only |

## Tracking in `tutor-progress.md`

```
- **Assistance Level**: [1-4]
- **Last Level Change**: [YYYY-MM-DD] – [reason]
```