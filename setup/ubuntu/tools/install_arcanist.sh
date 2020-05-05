#!/bin/bash

# https://secure.phabricator.com/book/phabricator/article/arcanist/
# https://github.com/phacility/arcanist

set -euo pipefail
set -x

####################
# Install Arcanist #
####################

readonly INSTALL_PATH="$HOME/.arcanist"
readonly VERSION="stable"

if [ "$(uname)" != Darwin ] && ! dpkg -s git php-cli php-curl 1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y \
        git \
        php-cli \
        php-curl
fi

git clone -b "$VERSION" --depth=1 https://github.com/phacility/arcanist.git "$INSTALL_PATH"

"$INSTALL_PATH/bin/arc" shell-complete --generate

# For bash user
if [ "$(uname)" == Darwin ]; then
    readonly BASHRC="$HOME/.bash_profile"
else
    readonly BASHRC="$HOME/.bashrc"
fi

# shellcheck disable=SC2016
echo 'export PATH="$PATH:'"$INSTALL_PATH"'/bin"' >>"$BASHRC"
echo "source $INSTALL_PATH/support/shell/hooks/bash-completion.sh" >>"$BASHRC"

# For zsh user
readonly ZSHRC="$HOME/.zshrc"
# shellcheck disable=SC2016
echo 'export PATH="$PATH:'"$INSTALL_PATH"'/bin/"' >>"$ZSHRC"
echo "source $INSTALL_PATH/support/shell/hooks/bash-completion.sh" >>"$ZSHRC"
