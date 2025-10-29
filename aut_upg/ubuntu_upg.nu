# 一応Debian系なので
source debians_upg.nu

# Ubuntu特有なOSアップグレード処理
if (which do-release-upgrade) != null {
    print "OSアップデートは実行しますか？(y/n)"
    if (input) == "y" {
        sudo do-release-upgrade
    }
}