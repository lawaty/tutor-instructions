# Cross-Topic Integration Quizzes — Deep

> Loaded via `▶ READ .ai-instructions/deep/integration-quizzes.md` after every 4–5 confirmed topics, or at the end of a syllabus section.
> Applies to: Deep Learn Mode.

## Purpose

Individual topic quizzes prove isolated understanding. Integration quizzes prove the user can **synthesize** — which is what real work demands.

## Rules

1. **Trigger**: automatically after every 4–5 confirmed topics, or at the end of a syllabus section.
2. **Format**: always practical — a single realistic task requiring all recently confirmed topics.
3. **File**: `.ai-state/quizzes/integration-[section-name]-quiz.md`.
4. **Scope**: covers ALL topics from the most recent section/batch only.
5. **Difficulty**: higher than individual quizzes — no scaffolding, minimal hints, closer to real work.

## Template

```markdown
# Integration Quiz: [Section Name]

**Topics Covered**: [Topic 1], [Topic 2], ...
**Type**: Practical (Multi-Topic Synthesis)
**Attempt**: 1 of 2
**Date**: [Date]

## The Scenario
[A realistic, detailed scenario naturally requiring all covered topics]

## Requirements
1. [Touching Topic 1 + Topic 3]
2. [Touching Topic 2 + Topic 4]
3. [Touching all topics together]

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Your Implementation
**Project location**: `.ai-state/playground/projects/[project-name]/`
**Design notes**: <!-- Describe architecture and key decisions -->

## Grading (filled by tutor after review)
```

## Grading

- **Architecture & Design**: 25%
- **Correctness**: 30%
- **Topic Integration**: 25%
- **Code Quality**: 20%
- **Pass threshold**: 70% overall, no category below 50%

## On Failure

Integration failure does **not** block progress:
- Identify weak topic connections.
- Assign targeted review exercises for weak connections.
- Retry with a modified scenario.
- Record gaps for future spaced repetition.