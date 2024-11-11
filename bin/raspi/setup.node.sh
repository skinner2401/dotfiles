echo ''
echo NVM setup start.

if [ -z 'nvm --version' ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
fi
  
echo Setting NVM_DIR start.

if [ -z "${NVM_DIR}" ]; then 
  echo Adding NVM_DIR to env vars
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
else
  echo NVM_DIR exists
fi

echo Setting NVM_DIR complete.
echo NVM setup complete.
echo ''

echo Node setup start.
echo ''
if [ -z 'node --version' ]; then
  nvm install node
fi

echo Node setup complete.
echo ''

