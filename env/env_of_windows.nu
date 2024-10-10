#パッケージマネージャを使えば、簡潔なインストール、アップデート（更新）が可能になる。
#wingetは、ストアアプリからwindowsにアプリインストーラーとしていれることができる。
#既存のものに干渉するので動かして時の動作が不安定なので辛い。
#

#https://scoop.sh/
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https:#get.scoop.sh | Invoke-Expression

#並列ダウンロード機能を導入してで
scoop install aria2

#この辺入れとく
#検索は以下のように
#scoop search git
scoop install git
scoop bucket add extras
scoop install googlechrome
#世話はなさそうなので、chromeも新しくいれるならこれでいいかも。
#scoop_appsを要確認

#rustup導入
#ストアアプリでvisual studio 2022をインストールしてC++のワークロードを選択しておく(自動生成)、インストールする。

#https://www.rust-lang.org/ja/tools/install
#今回はwingetでインストーラーを入れる。
winget install rustup
#これで入ったものを実行すれば良い。scoopはネストが深くて文句言われた事があるので、だが別に気にしなくていい気もする。
#コンパイルは時間がかかるのでGitのReleaseなどからバイナリが高速で手に入る用に。
cargo install cargo-binstall
#その後のアプリ管理
cargo install cargo-update
#list表示
#cargo install-update -l
#実行、自動アップデートシステムはこの辺の管理順序をフローにしてる。
#cargo install-update -a

#nana
#nushellに
#hx $nu.env-path

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

#hx $nu.config-path

use ~/.cache/starship/init.nu

#windows最新版のPowerShellに
#$PROFILE.config-path

Invoke-Expression (&starship init powershell)

#windows古参のコマンドプロンプト(CMD)に
#%LocalAppData%\clink\starship.lua
#remove""

"load(io.popen('starship init cmd'):read("*a"))()"