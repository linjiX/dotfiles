#!/bin/bash

# https://wiki.ubuntu.com/ToolChain

[ -r /etc/lsb-release ] && source /etc/lsb-release
if [ "$DISTRIB_CODENAME" != 'xenial' ]; then
    echo 'Only support ubuntu 16.04'
    exit 1
fi

set -euo pipefail
set -x

###############
# Install gcc #
###############

if ! dpkg -s software-properties-common &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y software-properties-common
fi

sudo apt-add-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install -y \
    gcc-9 \
    g++-9

sudo ln -sf /usr/bin/gcc-9 /usr/bin/gcc
sudo ln -sf /usr/bin/g++-9 /usr/bin/g++
