if (which apt-fast) != null {
    sudo apt-fast update
    sudo apt-fast dist-upgrade -y
}

source not_termux.nu
source posix_upg.nu