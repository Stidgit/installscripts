#!/bin/sh

# Quick Install script for Void Linux
# Ensure root
if [ "$(id -u)" -ne 0 ]; then
  echo "\e[32mPlease run as root\e[0m"
  exit 1
fi

# Update package repositories and upgrade existing packages
sudo xbps-install -Suv
sudo xbps-install -u xbps

# xorg
sudo xbps-install -y xorg

# Install i3 window manager and other essential tools
sudo xbps-install -y i3-gaps i3status picom nitrogen lxappearance feh rofi

# Install terminal
sudo xbps-install -y alacritty

# Install LightDM and the GTK greeter
sudo xbps-install -y lightdm lightdm-gtk3-greeter
sudo ln -s /etc/sv/lightdm /var/service/

# Add your user to the video group for graphics acceleration (replace 'yourusername' with your actual username)
sudo usermod -aG video "$USER"

# Useful stuff
sudo xbps-install -y flameshot neovim btop firefox wget curl keepassxc
# sudo xbps-install -Sy vpm void-repo-nonfree

# Network manager
xbps-install -y NetworkManager
ln -s /etc/sv/NetworkManager /var/service/

# Virtualization
sudo xbps-install -y virt-manager qemu

# Reboot to start LightDM
echo "Installation complete. Rebooting in 5 seconds..."
sleep 5
sudo reboot

