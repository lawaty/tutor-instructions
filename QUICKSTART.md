## For Users (People Using Your Tutor System)

### Install or Update (Single Command)

Run this from your project root — works for **both** fresh installs and updates:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/lawaty/tutor-instructions/main/setup.sh)
```

On a fresh project it sets everything up. On an existing install it detects your files and lets you choose what to update (your progress, syllabus, playground, and quizzes are preserved).

### Alternative: Clone Method

```bash
# First time
git clone https://github.com/lawaty/tutor-instructions.git .ai/tutor-instructions
bash .ai/tutor-instructions/setup.sh

# To update later
cd .ai/tutor-instructions && git pull && cd ../..
bash .ai/tutor-instructions/setup.sh
```

---

## Testing It Works

After setup, try this with your AI assistant:

**You:** "Build a Laravel API endpoint with validation and policies"

**Expected Behavior:**
- Agent checks your progress
- Identifies missing prerequisites
- Teaches each concept one-by-one
- Only implements after all prerequisites confirmed

---

## Customization

### Change Tech Stack
Edit `.ai/tutor-syllabus.md`:
```md
## Authoritative Sources
Primary: "Your Favorite Book"
Secondary: Official Docs

## Topics
1. Topic one
2. Topic two
...
```

### Multiple Projects
Run the same command in each project:
```bash
cd /path/to/project
bash <(curl -fsSL https://raw.githubusercontent.com/lawaty/tutor-instructions/main/setup.sh)
```

---

## Troubleshooting

### "Agent not acting as tutor"
- Verify `.github/copilot-instructions.md` contains the tutor instructions
- Restart VS Code
- Clear GitHub Copilot cache

### "Syllabus not auto-generated"
- Make sure `.ai` directory exists
- Agent will create on first interaction
- You can manually create from examples/

### "Progress not tracking"
- Check `.ai/tutor-progress.md` exists
- Agent needs write permission to .ai/ directory
- Ensure you're confirming understanding when prompted

---

## Need Help?

- **Issues:** https://github.com/lawaty/tutor-instructions/issues
- **Discussions:** https://github.com/lawaty/tutor-instructions/discussions
- **Contributing:** See CONTRIBUTING.md
