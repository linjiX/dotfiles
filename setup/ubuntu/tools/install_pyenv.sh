#!/bin/bash

set -euo pipefail
set -x

readonly VERSION=3.8.2

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

set +u
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
set -u

pyenv install $VERSION
pyenv global $VERSION
pip3 install --upgrade pip
