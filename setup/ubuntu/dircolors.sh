#!/bin/bash

set -e
set -v

git clone --depth=1 https://github.com/seebi/dircolors-solarized.git ~/dircolors-solarized
cp ~/dircolors-solarized/dircolors.ansi-dark ~/.dircolors
rm -rf ~/dircolors-solarized
