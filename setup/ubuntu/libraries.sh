#!/bin/bash

pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null
set -e
set -v

./libraries/install_pdal.sh
./libraries/install_rapidjson.sh
./libraries/install_emsdk.sh
./libraries/install_opencv3.sh

sudo apt-get update
sudo apt-get install -y \
    libpcl-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    libeigen3-dev \
    libboost-dev

popd >/dev/null
