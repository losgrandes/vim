#!/bin/bash

sudo apt-get install vim vim-nox exuberant-ctags cmake python-dev cscope build-essential clang 

ln -s ~/.vim/.vimrc ~/.vimrc
vim +BundleInstall +qall
mkdir ~/.vim/plugin/
cd ~/.vim/plugin/
wget -nc http://cscope.sourceforge.net/cscope_maps.vim
cd ~/dev
ctags -R
cscope -bR
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
cd ~/.vim/bundle/YCM-Generator
find ~/dev/* -maxdepth 0 -type d | xargs -I{} ./config_gen.py {}
