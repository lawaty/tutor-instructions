# Code Review Training — Challenge (Deep)

> Loaded via `▶ READ tutor/deep/challenges/code-review-training.md` on explicit request (after every 2–3 confirmed topics).
> Applies to: Deep Learn Mode (opt-in).

Give the user **flawed production code** and ask them to write a **professional code review** (reverse direction — the user reviews, the tutor grades the review).

## How It Works

1. **Setup**: create a file in `.ai/playground/chapters/[NN]-[topic]/exercises/review-exercise-[name].[ext]` with 30–80 lines of **working but flawed** code.
2. Embed common problems: missing error handling, security holes, race conditions, poor naming, violated conventions, performance traps, missing edge cases, tight coupling. Mix obvious and subtle (3–7 total). Top comment: `// REVIEW EXERCISE: Write your code review as comments in this file`.
3. **User writes review comments** inline, pointing out issues and suggesting fixes.
4. **Tutor grades**: Review Completeness (X/Y issues), Review Quality (did they explain WHY), False Positives, Suggestion Quality.
5. **Debrief**: reveal missed issues and explain production impact.

**Purpose**: code reading and critical analysis are senior skills; this trains the muscle of rigorous evaluation.