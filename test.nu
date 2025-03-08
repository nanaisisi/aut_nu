# cargo install-update -l コマンドを実行し、出力を取得
let output = (cargo install-update
-l
)# 出力を行ごとに分割
let lines = $output | lines # cargo-update の行を解析
for line in
$lines {if ($line | str contains
"cargo-binstall"
){if ($line | str contains
"No"
){
            # "No" が含まれている場合は無視print "No update needed for cargo-binstall"
}else
{
            # "No" が含まれていない場合は更新コマンドを実行print "Updating cargo-binstall"
}}else
if ($line | str contains
"cargo-update"
){if ($line | str contains
"No"
){
            # "No" が含まれている場合は無視print "No update needed for cargo-update"
continue }else
{
            # "No" が含まれていない場合は更新コマンドを実行print "Updating cargo-update"
}}else
if ($line | str contains
"erg"
){if ($line | str contains
"No"
){
            # "No" が含まれている場合は無視print "No update needed for erg"
}else
{
            # "No" が含まれていない場合は更新コマンドを実行print "Updating erg"
}}}print "cargo apps updating"
