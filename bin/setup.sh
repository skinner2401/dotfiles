#!/bin/bash

INST_DIR="/opt/vim"

installVim () {

    echo 'Checking if vim is already installed.'
    if ( which vim ) then

        echo "vim already installed. do you want to remove vim? (y/n) "
        while read cleanupvim && [ "$cleanupvim" != y ] && [ "$cleanupvim" != n ]; do
            :
        done
        if [ "$cleanupvim" = y ]; then
            echo "Uninstalling vim"
            sudo apt remove vim vim-runtime gvim  
        fi
    fi

    sudo apt install libncurses5-dev \
    libgtk2.0-dev libatk1.0-dev \
    libcairo2-dev python-dev \
    python3-dev git

    pushd $HOME/Projects
    echo $'\n\n---------======= CLONING VIM =========------------\n\n'
    git clone https://github.com/vim/vim.git 
    pushd vim/src
    echo $'\n\n---------======= WORKING DIRECTORY =========------------\n\n'
    echo `pwd`

    echo $'\n\n---------======= CONFIGURING VIM INSTALL =========------------\n\n'

    sudo ./configure --with-features=huge \
    --prefix=${INSTR_DIR} \
    --mandir=${INST_DIR}/share/man \
    --enable-multibyte \
    --enable-pythoninterp=yes \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \  # pay attention here check directory correct
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ \  # pay attention here check directory correct
    --enable-gui=gtk2 \
    --enable-cscope \ 
    --prefix=/usr/local/ \
    --with-clipboard \
    --with-x

    echo $'\n\n---------======= BUILDING VIM (wait a hot minute) =========------------\n\n' 

    # sudo make VIMRUNTIMEDIR=/usr/local/share/vim/vim81 
    sudo make
    echo $'\n\n---------======= INSTALLING VIM (wait a hot minute) =========------------\n\n' 
    sudo make install
    echo $'\n\n---------======= DONE BUILDING VIM =========------------\n\n' 
}

# echo "Do you wish to update? (y/n)"
while read -p "Do you wish to update? (y/n): " updateall && [ "$updateall" != "y" ] && [ "$updateall" != "n" ]; do
  :
done

# echo "Do you want to install vim? (y/n): "
while read -p "Do you want to install vim? (y/n): " installvim && [ "$installvim" != y ] && [ "$installvim" != n ]; do
  :
done

# echo "Do you want to copy .vimrc.* to $HOME (y/n): "
while read -p "Do you want to copy .vimrc.* to $HOME (y/n): " copydevenv && [ "$copydevenv" != "y" ] && [ "$copydevenv" != "n" ]; do
  :
done

if [ "$updateall" = "y" ];
then
    echo 'updating, you may be asked for sudo password'
    sudo apt update
fi

if [ "$installvim" = "y" ];
then
    echo "Installing VIM"
    installVim
fi

if [ "$copydevenv" = "y" ];
then
    echo "Copying vimrc"
    cp .vimrc* $HOME/.
fi
