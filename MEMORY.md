# MEMORY (中期記憶インデックス)

vault 全体を横断する「索引」。長文は書かず、各エントリは 1 行 (~150 字) に収め、必要に応じて個別ノートへ飛ばす。Claude Code (ノエル) が起動するたび最初に読む想定。

## 運用ルール

- 役割定義とフォルダ規約は [CLAUDE.md](CLAUDE.md) を参照。ここで重複させない。
- 朝の手順は [.claude/commands/morning.md](.claude/commands/morning.md)、夜は [.claude/commands/evening.md](.claude/commands/evening.md)。
- 会議は `/meeting`、タスクは `/tasks`、クライアントは `/clients`、朝ブリーフは `/brief`。
- AI 社員フレームの全体像は [Notes/AI社員運用マニュアル.md](Notes/AI%E7%A4%BE%E5%93%A1%E9%81%8B%E7%94%A8%E3%83%9E%E3%83%8B%E3%83%A5%E3%82%A2%E3%83%AB.md)、原典要約は [Notes/AI社員の作り方_要約.md](Notes/AI%E7%A4%BE%E5%93%A1%E3%81%AE%E4%BD%9C%E3%82%8A%E6%96%B9_%E8%A6%81%E7%B4%84.md)。

## 事業 (常時参照)

- [[ビジネスモデル]] — ユーザー手書きの問い (不可侵)
- [[事業戦略]] — 戦略本体 (不可侵)
- [[ロードマップ]] — Phase 0–4 と資産目標 (不可侵)
- [[会社情報/基本情報]] — AI が毎回読む「会社説明書」、価値観と判断軸

## 知識ベース起点

- [[タスク管理]] — 全タスクの正本
- `クライアント/` — 1 社 1 ファイル (`_テンプレート.md` あり)
- `会議メモ/` — 1 会議 1 ファイル (`_テンプレート.md` あり)
- `マニュアル/` — [[マニュアル/撮影マニュアル]] / [[マニュアル/営業マニュアル]]

## サブエージェント

- `meeting-summarizer` — 会議トランスクリプト → 会議メモ / タスク / クライアントへ反映
- `task-curator` — Inbox/Daily Note → タスク管理、滞留検出、完了反映
- `client-tracker` — クライアント横断レビュー / 個別サマリ / 新規登録

## 進行中のテーマ

- Phase 0 のパイロット撮影と SUUMO 規約確認が最優先。詳細は [[タスク管理]] 進行中セクション参照。

## 既知の制約

- vault は Windows ローカル (`C:\Users\PC_User\Develop\obsidian`)。スクリプトは PowerShell 5.1 前提。
- 自動ジョブはコミット & push を行うため、push 先 remote が無い環境では `register-tasks.ps1` 経由のスケジューラ実行が失敗する。
- Claude Cowork / MCP (GDrive・Slack・Gmail・Calendar) は未接続。必要になった段階で `claude mcp add` で追加する。
- 会議の自動文字起こし (Fathom / Zapier) は未接続。手動で文字起こしを `Inbox/transcript-*.md` に置くと `/meeting` で処理可能。

---

メンテ方針: 古くなった行は削るか、該当ノートに移して短い索引だけ残す。200 行を超えたら間引く。
