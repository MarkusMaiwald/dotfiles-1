setopt prompt_subst

function prompt-os() {
  case $(uname) in
    (Darwin)
      echo $ZSH_THEME_OS_DARWIN;
      ;;
    (Linux)
      echo $ZSH_THEME_OS_LINUX;
      ;;
  esac
}

function prompt-vagrant() {
  if [[ -f ".vagrant" ]]; then
    echo $ZSH_THEME_VAGRANT;
  fi
}

function prompt-git() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    echo "$(prompt-git-branch)$(prompt-git-dirty)$(prompt-git-tracking)"
  fi
}

function prompt-git-branch() {
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(git-current-branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function prompt-git-dirty() {
  if [[ -n $(git status -s 2> /dev/null) ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

function prompt-git-tracking() {
  git rev-parse @{upstream} > /dev/null 2>&1 || (echo $ZSH_THEME_GIT_NO_TRACK && return)
  behind=$(git-commits-behind)
  ahead=$(git-commits-ahead)
  if [[ $behind -gt 0 && $ahead -gt 0 ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIVERGED"
  elif [[ $behind -gt 0 ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_BEHIND"
  elif [[ $ahead -gt 0 ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_AHEAD"
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

PROMPT='%F{green}%2c%F{blue} $(prompt-os)[%f '
RPROMPT='$(prompt-git) %F{blue}$(prompt-vagrant)] %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'
