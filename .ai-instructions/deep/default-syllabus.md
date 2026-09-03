# Default Syllabus — Deep

> Loaded via `▶ READ .ai-instructions/deep/default-syllabus.md` when `.ai-state/tutor-syllabus.md` is missing and mode is deep.
> Applies to: Deep Learn Mode.

## When Generated

If `tutor-syllabus.md` is missing at bootstrap, create a default syllabus based on the detected tech stack (Laravel, React, Next.js, Vite, etc.).

## Tech-Stack Detection

Detect the framework from project files (composer.json, package.json, etc.) and generate a topic checklist in the official-source style.

## Default Syllabus Example (Laravel)

```md
# Tutor Syllabus

## Authoritative Sources
Primary: "Laravel: Up & Running" — Matt Stauffer
Secondary: Laravel Official Documentation

## Laravel
1. Request lifecycle
2. Routing & middleware
3. Controllers & DI
4. Validation
5. Eloquent ORM
6. Authorization (policies & gates)
7. Queues & jobs
8. Service container
9. Testing (Feature & Unit)
10. Deployment & production best practices
```

## Using the Examples

The `examples/` directory in the repo contains ready-made syllabi (syllabus-laravel.md, syllabus-react.md). Adapt them to the project's tech stack.