#!/bin/bash
sudo apt-get install zsh vim tmux build-essential net-tools automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zsh/local.zsh
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zsh/local.zsh
source ~/.zshrc

