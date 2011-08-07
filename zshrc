if [[ -f "${HOME}/.zprivate" ]]; then
  source "${HOME}/.zprivate"
fi

export EDITOR=vim

if [[ -eq $(uname) "Darwin" ]]; then
  export PATH=/usr/local/bin:$PATH
fi

bindkey -e

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# ls colors
autoload colors; colors;
# BSD
export LSCOLORS="Gxfxcxdxbxegedabagacad"
# Linux
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

# Enable ls colors
# Find the option for using colors in ls, depending on the version: Linux or BSD
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Load and run compinit
autoload -U compinit
compinit -i


export PATH=~/.rbenv/shims:~/.rbenv/bin:~/bin:$PATH
source $ZSH/init.sh

