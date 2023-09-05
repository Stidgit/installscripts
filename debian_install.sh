#!/usr/bin/env bash

# xorg
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

# Build essentials
sudo apt install -y build-essential

# Creates default folder in user dir
xdg-user-dirs-update

# Networking
sudo apt install -y network-manager

# Terminal
sudo apt install -y tmux alacritty

# File manager (Thunar)
sudo apt install -y thunar thunar-archive-plugin thunar-volman file-roller

# Volume / Audio
sudo apt install -y pulseaudio pavucontrol alsa-utils volumeicon-alsa pamixer

# Miscellaneous
sudo apt install -y neofetch firefox-esr lxappearance feh neovim btop wget keepassxc whois curl flameshot

# Virtualization
sudo apt install -y virt-manager qemu-system

# Window manager
sudo apt install -y i3-wm suckless-tools sxhkd polybar rofi unzip dunst libnotify-bin

# Install Lightdm Console Display Manager
sudo apt install -y lightdm lightdm-gtk-greeter-settings
sudo systemctl enable lightdm

# Clean
sudo apt autoremove

printf "\e[1;32mFinished Installing, You may reboot.\e[0m\n"
