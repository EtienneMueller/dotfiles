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

# Create Symlinks
ln -s ~/.dotfiles/src/zshrc ~/.zshrc
sudo mkdir -p /Applications/Firefox.app/Contents/Resources/distribution
sudo ln -s ~/.dotfiles/src/firefox_exceptions.json /Applications/Firefox.app/Contents/Resources/distribution/policies.json

### Install Apps & Tools
# Apps
brew install --cask anki
brew install --cask spotify
brew install --cask steam
brew install --cask telegram
brew install --cask vlc
brew install --cask whatsapp

# Utilities
brew install --cask appcleaner
brew install --cask batteries
brew install --cask eul
brew install --cask fliqlo
brew install --cask keyboardcleantool
brew install --cask music-decoy
brew install --cask protonvpn
brew install --cask rectangle
brew install --cask thaw

# Dev
brew install uv
brew install --cask docker-desktop
brew install --cask tailscale-app
brew install --cask visual-studio-code

# Work
brew install --cask google-chrome
brew install --cask slack
brew install --cask todoist
brew install --cask zoom
brew install --cask zotero
