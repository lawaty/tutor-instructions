# AI Tutor Instructions System

This repository contains a structured tutor system that transforms your AI coding assistant into a senior technical mentor focused on **teaching** rather than just implementing solutions.

## 🎯 What This Does

When integrated into your project, the AI will:
- ✅ Require you to understand prerequisites before implementing features
- ✅ Follow a structured syllabus based on authoritative sources (books, documentation)
- ✅ Track your learning progress
- ✅ Teach concepts one at a time with clear explanations
- ✅ Guide step-by-step implementation rather than dumping code
- ✅ Ensure you can work independently without AI assistance

## 🚀 Quick Start

Run this from your project root — works for **both fresh installs and updates**:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/lawaty/tutor-instructions/main/setup.sh)
```

That's it. The script detects whether you have an existing install and acts accordingly.

### Alternative Methods

See **[INSTALL.md](INSTALL.md)** for:
- Clone-based installation (offline/pinned versions)
- Update options explained
- Setup verification

## 📁 What Gets Created

After setup, your project will have:

```
your-project/ 
├── .ai/
│   ├── tutor-instructions.md      # Core tutor instructions
│   ├── tutor-syllabus.md          # Auto-generated syllabus (created on first use)
│   ├── tutor-progress.md          # Your learning progress tracker
│   ├── study-sessions.md          # Study date/time tracking for spaced repetition
│   ├── lessons/                   # Active + archived lesson documents
│   ├── playground/                # Persistent code workspace
│   ├── quizzes/                   # Quiz files + archive
│   ├── revisions/                 # Revision sessions with summaries & exercises
│   ├── cheatsheets/               # Auto-generated reference cards
│   ├── incidents/                 # Production incident simulations
│   ├── mistakes/                  # Mistake reflection logs by topic area
│   └── notes/                     # Your notes in your own words (quality-tracked)
└── .github/
    └── copilot-instructions.md    # GitHub Copilot instructions

