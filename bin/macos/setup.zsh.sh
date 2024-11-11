if [ ! which zsh ] ; then
  installing zsh
  sudo apt get zsh
else
  echo 'zsh already installed. changing primary shell to zsh. To change back, run:'
  echo '$ chsh -s $(which zsh)'
fi
if [ ! "$SHELL" == "zsh" ] ; then
  echo "changing shell to zsh"
  chsh -s $(which zsh)
else
  echo "primary shell is already zsh. No action"
fi
