#sudo apt-fast-get update
#sudo apt-fast-get dist-upgrade
#のほうがcli的にはいいかも？
sudo apt-fast update
sudo apt-fast dist-upgrade -y
source not_termux.nu
source posix_upg.nu
source all_upg.nu

print "OSアップデートは実行しますか？(y/n)"
if (input) == "y" {
    sudo do-release-upgrade
}
