if [[ -f "${HOME}/.zprivate" ]]; then
  source "${HOME}/.zprivate"
fi

export EDITOR=vim
bindkey -e

fpath=(~/.zfunc $fpath)

setopt no_beep      # For the love of god make it stop
setopt correct_all
setopt auto_cd
setopt cdable_vars  # Expand expression with ~ if ambiguous
setopt multios      # multiple redirections
setopt pushd_ignore_dups # Ignore duplicates on the directory stack (duh)

# Load and run compinit
autoload -U compinit
compinit -i

autoload -U colors
colors

for f in $HOME/.zsh/??_*; do
  source $f
done
