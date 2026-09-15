#!/bin/bash

# Update system and repos for good measure
sudo pacman -Syu --noconfirm

# Bedrock applications; items that make the rest of this script work
BEDROCK=(syncthing
         tailscale
         keyd
         wl-clipboard
         bitwarden
         bitwarden-cli
         rbw
)

sudo pacman -S --noconfirm "${BEDROCK[@]}"

# Tiling window manager stuff
TWM=(sway
     ly
)

sudo pacman -S --noconfirm "${TWM[@]}"

# Essential GUI components
GUI=(cosmic-session
     flatpak
)

sudo pacman -S --noconfirm "${GUI[@]}"

# Terminal toolkit
TERMINAL=(foot
        fish
        neovim
        imv
        zellij
        paru
)

sudo pacman -S --noconfirm "${TERMINAL[@]}"

# Flatpak applications
FLATPAKS=(firefox
          thunderbird
          obsidian
          boxes
          transmission
          copyq
          qalculate
)

flatpak install "${FLATPAKS[@]}"

# Enable and start syncthing service
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

# Log into Bitwarden, copy 
bw login "andrew.evans@mailbox.org"

# Start tailscaled.service
sudo systemctl start tailscaled
tailscale login
