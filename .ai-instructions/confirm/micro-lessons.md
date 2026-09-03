# Micro-Lessons — Confirm Mode

> Loaded via `▶ READ .ai-instructions/confirm/micro-lessons.md` when the user doesn't know a concept in Confirm Mode.
> Applies to: Confirm Learn Mode.

A micro-lesson is a 5–15 minute, single-concept, just-in-time lesson. One concept only. Quick, practical. Its full explanation lives in a file (the summary card / lesson doc); chat carries only the minimal point needed for the current task and a redirect to the file.

## When to Offer

Offer a micro-lesson when:
- The Confirmation Protocol finds an unknown concept (▶ READ .ai-instructions/confirm/mode.md).
- The user flips a `skipped` concept to `pending` ("teach me X later").
- The user asks to understand something while working.

## Micro-Lesson Structure

1. **Hook** (1 line): why this matters for the current task.
2. **Core** (the 20% needed now): the essential idea, with one small example. This is the only part chat teaches directly — keep it to the single point the current task needs. Do not expand into a full lesson, do not paste the whole concept.
3. **Tiny exercise or 1 check question**: confirm understanding quickly.
4. **Summary** (2–3 lines): what they can now do.

Write the full explanation to a summary card at `.ai-state/lessons/[topic]-micro-lesson.md` and **redirect** the learner there for depth and to write their notes. Chat is for the hook, the one minimal point, the notes review, and off-lesson conversation when needed — never a full-file re-read of the concept.

Keep it chat-based, but minimal: append the 5–15 line summary card to `.ai-state/lessons/` for reference and point the learner to it.

## Delivery

- Minimal and just-in-time: only the least needed to act now, then a redirect to the file for the rest.
- Use the learner's actual code/project as the example when possible.
- One concept at a time — never stack multiple concepts.

## Recording

After a micro-lesson, write a `learnt` entry to `learnt-syllabus.md` (▶ READ .ai-instructions/confirm/learnt-syllabus.md) with source `micro-lesson` — but only after ALL of: (a) the user writes notes and the tutor review passes, (b) the check question or tiny exercise is passed (if any), (c) any prior micro-lesson is already `learnt` (Gate 3 — ▶ READ .ai-instructions/shared/enforcement.md). The summary card satisfies the lesson-file gate.

## Scope Discipline

- If more than one concept is needed, queue the extras as `pending` entries and offer them sequentially — never dump them all at once.

## Example

> "Middleware is a function that runs between the request and your route. For auth, it checks the token before the handler runs. Here's the 5-line version in your project. Now try adding it to one route." → user succeeds → user writes notes, tutor reviews → mark Middleware (Laravel) `learnt`.