#!/bin/bash

set -e
set -v

git clone --depth=1 https://github.com/linjiX/.vim.git ~/.vim
~/.vim/setup/install_vim.sh
