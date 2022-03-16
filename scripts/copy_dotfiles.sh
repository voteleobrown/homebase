#! /bin/bash
source ./scripts/helpers.sh

log_info "Copying standard dotfiles."
cp -r .tmux.conf $HOME
cp -r .vim $HOME
cp -r .vimrc $HOME
cp -r .zsh $HOME
cp -r .zshrc $HOME
touch $HOME/.zsh/local.zsh


log_info "Cloning prezto repo for zsh themes."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" 2>&1  | log_error

log_info "Copying prezto related directories and dotfiles."
# prezto
cp ./.zlogin $HOME
cp ./.zlogout $HOME
cp ./.zpreztorc $HOME
cp ./.zshenv $HOME
cp ./.p10k.zsh $HOME
