#!/bin/bash

set -e
set -v

git clone --depth=1 https://github.com/linjiX/.vim.git ~/.vim
~/.vim/setup/install_vim.sh

for file in ~/.vim/setup/*
do
    bash "$file"
done
