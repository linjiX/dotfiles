#!/bin/bash

set -e
set -v

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pip3 install -r "$(dirname "${BASH_SOURCE[0]}")/requirements.txt"
/usr/bin/pip3 install -r "$(dirname "${BASH_SOURCE[0]}")/requirements.txt"
