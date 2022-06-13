.PHONY: all installstow tmux nvim aliases bashsh zsh vim

all: installstow tmux nvim aliases bashsh zsh

installstow:
	bin/setup.stow.sh

tmux:
	stow tmux -t ~/

nvim:
	stow nvim -t ~/

aliases:
	stow aliases -t ~/

bashsh:
	stow bashsh -t ~/

zsh:
	stow zsh -t ~/

vim: installstow aliases
	stow vim -t ~/

