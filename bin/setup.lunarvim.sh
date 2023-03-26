#!/usr/bin/bash

set -o nounset                              # Treat unset variables as an error

scriptdir="$( dirname -- "$BASH_SOURCE"; )";
. $scriptdir/setup.coreutils.sh

#SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
#REPOHOME=$SCRIPT_DIR/..
#NOW=`date +%s`
#LUADFCFGDIR=$($REALPATHBIN $REPOHOME/nvim)
#SRCDIR=$HOME/src

#. $scriptdir/setup.neovim.sh

LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
