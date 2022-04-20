#!/bin/zsh

NOW=`date '+%F_%H-%M-%S'`

# for more information on zsh command expansion, see
# man zshexpn
# This gives us the scripts running directory
SCRIPTDIR=${0:a:h}
echo "script dir: $SCRIPTDIR"

function bkupAndSymlink() {
  if [ "$1" -ef "$2" ]; then
    echo "$1 is already properly symlinked, skipping."
  else
    if [ -f $1 ]; then
      local BKUP=$1.$NOW.bkup
      echo "backing up $1 to $BKUP"
      mv $1 $BKUP
    fi
    echo "creating symlink from $2 to $1"
    ln -s $2 $1
  fi
}

DF=$(readlink -f "$SCRIPTDIR/..")
echo "dotfiles path: $DF"
CFG=$HOME/.config
VIMRCDF=$DF/.vimrc
NVIMCONFDIR=$CFG/nvim
NVIMCONF=$NVIMCONFDIR/init.vim
TMUXCONFDF=$DF/.tmux.conf
TMUXCONF=$HOME/.tmux.conf
ZSHRCDF=$DF/.zshrc
ZSHRC=$HOME/.zshrc.skinner2401
ALIASDF=$DF/.aliases
ALIAS=$HOME/.aliases

if [ -d "$CFG" ]; then
echo "backing up $CFG"
  CFGBKUP=$CFG.$NOW.bkup
  echo "backing up $CFG to $CFGBKUP"
  mv $CFG $CFGBKUP
fi

if ! [ -d "$CFG" ]; then
  echo "no $NVIMCONFDIR dir exists, creating"
  mkdir -p $NVIMCONFDIR
fi

echo "creating nvim conf symlinks from \"$VIMRCDF\" to $NVIMCONF"
ln -s $VIMRCDF $NVIMCONF

bkupAndSymlink $TMUXCONF $TMUXCONFDF
bkupAndSymlink $ZSHRC $ZSHRCDF
bkupAndSymlink $ALIAS $ALIASDF
