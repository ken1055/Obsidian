---
tags: [reference]
---

# AI 社員運用マニュアル

この vault における「AI 社員 = ノエル」の運用マニュアル。原典は [[AI社員の作り方_要約]] を参照。

## 全体像

```
┌─ 短期記憶 (セッション内) ─────────────────────────┐
│  CLAUDE.md          人格・ジョブ仕様・事業ドメイン       │
│                                                          │
├─ 中期記憶 (起動時に読む索引) ─────────────────────┤
│  MEMORY.md          1 行索引のみ                         │
│                                                          │
└─ 長期記憶 (永続) ──────────────────────────────────┘
   会社情報/基本情報.md   会社説明書 (判断軸・目標・価値観)
   ビジネスモデル.md       問い (ユーザー手書き、不可侵)
   事業戦略.md             戦略本体 (不可侵)
   ロードマップ.md         Phase 0–4 (不可侵)
   タスク管理.md           全タスクの正本
   クライアント/           1 社 1 ファイル
   会議メモ/               1 会議 1 ファイル
   マニュアル/             撮影・営業
   Templates/              雛形
   Daily Notes/            日次の記録
   Inbox/                  未整理メモの投入先
   Notes/                  恒久ドキュメント
```

## 1 日の流れ

1. **朝 07:00 JST** — `morning-summary` ジョブ (Windows タスクスケジューラ) または `/morning`。
   - 昨日の Daily Note と Inbox を読み、今日の Daily Note 冒頭を埋める。コミット & push。
2. **朝の確認** — `/brief` を実行。今日の予定 + 滞留タスク + 要フォロークライアントが 1 画面で出る。
3. **日中** — メモは `Inbox/` に投げ込む。会議の文字起こしは `Inbox/transcript-YYYY-MM-DD-<topic>.md` で保存。
4. **会議後** — `/meeting` を実行。会議メモが生成され、タスクとクライアントに自動反映。
5. **夜 23:00 JST** — `evening-tidy` ジョブまたは `/evening`。Inbox を分類し移動。コミット & push。
6. **任意** — 週次で `/tasks check` を実行し、期限超過・放置を洗い出す。

## コマンド一覧

| コマンド | 役割 | 引数 |
|---|---|---|
| `/morning` | 朝のサマリ (CLAUDE.md のジョブ仕様通り) | `dry-run` |
| `/evening` | 夜の整理 | `dry-run` |
| `/meeting` | 会議トランスクリプトを整理 | ファイルパス (省略時は最新の transcript-*) |
| `/tasks` | タスクの取り込み | `ingest` (既定) / `check` / `done <内容>` |
| `/clients` | クライアント状況 | (空 = 横断) / クライアント名 / `new <名前>` |
| `/brief` | 朝のブリーフィング | `write` (Daily Note へ書き込み) |

## サブエージェント

| 名前 | 起動条件 | 出力先 |
|---|---|---|
| `meeting-summarizer` | `/meeting` 経由 or 「会議を整理して」発話 | 会議メモ/ / タスク管理.md / クライアント/ |
| `task-curator` | `/tasks` 経由 or 「やることまとめて」発話 | タスク管理.md (モード A/C) / 画面のみ (モード B) |
| `client-tracker` | `/clients` 経由 or 「フォローすべき相手」発話 | 画面のみ (A/B) / クライアント/ (C) |

## 手動で動かす場合

```powershell
.\scripts\morning-summary.ps1
.\scripts\evening-tidy.ps1
```

Claude Code セッション内では:

```
/morning
/evening
/meeting Inbox/transcript-2026-06-11-A社.md
/tasks check
/clients A社
/brief write
```

## 社員を増やしたくなったら

「AI 社員の作り方」では複数 AI を同居させる場合 **ディレクトリ分離** を推奨。例:

```
obsidian/                     ← ノエル (vault 整理担当)
../analytics-agent/           ← 別エージェント (KPI 集計担当)
    └── CLAUDE.md
```

同一 vault で複数人格を切り替えるより、用途別にディレクトリを分けて各 CLAUDE.md で役割を完全分離する方が記憶が混線しない。

## 連携 (まだ繋がっていないもの)

- Claude Cowork / MCP — Obsidian / Google ドライブ / Slack / Google カレンダー / Gmail を Claude に見せる仕組み。`claude mcp add` で必要に応じて追加。
- Fathom / Zapier — 会議の自動録音・文字起こし → Google ドライブ → Inbox/。現状は手動。

## 守るべきこと (CLAUDE.md からの再掲)

- ユーザー手書きメモ ([[ビジネスモデル]] [[事業戦略]] [[ロードマップ]] その他) の本文は書き換えない。
- 個人情報・認証情報を含むファイルを生成しない。
- 不確実な要約より「要約困難」を優先。

## 参考

- [[AI社員の作り方_要約]] — 原典本文。
- [CLAUDE.md](../CLAUDE.md) — 人格定義・ドメイン・カスタム指示。
- [MEMORY.md](../MEMORY.md) — 中期記憶索引。
