# dotfiles
```
stow -v -t $HOME */
```

To overwrite existing files

```
stow -v -t $HOME --adopt */
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
```