#!/bin/bash

HOMEBASE_DIR=$(pwd)

echo "Installing base applications..."
./scripts/debian_install_base.sh

echo "Copying config files to home directory..."
./scripts/copy_dotfiles.sh

echo "Changing defualt shell to ZSH..."
sudo chsh $USER -s /bin/zsh

# read -r -n 1 -p "Install erlang and elixir?" REPLY
# case $REPLY in
#   [yY]) cd $HOMEBASE_DIR/scripts && ./debian_install_erl.sh && cd $HOMEBASE_DIR ;;
#   [nN]) echo "Erland and Elixir not installed." ;;
#   *) printf " \033[31m %s \n\033[0m" "invalid input" ;;
# esac
# 
# read -r -n 1 -p "Install nodejs?" REPLY
# case $REPLY in
#   [yY]) cd $HOMEBASE_DIR/scripts && ./debian_install_node.sh && cd $HOMEBASE_DIR ;;
#   [nN]) echo "Nodejs not installed." ;;
#   *) printf " \033[31m %s \n\033[0m" "invalid input" ;;
# esac
