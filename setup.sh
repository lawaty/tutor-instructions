#!/bin/bash

# AI Tutor Instructions Setup Script
# ====================================
# Installs the AI tutor system into a target project.
# Handles existing/user-owned instruction files (AGENT.md, AGENTS.md, CLAUDE.md, etc.)
# safely: never overwrites user content, offers append-or-skip on conflicts.

set -e  # Exit on error

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# ---- Defaults ----
PROJECT_ROOT="$(pwd)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TUTOR_DIR_NAME=".ai-instructions"
TUTOR_DIR="$PROJECT_ROOT/$TUTOR_DIR_NAME"
STATE_DIR="$PROJECT_ROOT/.ai-state"
ENTRY_MARKER="tutor-system:entry"
INCLUDE_START="tutor-system:include:start"
INCLUDE_END="tutor-system:include:end"
LEGACY_HEADER="SENIOR TUTOR AGENT INSTRUCTIONS"
LEGACY_APPEND="# AI Tutor Mode"
MODE="deep"
FRAMEWORKS="default"
APPEND_MODE=0
NO_MODIFY=0
YES=0
UNINSTALL=0
DRY_RUN=0
STRICT=0

# ---- Flag parsing ----
usage() {
    cat <<EOF
AI Tutor Instructions — setup

Usage: setup.sh [options]

Options:
  --mode=deep|crash|confirm   Set the tutor mode (seed/update settings)
  --dir=NAME                  Use a custom instruction directory (default: tutor)
  --frameworks=all|claude,cursor,copilot,gemini
                              Integrate with extra agent frameworks
  --append                    On conflict, append an include block to user-owned files
  --no-modify                 Never modify user-owned files (print manual snippet instead)
  --yes                       Non-interactive; use safe defaults (no prompts)
  --dry-run                   Show what would happen, change nothing
  --uninstall                 Remove the tutor system (keeps .ai-state/ and vault)
  --strict                    Fail with non-zero exit if any entry point was skipped
  -h|--help                   Show this help
EOF
    exit 0
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --mode=*) MODE="${1#*=}" ;;
        --dir=*) TUTOR_DIR_NAME="${1#*=}"; TUTOR_DIR="$PROJECT_ROOT/$TUTOR_DIR_NAME" ;;
        --frameworks=*) FRAMEWORKS="${1#*=}" ;;
        --append) APPEND_MODE=1 ;;
        --no-modify) NO_MODIFY=1 ;;
        --yes) YES=1 ;;
        --dry-run) DRY_RUN=1 ;;
        --uninstall) UNINSTALL=1 ;;
        --strict) STRICT=1 ;;
        -h|--help) usage ;;
        *) echo "Unknown option: $1"; usage ;;
    esac
    shift
done

echo "🎓 AI Tutor Instructions"
echo "========================"
echo ""
echo -e "${BLUE}📁 Project root:${NC} $PROJECT_ROOT"
echo ""

interactive() {
    [[ "$YES" -eq 1 ]] && return 1
    [[ -t 0 ]]
}

confirm() {
    local msg="$1"
    if ! interactive; then
        echo -e "${YELLOW}ℹ️ (non-interactive) $msg → skipped${NC}"
        return 1
    fi
    read -p "$msg (y/N): " ans < /dev/tty
    [[ "$ans" =~ ^[Yy]$ ]]
}

# ---- Source resolution ----
# The tutor tree ships next to this script in the repo (clone method).
# For the one-liner (curl-piped) method, the script is downloaded alone and the
# tree must come from a tarball.
# Note: source always comes from the repo's canonical "tutor" dir regardless of
# --dir=NAME, which only changes the target directory name in the project.
SOURCE_TUTOR="$SCRIPT_DIR/.ai-instructions"
NEED_TARBALL=0
if [[ ! -d "$SOURCE_TUTOR" || ! -f "$SOURCE_TUTOR/README.md" ]]; then
    NEED_TARBALL=1
fi

fetch_tree() {
    local dest="$1"
    local url="https://github.com/lawaty/tutor-instructions/archive/refs/heads/main.tar.gz"
    local tmp
    tmp="$(mktemp -d)"
    trap 'rm -rf "$tmp"' EXIT
    if command -v curl &>/dev/null; then
        curl -fsSL "$url" -o "$tmp/tutor.tar.gz"
    elif command -v wget &>/dev/null; then
        wget -q "$url" -O "$tmp/tutor.tar.gz"
    else
        echo -e "${RED}❌ Neither curl nor wget available.${NC}"
        exit 1
    fi
    tar -xzf "$tmp/tutor.tar.gz" -C "$tmp" --strip-components=1
    mkdir -p "$(dirname "$dest")"
    cp -R "$tmp/.ai-instructions" "$dest"
}

