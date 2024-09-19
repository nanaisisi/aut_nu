print sat
# cargo install-update -l コマンドを実行し、出力を取得

let output = (run-external "cargo" "install-update" "-l" | get stdout)

# 出力を行ごとに分割
let lines = $output | lines