#!/bin/zsh

NOW=`date '+%F_%H-%M-%S'`
# for more information on zsh command expansion, see
# man zshexpn
SCRIPTDIR=${0:a:h}
echo "script dir: $SCRIPTDIR"

DF=$SCRIPTDIR/..
CFG=$HOME/.config
VIMRCDF=$DF/.vimrc
NVIMCONFDIR=$CFG/nvim
NVIMCONF=$NVIMCONFDIR/init.vim
TMUXCONFDF=$DF/.tmux.conf
TMUXCONF=$HOME/.tmux.conf
ZSHRCDF=$DF/.zshrc
ZSHRC=$HOME/.zshrc

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

if [ -f "$TMUXCONF" ]; then
  TMUXBKUP=$TMUXCONF.$NOW.bkup
  echo "backing up $TMUXCONF to $TMUXBKUP"
  mv $TMUXCONF $TMUXBKUP
fi

echo "creating tmux conf symlink from \"$TMUXCONFDF\" to $TMUXCONF"
ln -s $TMUXCONFDF $TMUXCONF

echo "creating nvim conf symlinks from \"$VIMRCDF\" to $NVIMCONF"
ln -s $VIMRCDF $NVIMCONF

if [ -f "$ZSHRC" ]; then
  ZSHRCBKUP=$ZSHRC.$NOW.bkup
  echo "backing up $ZSHRC to $ZSHRCBKUP"
  mv $ZSHRC $ZSHRCBKUP
fi
 
echo "creating zshrc symlink"
ln -s $ZSHRCDF $ZSHRC
