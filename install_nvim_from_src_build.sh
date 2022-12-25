#!/bin/bash

# fill out version branch below
# branch="release-0.8"
branch="stable"

srcdir="neovim_src"

pushd ~/.config/nvim/

if [[ ! -d $srcdir ]] ; then
  # clone version 
  echo === clone repo
  git clone https://github.com/neovim/neovim.git $srcdir
fi
cd $srcdir
echo === checkout & pull
git checkout $branch
git pull

echo === start build
make CMAKE_BUILD_TYPE=Release
make build
echo === build done
echo === build version
./build/bin/nvim --version
cd ..

popd