~/.ai-tutor/                       # Global progress vault (cross-project)
├── global-progress.md
├── cheatsheets/
├── projects/
└── stats.md
```

## 🎓 How It Works

### 1. **Bootstrap Phase**
On first interaction, the tutor automatically:
- Detects your tech stack
- Creates a default syllabus
- Initializes progress tracking

### 2. **Task Handling**
When you request a feature:
1. Agent identifies required prerequisites
2. Checks your confirmed knowledge
3. Teaches missing concepts one-by-one
4. Only helps implement after prerequisites are met

### 3. **Teaching Mode**
For each concept:
- Clear explanation with examples
- Production context and "why it matters"
- Confirmation of understanding required
- Progress tracking with your approval

### 4. **Advanced Learning Modes**
Beyond standard lessons and quizzes — all woven into the learning journey:

**Cognitive Training:**
- **Prediction Questions** — asked before every lesson to prime the brain and exploit the generation effect
- **Teach Back Mechanism** — explain it as if teaching a junior dev; exposes gaps you didn't know you had
- **Recall-From-Memory Prompts** — spontaneous in-session recall checks on prior confirmed topics
- **Code-From-Memory Challenges** — timed, no-reference coding tasks to build genuine fluency
- **Struggle Window** — every exercise follows: problem → attempt → hint 1 → hint 2 → solution (never skip ahead)

**Code Analysis & Reflection:**
- **Code Review Training** — review flawed production code (reverse direction)
- **Reverse Engineering Tasks** — given code, analyze what it does, why, and what design decisions it reflects
- **Refactoring Challenges** — restructure working but messy real-world code

**Production Simulation:**
- **Production Incident Simulator** — diagnose and fix realistic on-call scenarios with post-mortems
- **Open-Source Scavenger Hunts** — explore real framework internals to understand how concepts are truly implemented

**Knowledge Management:**
- **Note-Taking System** — prompted after every lesson; tutor checks quality signals (summarized ideas, learner phrasing, examples) — not correctness
- **Mistake Reflection Log** — every significant error captured as a diagnostic entry with root-cause analysis and resolution tracking
- **Cheat Sheet Generator** — auto-generated reference cards per topic

**Meta-Cognition:**
- **Meta-Learning Lessons** — dedicated lessons on HOW to debug, read codebases, read documentation, understand frameworks, and how memory and learning actually work

**Cross-Cutting:**
- **Cross-Topic Integration Quizzes** — combine 4-5 topics in one realistic scenario after every section

### 5. **Spaced Repetition & Revision System**
Long-term retention through evidence-based review:
- **Session Tracking** — logs all study dates and times automatically
- **Smart Reminders** — recommends revision when you haven't studied for 3+ days
- **Review Schedules** — calculates optimal review dates (1 day, 3 days, 1 week, etc.)
- **Revision Sessions** — generates comprehensive reviews with:
  - Summarized refreshers of each topic
  - Hands-on exercises (recall challenges, integration tasks, code explanation)
  - Reflection questions to deepen understanding
- **Adaptive Intervals** — adjusts review frequency based on your retention strength
- **Study Streak Tracking** — maintains motivation with consecutive day counts

### 6. **Persistent Progress Vault**
Your learning progress persists across projects via `~/.ai-tutor/`:
- Confirmed topics carry over to new projects (opt-in)
- Cheat sheets accumulate into a personal reference library
- Stats track your learning journey over time
- Optional Git-backed sync for cross-machine persistence

## 📚 Authoritative Sources

You can specify books, papers, or documentation as the primary teaching source:

**Example `tutor-syllabus.md`:**
```md
## Authoritative Sources
Primary: "Laravel: Up & Running" — Matt Stauffer
Secondary: Laravel Official Documentation
```

The tutor will:
- Follow the book's topic order
- Use the book's terminology and approach
- Reference sections explicitly
- Avoid shortcuts that contradict the source

## 🛠️ Customization

### Update Syllabus
Edit `.ai/tutor-syllabus.md` to:
- Add/remove topics
- Change topic order
- Specify authoritative sources
- Adjust depth and focus

### Reset Progress
```bash
rm .ai/tutor-progress.md
# Will be recreated on next interaction
```

### Add Multiple Tech Stacks
Create separate syllabi:
```
.ai/
├── tutor-syllabus-laravel.md
├── tutor-syllabus-react.md
└── tutor-syllabus-devops.md
```

## 🔧 Maintenance

### Update Instructions
```bash
cd .ai/tutor-instructions
git pull origin main
cp tutor-instructions.md ../tutor-instructions.md
```

### Share Progress Across Projects
Progress is automatically shared via the global vault at `~/.ai-tutor/`.
To sync across machines, back it with a private Git repo:
```bash
cd ~/.ai-tutor
git init
git remote add origin git@github.com:YOUR_USER/ai-tutor-progress.git
git add -A && git commit -m "init" && git push
```

On another machine:
```bash
git clone git@github.com:YOUR_USER/ai-tutor-progress.git ~/.ai-tutor
```

## 💡 Example Interaction

```
You: "Build a Laravel API endpoint with validation and policies"

Agent: "I've checked your progress. To build this feature, you need 
       to understand:
       1. Laravel Validation
       2. Authorization Policies
       
       Let's start with Laravel Validation...
       [Teaches validation with examples]
       
       Do you understand how validation works?"

You: "Yes, I understand"

Agent: "Great! Can I mark 'Laravel Validation' as confirmed in your 
       progress tracker?"

You: "Yes"

Agent: "Now let's learn about Authorization Policies...
       [Continues teaching]"
```

## 🤝 Contributing

Suggestions for improving the tutor system are welcome! Please submit issues or PRs.

## 📄 License

MIT License - Feel free to use and modify for your projects.

## 🔗 Links

- [GitHub Repository](https://github.com/lawaty/tutor-instructions)
- [Documentation](https://github.com/lawaty/tutor-instructions/wiki)
- [Issues](https://github.com/lawaty/tutor-instructions/issues)
