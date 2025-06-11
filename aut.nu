#git fetch
#git merge

# 実行環境ごとに条件分岐して処理を分ける

match (sys host | get name) {
    (str contains "Windows") => (
        # Windows用の処理
        source ./aut_upg/win_aut.nu
        source ./aut_upg/posix_aut.nu
    ),
    (str contains "Ubuntu") => (
        # Ubuntu用の処理
        source ./aut_upg/ubuntu_aut.nu
    ),
    (str contains "Debian") => (
        # Linux用の処理
        source ./aut_upg/debians_aut.nu
    ),
    (str contains "Kali") => (
        # Kali Linux用の処理
        source ./aut_upg/debians_aut.nu
    ),
    _ => {
        if $nu.os-info.name == "Android" {
            # Android用の処理
            # Termuxは、
            # host名が端末名かつ、
            # nuのOS情報がAndroidなので、
            # Termuxとして処理する
            source ./aut_upg/termux_aut.nu
        }
        else {
            print (未対応のOS: (sys host | get name))
        }
    }
}