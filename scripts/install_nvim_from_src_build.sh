#!/usr/bin/env bash

# fill out version branch below
# version="release-0.9"
version="v0.9.1"

srcdir="neovim_src"

pushd ~/.config/nvim/

if [[ ! -d $srcdir ]]; then
	# clone version
	echo === clone repo
	git clone https://github.com/neovim/neovim.git $srcdir
fi
cd $srcdir
echo === checkout and pull $version
git checkout $version
git pull

echo === start build
make CMAKE_BUILD_TYPE=Release
make build
echo === build done
echo === build version
./build/bin/nvim --version
cd ..

echo --- old version
nvim --version

popd
