#!/bin/bash

set -e
set -v

useradd --no-log-init --create-home --shell /bin/bash $1
sed -i '20a '"$1"'\tALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers
echo $1':123' | chpasswd
