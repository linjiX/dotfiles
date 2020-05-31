#!/bin/bash

set -euo pipefail
set -x

git clone --depth=1 https://github.com/linjiX/dotfiles.git ~/.config/dotfiles/

echo 'source ~/.config/dotfiles/bash/bashrc' >> ~/.bashrc
ln -sf ~/.config/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/.config/dotfiles/git/gitconfig ~/.gitconfig
