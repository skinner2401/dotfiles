#!/bin/zsh

NOW=`date '+%F_%H-%M-%S'`
# for more information on zsh command expansion, see
# man zshexpn
SCRIPTDIR=${0:a:h}
echo "script dir: $SCRIPTDIR"

CFG=$HOME/.config
VIMRCDF=$SCRIPTDIR/../.vimrc
NVIMCONFDIR=$CFG/nvim
NVIMCONF=$NVIMCONFDIR/init.vim
TMUXCONFDF=$SCRIPTDIR/../.tmux.conf
TMUXCONF=$HOME/.tmux.conf

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
