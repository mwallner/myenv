#!/bin/bash

sudo pacman -Syy
sudo pacman --noconfirm -S yaourt

yaourt -Syy

yaIn() {
  yaourt --noconfirm -S $1
}

yaIn hunspell-de
yaIn google-chrome
yaIn vlc
yaIn virtualbox
yaIn vagrant
yaIn git
yaIn vim
yaIn code
yaIn qtcreator
yaIn meld

yaIn sbt
yaIn maven
yaIn scala211
yaIn go
yaIn jdk8-openjdk
yaIn jre8-openjdk
yaIn kotlin
yaIn python
yaIn python-pip

yaIn aftershotpro3
yaIn hugin
yaIn shotwell
yaIn gimp
yaIn displaycal
yaIn synergy
yaIn clementine

