#!/bin/bash

# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv-installer

set -euo pipefail
set -x

readonly VERSION=3.8.2

sudo apt-get update
sudo apt-get install -y \
    curl \
    git \
    gcc \
    make \
    zlib1g-dev \
    libbz2-dev \
    libssl-dev \
    libffi-dev \
    libsqlite3-dev \
    libreadline-dev

curl https://pyenv.run | bash

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

set +u
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
set -u

pyenv install $VERSION
pyenv global $VERSION
pip3 install --upgrade pip
