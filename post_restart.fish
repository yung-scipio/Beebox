echo "Hey, welcome back! Looks like we're resuming the setup process. Thanks for your patience. *bzz*bzz*"
sleep 2s

### SETTING UP ###

# Open Bitwarden for user to log into
echo "You'll probably need this at some point... go ahead and log into Bitwarden and set it as your SSH Agent."
sleep 3s
flatpak run com.bitwarden.desktop

# Set up and connect to Tailscale network
echo "While you're doing that, I'm gonna set up Tailscale..."
sleep 3s

sudo tailscale up --qr
sudo systemctl enable --now tailscaled
tailscale status
tailscale set ssh # Enable Tailscale SSH for this machine

# Set up Syncthing
echo "Setting up Syncthing..."
sleep 3s

# Set variable my_id to this machine's ID (device IDs aren't secret)
set my_id (syncthing cli show system | jq -r .myID)

# Find Mothership's Tailscale IP address and set as variable mothership_ip
set mothership_ip (tailscale ip -4 mothership)

# tell Mothership about this machine
ssh mothership "syncthing cli config devices add --device-id $my_id --name (hostname)"
syncthing # log into Syncthing web GUI for local device
flatpak run org.mozilla.firefox "https://$mothership_ip:8384" # open Syncthing web GUI for Mothership