# 一応Debian系なので
source debians_upg.nu

# Ubuntu特有なOSアップグレード処理
if not ((which do-release-upgrade) | is-empty) {
    print "OSアップデートは実行しますか？(y/n)"
    if input == "y" {
        sudo do-release-upgrade
    }
}