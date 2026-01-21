#!/bin/bash

# AI Tutor Instructions Setup Script
# ====================================
# This script sets up or updates the AI tutor system in your project

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "🎓 AI Tutor Instructions Setup"
echo "=============================="
echo ""

# Detect project root (current directory)
PROJECT_ROOT="$(pwd)"
echo -e "${BLUE}📁 Project root:${NC} $PROJECT_ROOT"
echo ""

# Check if tutor system already exists
EXISTING_INSTALL=false
UPDATE_MODE=false

if [ -f "$PROJECT_ROOT/.ai/tutor-instructions.md" ]; then
    EXISTING_INSTALL=true
    echo -e "${YELLOW}🔍 Existing tutor installation detected!${NC}"
    echo ""
    
    # Scan current structure
    echo "📊 Current Tutor Structure:"
    echo "──────────────────────────────"
    
    if [ -f "$PROJECT_ROOT/.ai/tutor-instructions.md" ]; then
        INST_SIZE=$(wc -l < "$PROJECT_ROOT/.ai/tutor-instructions.md")
        echo -e "${GREEN}✓${NC} tutor-instructions.md (${INST_SIZE} lines)"
    fi
    
    if [ -f "$PROJECT_ROOT/.ai/tutor-syllabus.md" ]; then
        SYL_SIZE=$(wc -l < "$PROJECT_ROOT/.ai/tutor-syllabus.md")
        echo -e "${GREEN}✓${NC} tutor-syllabus.md (${SYL_SIZE} lines)"
    else
        echo -e "${YELLOW}○${NC} tutor-syllabus.md (missing)"
    fi
    
    if [ -f "$PROJECT_ROOT/.ai/tutor-progress.md" ]; then
        PROG_SIZE=$(wc -l < "$PROJECT_ROOT/.ai/tutor-progress.md")
        echo -e "${GREEN}✓${NC} tutor-progress.md (${PROG_SIZE} lines)"
    else
        echo -e "${YELLOW}○${NC} tutor-progress.md (not created yet)"
    fi
    
    if [ -f "$PROJECT_ROOT/.github/copilot-instructions.md" ]; then
        echo -e "${GREEN}✓${NC} .github/copilot-instructions.md"
    else
        echo -e "${YELLOW}○${NC} .github/copilot-instructions.md (missing)"
    fi
    
    # Check for practice directories
    if [ -d "$PROJECT_ROOT/.ai/practice" ]; then
        PRACTICE_COUNT=$(find "$PROJECT_ROOT/.ai/practice" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l)
        if [ "$PRACTICE_COUNT" -gt 0 ]; then
            echo -e "${YELLOW}⚠${NC}  practice/ directory (${PRACTICE_COUNT} active scenarios)"
        fi
    fi
    
    echo ""
    echo -e "${BLUE}Choose an option:${NC}"
    echo "  1) Update tutor-instructions.md only (preserve syllabus & progress)"
    echo "  2) Full reinstall (keeps progress.md, resets syllabus)"
    echo "  3) Complete fresh install (WARNING: deletes all tutor files)"
    echo "  4) Cancel"
    echo ""
    read -p "Enter your choice (1-4): " choice
    
    case $choice in
        1)
            UPDATE_MODE=true
            echo -e "${GREEN}✓${NC} Update mode: Will update instructions only"
            ;;
        2)
            echo -e "${YELLOW}⚠${NC}  Reinstall mode: Will preserve progress.md"
            # Backup progress if exists
            if [ -f "$PROJECT_ROOT/.ai/tutor-progress.md" ]; then
                cp "$PROJECT_ROOT/.ai/tutor-progress.md" "$PROJECT_ROOT/.ai/tutor-progress.md.backup"
                echo -e "${GREEN}✓${NC} Backed up tutor-progress.md"
            fi
            ;;
        3)
            echo -e "${RED}⚠${NC}  Fresh install: Removing all tutor files..."
            rm -rf "$PROJECT_ROOT/.ai/tutor-"* 2>/dev/null || true
            rm -rf "$PROJECT_ROOT/.ai/practice" 2>/dev/null || true
            EXISTING_INSTALL=false
            ;;
        4)
            echo "Installation cancelled."
            exit 0
            ;;
        *)
            echo "Invalid choice. Exiting."
            exit 1
            ;;
    esac
    echo ""
fi

echo "📁 Project root: $PROJECT_ROOT"

# Create .ai directory if it doesn't exist
if [ ! -d "$PROJECT_ROOT/.ai" ]; then
    echo "📂 Creating .ai directory..."
    mkdir -p "$PROJECT_ROOT/.ai"
fi

# Download or copy tutor instructions
TUTOR_INSTRUCTIONS_URL="https://raw.githubusercontent.com/lawaty/tutor-instructions/main/tutor-instructions.md"

if [ "$UPDATE_MODE" = true ]; then
    echo "📥 Updating tutor-instructions.md..."
else
    echo "📥 Installing tutor instructions..."
fi

# Try to download if URL is accessible, otherwise copy from local
if command -v curl &> /dev/null; then
    if [ -f "$(dirname "$0")/tutor-instructions.md" ]; then
        # Running from cloned repo
        cp "$(dirname "$0")/tutor-instructions.md" "$PROJECT_ROOT/.ai/tutor-instructions.md"
    else
        # Download from GitHub
        curl -fsSL "$TUTOR_INSTRUCTIONS_URL" -o "$PROJECT_ROOT/.ai/tutor-instructions.md"
    fi
