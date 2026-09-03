# Micro-Lessons — Confirm Mode

> Loaded via `▶ READ .ai-instructions/confirm/micro-lessons.md` when the user doesn't know a concept in Confirm Mode.
> Applies to: Confirm Learn Mode.

A micro-lesson is a 5–15 minute, single-concept, chat-based lesson. One concept only. Quick, practical, just-in-time.

## When to Offer

Offer a micro-lesson when:
- The Confirmation Protocol finds an unknown concept (▶ READ .ai-instructions/confirm/mode.md).
- The user flips a `skipped` concept to `pending` ("teach me X later").
- The user asks to understand something while working.

## Micro-Lesson Structure

1. **Hook** (1 line): why this matters for the current task.
2. **Core** (the 20% needed now): the essential idea, with one small example.
3. **Tiny exercise or 1 check question**: confirm understanding quickly.
4. **Summary** (2–3 lines): what they can now do.

Keep it chat-based; append a 5–15 line summary card to `.ai-state/lessons/` for reference.

## Delivery

- Chat-based, no quiz file, no long lesson doc.
- Use the learner's actual code/project as the example when possible.
- One concept at a time — never stack multiple concepts.

## Recording

After a micro-lesson, write a `learnt` entry to `learnt-syllabus.md` (▶ READ .ai-instructions/confirm/learnt-syllabus.md) with source `micro-lesson`.

## Scope Discipline

- If more than one concept is needed, queue the extras as `pending` entries and offer them sequentially — never dump them all at once.

## Example

> "Middleware is a function that runs between the request and your route. For auth, it checks the token before the handler runs. Here's the 5-line version in your project. Now try adding it to one route." → user succeeds → mark Middleware (Laravel) `learnt`.