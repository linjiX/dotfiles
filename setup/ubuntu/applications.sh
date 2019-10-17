#!/bin/bash

set -e
set -v

sudo add-apt-repository -y ppa:dawidd0811/neofetch
sudo apt-get update
sudo apt-get install -y \
    tree \
    htop \
    arcanist \
    ranger \
    neofetch
sudo apt-get -y upgrade

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# NeoVim
pip3 install neovim

# Git
pip3 install gitlint

# bash
sudo npm install --global bash-language-server
sudo apt-get install -y shellcheck

# Python
pip3 install yapf isort ipython pylint flake8

# C/C++
~/.vim/setup/install_clang_format.sh
# ~/.vim/setup/install_cppcheck.sh
# ~/.vim/setup/install_ccls.sh

# Bazel
~/.vim/setup/install_bazel.sh
# ~/.vim/setup/install_buildifier.sh

# Json
pip3 install demjson
sudo npm install --global prettier

# Markdown
# npm install --global prettier

# cmake
pip3 install cmake_format cmakelint

# Dockerfile
sudo npm install --global dockerfile-language-server-nodejs
~/.vim/setup/install_hadolint.sh

# VimScript
pip3 install vim-vint

# tldr
sudo npm install --global tldr

