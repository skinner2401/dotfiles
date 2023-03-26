#!/usr/bin/bash

set -o nounset                              # Treat unset variables as an error

echo Linux coreutils setup start.

if [ -z 'realpath 2>/dev/null' ]; then
  if which grealpath ; then
    REALPATHBIN=grealpath
  else
    echo 'please install linux core utils, macos: `brew install coreutils`'
    exit 1
  fi
else
  REALPATHBIN=realpath
fi

echo coreutils setup complete.

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

NOW=`date +%s`
SRCDIR=$HOME/src

if ! hash nvim; then
  echo 'neovim not detetcted, installing neovim'
  echo 'cloning neovim'
  git clone https://github.com/neovim/neovim.git $SRCDIR/neovim
  pushd $SRCDIR/neovim
  
  echo 'Fetching v0.8.3'
  git fetch origin v0.8.3
  echo 'checking out v0.8.3'
  git checkout v0.8.3
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

LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
