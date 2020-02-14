#!/bin/bash

set -e
set -v

sudo apt-get update
sudo apt-get install -y \
    curl \
    wget \
    bash-completion \
    git \
    man \
    rar \
    unrar \
    pkg-config \
    iputils-ping \
    autoconf \
    openssh-server \
    software-properties-common
