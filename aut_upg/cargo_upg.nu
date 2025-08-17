mut cargo_all_update_run_flag = false
mut cargo_update_app_update_run_flag = false
mut erg_update_run_flag = false

if (which cargo) != null {
    let output_cargo = (cargo install-update -l)
    # 出力を行ごとに分割
    let lines_cargo = $output_cargo | lines # cargo-update の行を解析

    for $line_cargo in $lines_cargo {
        # 優先順位1: cargo-binstall（即座に更新）
        if ($line_cargo | str contains "cargo-binstall") {
            if ($line_cargo | str contains "Yes") {
                print "Updating cargo-binstall"
                cargo binstall --force cargo-binstall
            }
        # 優先順位2: cargo-update（フラッグ管理、後でbinstall更新）
        } else if ($line_cargo | str contains "cargo-update") {
            if ($line_cargo | str contains "Yes") {
                print "Yes update needed for cargo-update"
                $cargo_update_app_update_run_flag = true
            }
        # 優先順位3: erg（フラッグ管理、後で特別オプション付きインストール）
        } else if ($line_cargo | str contains "erg") {
            if ($line_cargo | str contains "Yes") {
                print "Yes update needed for erg"
                $erg_update_run_flag = true
            }
        # 優先順位4: 一般的なcargo apps（一括更新フラッグ）
        } else if ($line_cargo | str contains "Yes") {
            $cargo_all_update_run_flag = true
        }
    }

    # 優先順位2: cargo-update の更新実行
    if ($cargo_update_app_update_run_flag == true) {
        print "Updating cargo-update"
        cargo binstall --force cargo-update
    } else {
        print "No updates available for cargo-update"
    }

    # 優先順位3: erg の更新実行
    if ($erg_update_run_flag == true) {
        print "Updating erg"
        cargo install erg -f --features "japanese full"
    } else {
        print "No updates available for erg"
    }

    # 優先順位4: 一般的なcargo apps の一括更新
    if ($cargo_all_update_run_flag == true) {
        print "cargo all apps updating"
        cargo install-update -a
    } else {
        print "No updates available for cargo all apps"
    }
}