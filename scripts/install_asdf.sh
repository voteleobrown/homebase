#!/bin/bash
sudo apt-get install automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zsh/local.zsh
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zsh/local.zsh
source ~/.zshrc

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install erlang 22.1.3
asdf global erlang 22.1.3
asdf install elixir 1.9.1-otp-22
asdf global elixir 1.9.1-otp-22

mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
