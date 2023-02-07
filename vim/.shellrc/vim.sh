if [ ! -f ~/.vim/bundle/Vundle.vim ]
then
    echo "Installing vim plugins for the first time (press Enter to ignore all initial errors)..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi
