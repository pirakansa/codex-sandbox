# Repository Guidelines

このドキュメントは、本リポジトリで開発するための実践的なガイドです。内容は短く要点に絞っています。疑問点があればPRやIssueで相談してください。

## プロジェクト構成と配置

- ルート: メタ情報とツール設定（`.github/`, `.devcontainer/`, `.vscode/`）
- `.github/`: ワークフロー/規約。特に `copilot-instructions.md` のコミット規約を遵守
- `.devcontainer/`: Rust ベースの開発コンテナ（VS Code Dev Containers 推奨）
- 将来の配置例: `src/`（本体）, `tests/`（統合テスト）, `docker/`（運用スクリプト）, `scripts/`（補助）

## ビルド・テスト・開発コマンド

本リポジトリは Rust 開発を想定（まだ `Cargo.toml` は未作成）。Rust を使う場合の標準コマンド:

```bash
cargo init            # 新規プロジェクト作成（初回のみ）
cargo build --release # 本番向けビルド
cargo test            # すべてのテスト実行
cargo run             # ローカル実行
```

Dev Container を使わない場合のビルド例:
```bash
docker build -f .devcontainer/Dockerfile -t repo-dev .
```

## コーディング規約・命名

- Rust: インデント4スペース、`rustfmt` に準拠、`clippy` 警告は原則解消
- 命名: 関数/変数は `snake_case`、型/構造体は `UpperCamelCase`、定数は `UPPER_SNAKE_CASE`
- 配置例: `src/lib.rs` とモジュール `src/<module>/mod.rs`、バイナリは `src/bin/<name>.rs`
- フォーマット/静的解析:
```bash
cargo fmt --all
cargo clippy --all-targets -- -D warnings
```

## テスト方針

- フレームワーク: 標準の Rust テスト（`#[test]`）と統合テスト（`tests/*.rs`）
- カバレッジ目安: 重要ロジックは主要分岐をカバー（定量目標は今後合意）
- 命名: `it_期待する振る舞い` の形式推奨（例: `it_handles_empty_input`）
- 実行: `cargo test`（必要に応じて `-- --nocapture`）

## コミットとプルリクエスト

- コミット: 日本語本文 + Conventional Commits 形式（タイプ/スコープは英語）。例:
```
feat(auth): 認証を追加

変更: src/auth/mod.rs, tests/auth.rs
理由: JWT に対応するため
```
- PR: 目的/背景、主な変更点、確認手順、影響範囲を記載。関連 Issue をリンク。動作確認結果（ログ/スクショ）を添付
- ブランチ: GitHub Flow（`main` から派生 → PR → レビュー後マージ）

## セキュリティ/設定メモ

- `.env` は開発補助用（`USERNAME`, `USERID` を自動生成）。秘匿情報はコミットしない
- 依存やビルド設定を更新したら、本ガイドと `README.md` を合わせて更新

