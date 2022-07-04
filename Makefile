.PHONY: all installstow tmux nvim aliases bashsh zsh vim clean-tmux clean-nvim clean-aliases clean-bashsh clean-zsh clean-vim

all: installstow tmux nvim aliases zsh

installstow:
	bin/setup.stow.sh

tmux:
	stow tmux -t ~/

nvim:
	mkdir -p ~/.config/nvim || true
	stow nvim -t ~/

aliases:
	stow aliases -t ~/

clean-aliases:
	stow -D aliases -t ~/

bashsh:
	stow bashsh -t ~/

clean-bashsh:
	stow -D bashsh -t ~/

zsh:
	stow zsh -t ~/
	
clean-zsh:
	stow -D zsh -t ~/

vim: installstow aliases
	stow vim -t ~/

clean-vim:
	stow -D vim -t ~/

clean: clean-tmux clean-nvim clean-aliases clean-zsh
	echo "hopefully cleaned the above"
