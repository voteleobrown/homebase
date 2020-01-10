#!/bin/bash
sudo apt-get install dirmngr
sudo apt-get install gpg

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash $HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install nodejs 12.14.1
asdf global nodejs 12.14.1
