echo Linux CoreUtils setup start.
if ! which realpath ; then
  if which grealpath ; then
    REALPATHBIN=grealpath
  else
    echo 'please install linux core utils, macos: `brew install coreutils`'
    exit 1
  fi
else
  echo Coreutils already installed.
  REALPATHBIN=realpath
fi
echo CoreUtils setup complete.
