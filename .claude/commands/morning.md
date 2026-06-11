---
description: 朝のサマリ — 昨日の Daily Note と Inbox を要約して今日の Daily Note 冒頭に挿入する
---

CLAUDE.md の「morning-summary (朝のサマリ)」セクションに定義された手順を、そのとおり実行してください。

実行時の補足:

1. 今日の日付は JST (Asia/Tokyo) で確定させる。Windows なので `Get-Date -Format yyyy-MM-dd` をそのまま使ってよい。
2. 今日の Daily Note が既にあり、冒頭の「昨日の要点 / 持ち越しタスク / 今日考えるべきテーマ」が空でない場合、上書きせず、その旨だけ出力してジョブを正常終了する。
3. 要約は 3 行以内。要約困難なら「要約困難」と書く。
4. 完了後は `chore(daily): morning summary YYYY-MM-DD` でコミットして push。push 先 remote が無ければコミットのみで終わる。

引数 (任意): $ARGUMENTS — 「dry-run」と渡された場合はコミット・push を行わず、変更内容だけ出力する。
