# Meta-Learning Lessons — Deep

> Loaded via `▶ READ .ai-instructions/deep/meta-learning.md` every 8–10 topic confirmations, or when the user starts a new domain or shows a recurring meta-skill struggle.
> Applies to: Deep Learn Mode (settings-gated).

## Meta-Learning Lessons

Interject lessons on HOW to learn, debug, and work — not specific tech.

## Meta-Lesson Library

**ML-01: How Debugging Works** — *"Debugging is a scientific method, not a prayer."* Mental models: bugs as hypotheses; the observe→hypothesize→isolate→test loop; binary search; stack traces as data; rubber-ducking; test one variable at a time.

**ML-02: How Frameworks Are Designed** — *"No framework decision was arbitrary."* Lifecycle/trade-offs; convention over configuration; inversion of control; reading architecture docs; extension points; why frameworks differ.

**ML-03: How to Read Large Codebases** — *"The skill isn't reading every line — it's knowing which lines to read."* Entry points; control-flow tracing; naming patterns; `git log`/`git blame`; tests as documentation; selective depth; when to stop reading and run.

**ML-04: How to Read Documentation Effectively** — *"The answer is almost always in the docs."* API vs. guides vs. tutorials; lateral reading; version-aware; cross-referencing; changelogs; trusting sources; reading source when docs are ambiguous.

**ML-05: How Memory and Learning Actually Work** — recognition vs. recall; spacing effect; interleaving; the generation effect; desirable difficulties; sleep and consolidation; metacognition.

**ML-06: How to Approach an Unknown Problem** — *"Every expert was a beginner who learned to decompose problems."* Decomposition; Feynman technique; working backwards; time-boxing; when to ask for help; prototyping/spiking.

**ML-07: How to Give and Receive Code Review** — *"Code review is the highest-leverage activity on a software team."* Both sides; correctness vs. design vs. readability; feedback that teaches; receiving without ego; nitpick vs. blocker; self-review.

## Meta-Lesson Format

```markdown
# Meta-Lesson: [Title]
**Code**: ML-[NN]
**Applies to**: All technologies / [Domain]
**Best time to teach**: [...]
## The Core Insight
## Why This Matters for You Right Now
## The Mental Model
## Practice Exercise
## Reflection Prompt
## Further Reading
```

## Meta-Lesson Rules

1. Meta-lessons are **taught, not assigned** — the core insight is written to a `.ai-state/lessons/meta-[NN].md` file that the learner reads, then guided through Socratic conversation. Chat never dumps the whole insight; it raises the questions and lets the learner reason.
2. **Not quizzed** by default — watch for demonstrated application.
3. Record in `## Meta-Skills` section of `tutor-progress.md`.
4. Note-taking is especially important for meta-lessons — prompt explicitly.
5. They should feel like conversations — use Socratic questioning.