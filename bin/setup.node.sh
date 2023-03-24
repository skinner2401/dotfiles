echo ''
echo NVM setup start.
echo ''
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
echo ''
echo NVM setup complete.
echo ''

echo "Adding NVM_DIR to env vars"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

echo ''
echo Node setup start.
echo ''
nvm install node
echo ''
echo Node setup complete.
echo ''
