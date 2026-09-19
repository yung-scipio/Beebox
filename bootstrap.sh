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
exec fish ./app_install.fish