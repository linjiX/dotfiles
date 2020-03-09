#############################################################################
#  https://github.com/linjiX/dotfiles                                       #
#   _  _          _  _ __  __    __   _         _     __  _  _              #
#  | |(_) _ __   (_)(_)\ \/ /   / /__| |  ___  | |_  / _|(_)| |  ___  ___   #
#  | || || '_ \  | || | \  /   / // _` | / _ \ | __|| |_ | || | / _ \/ __|  #
#  | || || | | | | || | /  \  / /| (_| || (_) || |_ |  _|| || ||  __/\__ \  #
#  |_||_||_| |_|_/ ||_|/_/\_\/_/  \__,_| \___/  \__||_|  |_||_| \___||___/  #
#              |__/                                                         #
#                                                                           #
#############################################################################

alias gitgraph='git log --graph --oneline --decorate --all'
alias ggr='git log --graph --oneline --decorate --all'

# git alias from oh-my-zsh
##################################################################################################
# alias g='git'
alias gst='git status'
alias gss='git status -s'
alias gsh='git stash'
alias gsp='git stash pop'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gdt='git difftool'
alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
# gdv() { git diff -w "$@" | view - }
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gco='git checkout'
alias gcm='git checkout master'
alias gr='git remote'
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gb='git branch'
alias gba='git branch -a'
alias gbv='git branch -vv'
alias gcount='git shortlog -sn'
alias gcl='git config --list'
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias glo='git log --oneline'
alias ga='git add'
alias gaa='git add -A'
alias grm='git rm'
alias grmc='git rm --cached'
alias gmv='git mv'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard && git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gf='git ls-files | grep'
alias gpoat='git push origin --all && git push origin --tags'
alias gmt='git mergetool'

alias gg='git gui citool'
alias gga='git gui citool --amend'
alias gk='gitk --all --branches'
alias gsts='git stash show --text'

# Will cd into the top of the current repository
# or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
current_branch() {
    ref=$(git symbolic-ref HEAD 2>/dev/null) ||
        ref=$(git rev-parse --short HEAD 2>/dev/null) || return
    echo "${ref#refs/heads/}"
}

current_repository() {
    ref=$(git symbolic-ref HEAD 2>/dev/null) ||
        ref=$(git rev-parse --short HEAD 2>/dev/null) || return
    git remote -v | cut -d':' -f 2
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
alias ggpur='git pull --rebase origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'

# Pretty log messages
_git_log_prettily() {
    if [ -n "$1" ]; then
        git log --pretty="$1"
    fi
}
alias glp="_git_log_prettily"

# vim:ft=sh
