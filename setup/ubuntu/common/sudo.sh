#!/bin/bash

set -e
set -v

cp /etc/apt/sources.list /etc/apt/sources.list.origin
cp /etc/apt/sources.list.ustc /etc/apt/sources.list

apt-get update
apt-get install -y sudo
