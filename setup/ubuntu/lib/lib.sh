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

./install/install_pdal.sh
./install/install_rapidjson.sh
./install/install_emsdk.sh
./install/install_opencv3.sh

popd >/dev/null
