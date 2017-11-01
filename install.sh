#!/bin/bash

VIMRC=~/.vim/.vimrc
VIMRC_LINK=~/.vimrc
DEFAULT_REPOS=~/git/

if [ -L $VIMRC_LINK ];then
    echo "$VIMRC_LINK already exists. Don't want to overwrite. Exiting!"
    exit
fi
sudo apt-get install vim vim-nox exuberant-ctags pylint 
ln -s $VIMRC $VIMRC_LINK
vim +BundleInstall +qall

echo -n "Need to scan for tags. Where're your repos? [$DEFAULT_REPOS]:"
read dir
if [ -z "$dir" ];then
    dir="$DEFAULT_REPOS"
fi
eval dir=$dir # Translating ~ into $HOME
ctags -f ~/tags -R "$dir"
echo "All Done!"
