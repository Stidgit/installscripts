#!/bin/sh
# Quick Install script for Void Linux
set -e

# Ensure root
if [ "$(id -u)" -ne 0 ]; then
  echo "\e[32mPlease run as root\e[0m"
  exit 1
fi

# Update package repositories and upgrade existing packages
xbps-install -Suv
xbps-install -u xbps

# Restarting services after update
xbps-install -y xtools

# xorg
xbps-install -y xorg

# Install i3 window manager and other essential tools
xbps-install -y i3-gaps i3status picom nitrogen lxappearance feh rofi

# Install terminal
xbps-install -y alacritty
#xbps-install -y kitty

# Audio
xbps-install -y pulseaudio pavucontrol

# Enable dbus-service
ln -sf /etc/sv/dbus /var/service

# Non-free repos
xbps-install -y void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree

# Useful stuff
xbps-install -y flameshot neovim btop firefox wget curl keepassxc neofetch mpv
# NerdFonts - ~4gb
sudo xbps-install nerd-fonts
# sudo xbps-install -Sy vpm

# Programming
xbps-install -y python3-pip python3 gdb gcc glibc-devel nasm ltrace strace go android-tools
xbps-install -y vscode # telemetry free version

# Network manager
xbps-install -y NetworkManager
ln -s /etc/sv/NetworkManager /var/service/

# Virtualization
xbps-install -y virt-manager qemu libvirtd
xbps-install bridge-utils iptables

ln -s /etc/sv/libvirtd /var/service
ln -s /etc/sv/virtlockd /var/service
ln -s /etc/sv/virtlogd /var/service
xcheckrestart

# Install LightDM and the GTK greeter
xbps-install -y lightdm lightdm-gtk3-greeter
ln -s /etc/sv/lightdm /var/service/

echo "You can manually reboot your system when you're ready, eg. sudo reboot"

