#!/usr/bin/env fish

### FISH SETUP GREETING ###
echo "Hey, if you're reading this, that means we're now working off of fish script. Pretty neat, huh? *bzz*bzz*"
sleep 3s

### PACKAGE INSTALLATION ###
echo "Aight, now we're gonna start installing what's called 'bedrock apps'. Don't ask me why they're called that. Anyhoo, here we go!"
sleep 3s

# Bedrock Applications
sudo pacman -S --needed --noconfirm (cat ./application_list/bedrock_apps.txt)
sleep 3s
# Essential GUI components
echo "Time for essential GUI components. These are the guts that make your schnazzy GUI stuff work. Don't worry, I won't bore you with details. Terminal's right there if you're really interested."
sleep 5s
sudo pacman -S --needed --noconfirm (cat ./application_list/gui_components.txt)
# Terminal Toolkit
echo "Now we're gonna install our handy dandy terminal toolkit tools!"
sleep 3s
sudo pacman -S --needed --noconfirm (cat ./application_list/terminal_toolkit.txt)
# Flatpak Applications
echo "Here comes those fancy Flatpaks! Everybody, watch out!"
sleep 3s
flatpak install -y (cat ./application_list/flatpak_apps.txt)

echo "Now to actually set all htis stuff up! *bzz*bzz*"

### SETTING UP ###
echo "You'll probably need this at some point..."
sleep 3s
flatpak run com.bitwarden.desktop

# Set up and connect to Tailscale network

echo "Setting up Tailscale..."
sleep 3s
sudo tailscale up --qr
sudo systemctl enable --now tailscaled
tailscale status
tailscale set ssh # Enable Tailscale SSH for this machine

# Set variable my_id to this machine's ID (device IDs aren't secret)
set my_id (syncthing cli show system | jq -r .myID)

# Set up Syncthing
echo "Setting up Syncthing..."
sleep 3s
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

# Set variable MOTHERSHIP_ID to Syncthing device ID of Mothership
set MOTHERSHIP_ID (ssh mothership "syncthing cli show system" | jq -r .myID)

# tell Mothership about this machine
ssh mothership "syncthing cli config devices add --device-id $my_id --name (hostname)"
syncthing # log into Syncthing web GUI



