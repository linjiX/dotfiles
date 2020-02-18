#!/bin/bash

pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null
set -e
set -v

echo 'source ~/.config/dotfiles/bashrc' >> ~/.bashrc
ln -sf ~/.config/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.config/dotfiles/gitconfig ~/.gitconfig

./ubuntu/common/basic.sh
./ubuntu/common/advanced.sh
./ubuntu/common/dircolors.sh
./ubuntu/tools/tmux.sh
./ubuntu/tools/pyenv.sh
./ubuntu/tools/pip.sh
./ubuntu/tools/npm.sh
./ubuntu/customize/vim.sh
sudo snap install \
    shfmt \
    shellcheck

popd >/dev/null
