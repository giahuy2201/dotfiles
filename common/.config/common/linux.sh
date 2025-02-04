# ----------
# STARTUP SCRIPTS
# ----------

# user local bins
if [ -d $HOME/.local/bin ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Cargo
if [ -d $HOME/.cargo ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# acme.sh
if [ -d $HOME/.acme.sh ]; then
  . "$HOME/.acme.sh/acme.sh.env"
fi

# Poetry
if [ -f $HOME/.local/bin/poetry ]; then
  export POETRY_CONFIG_DIR="$HOME/.config/pypoetry"
fi

# Pyenv
if [ -f $HOME/.pyenv/bin/pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi

# Node Version Manager
if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# ----------
# SHORTCUTS
# ----------

# Own folder recursively
fownr() {
  if [[ $# -eq 0 ]]; then
    echo "Directory argument missing!"
  else
    sudo chown -R $USER:$USER $1
  fi
}

# Mount NFS shares with noauto in fstab
mnt() {
  if [[ $# -eq 0 ]]; then
    echo "Share argument missing!"
  else
    sudo mount /mnt/$1
  fi
}

# Unmount all 
umnt() {
  sudo umount /mnt/*
}