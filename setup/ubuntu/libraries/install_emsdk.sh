#!/bin/bash

# https://emscripten.org/index.html

set -e
set -v

#################
# Install emsdk #
#################

INSTALL_PATH="/opt/emsdk"
VERSION="1.39.3"

if ! dpkg -s git 1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y git
fi

if [ ! -d $INSTALL_PATH ]; then
    sudo git clone https://github.com/emscripten-core/emsdk.git $INSTALL_PATH
fi

pushd $INSTALL_PATH >/dev/null
sudo git pull

sudo ./emsdk install $VERSION
./emsdk activate $VERSION

echo "[ -f /opt/emsdk/emsdk_env.sh ] && source /opt/emsdk/emsdk_env.sh >/dev/null" >> ~/.bashrc

popd >/dev/null
