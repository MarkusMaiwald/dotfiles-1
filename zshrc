if [[ -f "${HOME}/.gpg-agent-info" ]]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
fi

source /usr/local/rvm/scripts/rvm
export EDITOR=vim
bindkey -e
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="nanotech"
plugins=(git command-not-found github gem)
source $ZSH/oh-my-zsh.sh
