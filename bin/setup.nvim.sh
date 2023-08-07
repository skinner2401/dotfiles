#!/usr/bin/bash

lvim091checksum256=6c083017304213c3a3efde8d332a52231b8df8206d35146942097c303ebf93d5

set -o nounset                              # Treat unset variables as an error

if ! which realpath ; then
  if which grealpath ; then
    REALPATHBIN=grealpath
  else
    echo 'please install linux core utils, macos: `brew install coreutils`'
    exit 1
  fi
else
  REALPATHBIN=realpath
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPOHOME=$SCRIPT_DIR/..
NOW=`date +%s`
LUADFCFGDIR=$($REALPATHBIN $REPOHOME/nvim)
SRCDIR=$HOME/src
LOGS=$HOME/logs
mkdir $LOGS

if ! (hash nvim) || ([ "$1" = "-f" ])
then
  echo 'neovim not detetcted, installing neovim'
  echo 'cloning neovim'
  git clone git@github.com:neovim/neovim.git $SRCDIR/neovim
  pushd $SRCDIR/neovim
  
  echo 'Pulling all history'
  git pull
  echo 'Fetching v0.9.1'
  git fetch origin "v0.9.1"
  echo 'checking out v0.9.1'
  git checkout "v0.9.1"
  echo 'Installing neovim dependencies.'
  sudo apt-get update
  sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  echo 'Working directory:'
  pwd
  echo 'calling make install'
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

