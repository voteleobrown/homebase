#!/bin/bash

install_debian () {
    log_step "Installing core applications for Debian..."
    sudo apt-get install -y zsh vim tmux ddate build-essential net-tools automake autoconf libreadline-dev libncurses5-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev curl tar
    log_step "Copying config files to home directory..."
    source ${COPY_DOTFILES}
    copy_dotfiles

    log_step "Changing defualt shell to ZSH..."
    sudo chsh $USER -s /bin/zsh
    log_success "ZSH is now default shell for user: ${PURPLE}$USER${NC}"

    log_step "Installing golang.."
    sudo apt install golang -y
    log_success "Golang installed!"
    log_step "Installing asdf..."
    go install github.com/asdf-vm/asdf/cmd/asdf@v0.18.0
    echo 'export ASDF_DATA_DIR="${HOME}/.asdf"' >> ${HOME}/.zsh/local.zsh
    echo 'export PATH="$ASDF_DATA_DIR/shims:$PATH"' >> ${HOME}/.zsh/local.zsh
    .  ${HOME}/.zshrc 
    mkdir -p "${ASDF_DATA_DIR:=$HOME/.asdf}/completions"
    asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
    log_success "asdf installed!"
    log_success "Debian specific configuration completed!"
}



