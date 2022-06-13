echo "checking for stow"
if ! which stow ; then
	echo "not found, installing stow."
	sudo apt-get -y install stow
else
	echo "stow present, skipping install"
fi
