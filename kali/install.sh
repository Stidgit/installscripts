#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Ensure as root"
    exit 1
fi

# Update the package list
if ! apt update; then
    echo "Update failed"
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
    echo "Failed to install packages"
    exit 1
fi
