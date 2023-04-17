#!/bin/bash

srcdir="nvim-AstroNvim"
giturl=https://github.com/AstroNvim/AstroNvim

pushd ~/.config

if [[ ! -d $srcdir ]]; then
	# clone version
	echo === clone repo
	git clone --depth 1 $giturl $srcdir
fi

popd
