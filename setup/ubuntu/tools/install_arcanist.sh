#!/bin/bash

# https://secure.phabricator.com/book/phabricator/article/arcanist/

set -e
set -v

####################
# Install Arcanist #
####################

INSTALL_PATH="$HOME/.arc"
VERSION="stable"

if [ "$(uname)" != Darwin ] && ! dpkg -s git php7.0-cli php7.0-curl 1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y \
        git \
        php7.0-cli \
        php7.0-curl
fi

mkdir -p "$INSTALL_PATH"
pushd "$INSTALL_PATH" >/dev/null

git clone -b "$VERSION" --depth=1 https://github.com/phacility/libphutil.git
git clone -b "$VERSION" --depth=1 https://github.com/phacility/arcanist.git

if [ "$(uname)" == Darwin ]; then
    BASHRC="$HOME/.bash_profile"
else
    BASHRC="$HOME/.bashrc"
fi

# shellcheck disable=SC2016
echo 'export PATH="$PATH:'"$INSTALL_PATH"'/arcanist/bin/"' >>"$BASHRC"
echo "source $INSTALL_PATH/arcanist/resources/shell/bash-completion" >>"$BASHRC"

popd >/dev/null
