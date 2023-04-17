#!/bin/bash

srcdir="nvim-LazyVim"
giturl=https://github.com/LazyVim/starter

pushd ~/.config

if [[ ! -d $srcdir ]]; then
	# clone version
	echo === clone repo
	git clone --depth 1 $giturl $srcdir
fi

popd
