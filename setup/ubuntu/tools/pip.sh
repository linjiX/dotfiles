#!/bin/bash

set -e
set -v

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# NeoVim
pip3 install neovim

# Git
pip3 install gitlint

# Python
pip3 install \
    black \
    isort \
    ipython \
    pylint \
    flake8 \
    mypy

# C/C++
pip3 install cpplint

# Json
pip3 install demjson

# cmake
pip3 install \
    cmake_format \
    cmakelint

# VimScript
pip3 install vim-vint
