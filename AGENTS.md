# Repository Guidelines

## Project Structure & Module Organization

- プロジェクトのディレクトリ構成は以下 Cargo Package Layout を採用。
  - https://doc.rust-lang.org/cargo/guide/project-layout.html
- リポジトリ規約や CI 設定は `.github/`、開発コンテナは `.devcontainer/` に配置。
- Rust モジュールは小さく凝集度高く分割し、再利用可能なロジックは `src/lib.rs` へ、実行エントリは `src/main.rs`（該当する場合）。
- `/README.md` には簡易的なプロジェクトの概要と使い方程度にとどめ、他ドキュメント（ビルド成果物の使い方等）は `/docs` に別途マークダウンファイルを配置して管理。

## Build, Test, and Development Commands

```bash
cargo build --release   # 本番向けビルド
cargo run               # ローカル実行
cargo test              # すべてのテスト
cargo test -- --nocapture  # テスト出力を表示
cargo fmt --all         # フォーマット
cargo clippy --all-targets -- -D warnings  # 静的解析（警告をエラー化）
```

## Coding Style & Naming Conventions

- フォーマットは `rustfmt` に準拠。PR 前に `cargo fmt --all` を実行。
- 静的解析は `clippy` を必須とし、警告は解消（`-D warnings`）。
- 命名: 関数/変数 `snake_case`、型/構造体 `UpperCamelCase`、定数 `UPPER_SNAKE_CASE`。
- 新規 API は小さくテスト可能に。公開 API はドキュメントコメント（`///`）を付与。

## Dependencies Selection Criteria

- 採用する場合は一般的で広く利用されている外部モジュールを選ぶこと。
- メンテナンスが継続されていない外部モジュールは選定しないこと。

## Testing Guidelines

- 標準の Rust テスト（`#[test]`）と統合テスト（`tests/*.rs`）。
- テスト名は `it_期待する振る舞い` 形式（例: `it_handles_empty_input`）。
- 重要ロジックには最小限のハッピーパス/エッジケースを用意。ローカルでは `cargo test -- --nocapture` で詳細確認。

## Commit & Pull Request Guidelines

- GitHub Flow 準拠。`main` から機能ブランチ作成（例: `feat/parser-refactor`）。小さく頻繁にコミット。
- コミットメッセージは日本語 + Conventional Commits 形式（タイプ/スコープは英語）、各ファイルの変更内容を列挙。以下例を記載。 
  ```
  feat(parser): 新しいパーサーモジュールを追加
  
  変更したファイル:
  - src/parser/mod.rs: パーサー実装
  - src/lib.rs: 公開モジュールを更新
  ```
- PR には目的、要約、主要変更点、関連 Issue、スクリーンショット/ログ（必要時）を含める。CI 通過と `test`/`fmt`/`clippy` 満たすこと。

## Agent-Specific Notes

- 本ガイドの範囲にある変更は必ず規約に従うこと。無関係な大規模リファクタは避け、影響範囲を最小化。
- 新しい構造やパターンを導入した場合は、本ファイルや関連ドキュメントを更新すること。

## Security

- 機密ファイルとして次を読み取ったり変更したりしないこと。
  - `.env` ファイル
  - API キー、トークン、または認証資格情報を含むファイル
- 機密ファイルの編集が必要な場合は、必ず事前に確認を取ること。

### Security Guidelines

- 機密ファイルを決してコミットしない
- 秘密情報には環境変数を使用する
- ログや出力に認証情報を含めない
