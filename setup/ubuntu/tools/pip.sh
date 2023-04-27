#!/bin/bash

set -euo pipefail
set -x

readonly VERSIONS="3.6.2 3.8.6 3.10.6"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

set +u
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
set -u

for version in $VERSIONS; do
    pyenv global "$version"
    pip3 install wheel
    pip3 install -r "$(dirname "${BASH_SOURCE[0]}")/requirements.txt"
done
