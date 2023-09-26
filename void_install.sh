#!/bin/sh
set -e
# Quick Install script for Void Linux
# Ensure root
if [ "$(id -u)" -ne 0 ]; then
  echo "\e[32mPlease run as root\e[0m"
  exit 1
fi

# Update package repositories and upgrade existing packages
xbps-install -Suv
xbps-install -u xbps

# Restarting services after update
xbps-install xtools
xcheckrestart

# xorg
xbps-install -y xorg

# Install i3 window manager and other essential tools
xbps-install -y i3-gaps i3status picom nitrogen lxappearance feh rofi

# Install terminal
xbps-install -y alacritty

# Audio
xbps-install pulseaudio pavucontrol

# Enable dbus-service
ln -sf /etc/sv/dbus /var/service

# Non-free repos
xbps-install void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree

# Useful stuff
xbps-install -y flameshot neovim btop firefox wget curl keepassxc neofetch mpv
# sudo xbps-install -Sy vpm

# Network manager
xbps-install -y NetworkManager
ln -s /etc/sv/NetworkManager /var/service/

# Virtualization
xbps-install -y virt-manager qemu libvirtd
xbps-install bridge-utils iptables

ln -s /etc/sv/libvirtd /var/service
ln -s /etc/sv/virtlockd /var/service
ln -s /etc/sv/virtlogd /var/service

# Install LightDM and the GTK greeter
xbps-install -y lightdm lightdm-gtk3-greeter
ln -s /etc/sv/lightdm /var/service/

# Finished
echo "You can manually reboot your system when you're ready, eg. sudo reboot"

