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

setopt PROMPT_SUBST
PS1="${white}┌[ ${clock}󰥔 %T ${white}][${user}  Hello World ${white}][ ${dir}  %1d ${white}][ ${git} \$(get_git_branch) ${white}]
└>${normal} "
