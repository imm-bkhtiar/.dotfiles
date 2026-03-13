
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

# Export section
# export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/usr/sbin"
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
# alias music="TERM=xterm-256color musikcube"
alias mpv="mpv --profile=fast --hwdec=vaapi"
alias codir="cd $HOME/BAKHTIAR/source-code/ && cd $1"
alias app="cd $HOME/BAKHTIAR/Apps/portable/"
alias update="sudo apt update && sudo apt upgrade"
alias shutdown="systemctl poweroff"
alias reboot="systemctl reboot"
alias logout="i3-msg exit"
alias scrcpy="scrcpy --video-encoder=OMX.google.h264.encoder"

# Promp

# normal="%{\e[0m%}"                   # Reset
# white="%{\e[1;37m%}"                 # white bold
# clock="%{\e[38;2;205;215;155m%}"     # RGB 205,215,155
# path="%{\e[38;2;230;180;90m%}"
# git="%{\e[38;2;90;230;195m%}"

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
# PS1="${white}┌[${user}  \$(is_root) ${white}][ ${dir}  %2~/ ${white}][ ${git} \$(get_git_branch) ${white}]
# └>${normal} "

# Custom Function

function start { sudo systemctl start $1 }
function status { sudo systemctl status $1 }
function stop { sudo systemctl stop $1 }
function restart { sudo systemctl restart $1 }
function enable { sudo systemctl enable $1 }
function disable { sudo systemctl disable $1 }
function ustart { systemctl --user start $1 }
function ustatus { systemctl --user status $1 }
function ustop { systemctl --user stop $1 }
function urestart { systemctl --user restart $1 }
function uenable { systemctl --user enable $1 }
function udisable { systemctl --user disable $1 }

function record() {
  $HOME/Videos/record.sh
}

function coding() {
  coding_dir="$HOME/BAKHTIAR/source-code/"
  coding_selected_raw=$(find "$coding_dir" -maxdepth 1 -mindepth 1 -type d | fzf --height 40% --reverse --print-query)

  query=$(echo "$coding_selected_raw" | sed -n '1p')
  selected=$(echo "$coding_selected_raw" | sed -n '2p')  

  
  if [[ -d "$selected" && -n "$selected" ]]; then
    tmux new-session -A -c "$selected" "nvim ."
  elif [[ "$query" != "" ]]; then
    mkdir "$coding_dir/$query" && tmux new-session -A -c "$selected" \; send-keys "nvim ." C-m 
  else
    cd "$coding_dir"
  fi
}

function ytd() {
  yt-dlp -S res:720,ext:mp4 $1 --cookies-from-browser chromium:$HOME/.local/share/qutebrowser --js-runtime node -o "$HOME/Videos/Youtube/%(title)s.%(ext)s"
}
