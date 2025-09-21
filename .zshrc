# Created by newuser for 5.9
# Default Settings export ZSH="$HOME/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh
export ZSH="$HOME/.oh-my-zsh"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ENABLE_CORRECTION="true"
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"

# ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting)

# Export section
# export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:~/.local/kitty.app/bin"
export PATH="$PATH:~/.dotnet/"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#ls settings
eval "$(dircolors -b $HOME/.dircolors)"
alias la="ls -a"
alias ls="ls --color=auto"
alias ll="ls -l"

#rm settings
alias rm="rm -I"

# Alias Section
alias music="TERM=xterm-256color musikcube"
alias bakhtiar="cd $HOME/BAKHTIAR/source-code/"
alias q="exit"
alias x="clear"
alias ss="flameshot"
alias update="sudo apt update && sudo apt upgrade"

alias shutdown="systemctl poweroff"
alias reboot="systemctl reboot"
alias logout="i3-msg exit"

# Promp

# normal="%{\e[0m%}"                   # Reset
# white="%{\e[1;37m%}"                 # white bold
# clock="%{\e[38;2;205;215;155m%}"     # RGB 205,215,155
# path="%{\e[38;2;230;180;90m%}"
# git="%{\e[38;2;90;230;195m%}"

normal="%f%k"                     # reset warna
white="%F{white}"                 # putih
clock="%F{#cdd79b}"               # RGB 205,215,155
dir="%F{#e6b45a}"                # RGB 230,180,90
git="%F{#5ae6c3}"                 # RGB 90,230,195
user="%F{#5E9B2E}"

function get_git_branch() {
  if [ -d ".git" ]; then
    git branch --show-current 2>/dev/null
  else
    echo ""
  fi
}

setopt PROMPT_SUBST
PS1="${white}┌[ ${clock}󰥔 %T ${white}][${user}  %n ${white}][ ${dir}  %~ ${white}][ ${git} \$(get_git_branch) ${white}]
└>${normal} "

# Custom Function

function start { sudo systemctl start $1 }
function status { sudo systemctl status $1 }
function stop { sudo systemctl stop $1 }
function restart { sudo systemctl restart $1 }
function enable { sudo systemctl enable $1 }
function disable { sudo systemctl disable $1 }
