#!/bin/bash

# Install Packages
sudo apt update
sudo apt install -y $(cat apt-packages.list)
flatpak install -y $(cat flatpak-packages.list)

# Change shell to zsh
chsh -s /usr/bin/zsh

# Only allow alt+tab in current workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Set default Terminal
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'

# Set key repeat
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 250

# Add user to Docker group
sudo usermod -a -G docker $USER

# Setup keybindings
./set-keybindings.sh

# Add terminator symlink
mkdir -p $HOME/.config/terminator
rm $HOME/.config/terminator/config
ln -nfs $HOME/.dotfiles/terminator-config $HOME/.config/terminator/config
