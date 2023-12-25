#!/usr/bin/env bash

# probably only works for linux

pushd ~/.config/nvim/ || exit

# clone version and build it
cd neovim_src || exit

echo "=== start install"
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..
echo "=== build install"

popd || exit
