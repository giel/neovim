#!/bin/bash

# todo check if it works for linux

echo === start uninstall
sudo rm -f /usr/local/share/man/man1/nvim.*
sudo rm -f /usr/local/bin/nvim
sudo rm -rdf /usr/local/lib/nvim
sudo rm -f /usr/local/share/locale/*/LC_MESSAGES/nvim.mo

# todo
# /usr/local/share/locale/cs.cp1250/LC_MESSAGES/nvim.mo
# /usr/local/share/locale/tr/LC_MESSAGES/nvim.mo
sudo rm -rd /usr/local/share/nvim/*

echo === uninstall done

