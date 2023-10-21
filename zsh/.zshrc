
# Enable minimal theme
if [ -f $HOME/.config/zsh/minimal.zsh ]
then
  source $HOME/.config/zsh/minimal.zsh
fi

# Include private aliases
if [ -f $HOME/.aliases ]
then
  source $HOME/.aliases
fi

# Enable history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Autocompletion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[v' describe-key-briefly

# Shell aliases
alias la='ls -lah'

# Git aliases
alias gs='git status'
alias gc='git clone'
alias ga='git add'
alias gps='git push'
alias gpl='git pull'
alias gcmsg='git commit -m'
alias gcane='git commit --amend --no-edit'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# Delete lines containing a certain string (ip address) in the known_hosts file.
knownrm() {
 re='^.{6,}$'
 if ! [[ $1 =~ $re ]] ; then
   echo "error: line number missing" >&2;
 else
   sed -i '' "/$1/d" $HOME/.ssh/known_hosts
 fi
}
# Remove all .DS_Store
alias dstrm='find . -name ".DS_Store" -print -delete'
# Reload this config
alias rfrsh='source $HOME/.zshrc'
