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

### ⭐ Recommended Method

```bash
# Navigate to your project
cd /path/to/your/project

# Clone and setup
git clone https://github.com/lawaty/tutor-instructions.git .ai/tutor-instructions
bash .ai/tutor-instructions/setup.sh
```

This ensures you get the latest version and the setup script can find all necessary files.

### Alternative Methods

See **[INSTALL.md](INSTALL.md)** for:
- Direct curl/wget installation
- Manual setup steps
- Troubleshooting common issues
- Setup verification

## 📁 What Gets Created

After setup, your project will have:

```
your-project/
├── .ai/
│   ├── tutor-instructions.md      # Core tutor instructions
│   ├── tutor-syllabus.md          # Auto-generated syllabus (created on first use)
│   └── tutor-progress.md          # Your learning progress tracker
└── .github/
    └── copilot-instructions.md    # GitHub Copilot instructions
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
Symlink your progress file:
```bash
ln -s ~/.ai-tutor/tutor-progress.md .ai/tutor-progress.md
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
