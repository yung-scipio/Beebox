#!/bin/bash

# Update system and repos for good measure
sudo pacman -Syu --noconfirm

# Bedrock applications; items that make the rest of this script work
# rbw is part of the bitwarden-cli suite. See chezmoi docs
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
#TWM=(sway
#     ly
#)
#
#sudo pacman -S --noconfirm "${TWM[@]}"

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
	  bitwarden
)

flatpak install "${FLATPAKS[@]}"

### SETTING UP ###

## Bitwarden Component ##
# Log into Bitwarden, copy 
#bw login "andrew.evans@mailbox.org"
## Acquire main Google password
#bw get password e96707b9-a0d5-4b44-be46-a9fd01836c84
#echo "Waiting 15 seconds, copy your Google password please!"
#sleep 15
#
## Log into Google
#echo "Let's get logged into Google now, yeah?"
#flatpak run org.mozilla.firefox "https://accounts.google.com/v3/signin/identifier?continue=https://accounts.google.com/&followup=https://accounts.google.com/&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S1225942870:1789496451744609"
#
## Start tailscaled.service, log in
#sudo systemctl start tailscaled
#echo "Remember to press ctrl+shift+C when copying the link, not Ctrl+C (closes tailscale cli) 
#sudo tailscale login
#echo "Running tailscale status to ensure it's working"
#
## Syncthing connect sequence to Mothership will go here
## Enable and start syncthing service
#systemctl --user enable syncthing.service
#systemctl --user start syncthing.service
