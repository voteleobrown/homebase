#!/bin/bash

echo "Installing base applications..."
./scripts/debian_install_base.sh

echo "Copying config files to home directory..."
./scripts/copy_dotfiles.sh

echo "Install asdf version management..."
./scripts/install_asdf.sh

echo "Changing defualt shell to ZSH..."
sudo chsh $USER -s /bin/zsh


