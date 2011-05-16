export PATH=~/bin:$PATH

# Jesus Christ this is annoying
export DISABLE_AUTO_UPDATE=true

if [[ -f "${HOME}/.zprivate" ]]; then
  source "${HOME}/.zprivate"
fi

# If GPG-Agent has started, load it
if [[ -f "${HOME}/.gpg-agent-info" ]]; then
  export $(cat "${HOME}/.gpg-agent-info")
fi

# Our editor is vim, but use emacs keybindings in zsh
export EDITOR=vim
bindkey -e

# Oh my Zsh!
export ZSH=$HOME/.oh-my-zsh

case $(uname) in
  (Darwin)
    export PATH=/usr/local/Cellar/ruby/1.9.2-p180/bin:/usr/local/bin:$PATH
    plugins=(git github gem osx brew vagrant bundler rails3)
    export ZSH_THEME="wsc-mac"
    ;;
  (Linux)
    plugins=(git github gem command-not-found bundler rails3)
    export ZSH_THEME="wsc-linux"
    ;;
esac

source $ZSH/oh-my-zsh.sh
