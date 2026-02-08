# Install or Update

## One Command — Install or Update

Run this from your project root. It works for **both fresh installs and updates**:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/lawaty/tutor-instructions/main/setup.sh)
```

- **New project?** It sets everything up: instructions, copilot config, syllabus placeholder, gitignore.
- **Already installed?** It detects your existing setup, shows what you have, and lets you choose what to update — your progress, syllabus, playground, and quizzes are preserved.

> **Alternative with wget:**
> ```bash
> bash <(wget -qO- https://raw.githubusercontent.com/lawaty/tutor-instructions/main/setup.sh)
> ```

---

## What the Script Does

### On Fresh Install

1. Creates `.ai/` directory with tutor instructions
2. Creates `.github/copilot-instructions.md` for GitHub Copilot
3. Creates a placeholder syllabus at `.ai/tutor-syllabus.md`
4. Sets up lesson, playground, and quiz directories
5. Adds `.ai/tutor-progress.md` to `.gitignore`

### On Update (Existing Install Detected)

The script shows your current tutor file structure and prompts:

| Option                           | What it does                                                   | Preserves                                                     |
| -------------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------- |
| **1 — Update instructions only** | Replaces `tutor-instructions.md` and `copilot-instructions.md` | Syllabus, progress, lessons, playground, quizzes — everything |
| **2 — Full reinstall**           | Resets instructions and syllabus, backs up progress            | Progress (backed up and restored automatically)               |
| **3 — Fresh install**            | Deletes all tutor files and starts from scratch                | Nothing                                                       |

**For most updates, choose option 1.**

---

## Alternative: Clone Method

If you prefer having the repo locally (useful for offline or pinning a version):

```bash
# First time
git clone https://github.com/lawaty/tutor-instructions.git .ai/tutor-instructions
bash .ai/tutor-instructions/setup.sh

# To update later
cd .ai/tutor-instructions && git pull && cd ../..
bash .ai/tutor-instructions/setup.sh
```

---

## Verification

After setup, verify:

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
2. Start using GitHub Copilot — it will now act as a tutor
3. Progress will be tracked in `.ai/tutor-progress.md` (auto-created on first use)

### What Gets Preserved on Update

| File / Directory          | Update (Option 1) | Reinstall (Option 2) | Fresh (Option 3) |
| ------------------------- | ----------------- | -------------------- | ---------------- |
| `tutor-instructions.md`   | ✅ Updated         | ✅ Updated            | ✅ Updated        |
| `copilot-instructions.md` | ✅ Updated         | ✅ Updated            | ✅ Updated        |
| `tutor-syllabus.md`       | ✅ Preserved       | ❌ Reset              | ❌ Deleted        |
| `tutor-progress.md`       | ✅ Preserved       | ✅ Preserved (backup) | ❌ Deleted        |
| `lessons/`                | ✅ Preserved       | ✅ Preserved          | ❌ Deleted        |
| `playground/`             | ✅ Preserved       | ✅ Preserved          | ❌ Deleted        |
| `quizzes/`                | ✅ Preserved       | ✅ Preserved          | ❌ Deleted        |
