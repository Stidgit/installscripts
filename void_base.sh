#!/bin/sh

# Update
xbps-install -Su
xbps-install -u xbps

# Audio
xbps-install pulseaudio pavucontrol

# Enable repositories
xbps-install void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree

# Drivers
xbps-install nvidia
