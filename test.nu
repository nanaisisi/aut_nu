# for code test
if (which cargo) != null {
let output_cargo = (cargo install-update -l)
# 出力を行ごとに分割
let lines_cargo = $output_cargo | lines # cargo-update の行を解析
mut cargo_all_update_run_flag = false
mut cargo_update_app_update_run_flag = false
mut erg_update_run_flag = false

for $line_cargo in $lines_cargo {
    if ($line_cargo | str contains
        "cargo-binstall"
    ) {
        if ($line_cargo | str contains
            "Yes"
        ) {
            # "Yes" が含まれてる場合は更新コマンドを実行
            print "Updating cargo-binstall"
            cargo binstall --force cargo-binstall
        }
    } else if ($line_cargo | str contains
        "cargo-update"
    ) {
        if ($line_cargo | str contains
            "Yes"
        ) {
            # "Yes" が含まれている場合は専用アップデートフラッグを立てる
            print "Yes update needed for cargo-update"
            $cargo_update_app_update_run_flag = true
        }
    } else if ( $line_cargo | str contains "erg" ) {
        if ( $line_cargo | str contains "Yes") {
            # "Yes" が含まれている場合は専用アップデートフラッグを立てる
            print "Yes update needed for erg"
            $erg_update_run_flag = true
        }
    } else if ($line_cargo | str contains "Yes") {
        $cargo_all_update_run_flag = true
    }
}

if ( $cargo_update_app_update_run_flag == true ) {
            # "Yes" が含まれている場合は更新コマンドを実行
            print "Updating cargo-update"
            cargo binstall --force cargo-update
        } else {
            # "Yes" が含まれていない場合は無視
            print "Yes update needed for cargo-update"
        }

if ( $erg_update_run_flag == true ) {
    # erg の更新が必要な場合
    print "Updating erg"
    cargo install erg -f --features "japanese full"
} else {
    # erg の更新が必要ない場合
    print "No updates available for erg"
}

if ( $cargo_all_update_run_flag == true ) {
    # cargo apps の更新が必要な場合
    print "cargo all apps updating"
    cargo install-update -a
} else {
    # すべてのcargo apps の更新が必要ない場合
    print "No updates available for cargo all apps"
}
}

mut gh_not_installed_flag = false
# gh のインストールを確認
if (which gh) != null {
    # gh-copilot のインストールを確認
    let lines_gh = (gh extension list | lines)
    for $line_gh in $lines_gh {
        if ($line_gh | (str contains "gh-copilot")) {
            # gh-copilot がインストールされている場合
            print "Installed gh-copilot"
            gh extension upgrade gh-copilot
        } else {
            $gh_not_installed_flag = true
        }
    }
}

if ($gh_not_installed_flag == true) {
    # gh-copilot がインストールされていない場合はインストール
    print "Installing gh-copilot"
    gh extension install github/copilot-cli
} else {
    print "gh-copilot is already installed"
}
