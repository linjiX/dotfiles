#!/bin/bash

[ -r /etc/lsb-release ] && source /etc/lsb-release
if [[ "$DISTRIB_CODENAME" != 'xenial' && "$DISTRIB_CODENAME" != 'focal' ]]; then
    echo 'Only support ubuntu 16.04 and 20.04'
    exit 1
fi

set -euo pipefail
set -x

curl -sS https://raw.githubusercontent.com/linjiX/.vim/master/setup/setup.sh | bash

if [ "$DISTRIB_CODENAME" == 'xenial' ]; then
    # C++
    ~/.vim/setup/install_ccls.sh
    ~/.vim/setup/install_clang_format.sh
    ~/.vim/setup/install_cppcheck.sh

    # php
    ~/.vim/setup/install_phpcs.sh

    # json
    ~/.vim/setup/install_jq.sh
fi

# bazel
~/.vim/setup/install_buildifier.sh

# Dockerfile
~/.vim/setup/install_hadolint.sh

# shell
~/.vim/setup/install_shfmt.sh
