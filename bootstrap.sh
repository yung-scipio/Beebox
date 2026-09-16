#!/usr/bin/env bash
set -e # exit on error (safety net)

# Greet user
read -p "Welcome to Beebox! Kick back and relax while the busy bees take care of everything for you. 'Bee' sure to stick around to move forward on the prompts. <Press ENTER to continue>"

echo "Thanks, and have a 'bee'autiful day! *bzz**bzz*"
sleep 3s

# Update system
echo "Updating system and repos for good measure..."
sleep 3s
sudo pacman -Syu --noconfirm

# Bootstrap to fish
echo "Let's get Fish shell installed, yeah? A lot more fun than dusty 'ol Bash ;)"
sleep 3s

sudo pacman -S --needed --noconfirm fish git curl # Install Fish if not already present
chsh -s "$(command -v fish)" # Change shell to Fish
exec fish ./setup.fish

#BEDROCK=(syncthing
#         tailscale
#         keyd
#         wl-clipboard
#         bitwarden
#         bitwarden-cli
#         rbw
#)
#
#sudo pacman -S --noconfirm "${BEDROCK[@]}"

# Tiling window manager stuff
#TWM=(sway
#     ly
#)
#
#sudo pacman -S --noconfirm "${TWM[@]}"

## Essential GUI components
#GUI=(cosmic-session
#     flatpak
#)
#
#sudo pacman -S --noconfirm "${GUI[@]}"
#
## Terminal toolkit
#TERMINAL=(foot
#        fish
#        neovim
#        imv
#        zellij
#        paru
#)
#
#sudo pacman -S --noconfirm "${TERMINAL[@]}"
#
## Flatpak applications
#FLATPAKS=(firefox
#          thunderbird
#          obsidian
#          boxes
#          transmission
#          copyq
#          qalculate
#	  bitwarden
#)
#
#flatpak install "${FLATPAKS[@]}"
#
#### SETTING UP ###
#
### Bitwarden Component ##
## Log into Bitwarden, copy 
##bw login "andrew.evans@mailbox.org"
### Acquire main Google password
##bw get password e96707b9-a0d5-4b44-be46-a9fd01836c84
##echo "Waiting 15 seconds, copy your Google password please!"
##sleep 15
##
### Log into Google
##echo "Let's get logged into Google now, yeah?"
##flatpak run org.mozilla.firefox "https://accounts.google.com/v3/signin/identifier?continue=https://accounts.google.com/&followup=https://accounts.google.com/&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S1225942870:1789496451744609"
##
### Start tailscaled.service, log in
##sudo systemctl start tailscaled
##echo "Remember to press ctrl+shift+C when copying the link, not Ctrl+C (closes tailscale cli) 
##sudo tailscale login
##echo "Running tailscale status to ensure it's working"
##
### Syncthing connect sequence to Mothership will go here
### Enable and start syncthing service
##systemctl --user enable syncthing.service
##systemctl --user start syncthing.service
