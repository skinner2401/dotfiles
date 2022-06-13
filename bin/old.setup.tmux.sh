#!/bin/bash
INSTALLDIR=$HOME/src
if ! ( ls $INSTALLDIR) then
  mkdir $INSTALLDIR
fi

if ( ls $INSTALLDIR/tmux ) then 
  rm -rf $INSTALLDIR/tmux
fi

git clone https://github.com/gpakosz/.tmux.git $INSTALLDIR/tmux
ln -s -f $INSTALLDIR/tmux/.tmux.conf ~/.tmux.conf
cp $INSTALLDIR/tmux/.tmux.conf.local ~/.tmux.conf.local

cat $INSTALLDIR/dotfiles/.tmux.conf >> ~/.tmux.conf.local
