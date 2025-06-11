# 実行環境ごとに条件分岐して処理を分ける

match (sys host | get name) {
    (str contains "Windows") => (
        # Windows用の処理
        source win_aut.nu
    ),
    (str contains "Ubuntu") => (
        # Ubuntu用の処理
        source ubuntu_aut.nu
    ),
    (str contains "Debian") => (
        # Linux用の処理
        source debians_aut.nu
    ),
    (str contains "Kail") => (
        # Kali Linux用の処理
        source debians_aut.nu
    ),
    (str contains "Termux") => (
        # Termux用の処理
        source termux_aut.nu
    ),
    _ => {
        print ($'未対応のOS: ' + (sys host | get name))
    }
}

gh extension upgrade gh-copilot
# cargo install-update -l コマンドを実行し、出力を取得
let output = (cargo install-update -l)
# 出力を行ごとに分割
let lines = $output | lines
let lines = $output | lines # cargo-update の行を解析
for line in $lines {if ($line | str contains
"cargo-binstall"
) {if ($line | str contains
"No"
) {
            # "No" が含まれている場合は無視print "No update needed for cargo-binstall"
} else {
            # "No" が含まれていない場合は更新コマンドを実行print "Updating cargo-binstall"
cargo binstall --force cargo-binstall
} } else if ($line | str contains
"cargo-update"
) {if ($line | str contains
"No"
) {
            # "No" が含まれている場合は無視print "No update needed for cargo-update"
continue } else {
            # "No" が含まれていない場合は更新コマンドを実行print "Updating cargo-update"
cargo binstall --force cargo-update
} } else if ( $line | str contains "erg" ) {
    if ( $line | str contains "No") {
            # "No" が含まれている場合は無視print "No update needed for erg"
} else {
            # "No" が含まれていない場合は更新コマンドを実行print "Updating erg"
cargo install erg -f --features "japanese full" }
} }
for line in $lines {if ($line | str contains "Yes"
) {print "cargo apps updating"
cargo install-update -a }}