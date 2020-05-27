#!/bin/bash

# Install Packages
sudo apt install $(cat packages.list)

# Change shell to zsh
chsh -s /usr/bin/zsh

# Only allow alt+tab in current workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Unbind keys
gsettings set org.gnome.shell.keybindings switch-to-application-1 []
gsettings set org.gnome.shell.keybindings switch-to-application-2 []
gsettings set org.gnome.shell.keybindings switch-to-application-3 []
gsettings set org.gnome.shell.keybindings switch-to-application-4 []
gsettings set org.gnome.shell.keybindings switch-to-application-5 []
gsettings set org.gnome.shell.keybindings switch-to-application-6 []
gsettings set org.gnome.shell.keybindings switch-to-application-7 []
gsettings set org.gnome.shell.keybindings switch-to-application-8 []
gsettings set org.gnome.shell.keybindings switch-to-application-9 []

gsettings set org.gnome.settings-daemon.plugins.media-keys home []
gsettings set org.freedesktop.ibus.general.hotkey triggers []
gsettings set org.gnome.desktop.wm.keybindings switch-input-source []
gsettings set org.gnome.mutter overlay-key []

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up []
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down []

# Custom keybindings

## Window management

### Tiling

gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Shift><Super>l']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Shift><Super>h']"

### Workspace

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>exclam']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>at']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>numbersign']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>dollar']"

gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Shift><Super>l']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Shift><Super>h']"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Shift><Super>x']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Shift><Super>c']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Shift><Super>q']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['<Super>bracketleft']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['<Super>bracketright']"
gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Shift><Super>Return']"

# Set default Terminal
gsettings set org.gnome.desktop.default-applications.terminal exec 'tilix'

# Set key repeat
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
