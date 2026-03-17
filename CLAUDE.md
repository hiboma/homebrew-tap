# CLAUDE.md

## プロジェクト概要

Homebrew tap リポジトリです。`Formula/` 配下に各 CLI ツールの Formula (.rb) を配置しています。

## Formula の更新手順

Formula のバージョンアップには `scripts/update-formula.rb` を使用します。

```sh
ruby scripts/update-formula.rb <formula-name> <version>
```

このスクリプトは以下を自動で行います。

1. Formula ファイルから GitHub リポジトリを検出します
2. `gh release` でリリースの存在を確認します
3. アセットをダウンロードして SHA256 チェックサムを計算します
4. `Formula/<name>.rb` の `version` と `sha256` を更新します
5. `README.md` の表のバージョン番号を更新します

手動で sha256 を編集しないでください。必ずこのスクリプトを経由して更新します。
