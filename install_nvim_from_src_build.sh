#!/bin/bash

# fill out version branch below
branch="release-0.8"

pushd ~/.config/nvim/

# clone version and build it 
echo === clone repo
git clone https://github.com/neovim/neovim.git neovim_src
cd neovim_src
git checkout $branch

echo === start build
make CMAKE_BUILD_TYPE=Release
make build
cd ..
echo === build done

popd
