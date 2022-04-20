source ~/.aliases

ssh-add ~/.ssh/id_github

if [[ -f "$HOME/.zshrc-local" ]]; then
  source "$HOME/.zshrc-local"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# create spaceship link
if ! [[ "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" -ef "$ZSH_CUSTOM/themes/spaceship.zsh-theme" ]]; then
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

# spaceship prompt
export ZSH_THEME="spaceship"
