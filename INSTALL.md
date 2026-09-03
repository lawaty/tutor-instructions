# Install or Update

## One Command — Install or Update

Run this from your project root. Works for **both fresh installs and updates**:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/lawaty/tutor-instructions/main/setup.sh)
```

> **Alternative with wget:**
> ```bash
> bash <(wget -qO- https://raw.githubusercontent.com/lawaty/tutor-instructions/main/setup.sh)
> ```

## What the Script Does

### On Fresh Install

1. Installs the `.ai-instructions/` instruction tree at your project root
2. Creates entry-point files (`AGENT.md` + `AGENTS.md`), safely handling any that already exist
3. Creates `.ai-state/` state directories
4. Initializes the global progress vault at `~/.ai-tutor/`
5. Creates `.ai-state/tutor-settings.md` (with your chosen `mode`)
6. Adds `.ai-state/tutor-progress.md` to `.gitignore`

### On Update (Existing Install Detected)

The installer checks ownership of every instruction file and updates only the ones this system owns, preserving all your `.ai-state/` state and the global vault. Re-runs are idempotent — no duplicate content.

## Options / Flags

| Flag | Effect |
| ---- | ------ |
| `--mode=deep\|crash\|confirm` | Set the tutor mode (seeds/updates `.ai-state/tutor-settings.md`) |
| `--dir=NAME` | Use a custom instruction directory (default `tutor`) |
| `--frameworks=claude,cursor,copilot,gemini,all` | Also create pointers for Claude, Cursor, Copilot, or Gemini |
| `--append` | On conflict, append the pointer block to user-owned files without prompting |
| `--no-modify` | Never modify user-owned files — print a manual snippet instead |
| `--yes` | Non-interactive; use safe defaults (no prompts) |
| `--dry-run` | Show everything that would happen; change nothing |
| `--uninstall` | Remove the tutor system (keeps `.ai-state/` state and vault) |
| `--strict` | Exit non-zero if any entry point was skipped |

## Conflict Handling

The installer classifies each instruction file as **owned** (written by this system) or **user-owned**:

| File state | Behavior |
| ---------- | -------- |
| Doesn't exist | Create a thin pointer file |
| Owned (has our marker) | Rewrite/update safely |
| Legacy (our old full-file header) | Replace with a pointer |
| User-owned (your content) | **Never overwritten** — offer to append a small marked block, or skip (prints a manual snippet) |
| Already integrated | Verify/leave as-is |
| Symlink | Left untouched (treat as user-owned) |

This means your existing `AGENT.md`, `AGENTS.md`, `CLAUDE.md`, `.cursorrules`, or `.github/copilot-instructions.md` are **never destroyed**. If you decline the append, the script prints a tiny snippet you can add manually later.

> On macOS/Windows (case-insensitive filesystems), `AGENT.md` vs `agent.md` are handled so your `agent.md` is never silently overwritten.

## Alternative: Clone Method

If you prefer a local copy (offline or pinned version):

```bash
# First time
git clone https://github.com/lawaty/tutor-instructions.git .tutor-instructions
cd .tutor-instructions && ./setup.sh && cd ..

# To update later
cd .tutor-instructions && git pull && cd ..
./tutor-instructions/setup.sh
```

## Verification

After setup, verify:

```bash
ls AGENT.md AGENTS.md
ls .ai-instructions/
```

You should see:
- `AGENT.md` / `AGENTS.md` (thin pointers)
- `.ai-instructions/README.md` and the mode subdirectories
- `.ai-state/tutor-settings.md`

## What Gets Preserved on Update

The installer **never deletes or overwrites your data**:

| Item | Behavior |
| ---- | -------- |
| `.ai-state/tutor-syllabus.md` | ✅ Preserved |
| `.ai-state/tutor-progress.md` | ✅ Preserved |
| `.ai-state/learnt-syllabus.md` | ✅ Preserved |
| `.ai-state/lessons/`, `quizzes/`, `playground/`, etc. | ✅ Preserved |
| `~/.ai-tutor/` vault | ✅ Preserved |
| Your own AGENT/CLAUDE/etc. content | ✅ Preserved (pointer appended, never replacing) |

## Next Steps

1. Edit `.ai-state/tutor-settings.md` to choose your `mode` (deep / crash / confirm)
2. For Deep/Crash, customize `.ai-state/tutor-syllabus.md` for your tech stack
3. Start talking to your agent — it will now act as a tutor
4. Commit `AGENT.md`, `AGENTS.md`, and `.ai-instructions/` so your team shares the tutor (`.ai-state/tutor-progress.md` stays gitignored)