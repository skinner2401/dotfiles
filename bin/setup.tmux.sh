#!/bin/bash
rm -rf ~/src/tmux
git clone https://github.com/gpakosz/.tmux.git ~/src/tmux
ln -s -f ~/src/tmux/.tmux.conf ~/.tmux.conf
cp ~/src/tmux/.tmux.conf.local ~/.tmux.conf.local

cat ~/src/dotfiles/.tmux.conf >> ~/.tmux.conf.local
#cat <<EOT >> ~/.tmux.conf.local
#unbind C-b
#set -g prefix C-a
#
## Smart pane switching with awareness of Vim splits.
## See: https://github.com/christoomey/vim-tmux-navigator
#is_vim="ps -o state= -o comm= -t '#{pane_tty}' \\
#            | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
#bind-key -n C-h if-shell "\$is_vim" "send-keys C-h"  "select-pane -L"
#bind-key -n C-j if-shell "\$is_vim" "send-keys C-j"  "select-pane -D"
#bind-key -n C-k if-shell "\$is_vim" "send-keys C-k"  "select-pane -U"
#bind-key -n C-l if-shell "\$is_vim" "send-keys C-l"  "select-pane -R"
#bind-key -n C-\\ if-shell "\$is_vim" "send-keys C-\\\\" "select-pane -l"
#bind-key -T copy-mode-vi C-h select-pane -L
#bind-key -T copy-mode-vi C-j select-pane -D
#bind-key -T copy-mode-vi C-k select-pane -U
#bind-key -T copy-mode-vi C-l select-pane -R
#bind-key -T copy-mode-vi C-\ select-pane -l
#
## set activity monitor
#setw -g monitor-activity on
#set -g visual-activity on
#
##highlight the current window using specified color
#set-window-option -g window-status-current-bg red
#
## pull in the development environment
#bind D source-file ~/.tmux/dev
#
##bind -n C-L send-keys -R \\; clear-history
#bind -n C-o send-keys -R \\; send-keys C-l \\; clear-history
#
#bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
#
## rebind split keys
#bind | split-window -h -c "#{pane_current_path}"
#bind - split-window -v -c "#{pane_current_path}"
#EOT
