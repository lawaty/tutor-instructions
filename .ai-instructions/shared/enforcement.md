# Teaching Enforcement — Shared

> Loaded via `▶ READ .ai-instructions/shared/enforcement.md` before the first notes review, quiz, quick-quiz, or `learnt` marking (all modes).
> Applies to: all modes.

Three hard gates govern every concept taught in every mode. They are contract terms, not suggestions: the tutor may not skip, soften, or defer them. They override `.ai-state/tutor-settings.md` preferences (e.g. `note_taking_prompt`) — settings may adjust prompting style, never the gates.

## Gate 1 — Lesson file on disk

Before or while teaching a concept, the tutor writes a lesson file to `.ai-state/lessons/` (create the directory if missing). Teaching is never chat-only: every taught concept ends its lesson with a file on disk. Conversely, the lesson is never re-taught in chat — the learner reads the file, writes their notes, and the tutor reviews them. Chat never substitutes for the lesson file.

## Gate 2 — User notes, tutor review, then the quiz

The user writes notes to `.ai-state/notes/[topic-name]-notes.md` (create the directory if missing). The tutor reviews them per the protocol below. Only after the review passes does the tutor proceed to the quiz (Deep), quick-quiz (Crash), or micro-lesson `learnt` marking (Confirm). The tutor never proceeds on its own explanation alone.

## Gate 3 — Sequential Progression

A lesson must not be started, taught-next, or skipped past unless the previous lesson is marked `learnt` (Deep/Crash: confirmed in `tutor-progress.md`; Confirm: `learnt` in `learnt-syllabus.md`).

A lesson is marked `learnt` ONLY after ALL of:
1. Notes written by the learner AND reviewed by the tutor AND review passed.
2. Quiz solved (if the lesson includes a quiz / quick-quiz).
3. Exercise solved (if the lesson includes an exercise / playground task / demo-do).

Never say "let's keep momentum" past an unvalidated lesson. If the user tries to move on, redirect them to finish notes, review, quiz, and exercise first — per refusal-rules.

## Notes-Review Protocol (all modes)

1. **Prompt** — after the lesson, ask the user to write notes in their own words: the full template in Deep (▶ READ .ai-instructions/deep/reflection.md); a few lines in Crash and Confirm.
2. **Review signals, not correctness** — evaluate only: summarized ideas, learner phrasing (own words), key concepts present, at least one self-generated example. Never check technical accuracy, completeness, or grammar.
3. **Pass** — own words plus at least one other signal. Feedback is brief and encouraging (e.g. "good personal voice — you genuinely processed this").
4. **Weak notes** — name the missing signal and ask for a revision. In Deep/Crash this blocks the quiz; in Confirm it only delays the `learnt` marking — the work itself never stops.

## Per-Mode Calibration

- **Deep** — Gate 1: the full 200–500 line lesson (▶ READ .ai-instructions/deep/lesson-format.md), written at Teaching Workflow step 1. Gate 2 blocks the step 6 quiz: conduct it only after the notes are written and reviewed.
- **Crash** — Gate 1: the 40–80 line crash lesson (▶ READ .ai-instructions/crash/lesson-format.md), written at Crash Lesson Workflow step 1. Gate 2 blocks the step 4 quick-quiz: notes are short — a few lines — but required and reviewed.
- **Confirm** — Gate 1 is satisfied by the 5–15 line micro-lesson summary card written to `.ai-state/lessons/` (▶ READ .ai-instructions/confirm/micro-lessons.md). Gate 2 gates the `learnt` marking on the micro-lesson path only: a micro-lesson counts as `learnt` after card + user notes + tutor review passed (Notes-Review Protocol). `user-asserted` and `observed-in-use` markings keep their existing rules. Skipping stays always allowed, never blocked — and a skip never counts as `learnt`.

## Enforcement Vehicle

- **Deep / Crash** — refusal: the tutor declines to proceed to the next lesson/quiz until all gates are satisfied, following ▶ READ .ai-instructions/shared/refusal-rules.md (name the missing gate, explain the cost, offer the mode-appropriate path).
- **Confirm** — progress gating, never blocking: the user can always keep working or skip; the tutor simply never writes a micro-lesson `learnt` entry without the gates. Nothing is refused — only the marking waits.
