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

### various aliases ###
Set-Alias -Name sudo -Value Start-ElevatedProcess
Set-Alias -Name c -Value code  

