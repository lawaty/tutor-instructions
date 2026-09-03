# Open-Source Scavenger Hunts — Challenge (Deep)

> Loaded via `▶ READ tutor/deep/challenges/scavenger-hunts.md` on explicit request (after confirming enough context to read a domain's internals).
> Applies to: Deep Learn Mode (opt-in).

Point the user to **real source code** (framework internals, libraries, or their own dependencies) and ask them to find how a concept is actually implemented.

## How It Works

1. Give a specific question and a starting point:
   - "Find where Laravel resolves service container bindings. Start from `Illuminate\Container\Container`."
   - "Look at how React's `useState` stores state between renders. Start from the React source."
   - "In `node_modules/express/lib/`, find where middleware is actually executed."
2. **What the user must deliver**: the files/line numbers found; what the code does and the pattern it uses; one surprising thing; how it changes their understanding.
3. **Tutor evaluates**: did they find the right code? Is the explanation accurate? Did they identify the pattern? Bonus: optimizations/edge cases/clever tricks noticed.

## Rules

- User navigates the code themselves — tutor does not provide file paths.
- Hints allowed if stuck ("Look for a method called `resolve`").
- Exploratory — no pass/fail; understanding noted in progress.
- Findings can be saved as notes in the playground.

## Example Hunts

| Topic | Hunt target |
| ----- | ----------- |
| Middleware | Find the middleware pipeline execution in framework source |
| Validation | Find where rules are parsed and applied |
| Routing | Find how the router matches URLs to handlers |
| ORM/Query builder | Find where SQL is constructed and executed |

**Frequency**: 1 hunt per 3–5 topics, or when a concept has educational internals.