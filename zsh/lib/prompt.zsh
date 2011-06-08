setopt prompt_subst

function zsh-prompt-os() {
  case $(uname) in
    (Darwin)
      echo $ZSH_THEME_OS_DARWIN;
      ;;
    (Linux)
      echo $ZSH_THEME_OS_LINUX;
      ;;
  esac
}

function zsh-prompt-vagrant() {
  if [[ -f ".vagrant" ]]; then
    echo $ZSH_THEME_VAGRANT;
  fi

}

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✶%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_AHEAD=" %F{green}→%f"
ZSH_THEME_GIT_PROMPT_BEHIND=" %F{red}←%f"
ZSH_THEME_GIT_PROMPT_DIVERGED=" %F{yellow}⇆%f"
ZSH_THEME_GIT_NO_TRACK=" %F{red}⚡%f"
ZSH_THEME_VAGRANT="❒ "
ZSH_THEME_OS_DARWIN=" "
ZSH_THEME_OS_LINUX="ℓ "

PROMPT='%F{green}%2c%F{blue} $(zsh-prompt-os)[%f '
RPROMPT='$(git-prompt-info)$(git-prompt-tracking) %F{blue}$(zsh-prompt-vagrant)] %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'

