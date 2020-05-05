#!/bin/bash

set -euo pipefail
set -x

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

set +u
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
set -u

pip3 install wheel
pip3 install -r "$(dirname "${BASH_SOURCE[0]}")/requirements.txt"
