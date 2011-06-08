export PATH=~/bin:$PATH

if [[ -f "${HOME}/.zprivate" ]]; then
  source "${HOME}/.zprivate"
fi

# If GPG-Agent has started, load it
if [[ -f "${HOME}/.gpg-agent-info" ]]; then
  export $(cat "${HOME}/.gpg-agent-info")
fi

export EDITOR=vim
export ZSH_THEME="wsc"

case $(uname) in
  (Darwin)
    export PATH=/usr/local/Cellar/ruby/1.9.2-p180/bin:/usr/local/bin:$PATH
    plugins=(git github gem osx brew vagrant bundler rails3)
    ;;
  (Linux)
    plugins=(git github gem command-not-found bundler rails3)
    ;;
esac

export ZSH=$HOME/.zsh
source $ZSH/init.sh
