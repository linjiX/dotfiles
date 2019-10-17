#!/bin/bash

pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null
set -e
set -v

echo 'source ~/.config/dotfiles/bashrc' >> ~/.bashrc
echo 'source ~/.config/dotfiles/tmux.conf' >> ~/.tmux.conf

pushd ubuntu >/dev/null

./basic.sh
./tmux.sh
./vim.sh
./pyenv.sh
./applications.sh
sudo snap install shfmt
./dircolors.sh
