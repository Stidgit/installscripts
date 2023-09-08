#!/bin/bash

# Audio
sudo xbps-install -Syu
sudo xbps-install alsa-utils pulseaudio pavucontrol
sudo ln -s /etc/sv/alsa /var/service && sudo ln -s /etc/sv/pulseaudio /var/service
