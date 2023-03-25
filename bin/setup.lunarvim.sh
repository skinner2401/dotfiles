#!/usr/bin/bash

set -o nounset                              # Treat unset variables as an error

scriptdir="$( dirname -- "$BASH_SOURCE"; )";
. $scriptdir/setup.coreutils.sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPOHOME=$SCRIPT_DIR/..
NOW=`date +%s`
LUADFCFGDIR=$($REALPATHBIN $REPOHOME/nvim)
SRCDIR=$HOME/src

. $scriptdir/setup.node.sh
. $scriptdir/setup.python3.sh

if [ -z 'nvim --version 2>/dev/null' ] ; then
  echo 'neovim not detetcted, installing neovim'
  pushd $SRCDIR
  git clone https://github.com/neovim/neovim
  pushd neovim
  git fetch origin v0.8.0
  git checkout v0.8.0
  sudo apt-get update
  sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen 
  echo 'installing neovim depedencies.'
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install 
else
  echo 'neovim exists. Not installing.'
fi

# install vimplug if it isn't already
if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ] ; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

NVIMCFGDIR=$HOME/.config/nvim
LUACFG=$NVIMCFGDIR/init.lua
LUACFGBKUP=$LUACFG.$NOW.bak
echo "NVIMCFGDIR $NVIMCFGDIR"
echo "LUACFG $LUACFG"
if [ -f $LUACFG ]; then
  echo "Backing up lua vim config to $LUACFGBKUP"
  mv $LUACFG $LUACFGBKUP
fi

