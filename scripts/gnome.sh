# Set fonts
gsettings set org.gnome.desktop.interface font-name 'JetBrainsMono Nerd Font 13'
gsettings set org.gnome.desktop.interface document-font-name 'JetBrainsMono Nerd Font 13'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 13'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'JetBrainsMono Nerd Font 13'
# Set theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
# Set top bar
gsettings set org.gnome.desktop.interface clock-show-weekday 'true'
# Set title bar
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'
# Set keyboard
gsettings set org.gnome.desktop.input-sources xkb-options "['terminate:ctrl_alt_bksp', 'ctrl:swap_lalt_lctl']"
# Set windows switching
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab', '<Super>Tab']"
gsettings set org.gnome.shell.window-switcher current-workspace-only 'false'
# Enable battery percentage on top bar
gsettings set org.gnome.desktop.interface show-battery-percentage 'true'