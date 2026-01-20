# Setup Script Usage

## ✅ Recommended: Use Direct Clone Method

Since GitHub caches raw content for up to 5 minutes, the setup script might not always reflect the latest changes immediately. **The most reliable method is:**

```bash
# Navigate to your project
cd /path/to/your/project

# Clone the tutor system
git clone https://github.com/lawaty/tutor-instructions.git .ai/tutor-instructions

# Run the local setup script
bash .ai/tutor-instructions/setup.sh
```

This ensures you always get the latest version and the script can find the local files.

## Alternative: Direct Download (After Cache Clears)

```bash
curl -fsSL https://raw.githubusercontent.com/lawaty/tutor-instructions/main/setup.sh | bash
```

**Note:** If you get a 404 error, it means GitHub's CDN is still caching an older version. Wait 5 minutes or use the clone method above.

## Manual Setup (Always Works)

```bash
# 1. Create .ai directory
mkdir -p .ai

# 2. Download tutor instructions
curl -fsSL https://raw.githubusercontent.com/lawaty/tutor-instructions/main/tutor-instructions.md -o .ai/tutor-instructions.md

# 3. Setup GitHub Copilot instructions
mkdir -p .github
cat .ai/tutor-instructions.md >> .github/copilot-instructions.md

# 4. Create placeholder syllabus
cat > .ai/tutor-syllabus.md << 'EOF'
# Tutor Syllabus

## Authoritative Sources
Primary: (To be defined based on tech stack)
Secondary: Official Documentation

## Topics
(Will be auto-generated on first interaction with AI tutor)

To customize:
1. Add your preferred books/resources under "Authoritative Sources"
2. Define topic order and depth
3. The AI tutor will follow this syllabus strictly
EOF

# 5. Add to .gitignore
echo "" >> .gitignore
echo "# AI Tutor Progress (personal)" >> .gitignore
echo ".ai/tutor-progress.md" >> .gitignore

echo "✅ Setup complete!"
```

## Verification

After setup, verify the files exist:

```bash
ls -la .ai/
ls -la .github/
```

You should see:
- `.ai/tutor-instructions.md`
- `.ai/tutor-syllabus.md`
- `.github/copilot-instructions.md`

## Next Steps

1. Customize `.ai/tutor-syllabus.md` for your tech stack
2. Start using GitHub Copilot - it will now act as a tutor
3. Progress will be tracked in `.ai/tutor-progress.md` (auto-created on first use)
