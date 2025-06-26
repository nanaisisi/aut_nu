# ダウンロード元を設定する
termux-change-repo

# ダウンロード元設定時の確認でapt updateは実行済みなため、apt upgradeのみ実行する
apt upgrade

# 個人的な好みだが、termuxのストレージをセットアップする。高バージョンのAndroid OSでは機能しない
termux-setup-storage

# 必要なパッケージをインストールする
source termux_pkg.nu

