#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "run as root."
    exit
fi

apt update
apt install -y i3 terminator ranger rofi nitrogen feh compton build-essential neovim
