#!/bin/bash

VIM="/home/$USER/.vim"
GNUPG="http://www.vim.org/scripts/download_script.php?src_id=12200"

if [ -d "$VIM" ]; then
   echo "vim directory exists"
     tar -czf /home/$USER/vimbackup.tar.gz $VIM

     rm -rf $VIM
     echo "Removed .vim/ directory"
fi

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

if [ ! -d '$VIM/plugin' ]; then
    echo "Creating plugins directory"
    mkdir $VIM/plugin
fi

if [ ! -f '$VIM/plugin/gnug' ]; then
    echo "Adding GNU Plugin..."
    exec curl -o $VIM/plugin/gnupg.vim $GNUPG
fi
