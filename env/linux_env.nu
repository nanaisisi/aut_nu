$nu.env-path
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.cargo/bin/')

#my.example.path
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.local/share/JetBrains/Toolbox/scripts')
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/always/tools/ada/alire/alr-2.0.1-bin-x86_64-linux/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/always/tools/ada/aura/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/snap/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.rye/shims')
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.elan/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.cargo/bin/')
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

.bashrc
export PATH=$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts
export PATH=$PATH:$HOME/always/tools/ada/alire/alr-2.0.1-bin-x86_64-linux/bin
export PATH=$PATH:$HOME/always/tools/ada/aura/bin
export PATH=$PATH:$HOME/snap/bin
export PATH=$PATH:$HOME/.elan/bin
export PATH=$PATH:$HOME/.rye/shims
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.fzf/bin

eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
eval "$(mcfly init bash)"
eval "$(sheldon source)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

.profileあたりで日本語入力系とかGUI系、日本語フォント系、アレかも
