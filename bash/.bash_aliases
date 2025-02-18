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
alias rfrsh='source $HOME/.bashrc'

# Enable partial command completion with arrow keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
