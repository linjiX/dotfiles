#!/bin/bash

set -euo pipefail
set -x

if ! dpkg -s curl &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y curl
fi

# https://github.com/nodesource/distributions#debinstall
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
