#!/bin/bash

set -e
set -v

sudo apt-get update
sudo apt-get install -y \
    libpcl-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    libeigen3-dev \
    libboost-dev
