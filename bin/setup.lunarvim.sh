#!/usr/bin/bash

set -o nounset                              # Treat unset variables as an error

function pressanykey() {
  echo "Press any key to continue..."
  read -n 1 k <&1
}

pressanykey
echo "Checking for ensurepip (python3-pip)"
if ! command -v ensurepip ; then
  echo 'python3-pip not detected, installing python3-pip'
  sudo apt-get install -y python3-pip
fi

echo Linux coreutils setup start.

pressanykey
if ! command -v realpath ; then
  if ! command -v grealpath ; then
    echo 'please install linux core utils, macos: `brew install coreutils`'
    sudo apt-get install -y coreutils
  else
    REALPATHBIN=grealpath
  fi
else
  REALPATHBIN=realpath
fi

SRCDIR=$HOME/src

pressanykey
if ! command -v nvim ; then
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

if ! command -v cargo ; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source "$HOME/.cargo/env"
fi

# install vimplug if it isn't already
if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ] ; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
export ARGS_INSTALL_DEPENDENCIES=1
export INTERACTIVE_MODE=0
export LV_BRANCH='release-1.2/neovim-0.8'
pressanykey
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
