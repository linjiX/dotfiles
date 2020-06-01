#!/bin/bash

# https://github.com/bazelbuild/bazelisk

[ -r /etc/lsb-release ] && source /etc/lsb-release
if [[ "$DISTRIB_CODENAME" != 'xenial' && "$DISTRIB_CODENAME" != 'focal' ]]; then
    echo 'Only support ubuntu 16.04 and 20.04'
    exit 1
fi

set -euo pipefail
set -x

if ! command -v go &>/dev/null; then
    if [ "$DISTRIB_CODENAME" == 'xenial' ]; then
        if ! dpkg -s git software-properties-common &>/dev/null; then
            sudo apt-get update
            sudo apt-get install -y \
                software-properties-common \
                git
        fi
        sudo apt-add-repository -y ppa:longsleep/golang-backports
    fi
    sudo apt-get update
    sudo apt-get install -y golang-go
fi

readonly GOPATH="$(mktemp -d /tmp/install_bazelisk.XXXX)"
export GOPATH
go get github.com/bazelbuild/bazelisk
sudo mv "$GOPATH/bin/bazelisk" /usr/local/bin
