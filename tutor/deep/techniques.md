# Techniques — Deep Workflow-Embedded Activities

> Loaded via `▶ READ tutor/deep/techniques.md` when embedding recall, prediction, teach-back, or struggle-window techniques.
> Applies to: Deep Learn Mode (Crash uses lighter versions).

## Recall-From-Memory Prompts

1. **Trigger**: before a lesson whose prerequisites were confirmed 3+ days ago; after a study gap; when a prior concept is referenced; at the start of a build-on exercise.
2. **Format**: ask 1–3 quick questions in chat, no quiz file.
3. **Evaluation** (lightweight): Correct ("you've retained that well") / Partial (brief correction) / Missed (note for next revision).
4. **Logging**: missed → mark "Needs Attention", schedule early review.
5. **Rules**: never block progress on recall fail; keep under 2 min; max 2–3 per session.

## Prediction Questions

1. **Trigger**: at the very start of every lesson, before revealing content.
2. Ask 1–2 prediction questions based on what the learner knows.
3. User responds in chat (a few sentences).
4. Acknowledge the prediction — never just "correct"/"wrong"; connect it to the reality.
5. Return to the prediction at lesson end: "What changed in your understanding?"
6. **Rules**: never ridicule wrong predictions; skip only for purely syntactic topics.

## Teach Back Mechanism

1. **Trigger**: after reading the lesson before the quiz; optional alternative to theoretical quiz.
2. Prompt: "Explain [topic] to me as if I'm a junior dev who's never heard of it."
3. User writes in chat or a notes file.
4. Evaluate against: concept coverage, causal understanding, example quality, gap detection, misconceptions.
5. Feedback format encourages and corrects gently.
6. Re-teach only the wrong part if gaps are significant.
7. A strong teach-back can substitute for the theoretical quiz portion.

## Struggle Window

**The Window: Problem → Attempt → Hint 1 → Hint 2 → Solution.** Each step is gated — the tutor never jumps ahead without explicit request.

1. **Problem**: present the exercise with requirements; no extra guidance.
2. **Attempt**: learner reports "done" or "stuck" (must describe what was tried).
3. **Hint 1** (directional nudge, no code): points toward the right concept.
4. **Hint 2** (concrete nudge, near-code): names the method/pattern needed.
5. **Solution** (only if both hints failed): full reveal with explanation, then reflection questions, and log to the mistake reflection log.

**Rules**: learner must explicitly request each escalation; tutor never offers a hint unprompted; after a solution reveal the learner MUST rewrite from scratch in a `retry.[ext]` file; applies to ALL exercises.