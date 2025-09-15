# codex-sandbox

Rust 製CLIツールの雛形を含みます。GitHub Flowで運用します。

## 使い方

- 初回セットアップ: `cargo build`
- ローカル実行: `cargo run -- hello --name Rust`
- テスト: `cargo test`
- フォーマット: `cargo fmt --all`
- 静的解析: `cargo clippy --all-targets -- -D warnings`

## 構成

- `Cargo.toml`: 依存とメタ情報
- `src/main.rs`: CLIエントリ（clap採用）
- `src/lib.rs`: ロジック（`greet`）
- `tests/`: 簡単なスモークテスト
- `.github/workflows/ci.yml`: CI（fmt/clippy/build/test）

Dev Container を使う場合は `.devcontainer/` を利用してください。
