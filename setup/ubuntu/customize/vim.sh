#!/bin/bash

[ -r /etc/lsb-release ] && source /etc/lsb-release
if [[ "$DISTRIB_CODENAME" != 'xenial' && "$DISTRIB_CODENAME" != 'focal' ]]; then
    echo 'Only support ubuntu 16.04 and 20.04'
    exit 1
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pip3 install neovim

set -euo pipefail
set -x

curl -sS https://raw.githubusercontent.com/linjiX/.vim/master/setup/setup.sh | bash

readonly SETUP=$HOME/.config/nvim/setup

# Vim8
"$SETUP/vim8.sh"

if [ "$DISTRIB_CODENAME" == 'xenial' ]; then
    # C++
    "$SETUP/install_ccls.sh"
    "$SETUP/install_clang_format.sh"
    "$SETUP/install_cppcheck.sh"

    # php
    "$SETUP/install_phpcs.sh"

    # json
    "$SETUP/install_jq.sh"
fi

# bazel
"$SETUP/install_buildifier.sh"

# Dockerfile
"$SETUP/install_hadolint.sh"

# shell
"$SETUP/install_shfmt.sh"
