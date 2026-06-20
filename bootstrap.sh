#!/bin/bash

sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
sudo sed -i '' 's/#auth/auth/' /etc/pam.d/sudo_local

xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install git wget
brew install --cask firefox
brew install --cask obsidian

