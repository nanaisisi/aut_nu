#hx $nu.env-path

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

#hx $nu.config-path

use ~/.cache/starship/init.nu
$env.config.buffer_editor = "hx"
$env.config.edit_mode = 'vi'
#$env.config = { rm: {
#        always_trash: true # always act as if -t was given. Can be overridden with -p
#        }
# edit_mode = vi
#}
#lol
