echo Linux coreutils setup start.

if [ -z 'realpath 2>/dev/null' ]; then
  if which grealpath ; then
    REALPATHBIN=grealpath
  else
    echo 'please install linux core utils, macos: `brew install coreutils`'
    exit 1
  fi
else
  REALPATHBIN=realpath
fi

echo coreutils setup complete.
