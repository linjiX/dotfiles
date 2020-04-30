#!/bin/bash

set -euo pipefail
set -x

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
    software-properties-common \
    apt-transport-https
