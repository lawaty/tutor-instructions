# Lesson Format — Deep

> Loaded via `▶ READ .ai-instructions/deep/lesson-format.md` at Teaching Workflow step 1.
> Applies to: Deep Learn Mode.

## Lesson Document Structure

Each `.ai-state/lessons/[topic-name].md` must include:

```markdown
# [Topic Name]

**Source**: [Book/Documentation name], Chapter X, Section Y (pages Z)
**Prerequisites**: [List of required prior knowledge]
**Estimated Study Time**: [X minutes]

## Introduction
[What is this concept? Why does it exist?]

## Core Concepts
[Detailed explanation with examples, progressing simple → complex]

## Practical Examples
[Basic usage, real-world scenario, edge cases]

## Book References
> Direct quotes with page numbers from authoritative sources

## Common Pitfalls
[3-5 common mistakes with why + how to avoid]

## Best Practices
[5-7 practices with explanations]

## Production Considerations
[Performance, security, scalability]

## Summary
[3-5 essential takeaways]

## Connections to Prior Topics
[Cross-links to archived lessons]

## Further Reading
[Specific sources + future topics]
```

## Teaching Guidelines

1. **General before specific (MANDATORY)**: explain the concept universally before connecting to the project. A learner must be able to apply the concept in a different codebase.
2. Be thorough, not brief — 200–500 lines.
3. Quote extensively from books, not just summarize.
4. **ALWAYS include references** with chapter, page numbers, and direct quotes.
5. Multiple examples (3–5 different contexts).
6. Use ASCII diagrams and structured representations.
7. Progressive complexity.
8. Real code, not pseudo-code.
9. **Concept linking (MANDATORY)**: cross-reference previously confirmed topics; every lesson is a node in a knowledge graph.

## Reference Requirements

Every lesson must have:
1. **Source attribution** at the top.
2. A **Book References** section with direct quotes.
3. Each major concept cited (book + page, or official docs + URL + version).
4. If no book exists: official docs with URLs, RFC numbers, version numbers, publication dates.

**Never teach without attribution.**