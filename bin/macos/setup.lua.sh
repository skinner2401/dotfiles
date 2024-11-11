#!/bin/bash - 

set -o nounset                              # Treat unset variables as an error

echo 'Installing lua'
sudo apt-get update 
sudo apt-get install lua5.2 liblua5.2

echo 'Installing luarocks'
wget https://luarocks.org/releases/luarocks-3.9.0.tar.gz 

echo 'Unzipping lua'
tar zxpf luarocks-3.9.0.tar.gz

echo 'configuring lua install' 
pushd luarocks-3.9.0

if ! ./configure --with-lua ; then
  echo 'lua configuration failed, please investigate.'
  exit 1
fi

echo 'making lua'
make --with-lua

echo 'installing lua'
sudo make install --with-lua

echo 'installing luasocket'
sudo luarocks install luasocket
