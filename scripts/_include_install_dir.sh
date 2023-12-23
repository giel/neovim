#include file for other install_ files

pushd ~/.config

if [[ ! -d $srcdir ]]; then
	# clone version
	echo === clone repo
	git clone --depth 1 $giturl $srcdir
fi

popd
