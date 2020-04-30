#!/bin/bash

set -euo pipefail
set -x

git clone --depth=1 https://github.com/linjiX/dotfiles.git ~/.config/dotfiles/

echo 'source ~/.config/dotfiles/bashrc' >> ~/.bashrc
ln -sf ~/.config/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.config/dotfiles/gitconfig ~/.gitconfig
