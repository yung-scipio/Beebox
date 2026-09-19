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

echo "Now to actually set all this stuff up! *bzz*bzz*"
sleep 3s


### CONFIG FILES ###
echo "Real quick, we're gonna pull my dots from my GitHub repo and apply them to the system. Hold still..."
sleep 3s
chezmoi init --apply https://github.com/yung-scipio/mydots.git

### RESTART SYSTEM ###
echo "Before we can continue, we need to restart the system. Don't forget to run post_restart.fish once you're logged into the COSMIC desktop environment. *bzz*bzz*"
shutdown -r now