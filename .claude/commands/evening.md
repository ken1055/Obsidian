---
description: 夜の整理 — Inbox の未整理メモにタグ・リンクを付け、所定フォルダへ移動する
---

CLAUDE.md の「evening-tidy (夜の整理)」セクションに定義された手順を、そのとおり実行してください。

実行時の補足:

1. `Inbox/` 配下のうち `.gitkeep` などのドットファイルは触らない。
2. タグ付けは内容に基づき、`#idea` `#task` `#log` `#reference` のいずれか 1 つを選ぶ。判定不能なら `Inbox/` に残してログに「分類保留: <ファイル名>」と書く。
3. `[[wiki link]]` の追加先は、`Notes/` か `Daily Notes/` 配下に実在するノートに限る。存在しないリンクは作らない。
4. 既存メモの本文は書き換えない。タグ行と関連リンク行をファイル末尾に追記するだけ。
5. 完了後は `chore(tidy): evening cleanup YYYY-MM-DD` でコミットして push。

引数 (任意): $ARGUMENTS — 「dry-run」と渡された場合はファイル移動・コミット・push を行わず、各 Inbox ファイルの分類予定だけ出力する。