elif command -v wget &> /dev/null; then
    if [ -f "$(dirname "$0")/tutor-instructions.md" ]; then
        cp "$(dirname "$0")/tutor-instructions.md" "$PROJECT_ROOT/.ai/tutor-instructions.md"
    else
        wget -q "$TUTOR_INSTRUCTIONS_URL" -O "$PROJECT_ROOT/.ai/tutor-instructions.md"
    fi
else
    echo "❌ Error: Neither curl nor wget is available. Please install one of them."
    exit 1
fi

echo "✅ Tutor instructions installed to .ai/tutor-instructions.md"

# If update mode, skip the rest
if [ "$UPDATE_MODE" = true ]; then
    echo ""
    echo "======================================"
    echo "✨ AI Tutor Update Complete! ✨"
    echo "======================================"
    echo ""
    echo "📊 Updated:"
    echo "   - .ai/tutor-instructions.md (latest version)"
    echo ""
    echo "📊 Preserved:"
    echo "   - .ai/tutor-syllabus.md (your custom syllabus)"
    echo "   - .ai/tutor-progress.md (your learning progress)"
    echo ""
    echo "💡 Restart your AI assistant to use the updated instructions!"
    echo ""
    exit 0
fi

# Setup GitHub Copilot instructions
COPILOT_DIR="$PROJECT_ROOT/.github"
COPILOT_FILE="$COPILOT_DIR/copilot-instructions.md"

echo ""
echo "⚙️  Setting up GitHub Copilot integration..."

# Create .github directory if needed
if [ ! -d "$COPILOT_DIR" ]; then
    mkdir -p "$COPILOT_DIR"
fi

# Add tutor instructions to copilot-instructions.md
if [ -f "$COPILOT_FILE" ]; then
    # Check if already integrated
    if grep -q "SENIOR TUTOR AGENT INSTRUCTIONS" "$COPILOT_FILE"; then
        echo "ℹ️  Tutor instructions already in copilot-instructions.md"
    else
        echo "" >> "$COPILOT_FILE"
        echo "# AI Tutor Mode" >> "$COPILOT_FILE"
        echo "Include instructions from .ai/tutor-instructions.md" >> "$COPILOT_FILE"
        echo "" >> "$COPILOT_FILE"
        cat "$PROJECT_ROOT/.ai/tutor-instructions.md" >> "$COPILOT_FILE"
        echo "✅ Tutor instructions added to existing copilot-instructions.md"
    fi
else
    # Create new file
    cat "$PROJECT_ROOT/.ai/tutor-instructions.md" > "$COPILOT_FILE"
    echo "✅ Created .github/copilot-instructions.md"
fi

# Create .gitignore entries if needed
GITIGNORE="$PROJECT_ROOT/.gitignore"
echo ""
echo "📝 Updating .gitignore..."

if [ -f "$GITIGNORE" ]; then
    if ! grep -q ".ai/tutor-progress.md" "$GITIGNORE"; then
        echo "" >> "$GITIGNORE"
        echo "# AI Tutor Progress (personal)" >> "$GITIGNORE"
        echo ".ai/tutor-progress.md" >> "$GITIGNORE"
        echo "✅ Added .ai/tutor-progress.md to .gitignore"
    else
        echo "ℹ️  .gitignore already configured"
    fi
else
    echo "# AI Tutor Progress (personal)" > "$GITIGNORE"
    echo ".ai/tutor-progress.md" >> "$GITIGNORE"
    echo "✅ Created .gitignore"
fi

# Create placeholder files (will be auto-generated by agent)
echo ""
echo "📋 Setting up tracker files..."

if [ ! -f "$PROJECT_ROOT/.ai/tutor-syllabus.md" ]; then
    cat > "$PROJECT_ROOT/.ai/tutor-syllabus.md" << 'EOF'
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
    echo "✅ Created placeholder tutor-syllabus.md"
else
    echo "ℹ️  tutor-syllabus.md already exists (preserved)"
fi

# Restore progress backup if in reinstall mode
if [ -f "$PROJECT_ROOT/.ai/tutor-progress.md.backup" ]; then
    mv "$PROJECT_ROOT/.ai/tutor-progress.md.backup" "$PROJECT_ROOT/.ai/tutor-progress.md"
    echo "✅ Restored tutor-progress.md from backup"
fi

# Success message
echo ""
echo "======================================"
echo "✨ AI Tutor Setup Complete! ✨"
echo "======================================"
echo ""

if [ "$EXISTING_INSTALL" = true ]; then
    echo "� Installation Summary:"
    echo "   ✓ Updated: .ai/tutor-instructions.md"
    if [ -f "$PROJECT_ROOT/.ai/tutor-progress.md" ]; then
        echo "   ✓ Preserved: .ai/tutor-progress.md (your learning history)"
    fi
    echo "   ✓ Preserved: .ai/tutor-syllabus.md (your custom syllabus)"
else
    echo "�📁 Files created:"
    echo "   - .ai/tutor-instructions.md"
    echo "   - .ai/tutor-syllabus.md (placeholder)"
    echo "   - .github/copilot-instructions.md"
fi

echo ""
echo "🎯 Next steps:"
echo "   1. Edit .ai/tutor-syllabus.md to customize your learning path"
echo "   2. Start working with GitHub Copilot - it will now act as your tutor"
echo "   3. Progress will be tracked in .ai/tutor-progress.md (auto-created)"
echo ""
echo "💡 Tip: Ask your AI assistant to 'build a feature' and watch it teach first!"
echo ""
