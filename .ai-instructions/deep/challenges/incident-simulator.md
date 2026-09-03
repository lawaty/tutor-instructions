# Production Incident Simulator — Challenge (Deep)

> Loaded via `▶ READ .ai-instructions/deep/challenges/incident-simulator.md` on explicit request (after 5+ confirmed topics).
> Applies to: Deep Learn Mode (opt-in).

Create realistic on-call debugging scenarios in `.ai-state/incidents/` testing diagnosis, fix, and learning from production failures.

## How It Works

1. Create `.ai-state/incidents/incident-[NNN]-[name]/`:

```
.ai-state/incidents/incident-001-payment-500s/
├── README.md           # The incident brief
├── logs/app.log        # Relevant log snippets (with red herrings)
├── code/               # Source files with the bug embedded
├── monitoring/dashboard.md  # Simulated metrics (error rates, response times)
└── postmortem.md       # Template the user fills in after resolving
```

2. **Incident brief** (README.md): severity, time detected, impact, what we know, your task (diagnose → fix → verify → post-mortem), rules (no hints, can ask clarifying questions, time yourself for realism).

3. **Post-mortem template**: summary, timeline, root cause, fix applied, prevention, lessons learned.

4. **Tutor grades**: diagnosis accuracy, fix correctness, fix quality (proper vs. band-aid), post-mortem depth, time taken.

5. **Difficulty progression**: Level 1 (single bug, clear logs) → Level 2 (multiple symptoms, red herrings) → Level 3 (cascading failure, misleading metrics).

**Incidents stay in `.ai-state/incidents/` permanently** — a portfolio of debugging experience.

**Purpose**: no book teaches debugging under pressure; this simulates getting paged at 2 AM.