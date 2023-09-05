#!/usr/bin/env bash

# xorg
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

sudo apt install -y build-essential

# Creates default folder in user dir
xdg-user-dirs-update


# Networking
# sudo apt install -y network-manager

# Terminal
sudo apt install -y tmux alacritty

# File manager (Thunar)
sudo apt install -y thunar thunar-archive-plugin thunar-volman file-roller

# Volume / Audio
sudo apt install -y pulseaudio pavucontrol alsa-utils volumeicon-alsa pamixer

# Miscellaneous
sudo apt install -y neofetch firefox-esr lxappearance feh nvim btop wget discord spotify lutris steam keepassxc whois curl flameshot vscodium obsidian

# Virtualization
sudo apt install -y virt-manager qemu