ensure_installed_tree() {
    if [[ "$NEED_TARBALL" -eq 1 ]]; then
        echo "📥 Fetching tutor instruction tree..."
        fetch_tree "$TUTOR_DIR"
        return
    fi
    # Local copy (clone method)
    [[ -d "$TUTOR_DIR" ]] && return
    cp -R "$SOURCE_TUTOR" "$TUTOR_DIR"
}

# ---- Uninstall ----
do_uninstall() {
    echo "🗑️  Uninstalling tutor system (keeps .ai-state/ and ~/.ai-tutor/)..."

    # Remove entry points we own / strip include blocks
    for f in AGENT.md AGENTS.md agents.md CLAUDE.md GEMINI.md .github/copilot-instructions.md .cursor/rules/tutor.mdc .cursorrules; do
        local path="$PROJECT_ROOT/$f"
        [[ -f "$path" ]] || continue
        if grep -q "$ENTRY_MARKER" "$path" 2>/dev/null; then
            [[ "$DRY_RUN" -eq 1 ]] && { echo "  would remove $f"; continue; }
            rm -f "$path"
            echo "  removed $f"
        elif grep -q "$INCLUDE_START" "$path" 2>/dev/null; then
            [[ "$DRY_RUN" -eq 1 ]] && { echo "  would strip include block from $f"; continue; }
            sed -i "/$INCLUDE_START/,/$INCLUDE_END/d" "$path"
            echo "  stripped include block from $f"
        fi
    done

    # Remove tutor tree only if we own it
    if [[ -f "$TUTOR_DIR/.tutor-manifest" ]]; then
        [[ "$DRY_RUN" -eq 1 ]] && { echo "  would remove $TUTOR_DIR_NAME/"; }
        [[ "$DRY_RUN" -eq 0 ]] && rm -rf "$TUTOR_DIR"
        echo "  removed $TUTOR_DIR_NAME/"
    fi

    # Remove legacy monolith if ours (old .ai/ path or current .ai-state/)
    local legacy="${PROJECT_ROOT}/.ai/tutor-instructions.md"
    [[ -f "$legacy" ]] || legacy="$STATE_DIR/tutor-instructions.md"
    if [[ -f "$legacy" ]] && head -n 1 "$legacy" | grep -q "$LEGACY_HEADER"; then
        [[ "$DRY_RUN" -eq 0 ]] && rm -f "$legacy"
        echo "  removed legacy $legacy"
    fi

    echo ""
    echo "✅ Uninstall complete. Your learning state remains in .ai-state/ and ~/.ai-tutor/."
    exit 0
}

if [[ "$UNINSTALL" -eq 1 ]]; then
    do_uninstall
fi

# ---- Phase 1: canonical tree ----
if [[ "$DRY_RUN" -eq 0 ]]; then
    if [[ -e "$TUTOR_DIR" && ! -f "$TUTOR_DIR/.tutor-manifest" ]]; then
        echo -e "${RED}❌ '$TUTOR_DIR_NAME/' exists but is not managed by tutor-instructions.${NC}"
        echo "   Refusing to overwrite it. Use --dir=NAME or rename it manually."
        exit 1
    fi
    ensure_installed_tree
    # Write the manifest after install
    if [[ ! -f "$TUTOR_DIR/.tutor-manifest" ]]; then
        ( cd "$TUTOR_DIR" && find . -type f ! -name '.tutor-manifest' | sort | while read -r f; do
            sha256sum "$f" 2>/dev/null || stat -c '%n' "$f"
        done > .tutor-manifest )
    fi
    echo -e "${GREEN}✅ Tutor instruction tree → $TUTOR_DIR_NAME/${NC}"
else
    echo -e "${YELLOW}🔍 (dry-run) would verify/install $TUTOR_DIR_NAME/ tree${NC}"
fi

# ---- Phase 2: entry points ----
SKIP_COUNT=0
declare -A FILLED

