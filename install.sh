#!/bin/bash

echo "Installing base applications..."
./scripts/install_apt_base.sh

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
	y|Y) echo "Installing Vundle plugins..." && cd scripts && ./install_vundle.sh && cd .. ;; 
	n|N) echo "Vundle plugins not installed." ;; 
	*) echo "Vundle plugins not installed" ;; 
esac

read -n1 -p "Install Node? [y,n]" npmresp 
case $npmresp in  
	y|Y) echo "Installing Node..." && cd scripts && ./install_nvm.sh && cd .. ;; 
	n|N) echo "Node not installed." ;; 
	*) echo "Node not installed" ;; 
esac

read -n1 -p "Install Python 3 [y,n]" doit 
case $doit in  
	y|Y) echo "Installing Python 3..." && cd scripts && ./install_python3.sh && cd .. ;; 
	n|N) echo "Python 3 not installed." ;; 
	*) echo "Python 3 not installed" ;; 
esac
