$ErrorActionPreference = 'Stop'

if (-Not (Get-Command choco -ErrorAction SilentlyContinue)) {
  Set-ExecutionPolicy Bypass -Scope Process -Force;
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Import-Module (Join-Path $env:ChocolateyInstall "helpers\chocolateyProfile.psm1")

function ipkg($pkgid) {
  choco install -y -r --no-progress $pkgid
}

ipkg boxstarter
ipkg 7zip
ipkg git
ipkg svn
ipkg meld
ipkg vscode
ipkg notepadplusplus

ipkg ChocolateyGUI
ipkg virtualbox
ipkg vagrant

ipkg keepassxc
ipkg clementine
ipkg gimp
ipkg rawtherapee
ipkg nomacs
ipkg vlc
ipkg greenshot
ipkg GoogleChrome
ipkg gpg4win

ipkg make
ipkg maven
ipkg pandoc
ipkg pester
ipkg psake
ipkg rustup.install
