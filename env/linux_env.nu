#end
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