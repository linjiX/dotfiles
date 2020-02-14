#!/bin/bash

set -e
set -v

git clone --depth=1 https://github.com/linjiX/dotfiles.git ~/.config/dotfiles/

echo 'source ~/.config/dotfiles/bashrc' >> ~/.bashrc
echo 'source ~/.config/dotfiles/tmux.conf' >> ~/.tmux.conf
