#!/bin/sh
set -o nounset                              # Treat unset variables as an error

if [ ! -d ~/.oh-my-zsh ]; then
  echo "Do you want to install Zsh? (requires sudo)"
  while read installzsh && [ "$installzsh" != y ] && [ "$installzsh" != n ]; do
    :
  done
  if [ "$installzsh" = y ]; then
    sudo apt install zsh
  fi
fi

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

DIRNM=dirname -- "${BASH_SOURCE[0]}"
SCRIPT_DIR=$( cd -- "$( $DIRNM )" &> /dev/null && pwd )

ZSHRCLOCAL=.zshrc.local
ZSHDFCFG=$REALPATHBIN $SCRIPT_DIR/../.zshrc
ZSHCFGCUSTOM=$HOME/$ZSHRCLOCAL
ZSHCFG=$HOME/.zshrc

echo "SCRIPT_DIR $SCRIPT_DIR"
echo "ZSHDFCFG $ZSHDFCFG"

ln -s $ZSHDFCFG $ZSHCFGCUSTOM

SRCSTRING="source $HOME/$ZSHRCLOCAL" >> $ZSHCFG

if ! grep -Fxq "$SRCSTRING" $ZSHCFG ; then 
  echo "Adding $SRCSTRING to $ZSHCFG"
  echo "$SRCSTRING" >> $ZSHCFG
fi
 
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
