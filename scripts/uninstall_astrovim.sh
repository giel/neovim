#!/bin/bash

srcdir="nvim-AstroNvim"

pushd ~/.config
if [[ -d $srcdir ]]; then
	cd $srcdir
	echo === removing $(pwd)
	cd ..
	rm -rfd $srcdir
fi

popd

pushd ~/.local/share
if [[ -d $srcdir ]]; then
	cd $srcdir
	echo === removing $(pwd)
	cd ..
	rm -rfd $srcdir
fi

popd
