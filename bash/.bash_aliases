alias la='ls -la'

if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

# Reload this config
alias rfrsh='source $HOME/.bashrc'