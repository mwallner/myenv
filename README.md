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
