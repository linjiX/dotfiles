#!/bin/bash

pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null
set -euo pipefail
set -x

[ -r /etc/lsb-release ] && source /etc/lsb-release

echo 'source ~/.config/dotfiles/bash/bashrc' >>~/.bashrc

./ubuntu/common/basic.sh
./ubuntu/common/advanced.sh

# git
ln -sf ~/.config/dotfiles/git/gitconfig ~/.gitconfig

# tmux
ln -sf ~/.config/dotfiles/tmux/tmux.conf ~/.tmux.conf
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth=1 https://github.com/tmux-plugins/tmux-cpu ~/.tmux/plugins/tmux-cpu

# ranger config
git clone --depth=1 https://github.com/alexanderjeurissen/ranger_devicons \
    ~/.config/ranger/plugins/ranger_devicons
ln -sf ~/.config/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf

if [ "$DISTRIB_CODENAME" == 'xenial' ]; then
    ./ubuntu/tools/install_gcc.sh
fi

./ubuntu/tools/install_node.sh
./ubuntu/tools/install_pyenv.sh
./ubuntu/tools/install_arcanist.sh
./ubuntu/tools/install_fzf.sh
./ubuntu/tools/install_bazel.sh
./ubuntu/tools/install_bazelisk.sh
./ubuntu/customize/vim.sh
./ubuntu/tools/pip.sh
./ubuntu/tools/npm.sh
sudo snap install \
    shfmt \
    shellcheck

popd >/dev/null
