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
