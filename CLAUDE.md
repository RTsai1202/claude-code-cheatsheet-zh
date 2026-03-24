# Claude Code 速查表（繁體中文版）

## 專案說明

這是 [cc.storyfox.cz](https://cc.storyfox.cz/) 的繁體中文翻譯版，部署於 GitHub Pages。

## 重要連結

- **原站**：https://cc.storyfox.cz/
- **中文版網站**：https://rtsai1202.github.io/claude-code-cheatsheet-zh/
- **GitHub Repo**：https://github.com/RTsai1202/claude-code-cheatsheet-zh

## 專案結構

```
index.html    # 繁體中文版頁面（單一檔案，CSS/JS 全內嵌）
CLAUDE.md     # 本檔案
```

## 更新流程

1. GitHub Actions 每天早上 8 點（台灣時間）自動偵測原站版本號
2. 若版本有變動，自動開 GitHub Issue 通知
3. 收到通知後，來這裡告訴 Claude：「原站更新了，幫我更新中文版」
4. Claude 會：
   - 抓取原站最新 HTML
   - 比對差異（版本號、changelog、新增描述文字）
   - 翻譯並更新 `index.html`
   - Push 到 GitHub（GitHub Pages 自動部署）

## 翻譯原則

- **保留原文**：所有指令名稱（`/clear`、`--model`）、鍵盤按鍵、檔案路徑、環境變數名稱、程式碼
- **翻譯為繁體中文**：所有說明文字、區段標題、頁首頁尾
- **用語**：台灣語境繁體中文

## 版權備註

本專案為翻譯衍生著作，建議取得原作者授權後再公開部署。
原站作者：storyfox.cz
