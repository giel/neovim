#!/usr/bin/env bash

# probably only works for linux

pushd ~/.config/nvim/ || exit

echo "=== removing build directory"
rm -rf neovim_src/*
rm -rf neovim_src/.*
rmdir neovim_src
popd || exit
