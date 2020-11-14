#!/bin/bash

set -euo pipefail
set -x

sudo apt-get update

readonly TZ=Asia/Shanghai
sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
sudo echo $TZ | sudo tee /etc/timezone
sudo apt-get install -y tzdata

sudo apt-get install -y \
    curl \
    wget \
    bash-completion \
    man \
    rar \
    unrar \
    pkg-config \
    iputils-ping \
    autoconf \
    openssh-server \
    software-properties-common \
    apt-transport-https
