# !/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install coreutils curl git vim asdf

echo "Copying config files to home directory..."
./scripts/copy_dotfiles.sh

echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zsh/local.zsh
echo -e 'export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"' >> ~/.zsh/local.zsh

