#!/bin/sh
set -o nounset                              # Treat unset variables as an error

OMZH='oh-my-zsh'

echo "looking for $OMZH home folder"
if [ ! -d ~/.oh-my-zsh ]; then
  echo "$OMZH not found, installing."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo 'oh-my-zsh home folder present, assuming install'
fi
