#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

curl -s https://cc.storyfox.cz/ -o /tmp/original.html

NEW_VERSION=$(grep -oE 'Claude Code v[0-9.]+' /tmp/original.html | head -1 | grep -oE '[0-9.]+$')
OLD_VERSION=$(grep -oE 'Claude Code v[0-9.]+' "$REPO_ROOT/index.html" | head -1 | grep -oE '[0-9.]+$')
NEW_DATE=$(grep -oE 'Last updated: [^<]+' /tmp/original.html | head -1 | sed 's/Last updated: //')

echo "原站版本：$NEW_VERSION（目前：$OLD_VERSION）"

if [ "$NEW_VERSION" = "$OLD_VERSION" ]; then
  echo "版本相同，無需更新"
  exit 0
fi

CHANGELOG=$(python3 "$SCRIPT_DIR/extract-changelog.py" /tmp/original.html)

EXISTING=$(gh issue list --repo "$GITHUB_REPOSITORY" \
  --label "sync" --state open \
  --json title --jq ".[] | select(.title | contains(\"$NEW_VERSION\")) | .title")

if [ -n "$EXISTING" ]; then
  echo "已有此版本的 Issue，跳過"
  exit 0
fi

BODY=$(cat <<BODY
## 原站偵測到版本更新

**新版本：** \`v${NEW_VERSION}\`
**舊版本：** \`v${OLD_VERSION}\`
**更新日期：** ${NEW_DATE}

### 原站 Changelog

${CHANGELOG}

---

### 處理方式

請到 Claude Code 告訴 Claude：
> 「原站更新了，幫我更新 https://github.com/${GITHUB_REPOSITORY} 的中文版」

Claude 會自動比對差異並翻譯更新。

- 原站：https://cc.storyfox.cz/
- 中文版：https://rtsai1202.github.io/claude-code-cheatsheet-zh/
BODY
)

gh issue create \
  --repo "$GITHUB_REPOSITORY" \
  --title "原站更新：Claude Code v${NEW_VERSION}（原 v${OLD_VERSION}）" \
  --label "sync" \
  --body "$BODY"
