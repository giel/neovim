#!/bin/bash

srcdir="nvim-NvChad"
giturl="https://github.com/NvChad/NvChad"

pushd ~/.config

if [[ ! -d $srcdir ]]; then
	# clone version
	echo === clone repo
	git clone --depth 1 $giturl $srcdir
fi

popd
