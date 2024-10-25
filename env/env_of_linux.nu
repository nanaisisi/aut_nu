
#私はwslで、winのクリップボードにパスワード固定しているんですよね。履歴あり非自動共有あり。
sudo apt update
sudo apt dist-upgrade -y
sudo do-release-upgrade

sudo apt install aptitude

#コンパイルは時間がかかるのでGitのReleaseなどからバイナリが高速で手に入る用に。
cargo install cargo-binstall
#その後のアプリ管理
cargo install cargo-update
#list表示
#cargo install-update -l
#実行、自動アップデートシステムはこの辺の管理順序をフローにしてる。
#cargo install-update -a

#helix

#ubuntu
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix

#not_ubuntu_issued_systemd

snap install --classic helix

flatpak install flathub com.helix_editor.Helix
flatpak run com.helix_editor.Helix

#Gordian Knot
cargo binstall helix

#$nu.env-path

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

#$nu.config-path

use ~/.cache/starship/init.nu

#~/.bashrc

eval "$(starship init bash)"