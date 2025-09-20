# codex-sandbox

Rust 製CLIツールの雛形を含みます。GitHub Flowで運用します。

## 使い方

- 初回セットアップ: `make build`
- ローカル実行: `make run`
- テスト: `make test`
- フォーマット: `make fmt`（確認のみは `make fmt-check`）
- 静的解析: `make clippy`
- 依存脆弱性チェック: `make audit`
- 一括実行（CI相当）: `make ci`

タスク一覧は `make` もしくは `make help` で確認できます。

## 構成

- `Cargo.toml`: 依存とメタ情報
- `src/main.rs`: CLIエントリ（clap採用）
- `src/lib.rs`: ロジック（`greet`）
- `tests/`: 簡単なスモークテスト
- `.github/workflows/ci.yml`: CI（fmt/clippy/build/test）

Dev Container を使う場合は `.devcontainer/` を利用してください。
