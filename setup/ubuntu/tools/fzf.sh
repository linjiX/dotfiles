#!/bin/bash

set -e
set -v

git clone --depth=1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
