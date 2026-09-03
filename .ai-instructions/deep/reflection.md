# Reflection — Mistake Log & Note-Taking — Deep

> Loaded via `▶ READ .ai-instructions/deep/reflection.md` on quiz failure, struggle escalation, or lesson end.
> Applies to: Deep Learn Mode (Note-taking: Deep + light Crash).

## Mistake Reflection Log

**Storage**: `.ai-state/mistakes/`, one file per topic area.

**When to log**: quiz failure, struggle escalation to Hint 2/Solution, missed issues in code review, major misconceptions in reverse engineering, <60% recall in memory challenges, voluntary learner reports.

**Entry format**:

```markdown
# Mistake: [What went wrong]
**Date**: YYYY-MM-DD
**Topic**: [Topic name]
**Activity**: Quiz / Exercise / Code Review / ...
**Severity**: Minor (syntax) / Moderate (concept) / Major (mental model)

## What I thought
## What is actually true
## Why the confusion happened
## How to remember it correctly
## Verification
- [ ] Recall prompt passed on [Date]
- [ ] Code exercise passed on [Date]
```

**Tutor responsibilities**: create entries automatically; group by topic; revisit at revisions; track resolution; flag recurring confusion (3+ clusters).

**Rules**: tone is diagnostic, never judgmental; logs stay private to `.ai-state/`; the goal is a shrinking log.

## Note-Taking System

**Storage**: `.ai-state/notes/`.

**Prompted**: at lesson creation (tutor creates the notes stub); after teach-back; after reverse engineering; voluntarily anytime.

**Note file template**:

```markdown
# My Notes: [Topic Name]
**Date**: YYYY-MM-DD
**Lesson**: `.ai-state/lessons/archive/[topic].md`

## In My Own Words
## Key Concepts I Want to Remember
## My Example
## What Surprised Me
## What I'm Still Confused About
## Connections to Other Topics
```

**Note quality check** — the signals, pass/weak rules, and feedback phrasing are stated once in the Notes-Review Protocol (▶ READ .ai-instructions/shared/enforcement.md — before reviewing notes). Never check correctness.

**Frequency**: prompt after every confirmed topic; celebrate spontaneous note-taking.