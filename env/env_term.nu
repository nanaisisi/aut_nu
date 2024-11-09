#f-droid
#coding keyboard
pkg upgrade
termux-change-repo
#mirror asia? (not china...)
termux-setup-storage

#かなり標準リポジトリに入ってるので、便利ではある。入っていないものは厄介。

gh extension install github/gh-copilot

#shell setting nu
chsh

#$nu.env-path

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

#$nu.config-path

use ~/.cache/starship/init.nu

#~/.bashrc

eval "$(starship init bash)"

#色々入れとく
#tauriとか参考にはなる
gh extension install github/gh-copilot

#Rustupじゃないし、いらない気がする。
#コンパイルは時間がかかるのでGitのReleaseなどからバイナリが高速で手に入る用に。
cargo install cargo-binstall
#その後のアプリ管理
cargo binstall cargo-update
#list表示
#cargo install-update -l
#実行、自動アップデートシステムはこの辺の管理順序をフローにしてる。
#cargo install-update -a

##android自体はscropyが流行りかな
##
pkg install openssh
pkg install iproute2
#※ip -4 aで使用
#で行なえる。この時、接続するIPアドレス(Wi-Fi接続)とユーザー名が分からないとどうにもならないため以下で確認。

#IPアドレス確認
ip -4 a
#inet 192.168.11.20/24
#※Android側の設定 > ネットワークとインターネット > Wi-Fi > 接続済みの横にある歯車アイコン > 詳細設定 でもIPアドレスを確認できる
#ユーザー確認uid=xxxxx(u0_axxx)を探す/u0_axxxがユーザー名
id
#uid=10435(u0_a435)
#パスワード設定
passwd
#※任意のパスワードを設定する
#OpenSSHサーバー起動
sshd
#これで例えばmacOSやWindowsから

ssh u0_a435@192.168.11.20 -p 8022
#※IPアドレスとユーザー名/パスワードは実行中のシステムに合わせる

##
https://qiita.com/Maki-HamarukiLab/items/05ccabba68703a7d7892
https://pc.watch.impress.co.jp/docs/column/nishikawa/1409411.html