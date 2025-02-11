# ----------
# STARTUP SCRIPTS
# ----------

# user local bins
if [ -d $HOME/.local/bin ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# HomeBrew
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Poetry
if [ -f $HOME/.local/bin/poetry ]; then
  export POETRY_CONFIG_DIR="$HOME/.config/pypoetry"
fi

# Pyenv
if [ -f $HOMEBREW_PREFIX/bin/pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi

# ruby-install
if [ -f $HOMEBREW_PREFIX/bin/ruby-install ]; then
  source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
  source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh
fi

# Node Version Manager
if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"                                       # This loads nvm
  [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi

# ----------
# SHORTCUTS
# ----------

# Flush macos dns
alias dnsrf='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
