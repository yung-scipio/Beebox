#!/usr/bin/env fish

echo "Hey, welcome back! Looks like we're resuming the setup process. Thanks for your patience. *bzz*bzz*"
sleep 2s

### SETTING UP ###

# Open Bitwarden for user to log into
echo "You'll probably need this at some point... go ahead and log into Bitwarden and set it as your SSH Agent."
sleep 3s
flatpak run com.bitwarden.desktop &> /dev/null &
disown

# Set up and connect to Tailscale network
echo "While you're doing that, I'm gonna set up Tailscale..."
sleep 3s

sudo systemctl start tailscaled
sudo systemctl enable --now tailscaled
sudo tailscale up --qr
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
sudo systemctl restart systemd-resolved
sudo systemctl restart NetworkManager
sudo systemctl restart tailscaled

tailscale status
sudo tailscale set --ssh # Enable Tailscale SSH for this machine

# Set up Syncthing
echo "Setting up Syncthing..."
sleep 3s

# Set variable my_id to this machine's ID (device IDs aren't secret)
set my_id (syncthing cli show system | jq -r .myID)

# Find Mothership's Tailscale IP address and set as variable mothership_ip
set mothership_ip (tailscale ip -4 mothership)

# tell Mothership about this machine
ssh mothership "syncthing cli config devices add --device-id $my_id --name (hostname)"
syncthing &> /dev/null & # log into Syncthing web GUI for local device, 
disown # disown
flatpak run org.mozilla.firefox "https://$mothership_ip:8384" # open Syncthing web GUI for Mothership