#!/bin/sh

# Ensure root
if [ "$(id -u)" -ne 0 ]; then
  echo "\e[32mPlease run as root\e[0m"
  exit 1
fi

# Update package repositories and upgrade existing packages
sudo xbps-install -Suv

# Install i3 window manager and other essential tools
sudo xbps-install -Sy i3-gaps i3status picom nitrogen lxappearance feh rofi
mkdir -p ~/.config/i3
cp /usr/share/doc/i3/config ~/.config/i3/config

# Install terminal
sudo xbps-install -Sy alacritty

# Install LightDM and the GTK greeter
sudo xbps-install -Sy lightdm lightdm-gtk-greeter

# Enable LightDM to start at boot
sudo ln -s /etc/sv/lightdm /var/service/

# Add your user to the video group for graphics acceleration (replace 'yourusername' with your actual username)
sudo usermod -aG video "$USER"

# Useful stuff
sudo xbps-install -Sy flameshot neovim btop firefox wget curl

# Network manager
xbps-install -Sy NetworkManager
ln -s /etc/sv/NetworkManager /var/service/

# Virtualization
sudo xbps-install -Sy virt-manager qemu

# Reboot to start LightDM
echo "Installation complete. Rebooting in 5 seconds..."
sleep 5
sudo reboot

