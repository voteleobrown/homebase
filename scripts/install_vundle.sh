echo "Cloning Vundle repository to $HOME/.vim/bundle/Vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Done."

echo "Deleting old Vundle configuration if present."
sed -i '/" BEGIN VUNDLE/,/" END VUNDLE/d' $HOME/.vimrc
echo "Inserting new configuration from vundle.txt."
cat vundle.txt >> $HOME/.vimrc

echo "Deleting old bundles if present."
rm -r $HOME/.vim/bundles

echo "Installing Vundle plugins."
vim +PluginInstall +qall
