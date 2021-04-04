#!/bin/bash
rm -rf ~/src/tmux
git clone https://github.com/gpakosz/.tmux.git ~/src/tmux
ln -s -f ~/src/tmux/.tmux.conf ~/.tmux.conf
cp ~/src/tmux/.tmux.conf.local ~/.tmux.conf.local

cat ~/src/dotfiles/.tmux.conf >> ~/.tmux.conf.local
