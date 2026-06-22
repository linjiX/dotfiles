#!/bin/bash

REPOSITORY="https://github.com/linjiX/dotfiles.git"
DOTFILES="$HOME/.config/dotfiles"

while getopts "g" opt; do
    case "$opt" in
    g) REPOSITORY="git@github.com:linjiX/dotfiles.git" ;;
    ?) echo "Invalid flag!" && exit 1 ;;
    esac
done

set -euo pipefail
set -x

git clone --depth=1 $REPOSITORY "$DOTFILES"

append_source_once() {
    local file="$1"
    local line="$2"

    touch "$file"
    grep -qxF "$line" "$file" || echo "$line" >>"$file"
}

# bash config
append_source_once ~/.bashrc 'source ~/.config/dotfiles/bash/bashrc.bash'
if [ "$(uname)" == Darwin ]; then
    append_source_once ~/.bash_profile '[ -r ~/.bashrc ] && source ~/.bashrc'
fi

# zsh config
append_source_once ~/.zshrc 'source ~/.config/dotfiles/zsh/zshrc.zsh'
if [ ! -d ~/.oh-my-zsh ]; then
    git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi
if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        ~/.oh-my-zsh/custom/themes/powerlevel10k
fi
if [ -r "$DOTFILES/zsh/p10k.zsh" ]; then
    ln -sf "$DOTFILES/zsh/p10k.zsh" ~/.p10k.zsh
fi

# git config
ln -sf ~/.config/dotfiles/git/gitconfig ~/.gitconfig

# tmux config
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth=1 https://github.com/tmux-plugins/tmux-cpu ~/.tmux/plugins/tmux-cpu
ln -sf ~/.config/dotfiles/tmux/tmux.conf ~/.tmux.conf

# ranger config
git clone --depth=1 https://github.com/alexanderjeurissen/ranger_devicons \
    ~/.config/ranger/plugins/ranger_devicons
ln -sf ~/.config/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf

# iterm2 Specify the preferences directory
if [ "$(uname)" == Darwin ]; then
    defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DOTFILES/iterm2/"
    defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
    defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile_selection 2
fi
