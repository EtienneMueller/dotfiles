#!/bin/bash

eval "$(/opt/homebrew/bin/brew shellenv)"

# Git config (from synced Documents file)
source ~/Documents/git.conf
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

# SSH key
ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f ~/.ssh/id_ed25519 -N ''
ssh-keyscan github.com >> ~/.ssh/known_hosts 2>/dev/null
pbcopy < ~/.ssh/id_ed25519.pub
open https://github.com/settings/keys
echo "Paste the key into GitHub, then press Enter."
read -r

# Clone repos
git clone git@github.com:EtienneMueller/dotfiles.git ~/.dotfiles
