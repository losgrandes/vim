#!/bin/bash

VIMRC=~/.vim/.vimrc
VIMRC_LINK=~/.vimrc
PROJECTS_PATH=""

while [[ $# -gt 0 ]]
do
key="$1"
    
case $key in
    -p|--projects-path)
    PROJECTS_PATH="$2"
    shift # past argument
    shift # past value
    ;;
    -h|--help)
    echo "$0 [ -p|--projects-path PATH ]"
    exit
    ;;
esac
done

if [ -L $VIMRC_LINK ];then
    echo "$VIMRC_LINK already exists. Don't want to overwrite. Exiting!"
    exit
fi

sudo apt-get install vim vim-nox exuberant-ctags pylint 
ln -s $VIMRC $VIMRC_LINK
vim +BundleInstall +qall
echo "\" Colorscheme" >> $VIMRC_LINK
echo "colorscheme molokai" >> $VIMRC_LINK
echo "let g:rehash256 = 1" >> $VIMRC_LINK

if [ ! -z $PROJECTS_PATH ];then
    echo -n "Running ctags for $PROJECTS_PATH"
    ctags -f ~/tags -R $PROJECTS_PATH
    echo " Done!"
fi
echo "All Done!"
