export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=robbyrussell
source $ZSH/oh-my-zsh.sh

plugins=(git brew)

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f $HOME/.aliases ]
then
  source $HOME/.aliases
fi

# Git aliases
alias gs='git status'
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