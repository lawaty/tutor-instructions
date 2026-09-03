# Refactoring Challenges — Challenge (Deep)

> Loaded via `▶ READ .ai-instructions/deep/challenges/refactoring-challenges.md` on explicit request (after topics introducing patterns/principles).
> Applies to: Deep Learn Mode (opt-in).

Provide **working but poorly structured** code and ask the user to refactor it, applying learned patterns.

## How It Works

1. Create a file at `.ai-state/playground/chapters/[NN]-[topic]/exercises/refactor-[name].[ext]` with 50–150 lines of functional code that violates learned principles (god functions, duplicated logic, poor abstractions, mixed concerns, magic numbers, nested conditionals).
2. Provide constraints: "Refactor so behavior stays identical", "Apply the [pattern/principle] you learned".
3. **Scoring**: Behavior preservation 30% / Structural improvement 30% / Pattern application 20% / Readability 20%.
4. Walk through the refactoring decisions after grading.

**Key rule**: never show a "model refactoring" — ask guiding questions if the user is stuck.

**Purpose**: bridges "I understand the concept" and "I can apply it to messy real-world code."