#!/bin/bash

set -e
set -v

sudo add-apt-repository -y ppa:dawidd0811/neofetch
sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt-add-repository -y ppa:ubuntu-toolchain-r/test

sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main'
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc | sudo apt-key add -
sudo apt-add-repository 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-9 main'
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

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
    cmake \
    llvm-9 \
    libclang-9-dev \
    clang-9 \
    golang-go \
    gcc-9 \
    g++-9

sudo ln -sf /usr/bin/gcc-9 /usr/bin/gcc
sudo ln -sf /usr/bin/g++-9 /usr/bin/g++

# dircolors
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark \
    -o ~/.dircolors