# write template pointer into a file (thin pointer to the router)
write_pointer() {
    local path="$1"
    local tdir="${2:-$TUTOR_DIR_NAME}"
    cat > "$path" <<EOF
<!-- ${ENTRY_MARKER} v=2 target=$tdir/README.md -->
## AI Tutor System

This project has an AI tutor system installed. At the start of any tutoring or
learning session, read \`$tdir/README.md\` first and follow its instructions.

> Tutor-instructions by [lawaty](https://github.com/lawaty).
EOF
}

# check for case-insensitive collision (macOS/Windows)
case_collision() {
    local name="$1"
    find "$PROJECT_ROOT" -maxdepth 1 -iname "$name" 2>/dev/null | grep -qvx "$PROJECT_ROOT/$name"
}

# handle one entry slot; returns filled/skipped
ensure_entry() {
    local path="$1"

    # 0. symlink → always user-owned
    if [[ -L "$path" ]]; then
        echo -e "${YELLOW}○ $path is a symlink — leaving untouched${NC}"
        return 1
    fi

    # 1. absent → create
    if [[ ! -e "$path" ]]; then
        if [[ "$DRY_RUN" -eq 1 ]]; then
            echo -e "${GREEN}→ would create $path${NC}"
        else
            write_pointer "$path"
            echo -e "${GREEN}✓ created $path${NC}"
        fi
        return 0
    fi

    # 2. ours (current) → safe rewrite
    if grep -q "$ENTRY_MARKER" "$path" 2>/dev/null; then
        if [[ "$DRY_RUN" -eq 1 ]]; then
            echo -e "${GREEN}→ would update $path${NC}"
        else
            write_pointer "$path"
            echo -e "${GREEN}✓ updated $path${NC}"
        fi
        return 0
    fi

    # 3. ours (legacy pure-ours) → upgrade
    if head -n 3 "$path" 2>/dev/null | grep -q "$LEGACY_HEADER"; then
        if [[ "$DRY_RUN" -eq 1 ]]; then
            echo -e "${GREEN}→ would upgrade legacy $path${NC}"
        else
            write_pointer "$path"
            echo -e "${GREEN}✓ upgraded legacy $path${NC}"
        fi
        return 0
    fi

    # 4. already integrated → refresh
    if grep -q "$INCLUDE_START" "$path" 2>/dev/null; then
        echo -e "${BLUE}ℹ️  $path already integrated${NC}"
        return 0
    fi

    # 5. legacy append inside a user file
    if grep -q "$LEGACY_APPEND" "$path" 2>/dev/null; then
        if confirm "Replace the old appended tutor block in $path? (content after it is kept)"; then
            if [[ "$DRY_RUN" -eq 0 ]]; then
                line=$(grep -n "^$LEGACY_APPEND" "$path" | head -n1 | cut -d: -f1)
                if [[ -n "$line" ]]; then
                    sed -i "${line},\$d" "$path"
                    cat >> "$path" <<EOF

<!-- ${INCLUDE_START} (added by tutor-instructions setup.sh — safe to remove this block) -->
## AI Tutor System

This project has an AI tutor system installed. At the start of any tutoring or
learning session, read \`$TUTOR_DIR_NAME/README.md\` first and follow its instructions.
<!-- ${INCLUDE_END} -->
EOF
                fi
            fi
            echo -e "${GREEN}✓ replaced legacy block in $path${NC}"
            return 0
        fi
        # fall through to 6
    fi

    # 6. USER-OWNED, unintegrated → never overwrite
    if [[ "$APPEND_MODE" -eq 1 ]]; then
        if [[ "$DRY_RUN" -eq 1 ]]; then
            echo -e "${GREEN}→ would append include block to $path${NC}"
        else
            cat >> "$path" <<EOF

<!-- ${INCLUDE_START} (added by tutor-instructions setup.sh — safe to remove this block) -->
## AI Tutor System

This project has an AI tutor system installed. At the start of any tutoring or
learning session, read \`$TUTOR_DIR_NAME/README.md\` first and follow its instructions.
<!-- ${INCLUDE_END} -->
EOF
            echo -e "${GREEN}✓ appended include block to $path${NC}"
        fi
        return 0
    fi

    if [[ "$NO_MODIFY" -eq 1 ]]; then
        echo -e "${YELLOW}○ $path is user-owned — skipped (--no-modify)${NC}"
        SKIP_COUNT=$((SKIP_COUNT+1))
        return 1
    fi

    if interactive; then
        echo -e "${YELLOW}⚠ $path already exists (user content).${NC}"
        if confirm "Append the tutor include block to it? (won't touch existing content)"; then
            return ensure_entry "$path"  # re-run with append-mode semantics
        fi
    fi
    echo -e "${YELLOW}○ $path skipped — add this manually to activate tutor:${NC}"
    echo "   cat >> $path << 'EOF'"
    echo "   <!-- ${INCLUDE_START} (added by tutor-instructions setup.sh — safe to remove this block) -->"
    echo "   ## AI Tutor System"
    echo "   Read \`$TUTOR_DIR_NAME/README.md\` first and follow its instructions."
    echo "   <!-- ${INCLUDE_END} -->"
    echo "   EOF"
    SKIP_COUNT=$((SKIP_COUNT+1))
    return 1
}

# choose framework slots based on FRAMEWORKS
slots=()
slots+=("AGENT.md")
slots+=("AGENTS.md")  # cross-tool standard (Codex, Amp, GitHub agent)

if [[ "$FRAMEWORKS" =~ (^|,)claude($|,) ]] || [[ "$FRAMEWORKS" =~ claude ]] || [[ "$FRAMEWORKS" == "all" ]] || [[ -f "$PROJECT_ROOT/CLAUDE.md" || -d "$PROJECT_ROOT/.claude" ]]; then
    slots+=("CLAUDE.md")
fi
if [[ "$FRAMEWORKS" =~ cursor ]] || [[ "$FRAMEWORKS" == "all" ]] || [[ -d "$PROJECT_ROOT/.cursor" ]]; then
    slots+=(".cursor/rules/tutor.mdc")
fi
if [[ "$FRAMEWORKS" =~ copilot ]] || [[ "$FRAMEWORKS" == "all" ]] || [[ -f "$PROJECT_ROOT/.github/copilot-instructions.md" ]]; then
    slots+=(".github/copilot-instructions.md")
fi
if [[ "$FRAMEWORKS" =~ gemini ]] || [[ "$FRAMEWORKS" == "all" ]]; then
    slots+=("GEMINI.md")
fi

# agents.md variant — treated as one slot with AGENTS.md
agents_occupied=0
if [[ -e "$PROJECT_ROOT/agents.md" || -e "$PROJECT_ROOT/AGENTS.md" ]]; then
    agents_occupied=1
fi

echo ""
echo "⚙️  Setting up entry points..."

# Handle AGENT.md with case-insensitivity guard
if case_collision "AGENT.md" && [[ ! -e "$PROJECT_ROOT/AGENT.md" ]]; then
    echo -e "${YELLOW}○ AGENT.md exists with different case (agent.md) — treating slot as occupied${NC}"
    SKIP_COUNT=$((SKIP_COUNT+1))
else
    ensure_entry "$PROJECT_ROOT/AGENT.md" || true
fi

# Handle AGENTS.md/agents.md slot
if [[ "$agents_occupied" -eq 1 ]]; then
    # see if ours or user's
    target=""
    for cand in AGENTS.md agents.md; do
        [[ -e "$PROJECT_ROOT/$cand" ]] && { target="$PROJECT_ROOT/$cand"; break; }
    done
    ensure_entry "$target" || true
else
    mkdir -p "$PROJECT_ROOT"
    ensure_entry "$PROJECT_ROOT/AGENTS.md"
fi

for slot in "${slots[@]:2}"; do
    case "$slot" in
        CLAUDE.md|GEMINI.md|.github/copilot-instructions.md|.cursor/rules/tutor.mdc)
            mkdir -p "$PROJECT_ROOT/$(dirname "$slot")"
            ensure_entry "$PROJECT_ROOT/$slot" || true
            ;;
    esac
done

# ---- Phase 3: legacy migration ----
# Remove legacy monolith after tree installed (ours only) — old .ai/ or .ai-state/
LEGACY_MONO="$STATE_DIR/tutor-instructions.md"
[[ -f "$LEGACY_MONO" ]] || LEGACY_MONO="$PROJECT_ROOT/.ai/tutor-instructions.md"
if [[ -f "$LEGACY_MONO" ]] && head -n 1 "$LEGACY_MONO" | grep -q "$LEGACY_HEADER"; then
    if [[ "$DRY_RUN" -eq 0 ]]; then
        rm -f "$LEGACY_MONO"
        echo -e "${GREEN}✓ removed legacy $LEGACY_MONO (superseded by $TUTOR_DIR_NAME/)${NC}"
    else
        echo -e "${YELLOW}→ would remove legacy $LEGACY_MONO${NC}"
    fi
fi

# ---- Phase 4: state setup ----
echo ""
echo "📂 Setting up state..."
mkdir -p "$STATE_DIR/lessons"
mkdir -p "$STATE_DIR/lessons/archive"
mkdir -p "$STATE_DIR/cheatsheets"

# Global vault
VAULT_DIR="$HOME/.ai-tutor"
if [[ ! -d "$VAULT_DIR" ]]; then
    if [[ "$DRY_RUN" -eq 1 ]]; then
        echo -e "${YELLOW}→ would initialize vault at ~/.ai-tutor/${NC}"
    else
        mkdir -p "$VAULT_DIR/cheatsheets"
        mkdir -p "$VAULT_DIR/projects"
        cat > "$VAULT_DIR/README.md" << 'VAULTEOF'
# AI Tutor — Progress Vault

This directory stores your learning progress across all projects.
It persists even when you start new projects or switch machines (if Git-backed).
VAULTEOF
        cat > "$VAULT_DIR/global-progress.md" << 'PROGRESSEOF'
# Global Learning Progress

**Last updated**: (auto-updated by tutor)
**Total topics confirmed**: 0
**Projects tracked**: 0
PROGRESSEOF
        cat > "$VAULT_DIR/stats.md" << 'STATSEOF'
# Learning Statistics

**Total study sessions**: 0
**Total topics confirmed**: 0
**Total quizzes taken**: 0
STATSEOF
        echo -e "${GREEN}✅ Global progress vault initialized at ~/.ai-tutor/${NC}"
    fi
else
    echo -e "${BLUE}ℹ️  Global progress vault already exists${NC}"
fi

# Settings seeding
SETTINGS="$STATE_DIR/tutor-settings.md"
if [[ ! -f "$SETTINGS" ]]; then
    if [[ "$DRY_RUN" -eq 0 ]]; then
        cat > "$SETTINGS" <<EOF
# Tutor Settings
mode: $MODE
study_gap_threshold_days: 3
EOF
        echo -e "${GREEN}✅ Created $SETTINGS (mode: $MODE)${NC}"
    else
        echo -e "${YELLOW}→ would create $SETTINGS (mode: $MODE)${NC}"
    fi
elif [[ -n "$MODE" && "$MODE" != "deep" ]]; then
    # update mode line if explicitly requested via --mode
    if [[ "$DRY_RUN" -eq 0 ]]; then
        if grep -q '^mode:' "$SETTINGS" 2>/dev/null; then
            sed -i "s/^mode:.*/mode: $MODE/" "$SETTINGS"
        else
            echo "mode: $MODE" >> "$SETTINGS"
        fi
        echo -e "${GREEN}✅ Set mode: $MODE in settings${NC}"
    else
        echo -e "${YELLOW}→ would set mode: $MODE in settings${NC}"
    fi
else
    echo -e "${BLUE}ℹ️  $SETTINGS preserved${NC}"
fi

# .gitignore
GITIGNORE="$PROJECT_ROOT/.gitignore"
if [[ "$DRY_RUN" -eq 0 ]]; then
    if [[ -f "$GITIGNORE" ]]; then
        if ! grep -q "\.ai-state/" "$GITIGNORE"; then
            echo "" >> "$GITIGNORE"
            echo "# AI Tutor state (personal — never commit)" >> "$GITIGNORE"
            echo ".ai-state/" >> "$GITIGNORE"
            echo -e "${GREEN}✅ Added .ai-state/ to .gitignore${NC}"
        fi
    else
        echo "# AI Tutor state (personal — never commit)" > "$GITIGNORE"
        echo ".ai-state/" >> "$GITIGNORE"
        echo -e "${GREEN}✅ Created .gitignore${NC}"
    fi
else
    echo -e "${YELLOW}→ would update .gitignore${NC}"
fi

# ---- Summary ----
echo ""
echo "======================================"
echo "✨ AI Tutor Setup Complete! ✨"
echo "======================================"
echo ""
echo "Your coding agent should now act as a tutor. Restart your agent if needed."
echo "Your .ai-state/ data and ~/.ai-tutor/ vault are preserved by the installer."
echo ""
echo "📦 Tip: commit AGENT.md, AGENTS.md, and $TUTOR_DIR_NAME/ so your team shares the tutor."
echo "   (.ai-state/ stays gitignored as personal state.)"
echo ""

if [[ "$STRICT" -eq 1 && "$SKIP_COUNT" -gt 0 ]]; then
    exit 1
fi
exit 0
