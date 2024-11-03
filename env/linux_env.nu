#end
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.cargo/bin/')

#my.example.path
$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/yakihali/.local/share/JetBrains/Toolbox/scripts')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/yakihali/always/tools/ada/alire/alr-2.0.1-bin-x86_64-linux/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/yakihali/always/tools/ada/aura/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/yakihali/snap/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/yakihali/.rye/shims')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/yakihali/.elan/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/yakihali/.cargo/bin/')
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu