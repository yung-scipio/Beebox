#!/bin/bash

# Update system and repos for good measure
sudo pacman -Syu --noconfirm

# Bedrock applications; syncthing and tailscale
BEDROCK=(syncthing
         tailscale
)

sudo pacman -S --noconfirm "${BEDROCK[@]}"

# Tiling window manager stuff
TWM=(scroll
)

sudo pacman -S --noconfirm "${TWM[@]}"

# Essential GUI applications
GUI=(firefox
    emacs
)

sudo pacman -S --noconfirm "${GUI[@]}"

# Terminal toolkit
TERMINAL=(foot
        neovim
        imv
)

sudo pacman -S --noconfirm "${TERMINAL[@]}"

# Enable and start syncthing service
systemctl --user enable syncthing.service
systemctl --user start syncthing.service
