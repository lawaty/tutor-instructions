## For Users (People Using Your Tutor System)

### Install or Update (Single Command)

Run this from your project root — works for **both** fresh installs and updates:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/lawaty/tutor-instructions/main/setup.sh)
```

On a fresh project it sets everything up: `.ai-instructions/` tree + `AGENT.md`/`AGENTS.md` pointers. On an existing install it safely updates only what it owns, preserving `.ai-state/` state and the vault. It never overwrites your existing instruction files.

### Choose Your Mode

```bash
# Seed the mode during install
bash <(curl -fsSL https://raw.githubusercontent.com/lawaty/tutor-instructions/main/setup.sh) --mode=confirm

# Or switch anytime in chat / settings
edit .ai-state/tutor-settings.md   # mode: deep | crash | confirm
```

- **deep** — full lessons, quizzes, spaced repetition (default)
- **crash** — fast-track, few hours or less per unit
- **confirm** — no course; confirm concepts before use, micro-lessons or skips

### Alternative: Clone Method

```bash
git clone https://github.com/lawaty/tutor-instructions.git .tutor-instructions
cd .tutor-instructions && ./setup.sh && cd ..
```

---

## Testing It Works

After setup, try this with your AI assistant:

**You:** "Build a Laravel API endpoint with validation and policies"

**Expected Behavior:**
- Agent checks your progress / known concepts
- Identifies missing prerequisites and teaches/confirms them
- Only implements after prerequisites are addressed (per your mode)

---

## Customization

### Change Tech Stack (Deep/Crash)
Edit `.ai-state/tutor-syllabus.md`:
```md
## Authoritative Sources
Primary: "Your Favorite Book"
Secondary: Official Docs

## Topics
1. Topic one
2. Topic two
```

### Check Known Concepts (Confirm)
Edits happen automatically in `.ai-state/learnt-syllabus.md` — view it to see what you've marked learnt vs. skipped.

### Other Projects
Run the same command in each project. Progress carries across via `~/.ai-tutor/` (opt-in).

---

## Troubleshooting

### "Agent not acting as tutor"
- Verify `AGENT.md` (or `AGENTS.md`) exists and points to `.ai-instructions/README.md`
- Confirm your agent reads that instruction file (some use `AGENTS.md` — we create both by default)
- Restart your agent/session

### "Mode not applied"
- Check `mode:` in `.ai-state/tutor-settings.md`
- Or just say "switch to crash mode" in chat

### "Syllabus not auto-generated"
- Make sure `.ai` directory exists
- Agent will create it on first interaction (Deep/Crash)
- You can manually create from examples/

### "Progress not tracking"
- Check the relevant file exists (`tutor-progress.md` for Deep/Crash, `learnt-syllabus.md` for Confirm)
- Agent needs write permission to `.ai-state/`

### "Existing AGENT.md was mine and got modified?"
- It wasn't overwritten — at most a small marked pointer block was appended to the end. Remove that block to revert, or see `--no-modify`.

---

## Need Help?

- **Issues:** https://github.com/lawaty/tutor-instructions/issues
- **Discussions:** https://github.com/lawaty/tutor-instructions/discussions
- **Contributing:** See CONTRIBUTING.md