let scoop_upd_al_com = "scoop update --all"
let rustup_upd_com = "rustup update"
let cargo_ins_upd_check_com = "cargo install-update -l"
let cargo_ins_upd_com = "cargo binstall --force cargo_update"
let cargo_bin_upd_com = "cargo binstall --force cargo-binstall"
let cargo_erg_upd_com = "cargo install erg -f --features \"japanese full\""
let cargo_all_upd_com = "cargo install-update -a"

# 各コマンドの実行と選択の出力
echo "Executing: $scoop_upd_al_com"
$scoop_upd_al_com | run

echo "Executing: $rustup_upd_com"
$rustup_upd_com | run

# cargo install-update -l コマンドを実行し、出力を取得
let output = ($cargo_ins_upd_check_com | run | get stdout)

# 出力を行ごとに分割
let lines = $output | lines

# cargo-update の行を解析
for line in $lines {
    if ($line | str contains "cargo-update") {
        if ($line | str contains "No") {
            # "No" が含まれている場合は無視
            echo "No update needed for cargo-update"
            continue
        } else {
            # "No" が含まれていない場合は更新コマンドを実行
            echo "Updating cargo-update"
            $cargo_ins_upd_com | run
        }
    }
}
