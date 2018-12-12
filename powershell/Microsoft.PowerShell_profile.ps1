### Chocolatey ###
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

### PoSh git ###
$poshGitPath = "C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1"
if (Test-Path $poshGitPath) {
  Import-Module $poshGitPath
}

### Docker ###
Import-Module DockerCompletion -ErrorAction Continue

function Remove-StoppedContainers {
  docker container rm $(docker container ls -q)
}

function Remove-AllContainers {
  docker container rm -f $(docker container ls -aq)
}

function Get-ContainerIPAddress {
  param (
    [string] $id
  )
  & docker inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' $id
}

function Add-ContainerIpToHosts {
  param (
    [string] $name
  )
  $ip = docker inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' $name
  $newEntry = "$ip  $name  #added by d2h# `r`n"
  $path = 'C:\Windows\System32\drivers\etc\hosts'
  $newEntry + (Get-Content $path -Raw) | Set-Content $path
}

function Start-ElevatedProcess {
  $file, [string]$arguments = $args;
  $psi = new-object System.Diagnostics.ProcessStartInfo $file;
  $psi.Arguments = $arguments;
  $psi.Verb = "runas";
  $psi.WorkingDirectory = get-location;
  [System.Diagnostics.Process]::Start($psi);
}


# kudos https://gist.github.com/haf/1313318
function Get-ChildItemColor {
  <#
  .Synopsis
    Returns childitems with colors by type.
    From http://poshcode.org/?show=878
  .Description
    This function wraps Get-ChildItem and tries to output the results
    color-coded by type
  .ReturnValue
    All objects returned by Get-ChildItem are passed down the pipeline
    unmodified.
  .Notes
    NAME:      Get-ChildItemColor
    AUTHOR:    Tojo2000 <tojo2000@tojo2000.com>
  #>
  $regex_opts = ([System.Text.RegularExpressions.RegexOptions]::IgnoreCase `
      -bor [System.Text.RegularExpressions.RegexOptions]::Compiled)
  
  $fore = $Host.UI.RawUI.ForegroundColor
  $compressed = New-Object System.Text.RegularExpressions.Regex(
    '\.(zip|tar|gz|rar|7z)$', $regex_opts)
  $executable = New-Object System.Text.RegularExpressions.Regex(
    '\.(exe|bat|cmd|py|pl|ps1|psm1|vbs|rb|reg|fsx|sh)$', $regex_opts)
  $dll_pdb = New-Object System.Text.RegularExpressions.Regex(
    '\.(dll|pdb)$', $regex_opts)
  $configs = New-Object System.Text.RegularExpressions.Regex(
    '\.(config|conf|ini)$', $regex_opts)
  $text_files = New-Object System.Text.RegularExpressions.Regex(
    '\.(txt|cfg|conf|ini|csv|log)$', $regex_opts)
  
  Invoke-Expression ("Get-ChildItem $args") |
    ForEach-Object {
    $c = $fore
    if ($_.GetType().Name -eq 'DirectoryInfo') {
      $c = 'DarkCyan'
    }
    elseif ($compressed.IsMatch($_.Name)) {
      $c = 'Yellow'
    }
    elseif ($executable.IsMatch($_.Name)) {
      $c = 'Green'
    }
    elseif ($text_files.IsMatch($_.Name)) {
      $c = 'Cyan'
    }
    elseif ($dll_pdb.IsMatch($_.Name)) {
      $c = 'DarkGreen'
    }
    elseif ($configs.IsMatch($_.Name)) {
      $c = 'Yellow'
    }
    $Host.UI.RawUI.ForegroundColor = $c
    Write-Output $_
    $Host.UI.RawUI.ForegroundColor = $fore
  }
}

### various aliases ###
Set-Alias -Name sudo -Value Start-ElevatedProcess
Set-Alias -Name c -Value code  
Set-Alias -Name l -Value Get-ChildItemColor
