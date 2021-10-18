#! /bin/bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cp -r .tmux.conf $HOME
cp -r .vim $HOME
cp -r .vimrc $HOME
cp -r .zsh $HOME
cp -r .zshrc $HOME
touch .zsh/local.zsh

# prezto
cp ./.zlogin $HOME
cp ./.zlogout $HOME
cp ./.zpreztorc $HOME
cp ./.zshenv $HOME
cp ./.p10k.zsh $HOME 