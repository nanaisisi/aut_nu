#not termux

if (which rustup) != null {
    rustup self update
    rustup update
}
if (which deno) != null {
    deno upgrade
}