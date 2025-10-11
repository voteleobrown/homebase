#! /bin/bash
source ./scripts/helpers.sh

log_info "Copying standard dotfiles."
cp -r .tmux.conf $HOME
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

# Define the Prezto directory, using the ZDOTDIR environment variable if it's set.
PREZTO_DIR="${ZDOTDIR:-$HOME}/.zprezto"

# Check if the Prezto directory exists
if [ ! -d "$PREZTO_DIR" ]; then
    echo "Error: Prezto directory not found at $PREZTO_DIR" >&2
    exit 1
fi

echo "Changing to Prezto directory: $PREZTO_DIR"
# pushd changes directory and saves the current one to a stack.
# We silence its output with > /dev/null
pushd "$PREZTO_DIR" > /dev/null

echo "Pulling latest changes for Prezto..."
git pull

echo "Updating Git submodules..."
git submodule update --init --recursive

echo "Returning to original directory..."
# popd returns to the directory saved by pushd.
popd > /dev/null

echo "✅ Prezto update complete!"