set -o nounset                              # Treat unset variables as an error

if ! which realpath ; then
  if which grealpath ; then
    REALPATHBIN=grealpath
  else
    echo 'please install linux core utils, macos: `brew install coreutils`'
    exit 1
  fi
else
  REALPATHBIN=realpath
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPOHOME=$SCRIPT_DIR/..
NOW=`date +%s`
LUADFCFGDIR=$($REALPATHBIN $REPOHOME/nvim)
LUADFCFG=$LUADFCFGDIR/init.lua
LUADFCFGCUSTOMDIR=$LUADFCFGDIR/lua
NVIMCFGDIR=$HOME/.config/nvim
LUACFG=$NVIMCFGDIR/init.lua
LUACFGBKUP=$LUACFG.$NOW.bak
LUACFGCUSTOMDIR=$HOME/.config/nvim/lua
SRCDIR=$HOME/src
NVIMINSTALLDIR=$SRCDIR/nvim_repo
TMUXCONFIGDF=$REPOHOME/.tmux.conf
TMUXCONFIG=$HOME/.tmux.conf
TMUXCONFIGBKUP=$TMUXCONFIG.$NOW.bak

echo "LUADFCFGDIR $LUADFCFGDIR"
echo "LUADFCFG $LUADFCFG"
echo "NVIMCFGDIR $NVIMCFGDIR"
echo "LUACFG $LUACFG"
echo "LUACFGBKUP $LUACFGBKUP"
echo "LUADFCFGCUSTOMDIR $LUADFCFGCUSTOMDIR"
echo "LUACFGCUSTOMDIR $LUACFGCUSTOMDIR"
echo "SRCDIR $SRCDIR"
echo "NVIMINSTALLDIR $NVIMINSTALLDIR"
echo "TMUXCONFIGDF $TMUXCONFIGDF"
echo "TMUXCONFIG $TMUXCONFIG"
echo "TMUXCONFIGBKUP $TMUXCONFIGBKUP"

if ! which tmux ; then
  echo 'Installing tmux'
  sudo apt-get update
  sudo apt-get install tmux
fi

if ! which nvim ; then
  echo 'neovim not detetcted, installing neovim'
  pushd $SRCDIR
  git clone https://github.com/neovim/neovim
  pushd neovim
  git fetch origin v0.7.0
  git checkout v0.7.0
  sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen 
  echo 'installing neovim depedencies.'
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install 
else
  echo 'neovim exists. Not installing.'
fi

# install vimplug if it isn't already
if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ] ; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

if [ -f $LUACFG ]; then
  echo "Backing up lua vim config to $LUACFGBKUP"
  mv $LUACFG $LUACFGBKUP
  echo "Done"
fi

if [ ! -d $LUACFGDIR ]; then
  echo "Nvim config directory does not exist, creating $LUACFGDIR"
  mkdir $LUACFGDIR
fi

if [ -f $TMUXCONFIG ] ; then
  echo 'Backing up tmux config'
  mv $TMUXCONFIG $TMUXCONFIGBKUP
fi

echo 'symlinking tmux config'
if ! ln -s $TMUXCONFIGDF $TMUXCONFIG ; then
  echo "Oh no! Something went wrong when we tried \n\n'ln -s $TMUXCONFIGDF $TMUXCONFIG'\n\n. may need to run it with sudo."
fi

echo "symlinking $LUACFGCUSTOMDIR -> $LUADFCFGCUSTOMDIR"
ln -s $LUADFCFGCUSTOMDIR $LUACFGCUSTOMDIR

echo "symlinking $LUACFG -> $LUADFCFG"
ln -s $LUADFCFG $LUACFG
