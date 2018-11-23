MW_SCRIPT_DIR="~/scripts"

# =)
alias suso="sudo"
alias _="sudo"

#dockinstation-xrandrs
#alias dock_screen_laptop_only="xrandr --output LVDS-0 --auto --output DP-1 --off --output DP-2 --off"
#alias dock_screen_right="xrandr --output LVDS-0 --off --output DP-1 --off --output DP-2 --auto"
#alias dock_screen_left="xrandr --output LVDS-0 --off --output DP-1 --auto --output DP-2 --off"
#alias dock_screen_dual="dock_screen_left && xrandr --output LVDS-0 --off --output DP-2 --auto --output DP-1 --auto --left-of DP-2"

# mobile devices
alias openmoko_init="$MW_SCRIPT_DIR/openmoko/openmoko_init.sh"

alias ls="ls --color"
alias ll="ls -laFh"
alias l="ls -lh"
alias dump="pygmentize -g"


#alias powershell="/opt/powershell/powershell"
alias powershell="pwsh"
alias New-PowerShell="konsole --profile PowerShell -e /opt/powershell/powershell"
alias c="code"


#pacman cmds
alias system_upgrade="sudo pacman -Syyu"
alias system_upgrade_full="yaourt -Syyu"

