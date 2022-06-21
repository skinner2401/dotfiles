# rbenv init
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export EDITOR="vim"
source ~/.aliases
if [ -f $HOME/.cargo/env ] ; then
  . "$HOME/.cargo/env"
fi
