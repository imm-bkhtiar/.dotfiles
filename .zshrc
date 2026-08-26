# Created by newuser for 5.9
# Default Settings export ZSH="$HOME/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh
export ZSH="$HOME/.oh-my-zsh"
ENABLE_CORRECTION="true"
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"

# ZSH_THEME="robbyrussell"

# ZSH Plugins
plugins=(
  git
  zsh-syntax-highlighting
  # emoji
  # qrcode
  # zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

unsetopt correct
unsetopt correct_all

# bun completions
[ -s "/home/immbkhtiar/.bun/_bun" ] && source "/home/immbkhtiar/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/kitty.app/bin"
export PATH="$PATH:$HOME/.local/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.dotnet/"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PKG_CONFIG_PATH=":/usr/lib/x86_64-linux-gnu/pkgconfig"

#ls settings
eval "$(dircolors -b $HOME/.dircolors)"
alias la="ls -hla"
alias ls="ls --color=auto"
alias ll="ls -shl"

# Alias Section
alias codir="cd $HOME/BAKHTIAR/source-code/ && cd $1"
alias app="cd $HOME/BAKHTIAR/Apps/portable/"
alias update="sudo apt update && sudo apt upgrade"
alias shutdown="systemctl poweroff"
alias reboot="systemctl reboot"
alias logout="i3-msg exit"
alias scrcpy="scrcpy --video-encoder=OMX.google.h264.encoder"

normal="%f%k"                     # reset warna
white="%F{white}"                 # putih
clock="%F{#475055}"               # RGB 205,215,155
dir="%F{#E9AD6B}"                # RGB 230,180,90
git="%F{#4D758E}"                 # RGB 90,230,195
user="%F{#424334}"

function get_git_branch() {
  if [ -d ".git" ]; then
    git branch --show-current 2>/dev/null
  else
    echo ""
  fi
}

function is_root(){
  if [[ $EUID == 0 ]]; then
    echo "root"
  else
    echo "user"
  fi
}

setopt PROMPT_SUBST
PS1="${user}  \$(is_root) ${white}:: ${dir}  %2~/ ${white}:: ${git} \$(get_git_branch) ${normal}> "

# Custom Function
source $HOME/.dotfiles/personal/zsh/custom-script.sh

