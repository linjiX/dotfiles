#!/bin/bash

set -euo pipefail
set -x

git clone --depth=1 https://github.com/linjiX/dotfiles.git ~/.config/dotfiles/
~/.config/dotfiles/setup.sh
