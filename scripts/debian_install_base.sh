#!/bin/bash
sudo apt-get install zsh vim tmux ddate build-essential net-tools automake autoconf libreadline-dev libncurses5-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev curl tar
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zsh/local.zsh
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zsh/local.zsh
source ~/.zshrc

## asdf for version management ##

# Note:
# If you use pip to install a module like ipython that has binaries. 
# You will need to run asdf reshim python for the binary to be in your path.
asdf plugin-add python

asdf plugin-add erlang
asdf plugin-add rebar
asdf plugin-add elixir
asdf plugin-add lfe https://github.com/vic/asdf-lfe.git

asdf plugin-add rust https://github.com/code-lever/asdf-rust.git

asdf plugin-add nodejs
asdf plugin-add yarn

asdf plugin-add julia
asdf plugin-add golang
asdf plugin-add haskell
asdf plugin add elm

asdf plugin-add java
asdf plugin-add scala

asdf plugin-add lua
asdf plugin-add ocaml
asdf plugin-add deno
asdf plugin add perl
asdf plugin-add php
asdf plugin-add R
asdf plugin-add racket
asdf plugin add chezscheme
asdf plugin-add guile

# asdf plugin-add kubectl https://github.com/Banno/asdf-kubectl.git
# asdf plugin add gcloud
# asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git
# asdf plugin-add helm-ct https://github.com/tablexi/asdf-helm-ct.git
# asdf plugin-add helm-docs https://github.com/sudermanjr/asdf-helm-docs.git
# asdf plugin-add helmfile https://github.com/feniix/asdf-helmfile.git
