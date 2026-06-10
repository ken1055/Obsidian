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

実行はクラウド上の Claude Code Routines が担い、結果は git にコミットされる。
