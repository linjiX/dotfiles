#!/bin/bash

pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null
set -e
set -v

echo 'source ~/.config/dotfiles/bashrc' >> ~/.bashrc
echo 'source ~/.config/dotfiles/tmux.conf' >> ~/.tmux.conf

./ubuntu/basic.sh
./ubuntu/advanced.sh
./ubuntu/tmux.sh
./ubuntu/pyenv.sh
./ubuntu/vim.sh
./ubuntu/applications.sh
sudo snap install \
    shfmt \
    shellcheck

popd >/dev/null
