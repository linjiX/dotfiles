#!/bin/bash

set -e
set -v

VERSION=3.7.4

sudo apt-get update
sudo apt-get install -y \
    libbz2-dev \
    libssl-dev \
    libffi-dev \
    libsqlite3-dev \
    libreadline6-dev

git clone --depth=1 https://github.com/pyenv/pyenv.git ~/.pyenv
git clone --depth=1 https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

pyenv install $VERSION
pyenv global $VERSION
pip3 install --upgrade pip
