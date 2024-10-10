//$nu.env-path

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

//$nu.config-path

use ~/.cache/starship/init.nu