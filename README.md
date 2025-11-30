# dotfiles
```
stow -v -t $HOME */
```

To overwrite existing files

```
stow -v -t $HOME --adopt */
git checkout .
```

## Linux `/etc` configs
with `sudo`

```
cd etc
stow -v -t /etc */
```

## Mac configs in `Library/Application Support`

Pypoetry won't work with symbolic link
```sh
cp pypoetry/.config/pypoetry/config.toml $HOME/Library/Application\ Support/pypoetry/config.toml
```

VSCodium
```sh
ln -s ../../../../dotfiles/VSCodium/.config/VSCodium/User/settings.json $HOME/Library/Application\ Support/VSCodium/User/settings.json
ln -s ../../../../dotfiles/VSCodium/.config/VSCodium/User/keybindings.json $HOME/Library/Application\ Support/VSCodium/User/keybindings.json
```