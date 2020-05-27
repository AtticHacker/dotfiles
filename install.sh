#!/bin/bash

# Install Packages
sudo apt install $(cat packages.list)

# Change shell to zsh
chsh -s /usr/bin/zsh

# Only allow alt+tab in current workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true


# Set default Terminal
gsettings set org.gnome.desktop.default-applications.terminal exec 'tilix'

# Set key repeat
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 250

# Setup keybindings
./set-keybindings.sh
