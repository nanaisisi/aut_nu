#not termux

if not ((which rustup) | is-empty) {
    rustup self update
    rustup update
} else {
    print "rustup is not installed"
}

if not ((which deno) | is-empty) {
    deno upgrade
} else {
    print "deno is not installed"
}

if not ((which uv) | is-empty) {
    uv self update
    uv tool upgrade --all
} else {
    print "deno is not installed"
}

source cargo_upg.nu
