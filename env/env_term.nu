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

https://qiita.com/Maki-HamarukiLab/items/05ccabba68703a7d7892
https://pc.watch.impress.co.jp/docs/column/nishikawa/1409411.html