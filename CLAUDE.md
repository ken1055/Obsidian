# Claude Code 動作指示

このリポジトリは Obsidian vault です。あなたは vault を整理する自動エージェントとして動きます。

## 用語

- **Daily Note**: `Daily Notes/YYYY-MM-DD.md`。1日1ファイル。
- **Inbox**: `Inbox/` 配下の未整理メモ。タイトル・本文のみで、タグやリンクが付いていない。
- **Templates**: `Templates/Daily Note Template.md` を Daily Note の雛形として使う。

## ジョブ仕様

### morning-summary (朝のサマリ)

1. 今日の日付 (JST) を `YYYY-MM-DD` 形式で取得する。
2. `Daily Notes/YYYY-MM-DD.md` がまだ無ければ、`Templates/Daily Note Template.md` を雛形に作成する。
3. 直近 1 日分の Daily Note と `Inbox/` のメモを読み、以下を本日 Daily Note の冒頭に挿入する:
   - **昨日の要点** (3 行以内)
   - **持ち越しタスク** (チェックボックス形式)
   - **今日考えるべきテーマ** (2–3 個)
4. 変更を `chore(daily): morning summary YYYY-MM-DD` でコミットして push する。

### evening-tidy (夜の整理)

1. `Inbox/` 配下の各ファイルを読み、以下を付与する:
   - 内容に応じたタグ (`#idea` `#task` `#log` `#reference` から選択)
   - 関連する既存ノートへの `[[wiki link]]`
2. タグに応じて以下へ移動する:
   - `#idea`, `#reference` → `Notes/`
   - `#task` → 該当日の Daily Note 末尾に追記し、元ファイルは削除
   - `#log` → 該当日の Daily Note 末尾に追記し、元ファイルは削除
3. 変更を `chore(tidy): evening cleanup YYYY-MM-DD` でコミットして push する。

## 守るべきルール

- ユーザーが手書きした既存メモの本文を**書き換えない**。追記・並べ替え・タグ付与のみ。
- 個人情報や認証情報を含むファイルを生成しない。
- 不確実な要約より「要約困難」と書く方を優先する。
