def main [] {
echo world
echo No
let $line_septers = ["doragon ok" "yokohama ok" "exam no"]

for line_septer in $line_septers {
    if ($line_septer | str contains doragon) {
        if ($line_septer | str contains "ok") {
            # "No" が含まれている場合は無視
            echo "doragon"
        } else {
            # "No" が含まれていない場合は更新コマンドを実行
            echo "no doragon"
        }
    } else if ($line_septer | str contains "yokohama") {
        if ($line_septer | str contains "ok") {
            # "No" が含まれている場合は無視
            echo "yokohama"
            continue
        } else {
            # "No" が含まれていない場合は更新コマンドを実行
            echo "no yokohama"
        }
    } else if ($line_septer | str contains "exam") {
        if ($line_septer | str contains "ok") {
            # "No" が含まれている場合は無視
            echo "exam"
        } else {
            # "No" が含まれていない場合は更新コマンドを実行
            echo "no yokohama"
        }
    }
}
}