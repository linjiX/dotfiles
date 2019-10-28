#!/bin/bash

set -e
set -v

sudo add-apt-repository -y ppa:dawidd0811/neofetch
sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install -y \
    tree \
    htop \
    arcanist \
    ranger \
    neofetch \
    golang-go
