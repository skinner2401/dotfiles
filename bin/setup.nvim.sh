#!/bin/bash - 
#===============================================================================
#
#          FILE: setup.nvim.sh
# 
#         USAGE: ./setup.nvim.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 04/30/2022 23:56
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
NOW=`date +%Y-%m-%d%::z`
LUADFCFGDIR=$(realpath $SCRIPT_DIR/../nvim)
LUADFCFG=$LUADFCFGDIR/init.lua
LUACFGDIR=$HOME/.config/nvim
LUACFG=$LUACFGDIR/init.lua
LUACFGBKUP=$LUACFG.$NOW.bak
LUADFCFGCUSTOMDIR=$LUADFCFGDIR/lua
LUACFGCUSTOMDIR=$HOME/.config/nvim/lua
SRCDIR=$HOME/src
NVIMINSTALLDIR=$SRCDIR/nvim_repo

if ! which nvim ; then
  echo 'neovim not detetcted, installing neovim'
  pushd $SRCDIR
  git clone https://github.com/neovim/neovim
  pushd neovim
  sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen 
  echo 'installing neovim depedencies.'
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install 
else
  echo 'neovim exists. Not installing.'
fi

# if [ ! -d $HOME/.config/nvim ]; then
#   echo 'creating nvim config folder ... '
#   mkdir -p $HOME/.config/nvim
#   echo 'done'
# else
#   echo 'backing up .config/nvim'
#   mv $HOME/.config/nvim $HOME/.config/nvim.bak.$NOW
#   mkdir -p $HOME/.config/nvim/custom $LUADFCFGDIR
# fi

if [ -f $LUACFG ]; then
  echo "Backing up lua vim config to $LUACFGBKUP"
  mv $LUACFG $LUACFGBKUP
  echo "Done"
fi

if [ ! -d $LUACFGDIR ]; then
  echo "Nvim config directory does not exist, creating $LUACFGDIR"
  mkdir $LUACFGDIR
fi

echo "symlinking $LUACFGCUSTOMDIR -> $LUADFCFGCUSTOMDIR"
ln -s $LUADFCFGCUSTOMDIR $LUACFGCUSTOMDIR

echo "symlinking $LUACFG -> $LUADFCFG"
ln -s $LUADFCFG $LUACFG
