#!/bin/bash

pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null
set -e
set -v

echo 'source ~/.config/dotfiles/bashrc' >> ~/.bashrc
ln -sf ~/.config/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.config/dotfiles/gitconfig ~/.gitconfig

./ubuntu/common/basic.sh
./ubuntu/common/advanced.sh
./ubuntu/tools/install_tmux.sh
./ubuntu/tools/install_arcanist.sh
./ubuntu/tools/install_fzf.sh
./ubuntu/tools/install_bazel.sh
./ubuntu/tools/install_bazelisk.sh
./ubuntu/tools/install_node.sh
./ubuntu/tools/install_python3.sh
./ubuntu/tools/install_pyenv.sh
./ubuntu/customize/vim.sh
./ubuntu/tools/pip.sh
./ubuntu/tools/npm.sh
sudo snap install \
    shfmt \
    shellcheck

popd >/dev/null
