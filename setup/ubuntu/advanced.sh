#!/bin/bash

set -e
set -v

sudo add-apt-repository -y ppa:dawidd0811/neofetch
sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt-add-repository -y ppa:ubuntu-toolchain-r/test

sudo apt-get update
sudo apt-get install -y \
    tree \
    htop \
    cloc \
    git-extras \
    silversearcher-ag \
    arcanist \
    ranger \
    neofetch \
    libxml2-utils \
    golang-go \
    gcc-9 \
    g++-9

sudo ln -sf /usr/bin/gcc-9 /usr/bin/gcc
sudo ln -sf /usr/bin/g++-9 /usr/bin/g++
