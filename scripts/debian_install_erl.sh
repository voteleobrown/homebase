#!/bin/bash
sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop inotify-tools

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install erlang 22.1.3
asdf global erlang 22.1.3
asdf install elixir 1.9.1-otp-22
asdf global elixir 1.9.1-otp-22

mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
