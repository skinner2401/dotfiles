.PHONY: all installstow installlvim tmux nvim lvim aliases bashsh zsh vim clean-tmux clean-nvim clean-aliases clean-bashsh clean-zsh clean-vim

all: installstow installlvim tmux lvim aliases zsh

installstow:
	bin/setup.stow.sh

installlvim:
	bin/setup.lunarvim.sh

tmux:
	stow tmux -t ~/

nvim:
	mkdir -p ~/.config/nvim || true
	stow nvim -t ~/

lvim:
	mkdir -p ~/.config/lvim || true
	stow lvim -t ~/

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

clean-nvim:
	stow -D nvim -t ~/

clean-lvim:
	stow -D lvim -t ~/

clean: clean-tmux clean-nvim clean-lvim clean-aliases clean-zsh
	echo "hopefully cleaned the above"
