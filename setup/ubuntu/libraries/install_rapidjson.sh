#!/bin/bash

# https://github.com/Tencent/rapidjson

set -e
set -v

#####################
# Install rapidjson #
#####################

VERSION="1.1.0"
TARFILE="v$VERSION.tar.gz"
DIR="rapidjson-$VERSION"

if ! dpkg -s cmake make wget 1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y \
        wget \
        cmake \
        make
fi

TMPDIR="$(mktemp -d /tmp/install_rapidjson.XXXX)"
pushd "$TMPDIR" >/dev/null
wget https://github.com/Tencent/rapidjson/archive/$TARFILE
tar -xf $TARFILE
pushd $DIR >/dev/null
mkdir build
pushd build >/dev/null
cmake ..
make -j
sudo make install

popd >/dev/null
popd >/dev/null
popd >/dev/null
