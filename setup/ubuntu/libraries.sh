#!/bin/bash

pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null
set -e
set -v

sudo apt-get update
sudo apt-get install -y \
    libpcl-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    libeigen3-dev \
    libboost-dev

./libraries/install_pdal.sh
./libraries/install_rapidjson.sh
./libraries/install_emsdk.sh
./libraries/install_opencv3.sh

popd >/dev/null
