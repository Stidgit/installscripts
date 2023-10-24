#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

# Update the package list
if ! apt update; then
    echo "Failed to update package list. Exiting."
    exit 1
fi

# Install all packages at once
if ! apt install -y i3 \
                    terminator \
                    rofi \
                    nitrogen \
                    feh \
                    compton \
                    build-essential \
                    btop \
                    ranger \
                    neovim; then
    echo "Failed to install packages. Exiting."
    exit 1
fi
