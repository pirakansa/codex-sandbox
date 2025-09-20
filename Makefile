.DEFAULT_GOAL := help

.PHONY: help build build-release run test fmt fmt-check clippy lint audit ci clean

help: ## タスク一覧を表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-16s %s\n", $$1, $$2}'

build: ## ロックファイルを尊重してデバッグビルド
	cargo build --locked

build-release: ## ロックファイルを尊重してリリースビルド
	cargo build --locked --release

run: ## デフォルト引数でCLIを実行
	cargo run -- --name Rust

test: ## 全テスト実行
	cargo test --all

fmt: ## 全ファイルを整形
	cargo fmt --all

fmt-check: ## 整形チェックのみ実行
	cargo fmt --all -- --check

clippy: ## clippyを警告なしで実行
	cargo clippy --all-targets -- -D warnings

lint: fmt-check clippy ## fmtチェックとclippyをまとめて実行

audit: ## 依存の脆弱性を確認
	cargo audit

ci: fmt-check clippy test audit ## CI相当のタスクをまとめて実行

clean: ## ビルド成果物を削除
	cargo clean
