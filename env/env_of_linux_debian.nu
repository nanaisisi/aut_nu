#私はwslで、winのクリップボードにパスワード固定しているんですよね。履歴あり非自動共有あり。
sudo apt update
sudo apt dist-upgrade -y
sudo do-release-upgrade

#どうしても困った時用。あんまり使わないほうがいい。
sudo apt install aptitude

#コンパイルは時間がかかるのでGitのReleaseなどからバイナリが高速で手に入る用に。
cargo install cargo-binstall
#その後のアプリ管理
cargo binstall cargo-update
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


#hx /etc/shells
#add nu path
#shell setting nu
chsh


#$nu.env-path

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

#$nu.config-path

use ~/.cache/starship/init.nu

#~/.bashrc

eval "$(starship init bash)"

#etc
  echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ stable main" | sudo tee /etc/apt/sources.list.d/azlux.list
    sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg
"deb http://packages.azlux.fr/debian/ testing main"


#色々入れとく
#tauriとか参考にはなる
gh extension install github/gh-copilot