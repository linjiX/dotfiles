#!/bin/bash

# https://emscripten.org/index.html
# https://github.com/emscripten-core/emsdk

set -euo pipefail
set -x

#################
# Install emsdk #
#################

readonly INSTALL_PATH="/opt/emsdk"
readonly VERSION="1.39.16"

if ! dpkg -s git python3-dev bzip2 xz-utils &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y \
        git \
        python3-dev \
        bzip2 \
        xz-utils
fi

if [ ! -d $INSTALL_PATH ]; then
    sudo mkdir -m 777 $INSTALL_PATH
    git clone --depth=1 https://github.com/emscripten-core/emsdk.git $INSTALL_PATH
fi

pushd $INSTALL_PATH >/dev/null
git pull

./emsdk install $VERSION
./emsdk activate $VERSION

python3 ./upstream/emscripten/embuilder.py build zlib

echo "[ -f $INSTALL_PATH/emsdk_env.sh ] && source $INSTALL_PATH/emsdk_env.sh >/dev/null" \
    >>~/.bashrc

popd >/dev/null
