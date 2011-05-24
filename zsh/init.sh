# Initializes Zshhh

# add a function path
fpath=($ZSH/functions $fpath)

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Add all defined plugins to fpath
plugin=${plugin:=()}
for plugin ($plugins) fpath=($ZSH/plugins/$plugin $fpath)

# Load and run compinit
autoload -U compinit
compinit -i

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done

# Load the theme
source "$ZSH/themes/$ZSH_THEME.zsh-theme"
