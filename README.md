# myenv
stuff I need to feel cozy on my boxes

## setup Linux shell env

checkout "myenv" to homedir:
```
cd ~
git clone https://github.com/mwallner/myenv.git
```

create required links
```
cd ~
mv .bashrc .bashrc_bk
ln -s myenv/bash/.* .
```

## dot-source PowerShell profile in Windows
```
code $profile
```
add the following content to the file
```
$myenv = Join-Path ~ "\myenv\powershell\Microsoft.PowerShell_profile.ps1"
if (Test-Path $myenv) {
  . $myenv
}
```