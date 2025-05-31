#originally created by: scoop project
#get.scoop.sh
#https://github.com/ScoopInstaller/Install/blob/master/install.ps1

#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://github.com/nanaisisi/aut_nu/tree/main/env_aut/install.ps1 | Invoke-Expression

# Issue Tracker: https://github.com/nanaisisi/aut_nu/issues
function Install-Nis {
    Write-InstallInfo 'Initializing...'
    # Validate install parameters
    Test-ValidateParameter
    # Check prerequisites
    Test-Prerequisite
    # Enable TLS 1.2
    Optimize-SecurityProtocol

    # Download Nis from GitHub
    Write-InstallInfo 'Downloading...'
    $downloader = Get-Downloader

    if (Test-CommandAvailable('git')) {
        $old_https = $env:HTTPS_PROXY
        $old_http = $env:HTTP_PROXY
        try {
            if ($downloader.Proxy) {
                #define env vars for git when behind a proxy
                $Env:HTTP_PROXY = $downloader.Proxy.Address
                $Env:HTTPS_PROXY = $downloader.Proxy.Address
            }
            Write-Verbose "Cloning $Nis_PACKAGE_GIT_REPO to $Nis_APP_DIR"
            git clone -q $Nis_PACKAGE_GIT_REPO $Nis_APP_DIR
            if (-Not $?) {
                throw 'Cloning failed. Falling back to downloading files.'
            }
        } catch {
            Write-Warning "$($_.Exception.Message)"
        } finally {
            $env:HTTPS_PROXY = $old_https
            $env:HTTP_PROXY = $old_http
        }
    }


    # Setup initial configuration of Nis
    Add-DefaultConfig

    Write-InstallInfo 'Nis was installed successfully!' -ForegroundColor DarkGreen
    Write-InstallInfo "Type 'Nis help' for instructions."
}

# Prepare variables
$IS_EXECUTED_FROM_IEX = ($null -eq $MyInvocation.MyCommand.Path)

# Abort when the language mode is restricted
Test-LanguageMode

# Nis root directory
$Nis_DIR = $NisDir, $env:Nis, "$env:USERPROFILE\Nis" | Where-Object { -not [String]::IsNullOrEmpty($_) } | Select-Object -First 1
## Nis cache directory
$Nis_CACHE_DIR = $NisCacheDir, $env:Nis_CACHE, "$Nis_DIR\cache" | Where-Object { -not [String]::IsNullOrEmpty($_) } | Select-Object -First 1
# Nis config file location
$Nis_CONFIG_HOME = $env:XDG_CONFIG_HOME, "$env:USERPROFILE\.config" | Select-Object -First 1
$Nis_CONFIG_FILE = "$Nis_CONFIG_HOME\Nis\config.json"


$Nis_PACKAGE_GIT_REPO = 'https://github.com/nanaisisi/aut_nu.git'

# Quit if anything goes wrong
$oldErrorActionPreference = $ErrorActionPreference
$ErrorActionPreference = 'Stop'

# Logging debug info
Write-DebugInfo $PSBoundParameters

# Nushellの自動インストール（scoop経由）
function Install-Nushell {
    if (!(Get-Command 'nu' -ErrorAction SilentlyContinue)) {
        Write-Output 'Nushellが見つかりません。自動インストールを開始します。'
        # scoopがなければインストール
        if (!(Get-Command 'scoop' -ErrorAction SilentlyContinue)) {
            Write-Output 'scoopが見つかりません。scoopをインストールします。'
            Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
            Invoke-Expression (Invoke-RestMethod 'https://get.scoop.sh')
        }
        # scoopでnushellをインストール
        scoop install nu
        Write-Output 'Nushellのインストールが完了しました。'
    } else {
        Write-Output 'Nushellは既にインストールされています。'
    }
}

# Nushellインストールを最初に実行
Install-Nushell

# Reset $ErrorActionPreference to original value
$ErrorActionPreference = $oldErrorActionPreference

scoop install aria2
scoop install git
scoop install gh
