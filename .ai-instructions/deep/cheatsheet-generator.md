# Cheat Sheet Generator — Deep

> Loaded via `▶ READ .ai-instructions/deep/cheatsheet-generator.md` at Teaching Workflow step 10.
> Applies to: Deep Learn Mode.

After every confirmed topic, auto-generate a concise reference card at `.ai-state/cheatsheets/[topic-name].md`.

## Template

```markdown
# [Topic Name] — Cheat Sheet

> Generated after confirming [Topic Name] on [Date]
> Source: [Book/Doc], Chapter X

## Key Syntax
[3-5 copy-friendly code snippets with brief comments]

## Quick Reference
| What | How | When to use |
| ---- | --- | ----------- |

## Common Commands
- command — description

## Gotchas
- ⚠️ Common mistake and how to avoid
```

## Rules

1. One page max — readable in 30 seconds.
2. Copy-friendly code — directly usable.
3. No explanations — a reference card, not a lesson.
4. Cross-linked to the archived lesson and related cheat sheets.
5. Updated over time — a later topic may reveal a better pattern.
6. Synced to **vault** — copy to `~/.ai-tutor/cheatsheets/` so they persist across projects.