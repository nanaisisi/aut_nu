#not termux

if (which rustup) != null {
    rustup self update
    rustup update
} else {
    print "rustup is not installed"
}

if (which deno) != null {
    deno upgrade
} else {
    print "deno is not installed"
}

if (which deno) != null {
    uv self update
} else {
    print "deno is not installed"
}
