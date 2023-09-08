#!/bin/sh

# Audio
sudo xbps-install -Syu
xbps-install alsa-utils pipewire alsa-pipewire
sudo ln -s /etc/sv/alsa /var/service && sudo ln -s /etc/sv/pulseaudio /var/service

# Enable repositories
xbps-install void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
