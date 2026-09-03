# Quiz System — Deep

> Loaded via `▶ READ tutor/deep/quiz-system.md` at Teaching Workflow step 6.
> Applies to: Deep Learn Mode.

Before confirming any topic, verify understanding through a quiz.

## File-Based Quiz Delivery

**All quizzes are delivered as structured files — not asked in chat.**

1. Tutor creates a quiz file at `.ai/quizzes/[topic-name]-quiz.md`.
2. User opens the file and writes answers directly in it.
3. User tells the tutor they're done.
4. Tutor reads the file and reviews all answers.
5. Tutor provides feedback in chat or appends a grading section.
6. On pass: move quiz file to `.ai/quizzes/archive/`.
7. On fail: update the file with feedback and a new attempt section.

## Quiz File Template

```markdown
# Quiz: [Topic Name]

**Topic**: [Topic Name]
**Type**: Theoretical / Practical
**Attempt**: 1 of 2
**Date**: [Date]
**Source**: [Book/Doc], Chapter X

## Instructions
- Write your answers directly below each question
- Do NOT look at the lesson, docs, or IDE autocomplete while answering recall questions
- For practical tasks, write code in the playground and reference the file path
- When done, tell the tutor you're ready for review

## Part 1: Recall / Memorization
### Q1: [Question]
**Your Answer:**
<!-- Write here -->
### Q2: [Question]
**Your Answer:**
<!-- Write here -->

## Part 2: Understanding
### Q3: [Question]
**Your Answer:**
<!-- Write here -->
### Q4: [Question]
**Your Answer:**
<!-- Write here -->

## Part 3: Practical Exercise
### Task: [Task with clear requirements]
**Acceptance Criteria:**
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3
**File**: <!-- path to implementation -->
**Explain your approach:**
<!-- Briefly explain design decisions -->

## Grading (filled by tutor after review)
<!-- DO NOT WRITE BELOW THIS LINE -->
```

## Quiz File Rules

1. Never ask quiz questions in chat — always create the file.
2. Keep questions and answers together — the file is the single source of truth.
3. Practical tasks reference playground files.
4. Grading section is appended by the tutor after review.
5. On failure, append a new attempt section to the same file.
6. On pass, move the whole file to `.ai/quizzes/archive/`.
7. The quiz file serves as a permanent study record.

## Quiz Type Decision Tree

**Always prefer practical quizzes:**
1. **Practical Quiz (DEFAULT, 90%)** — any topic involving code, tools, implementation. Format: recall (1–2) + hands-on exercise (1 main task).
2. **Theoretical Quiz (RARE)** — pure concepts with no code manifestation. Format: memorization (1–2) + understanding (2–4) + mini-practical if possible.

**Rule of thumb**: if you can write even 3 lines of code about the topic, use a practical quiz.

## Theoretical Concepts

Includes all three components:
1. **Memorization Questions (MANDATORY, 1–3)** — key terms, definitions, sequences, syntax patterns, API structures.
2. **Understanding Questions (MANDATORY, 2–5)** — explain in own words, why it matters in production, apply to real scenario, debug/ troubleshoot.
3. **Practical Application (MANDATORY unless impossible)** — hands-on task in `.ai/practice/` or the actual project.

## Practical Concepts

Includes all components:
1. **Recall Questions (MANDATORY, 1–3)** — syntax without IDE, method names/params, file locations, keyboard shortcuts.
2. **Hands-on Exercise (MANDATORY, 1–2 tasks)** — realistic context:
   - **Default: Playground-based** — direct user to write in the playground, tutor reviews, code stays as reference.
   - **Prefer: Direct application to the current project** — immediate practical value.
   - **Alternative: Isolated educational scenario** — temp `.ai/practice/[topic]-[date]/`, score 0–100 (correctness 40% / code quality 30% / understanding 30%), delete on success.

## Quiz Rules

1. All quizzes are file-based.
2. Difficulty matches syllabus depth.
3. No hints during the quiz (only after failure).
4. On failure: append grading + feedback, re-teach in chat, append Attempt 2 with different questions.
5. **Maximum 2 attempts** per topic (tracked in the same file).
6. If still failing after 2: mark "needs review", suggest revisiting sources, do not proceed to dependent topics.
7. On pass: move quiz to archive.
8. User reviews at their own pace — never rush.

## Quiz Passing Criteria

- **Theoretical**: all memorization correct; ≥2 of 3 understanding with clear reasoning.
- **Practical**: correct recall syntax; working implementation showing understanding; **Implementation Score ≥ 70%** (Correctness 40 / Code Quality 30 / Understanding 30).

Memorization is as important as understanding — both train different cognitive skills.

## Educational Scenario Best Practices

1. Scaffold appropriately — provide structure so the user focuses on the learning objective.
2. Cleanup protocol — delete practice directory only after review, score, user confirmation.
3. Scenario reusability — on retry, modify slightly to prevent memorization.