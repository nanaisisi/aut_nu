#win_env_aut.nu
#前提条件

#windows
#scoop install aria2
#scoop install git
#scoop bucket add extras

#nu(scoop)


scoop install uv
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"