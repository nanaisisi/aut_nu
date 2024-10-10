winget upgrade
scoop update -a
wsl --update --pre-release
nu not_term.nu
nu aut.nu
clink update
wsl -d ubuntu -- nu wsl_ubuntu.nu & exit
wsl -d -- kail nu wsl_kail.nu & exit
