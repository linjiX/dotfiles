#!/bin/bash

set -euo pipefail
set -x

if ! dpkg -s curl 1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y curl
fi

# https://github.com/nodesource/distributions#debinstall
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
