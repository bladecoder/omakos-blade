#!/bin/sh

set -e

cp ./configs/vimrc ~/.vimrc

# Install vim-plug if not already installed
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install plugins
vim +PlugInstall +qall