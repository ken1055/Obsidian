# Obsidian × Claude Code Vault

Claude Code が自動でメモを整理・要約する Obsidian vault。

## 構成

```
Daily Notes/   毎日の記録 (YYYY-MM-DD.md)
Inbox/         未整理メモの投入先
Templates/     ノートのテンプレート
CLAUDE.md      Claude Code 用の動作指示
```

## 自動化ジョブ

| ジョブ | 起動タイミング | 内容 |
| --- | --- | --- |
| 朝のサマリ | 毎朝 07:00 JST | 前日の Daily Note と Inbox を要約し、当日の Daily Note を生成 |
| 夜の整理 | 毎晩 23:00 JST | Inbox の未整理メモにタグ・リンクを付与し、所定フォルダへ移動 |

実行はクラウド上の Claude Code Routines もしくはローカルの Windows タスクスケジューラが担い、結果は git にコミットされる。

## ローカル運用 (Windows タスクスケジューラ)

1. PowerShell を**管理者権限なし**で開き、次を実行してタスクを登録する:
   ```powershell
   powershell -ExecutionPolicy Bypass -File C:\Users\PC_User\Develop\obsidian\scripts\register-tasks.ps1
   ```
2. 登録後は `taskschd.msc` で `Obsidian-MorningSummary` (07:00) と `Obsidian-EveningTidy` (23:00) が見える。
3. 実行ログは `scripts/logs/` に1日1ファイルで残る (git には含めない)。
4. 手動でテストしたいときは、PowerShell で個別スクリプトを直接叩けばよい:
   ```powershell
   .\scripts\morning-summary.ps1
   .\scripts\evening-tidy.ps1
   ```

### 前提

- `claude` CLI に PATH が通っていること (`claude --version` が通る状態)。
- vault が git remote を持っていない場合、スクリプト内の push は失敗する。push を外したいときは CLAUDE.md のジョブ仕様から「push」を削るか、ローカルコミットのみに変える。
