#!/bin/bash
# Installs all cc-code-along commands globally so they work in any Claude Code project.

set -e

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMANDS_DIR="$HOME/.claude/commands"

echo "Installing cc-code-along commands..."
mkdir -p "$COMMANDS_DIR"

commands=(
  "generate-exercises.md"
  "study.md"
  "start-exercise.md"
  "check-exercise.md"
  "hint.md"
)

for cmd in "${commands[@]}"; do
  cp "$PLUGIN_DIR/.claude/commands/$cmd" "$COMMANDS_DIR/$cmd"
  echo "  ✓ /$( basename "$cmd" .md )"
done

echo ""
echo "✅  Done! Open any project in Claude Code and use:"
echo ""
echo "   /generate-exercises       — generate the exercise guide"
echo "   /study <N>                — study guide before each exercise"
echo "   /start-exercise <N>       — starter file with TODOs"
echo "   /hint [exercise N step M] — progressive hint when stuck"
echo "   /check-exercise [N]       — review your work, get feedback"
echo ""
echo "Suggested workflow:"
echo "   /generate-exercises → /study 1 → /start-exercise 1 → /hint → /check-exercise 1"
echo ""
