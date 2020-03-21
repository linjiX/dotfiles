#!/bin/bash

set -e
set -v

git clone --depth=1 https://github.com/linjiX/.vim.git ~/.vim
~/.vim/setup/install_vim.sh

# bazel
~/.vim/setup/install_buildifier.sh

# C++
~/.vim/setup/install_ccls.sh
~/.vim/setup/install_clang_format.sh
~/.vim/setup/install_cppcheck.sh

# Dockerfile
~/.vim/setup/install_hadolint.sh

# php
~/.vim/setup/install_phpcs.sh

# shell
~/.vim/setup/install_shfmt.sh

# json
~/.vim/setup/install_jq.sh
