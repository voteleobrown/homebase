#!/bin/bash

echo "Installing base applications..."
./scripts/install_termux_base.sh

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
	y|Y) echo "Installing Node..." && pkg nodejs ;; 
	n|N) echo "Node not installed." ;; 
	*) echo "Node not installed" ;; 
esac

read -n1 -p "Install Python [y,n]" doit 
case $doit in  
	y|Y) echo "Installing Python..." && pkg install python ;; 
	n|N) echo "Python not installed." ;; 
	*) echo "Python not installed" ;; 
esac

read -n1 -p "Install asdf, erlang, and elixir?" doit
case $doit in
	y|Y) echo "Installing asdf, erlang, and elixir..." && cd scripts && ./install_asdf.sh && cd .. ;;
	n|N) echo "asdf, erlang, and elixir not installed." ;;
	*) echo "asdf, erlang, and elixir not install." ;;
esac
