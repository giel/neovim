#!/bin/bash

# probably only works for linux

pushd ~/.config/nvim/

# clone version and build it 
cd neovim_src

echo === start install
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..
echo === build install

popd
