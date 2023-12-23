#include file for other install_ files

pushd ~/.config

if [[ ! -d $srcdir ]]; then
	# clone version
	echo === clone repo
	git clone --depth 1 $giturl $srcdir
fi

popd

echo
echo "Maybe use one of the aliases to activate this nvim version you can find with:"
echo "alias | grep nvim"
echo
