#!/bin/bash
set -euo pipefail

# Only run in Claude Code cloud sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install graphify (pip, from GitHub) only if missing
if ! command -v graphify >/dev/null 2>&1; then
  python3 -m pip install --quiet "git+https://github.com/Graphify-Labs/graphify.git"
fi

# Install the Claude skill only if missing
if [ ! -f "$HOME/.claude/skills/graphify/SKILL.md" ]; then
  graphify install --platform claude
fi
