# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export BEMENU_BACKEND=wayland

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f $HOME/.aliases ]
then
  source $HOME/.aliases
fi

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
   sed -i '' "/$1/d" ~/.ssh/known_hosts
 fi
}
