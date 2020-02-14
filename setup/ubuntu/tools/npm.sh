#!/bin/bash

set -e
set -v

# bash
sudo npm install --global bash-language-server

# Markdown
sudo npm install --global markdownlint-cli
sudo npm install --global prettier

# Dockerfile
sudo npm install --global dockerfile-language-server-nodejs

# xml
sudo npm install --global prettydiff

# tldr
sudo npm install --global tldr
