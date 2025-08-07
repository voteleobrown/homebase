#! /bin/bash
copy_dotfiles () {
    log_info "Copying standard dotfiles."
    cp -r .tmux.conf $HOME
    cp -r .vim $HOME
    cp -r .vimrc $HOME
    cp -r .zsh $HOME
    cp -r .zshrc $HOME
    log_success "Dotfiles copied!"
    touch $HOME/.zsh/local.zsh
    log_step "Cloning prezto repo for zsh themes..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" 2>&1  | log_error

    log_step "Copying prezto related directories and dotfiles...."
    # prezto
    cp ./.zlogin $HOME
    cp ./.zlogout $HOME
    cp ./.zpreztorc $HOME
    cp ./.zshenv $HOME
    cp ./.p10k.zsh $HOME
    log_step "Updating zprezto theme submodules..."
    cd ${HOME}/.zprezto
    git submodule update --init --recursive
    log_success "zprezto looking good!"
    cd ${SCRIPT_DIR}
}
