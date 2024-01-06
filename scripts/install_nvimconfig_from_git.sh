#!/usr/bin/env bash

# move old dir to backup dir and create a new rcdir
dirname=nvim
srcdirRoot=~/.config
srcdir=$srcdirRoot/$dirname
dd=$(date "+%Y%m%d_%H%M")
bakupPostfix=_bak_$dd

echo "=== backing up to $srcdir$bakupPostfix"
mv $srcdir $srcdir$bakupPostfix

if [[ ! -d $srcdir ]]; then
	pushd $srcdirRoot || exit
	# clone version
	echo "=== clone repo"
	git clone git@github.com:giel/neovim.git $dirname
	popd || exit
else
	echo "=== could not clone neovim config"
fi
