#!/bin/bash

# https://www.bazel.build/

set -euo pipefail
set -x

#################
# Install Bazel #
#################

if ! dpkg -s curl apt-transport-https &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y \
        curl \
        apt-transport-https
fi

curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" |
    sudo tee /etc/apt/sources.list.d/bazel.list

sudo apt-get update
sudo apt-get install -y bazel
