# dotfiles

My linux configuration

## Content

-   bashrc
-   tmux
-   gitconfig

## Usage

```bash
git clone git@github.com:linjiX/dotfiles.git ~/.config/dotfiles
echo 'source ~/.config/dotfiles/bash/bashrc' >> ~/.bashrc
ln -sf ~/.config/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/.config/dotfiles/git/gitconfig ~/.gitconfig
```
