# dotfiles
```
stow -v -t $HOME */
```

To overwrite existing files

```
stow -v -t $HOME --adopt */
git checkout .
```

## Linux configs
with `sudo`

```
cd etc
stow -v -t /etc */
```

## Mac configs

```
ln -s ../../../../dotfiles/VSCodium/.config/VSCodium/User/settings.json $HOME/Library/Application\ Support/VSCodium/User/settings.json
ln -s ../../../../dotfiles/VSCodium/.config/VSCodium/User/keybindings.json $HOME/Library/Application\ Support/VSCodium/User/keybindings.json
```