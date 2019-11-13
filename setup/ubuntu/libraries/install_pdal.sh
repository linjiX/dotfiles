#!/bin/bash

# https://pdal.io
# https://launchpad.net/%7Eubuntugis/+archive/ubuntu/ppa/+index?batch=75&memo=75&start=75

set -e
set -v

################
# Install PDAL #
################

if ! dpkg -s software-properties-common 1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y software-properties-common
fi

sudo apt-add-repository -y ppa:ubuntugis/ppa
sudo apt-get update
sudo apt-get install -y libpdal-dev
