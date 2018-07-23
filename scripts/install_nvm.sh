echo "Downloading NVM install script..."

if [ -z $(command -v curl) ];then
   echo "...using wget."
   wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
else
   echo "...using curl."
   curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi 

TEST_LINE_1='export NVM_DIR="$HOME/.nvm"'
if grep -Fxq "$TEST_LINE_1" $HOME/.zsh/local.zsh
then
    echo " "
    echo "!!! $HOME/.zsh/local.zsh has been previously updated. !!!"
    echo " "
else
    echo "Updating $HOME/.zsh/local.zsh"
    echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/.zsh/local.zsh
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.zsh/local.zsh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


echo "Installing Node..."
nvm install node


