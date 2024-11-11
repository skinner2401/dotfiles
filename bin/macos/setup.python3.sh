
if ! hash python3; then
  echo Python is not installed
  echo Installing python 3.11
  sudo apt-get update
  sudo apt-get install python3.11
fi

if python --version 2>&1 | grep -q '^Python 3\.'; then
  echo Python 3 detected
else
  echo Installing python 3
  sudo apt install python-is-python3
fi

