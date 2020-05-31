#!/bin/bash

set -euo pipefail
set -x

# bash config
echo 'source ~/.config/dotfiles/bash/bashrc' >>~/.bashrc

# git config
ln -sf ~/.config/dotfiles/git/gitconfig ~/.gitconfig

# tmux config
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth=1 https://github.com/tmux-plugins/tmux-cpu ~/.tmux/plugins/tmux-cpu
ln -sf ~/.config/dotfiles/tmux/tmux.conf ~/.tmux.conf

# ranger config
git clone --depth=1 https://github.com/alexanderjeurissen/ranger_devicons \
    ~/.config/ranger/plugins/ranger_devicons
pushd ~/.config/ranger/plugins/ranger_devicons >/dev/null
make install
popd
ln -sf ~/.config/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
