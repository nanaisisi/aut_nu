source cargo_upg.nu

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


    if ($gh_not_installed_flag == true) {
        # gh-copilot がインストールされていない場合はインストール
        print "Installing gh-copilot"
        gh extension install github/copilot-cli
    } else {
        print "gh-copilot is already installed"
    }
}
