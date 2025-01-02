# Enable minimal theme
if [ -f $HOME/.config/zsh/minimal.zsh ]; then
  source $HOME/.config/zsh/minimal.zsh
fi

# Include apps environments
if [[ $(uname) == "Darwin" ]]; then
  source $HOME/.config/common/darwin.sh
elif [[ $(uname) == "Linux" ]]; then
  source $HOME/.config/common/linux.sh
else
  echo 'Unknown OS!'
fi

# Include shared aliases
if [ -f $HOME/.config/common/.aliases ]; then
  source $HOME/.config/common/.aliases
fi

# Include private aliases
if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi

# Reload this config
alias rfrsh='source $HOME/.zshrc'

# Delete lines containing a certain string (ip address) in the known_hosts file.
knownrm() {
  re='^.{6,}$'
  if ! [[ $1 =~ $re ]]; then
    echo "error: line number missing" >&2
  else
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "$1"
  fi
}

# Zsh configs
# Enable history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=20000
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space

# Autocompletion using arrow keys (based on history)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^?' backward-delete-char
bindkey '^[v' describe-key-briefly
bindkey -M viins '^[[A' up-line-or-beginning-search
bindkey -M vicmd '^[[A' up-line-or-beginning-search
bindkey -M viins '^[[B' down-line-or-beginning-search
bindkey -M vicmd '^[[B' down-line-or-beginning-search
# Enable command completion
autoload -Uz compinit
compinit

# Enable vi mode
bindkey -v
