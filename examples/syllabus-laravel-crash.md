# Syllabus (Crash) — Laravel

Crash-mode time-boxed critical path. Each section is a self-contained unit completable in a few hours or less. For a deeper, book-driven path, use `syllabus-laravel.md` (Deep mode).

## Scenario
Build and deploy a small CRUD API with authentication.

## Critical Path (do these in order)

1. **Routing & controllers** — 60 min
   - Define routes, wire controllers, return JSON responses
   - Skip: service container internals, route model binding depths

2. **Middleware & authentication** — 60 min
   - Gate a route behind auth; write one custom middleware
   - Skip: policy/gate matrix, sanctum token lifecycle details

3. **Validation** — 45 min
   - Validate a request via Form Request; custom messages
   - Skip: rule-level customization, authorization in the same request

4. **Eloquent basics** — 60 min
   - Model, migration, one relationship, query a controller
   - Skip: advanced relationships, scopes, queueables

5. **Testing essentials** — 45 min
   - One feature test for an endpoint (happy path + one failure)
   - Skip: TDD discipline, factories/seeders breadth

## Optional / Go Deeper
- Middleware pipeline internals → switch to Deep mode
- Eloquent relationships & eager loading → Deep mode

## Time-Boxing Notes
- If a section overruns, split it (e.g., "routing" alone) rather than rushing.
- Each unit ends with a quick-check; gaps are added to the review list.