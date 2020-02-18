#!/bin/bash

set -e
set -v

git clone --depth=1 https://github.com/linjiX/dotfiles.git ~/.config/dotfiles/

echo 'source ~/.config/dotfiles/bashrc' >> ~/.bashrc
ln -sf ~/.config/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.config/dotfiles/gitconfig ~/.gitconfig
