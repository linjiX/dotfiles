#!/bin/bash

set -euo pipefail
set -x

# https://github.com/nodesource/distributions#debinstall

curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs
