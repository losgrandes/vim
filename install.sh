#!/bin/bash

sudo apt-get install vim vim-nox exuberant-ctags pylint 

VIMRC=~/.vim/.vimrc
VIMRC_LINK=~/.vimrc
DEFAULT_REPOS=~/git/

if [ ! -L $VIMRC_LINK ];then
    ln -s $VIMRC $VIMRC_LINK
fi
vim +BundleInstall +qall
echo -n "Need to scan for tags. Where're your repos? [$DEFAULT_REPOS]:"
read dir
if [ -z "$dir" ];then
    dir="$DEFAULT_REPOS"
fi
eval dir=$dir # Translating ~ into $HOME
ctags -f ~/tags -R "$dir"
