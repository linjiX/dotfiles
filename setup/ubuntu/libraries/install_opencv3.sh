#!/bin/bash

# http://wiki.ros.org/kinetic/Installation/Ubuntu

set -e
set -v

if ! dpkg -s lsb-release 1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y lsb-release
fi

# shellcheck source=/dev/null
source /etc/lsb-release
echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $(lsb_release -cs) main" |
    sudo tee /etc/apt/sources.list.d/ros-latest.list

sudo apt-key adv \
    --keyserver 'hkp://keyserver.ubuntu.com:80' \
    --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
sudo apt-get install -y ros-kinetic-opencv3

# shellcheck disable=SC2016
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/ros/kinetic/lib/x86_64-linux-gnu"' >> ~/.bashrc
