# If GPG-Agent has started, load it
if [[ -f "${HOME}/.gpg-agent-info" ]]; then
  export $(cat "${HOME}/.gpg-agent-info")
fi

# Load either systemwide or local RVM
if [[ -f "/usr/local/rvm/scripts/rvm" ]]; then
  source "/usr/local/rvm/scripts/rvm"
elif [[ -f "${HOME}/.rvm/scripts/rvm" ]]; then
  source "${HOME}/.rvm/scripts/rvm"
fi

# Our editor is vim, but use emacs keybindings in zsh
export EDITOR=vim
bindkey -e

# Oh my Zsh!
export ZSH=$HOME/.oh-my-zsh

case $(uname) in
  (Darwin) 
    plugins=(git github gem osx brew)
    export ZSH_THEME="wsc-mac"
    ;;
  (Linux)
    plugins=(git github gem command-not-found)
    export ZSH_THEME="wsc-linux"
    ;;
esac

source $ZSH/oh-my-zsh.sh
