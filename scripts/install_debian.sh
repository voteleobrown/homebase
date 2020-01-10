#!/bin/bash

HOMEBASE_DIR=$(pwd)

install_erl() {
  while true; do
    read -r -n 1 -p "Install erlang and elixir?" REPLY
    case $REPLY in
	[yY]) cd $HOMEBASE_DIR/scripts && ./debian_install_erl.sh && cd $HOMEBASE_DIR ;;
	[nN]) echo "Erland and Elixir not installed." ;;
	*) printf " \033[31m %s \n\033[0m" "invalid input" ;;
    esac
  done
}

install_node() {
  while true; do
    read -r -n 1 -p "Install nodejs?" REPLY
    case $REPLY in
	[yY]) cd $HOMEBASE_DIR/scripts && ./debian_install_node.sh && cd $HOMEBASE_DIR ;;
	[nN]) echo "Nodejs not installed." ;;
	*) printf " \033[31m %s \n\033[0m" "invalid input" ;;
    esac
  done
}

echo "Installing base applications..."
./scripts/debian_install_base.sh

echo "Copying config files to home directory..."
cp -r .tmux.conf $HOME
cp -r .vim $HOME
cp -r .vimrc $HOME
cp -r .zsh $HOME
cp -r .zshrc $HOME
touch .zsh/local.zsh

echo "Changing defualt shell to ZSH..."
sudo chsh $USER -s /bin/zsh


read -n1 -p "Install vundle plugins for vim? [y,n]" vundleresp 
case $vundleresp in  
	y|Y) echo "Installing Vundle plugins..." && cd $HOMEBASE_DIR/scripts && ./install_vundle.sh && cd $HOMEBASE_DIR ;; 
	n|N) echo "Vundle plugins not installed." ;; 
	*) echo "Vundle plugins not installed" ;; 
esac

read -n1 -p "Install asdf version manager? [y,n]" asdfresp 
case $asdfresp in  
	y|Y) echo "Installing Vundle plugins..." && cd $HOMEBASE_DIR/scripts && ./debian_install_asdf.sh && cd $HOMEBASE_DIR && install_erl && install_node ;; 
	n|N) echo "asdf version manager not installed." ;; 
	*) echo "asdf version manager not installed." ;; 
esac

