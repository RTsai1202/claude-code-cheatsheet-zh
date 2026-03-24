# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 專案說明

[cc.storyfox.cz](https://cc.storyfox.cz/) 的繁體中文翻譯版，部署於 GitHub Pages。
單一檔案專案：`index.html`（CSS/JS 全內嵌，無任何外部依賴或建置步驟）。

- **中文版網站**：https://rtsai1202.github.io/claude-code-cheatsheet-zh/
- **GitHub Repo**：https://github.com/RTsai1202/claude-code-cheatsheet-zh

## 更新流程

當收到「原站更新了」的通知時：

```bash
# 1. 抓取原站最新版本
curl -s https://cc.storyfox.cz/ -o /tmp/original.html

# 2. 比對版本號
grep -oP '(?<=Claude Code v)[0-9.]+' /tmp/original.html
grep -oP '(?<=Claude Code v)[0-9.]+' index.html

# 3. 本機預覽中文版
python3 -m http.server 8765
# 開啟 http://localhost:8765/index.html
```

更新後 push 到 GitHub，Pages 自動部署（約 1 分鐘生效）：
```bash
git add index.html
git commit -m "chore: 同步原站更新至 vX.X.X"
git push
```

## 翻譯原則

**保留英文（不翻譯）**：
- 所有指令名稱（`/clear`、`--model`、`-p`）
- 鍵盤按鍵（Ctrl、Alt、Shift、Esc）
- 檔案路徑（`~/.claude/settings.json`）
- 環境變數名稱（`ANTHROPIC_API_KEY`）
- `<code>` 標籤內的所有內容
- Frontmatter 欄位名稱（`description`、`allowed-tools`）

**翻譯為繁體中文（台灣用語）**：
- `.section-header` 的區段標題
- `.sub-header` 的子區段標題
- `.desc` 的說明文字
- 頁首標題、更新日期、changelog 項目、頁尾標籤

## index.html 結構

頁面分為 4 欄，每欄包含 2 個 section：

| 欄位 | 上方 section | 下方 section |
|------|-------------|-------------|
| 1 | `.section-keyboard`（鍵盤快捷鍵） | `.section-mcp`（MCP 伺服器） |
| 2 | `.section-slash`（斜線指令） | `.section-memory`（記憶體與檔案） |
| 3 | `.section-workflows`（工作流程） | `.section-config`（設定與環境） |
| 4 | `.section-skills`（Skills 與 Agents） | `.section-cli`（CLI 指令） |

`.badge-new` 元素帶有 `data-added="YYYY-MM-DD"`，JS 會在 14 天後自動隱藏。
OS 切換按鈕（Mac/Windows）透過 JS 動態替換 `.keycap` 文字。

## 版權備註

本專案為翻譯衍生著作。原站作者：storyfox.cz。公開部署前建議取得授權。
