#!/bin/bash

sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
sudo sed -i '' 's/#auth/auth/' /etc/pam.d/sudo_local

xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install --cask firefox
brew install --cask obsidian

open -a "Firefox" "https://www.pcloud.com/how-to-install-pcloud-drive-mac-os.html?download=mac"
