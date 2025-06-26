#win_env_upg.nu

#前提条件クリア後のインストール自動化
#powershell scriptはこの前提条件を満たすためのもの
#前提条件

#windows
#scoop install aria2
#scoop install git
#scoop bucket add extras

#nu(scoop)
let uv_output = (uv)
# 出力を行ごとに分割
let uv_lines = $uv_output | lines # uv実行によるの行を解析
for uv_line in $uv_lines {
    if ($uv_line | str contains "Error") {
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
    }
}
scoop bucket add extras
winget upgrade
scoop update -a
wsl --update --pre-release
winget install googlechrome
winget install
