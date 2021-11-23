#!/bin/bash

sudo pacman -Syy
sudo pacman --noconfirm -S yay

sudo pacman -S snapd
sudo systemctl enable --now snapd.socket

yay -Syy

yaIn() {
  yay --noconfirm -S $1
}

snapIn() {
  sudo snap install $1 
}

snapInC() {
  sudo snap install --classic $1
}

yaIn hunspell-de
yaIn google-chrome
yaIn vlc
yaIn virtualbox
yaIn vagrant
yaIn rdesktop

yaIn git
yaIn vim

yaIn aftershotpro3
yaIn hugin
yaIn shotwell
yaIn gimp
yaIn displaycal
yaIn synergy
yaIn clementine
yaIn kdenlive

snapInC powershell
snapInC code
snapIn discord
snapIn hugo
snapIn signal-desktop

