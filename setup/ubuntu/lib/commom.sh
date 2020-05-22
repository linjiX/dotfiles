#!/bin/bash

[ -r /etc/lsb-release ] && source /etc/lsb-release
if [[ "$DISTRIB_CODENAME" != 'xenial' && "$DISTRIB_CODENAME" != 'focal' ]]; then
    echo 'Only support ubuntu 16.04 and 20.04'
    exit 1
fi

set -euo pipefail
set -x

sudo apt-get update

if [ "$DISTRIB_CODENAME" == 'focal' ]; then
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
    sudo apt-get install -y \
        rapidjson-dev \
        libpdal-dev \
        pdal
fi

sudo apt-get install -y \
    libpcl-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    libeigen3-dev \
    libboost-dev
