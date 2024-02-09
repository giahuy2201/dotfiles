# HomeBrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Poetry
export PATH="$HOME/.local/share/pypoetry/bin:$PATH"
export POETRY_CONFIG_DIR="$HOME/.config/pypoetry"
# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
