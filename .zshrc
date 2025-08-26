# Created by newuser for 5.9
# Default Settings
export ZSH="$HOME/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ENABLE_CORRECTION="true"

# ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting)

# Export section
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:~/.local/kitty.app/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Alias Section
alias music="TERM=xterm-256color musikcube"
alias bakhtiar="cd $HOME/\[BAKHTIAR\]/source-code/"
alias q="exit"
alias x="clear"
alias la="ls -a"
alias ss="$HOME/\[BAKHTIAR\]/Apps/portable/flameshot"
alias obs="flatpak run  com.obsproject.Studio"
alias update="sudo apt update && sudo apt upgrade"

# Promp

# $normal = "\e[0m"                   # Reset
# $white = "\e[1;37m"                 # white bold
# $clock = "\e[38;2;205;215;155m"     # RGB 205,215,155
# $path = "\e[38;2;230;180;90m"
# $git = "\e[38;2;90;230;195m"

# function Get-GitBranch {
#   if (Test-Path ".git") {
#     git branch --show-current 2>$null
#   } else {
#     return "!git"
#   }
# } 

PROMPT="%F{#dffffe}┌[ %F{#fc5e19}%B%D|%t%F{white} - %F{#fefe27}%2~ %F{white}- %F{#383743}%j%F{#dffffe}]
%F{#dffffe}└> " 

# Custom Function

function start { sudo systemctl start $1 }
function status { sudo systemctl status $1 }
function stop { sudo systemctl stop $1 }
function restart { sudo systemctl restart $1 }
function enable { sudo systemctl enable $1 }
function disable { sudo systemctl disable $1 }
