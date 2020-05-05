#!/bin/bash

[ -r /etc/lsb-release ] && source /etc/lsb-release
if [[ "$DISTRIB_CODENAME" != 'xenial' && "$DISTRIB_CODENAME" != 'focal' ]]; then
    echo 'Only support ubuntu 16.04 and 20.04'
    exit 1
fi

set -euo pipefail
set -x

if [ "$DISTRIB_CODENAME" == 'xenial' ]; then
    sudo add-apt-repository -y ppa:dawidd0811/neofetch
    sudo add-apt-repository -y ppa:longsleep/golang-backports

    sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main'
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc | sudo apt-key add -
fi

sudo apt-get update
sudo apt-get install -y \
    tree \
    htop \
    cloc \
    git-extras \
    trash-cli \
    silversearcher-ag \
    ranger \
    libxml2-utils

sudo apt-get install -y \
    neofetch \
    cmake \
    golang-go

if [ "$DISTRIB_CODENAME" == 'focal' ]; then
    sudo apt-get install -y \
        gcc \
        g++ \
        universial-ctags \
        global \
        ripgrep \
        clang-format \
        cppcheck \
        ccls \
        shellcheck \
        php-codesniffer \
        jq
fi

# dircolors
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark \
    -o ~/.dircolors
