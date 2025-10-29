# 開発計画 / Development Plan

## 概要

現在のアップデートシステムの改善計画と将来の開発ロードマップ。

## 現在の安定版 (v1)

### ファイル構造

- `upg.nu` - メインアップデートスクリプト
- `aut_upg/` - プラットフォーム別アップデートモジュール

### 特徴

- OS 自動検出（Windows/Ubuntu/Debian/Termux）
- 各プラットフォーム固有のアップデート実行
- シンプルな条件分岐ベースの処理

### 課題

- ハードコードされたアプリケーション管理
- 設定の柔軟性の欠如
- エラーハンドリングの不足
- 手動/自動の明確な分離なし

## 次世代アップデートシステム (開発中)

### 目標

設定ファイルベースの柔軟なアップデート管理システムの実装。

### 主要機能

- **設定ファイルベース**: TOML/NUON 形式の設定ファイルでアプリケーション管理
- **プラットフォーム自動検出**: 強化された OS/環境検出
- **優先順位管理**: アプリケーションごとの更新優先順位設定
- **手動操作分離**: 自動更新と手動確認の明確な分離
- **エラーハンドリング**: 詳細なエラーメッセージと回復処理
- **条件付き更新**: インストール状況に応じた柔軟な処理

### 設定ファイル構造

```toml
[platforms.windows]
automatic = [
    { name = "winget", command = "winget upgrade", description = "Windows Package Manager" },
    { name = "scoop", command = "scoop update -a", description = "Scoop package manager" }
]
manual = [
    { name = "rustup", command = "rustup update", description = "Rust toolchain" }
]

[cargo]
priority_apps = [
    { name = "cargo-binstall", priority = 1, command = "cargo binstall --force cargo-binstall" },
    { name = "erg", priority = 3, command = "cargo install erg -f --features \"japanese full\"" }
]
bulk_update = { command = "cargo install-update -a", description = "Bulk cargo updates" }

[metadata]
version = "2.0.0"
description = "Next generation update configuration"
```

### 実装予定ファイル

- `upg_config.nu` - 次世代メインスクリプト
- `config/update_config.toml` - TOML 形式設定ファイル
- `config/update_config.nuon` - NUON 形式設定ファイル

### 開発ステップ

#### Phase 1: 基本構造の実装

- [ ] 設定ファイル読み込み機能
- [ ] プラットフォーム検出の改善
- [ ] 基本的な自動更新処理

#### Phase 2: 高度な機能

- [ ] 優先順位ベースの更新
- [ ] 条件付き更新の実装
- [ ] エラーハンドリングの強化

#### Phase 3: ユーザビリティ改善

- [ ] 手動更新の明確な案内
- [ ] 詳細なログ出力
- [ ] 設定ファイルの検証

#### Phase 4: テストと安定化

- [ ] 各プラットフォームでのテスト
- [ ] ドキュメント更新
- [ ] 安定版への移行

## 開発ブランチ運用

### 推奨ワークフロー

1. `main`ブランチは常に安定版を維持
2. 新機能開発は `feature/` プレフィックスのブランチで実施
3. 破壊的変更の場合は `breaking-change/` ブランチを使用
4. リリース準備ができたら `develop` ブランチを経由して `main` にマージ

### 現在の開発ブランチ

- `feature/config-based-updates` - 設定ファイルベース更新システム

## 注意事項

- 安定版の動作を損なわないよう注意
- 後方互換性を可能な限り維持
- ユーザーの手動操作を強制しない設計
- 各プラットフォームでのテストを徹底

## 連絡先

開発に関する質問や提案はリポジトリの Issue にてお願いします。
