#dotfiles
backup of dotfiles and configurations

#Dependencies
Setup of these dotfiles relies on GNU [stow](https://www.gnu.org/software/stow).

Don't worry about installing it, running make below will do that for you.

Not familiar with stow? No problem! It's super simple, it symlinks directory trees. You won't end up with copies of anything in your home directory. Everything you "install" will symlink from home to this repo. 

#Installation
##Lunarvim

```make```

## Want Neovim without the Lunarvim config?

```make nvim```

## VIm more your speed?

```make vim```

## Want Lunarvim standalone, without a custom config?

```source <(curl -H "Cache-Control: no-cache, no-store, must-revalidate" -s https://raw.githubusercontent.com/skinner2401/dotfiles/master/bin/setup.lunarvim.sh)```
