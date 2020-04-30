#!/bin/bash

# https://pdal.io
# https://github.com/PDAL/PDAL
# https://launchpad.net/%7Eubuntugis/+archive/ubuntu/ppa/+index?batch=75&memo=75&start=75

set -euo pipefail
set -x

################
# Install PDAL #
################

readonly VERSION="2.0.1"
readonly TARFILE="PDAL-$VERSION-src.tar.gz"
readonly DIR="PDAL-$VERSION-src"

if ! dpkg -s software-properties-common 1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y software-properties-common
fi

sudo apt-add-repository -y ppa:ubuntugis/ppa
sudo apt-get update
sudo apt-get install -y \
    wget \
    cmake \
    make \
    libgdal-dev \
    libunwind-dev

readonly TMPDIR="$(mktemp -d /tmp/install_pdal.XXXX)"
pushd "$TMPDIR" >/dev/null
wget -c https://github.com/PDAL/PDAL/releases/download/$VERSION/$TARFILE
tar -xf $TARFILE
pushd $DIR >/dev/null
mkdir build
pushd build >/dev/null

cmake ..
make -j "$(nproc)"
sudo make install

popd >/dev/null
popd >/dev/null
popd >/dev/null
