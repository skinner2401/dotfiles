echo "checking for stow"
if which stow ; then
  echo "stow present, skipping install"
  exit 0
fi

echo "stow now found."


if [[ $OSTYPE == 'darwin'* ]]; then
  echo "Installing stow on macOS"
  brew install stow
else
  echo "Installing stow on *nix, installing stow."
  sudo apt-get -y install stow
fi
