#!/bin/bash

set -euo pipefail
set -x

sudo add-apt-repository -y ppa:hnakamur/tmux
sudo apt-get update
sudo apt-get install -y tmux

git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth=1 https://github.com/tmux-plugins/tmux-cpu ~/.tmux/plugins/tmux-cpu
