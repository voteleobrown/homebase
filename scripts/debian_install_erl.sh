#!/bin/bash
sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop inotify-tools

asdf install erlang 23.1.1
asdf global erlang 23.1.1
asdf install elixir 1.11.1-otp-23
asdf global elixir 1.11.1-otp-23
asdf install rebar 3.14.0
asdf global rebar 3.14.0

mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
