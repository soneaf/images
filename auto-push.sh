#!/bin/bash
# Auto-commit and push new/changed images in email-images repo
REPO_DIR="$HOME/Developer/email-images"
LOG="$HOME/Library/Logs/email-images-autopush.log"

cd "$REPO_DIR" || exit 1

# Wait a moment for file writes to finish
sleep 2

# Check for changes (ignore .DS_Store)
git add --all -- ':!.DS_Store' ':!**/.DS_Store'

if git diff --cached --quiet; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') No changes to push" >> "$LOG"
    exit 0
fi

# Build commit message from changed files
FILES=$(git diff --cached --name-only | head -5)
COUNT=$(git diff --cached --name-only | wc -l | tr -d ' ')
MSG="Add/update ${COUNT} image(s): $(echo "$FILES" | head -1)"
if [ "$COUNT" -gt 1 ]; then
    MSG="Add/update ${COUNT} image(s)"
fi

git commit -m "$MSG" >> "$LOG" 2>&1
git push >> "$LOG" 2>&1

echo "$(date '+%Y-%m-%d %H:%M:%S') Pushed: $MSG" >> "$LOG"
