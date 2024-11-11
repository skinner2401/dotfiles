#!/bin/zsh

CA_NVIM_V=v0.10.2

brew install cmake
brew install cmake-docs
brew install gettext

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

if ! hash nvim; then
  echo 'neovim not detetcted, installing neovim'
  echo 'cloning neovim'
  git clone git@github.com:neovim/neovim.git $SRCDIR/neovim
  pushd $SRCDIR/neovim
  
  echo "Fetching $CA_NVIM_V"
  git fetch origin $CA_NVIM_V
  echo "checking out $CA_NVIM_V"
  git checkout $CA_NVIM_V
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

