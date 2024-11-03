winget upgrade
scoop update -a
wsl --update --pre-release
nu not_term.nu
nu aut.nu
wsl -d ubuntu -- nu wsl_ubuntu.nu & exit
wsl -d -- kail nu wsl_kail.nu & exit

#chrome profile n help
#プロファイル選択がデバイスで安定しないかも