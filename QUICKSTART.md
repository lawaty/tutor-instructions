## For Users (People Using Your Tutor System)

### Method 1: Quick Setup Script
```bash
# Navigate to your project
cd /path/to/your/project

# Download and run setup script
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/tutor-instructions/main/setup.sh | bash
```

### Method 2: Manual Clone
```bash
# Navigate to your project
cd /path/to/your/project

# Clone into .ai directory
git clone https://github.com/YOUR_USERNAME/tutor-instructions.git .ai/tutor-instructions

# Copy instructions
cp .ai/tutor-instructions/tutor-instructions.md .ai/

# Add to GitHub Copilot instructions
mkdir -p .github
cat .ai/tutor-instructions.md >> .github/copilot-instructions.md
```

### Method 3: Git Submodule (Advanced)
```bash
# Add as submodule
git submodule add https://github.com/YOUR_USERNAME/tutor-instructions.git .ai/tutor-instructions

# Link the instructions file
cp .ai/tutor-instructions/tutor-instructions.md .ai/

# Update
git submodule update --remote
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
Use the same tutor system across projects:
```bash
# In each project
cd /path/to/project
git clone https://github.com/YOUR_USERNAME/tutor-instructions.git .ai/tutor-instructions
cp .ai/tutor-instructions/tutor-instructions.md .ai/
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

- **Issues:** https://github.com/YOUR_USERNAME/tutor-instructions/issues
- **Discussions:** https://github.com/YOUR_USERNAME/tutor-instructions/discussions
- **Contributing:** See CONTRIBUTING.md
