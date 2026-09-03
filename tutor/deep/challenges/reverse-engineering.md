# Reverse Engineering Tasks — Challenge (Deep)

> Loaded via `▶ READ tutor/deep/challenges/reverse-engineering.md` on explicit request (after confirming 2–3 related topics).
> Applies to: Deep Learn Mode (opt-in).

Distinct from Code Review Training (which tests quality judgment), this tests **understanding** — "what is this code doing and why?"

## How It Works

1. Provide a working piece of code at `.ai/playground/chapters/[NN]-[topic]/reverse-engineering/re-[name].[ext]`: 40–120 lines of production-style code using confirmed patterns, no inline comments, may include intentional complexity.
2. **The task** (user answers in `re-[name]-analysis.md`):
   - **Line-by-line walk-through**
   - **Architecture analysis**: pattern used, problem solved, inputs/outputs
   - **Design decisions**: why structured this way, alternatives, trade-offs
   - **Questions this raises**
3. **Tutor evaluates**: accuracy of walk-through; pattern identification; depth of design analysis; quality of questions raised.
4. After evaluation: answer questions, correct misconceptions, add raised questions to the syllabus if appropriate.

## Progression

- Level 1: code using ONE confirmed topic — learn to trace known patterns in unfamiliar code.
- Level 2: code combining multiple confirmed topics.
- Level 3: real open-source code (connects to Scavenger Hunts).