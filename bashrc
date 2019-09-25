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

# PS1
##################################################################################################
WHITE='\[\e[01;36m\]'
RED='\[\e[01;31m\]'
PURPLE='\[\e[01;35m\]'
GRAY='\[\e[01;33m\]'
RESET='\[\e[00m\]'

function timer_start {
    timer=${timer:-$SECONDS}
}

function timer_stop {
    timer_show=$(($SECONDS - $timer))
    unset timer
}

seconds2days() { # convert integer seconds to Ddays,HH:MM:SS
    if [ $1 -lt 3 ]; then
        return
    fi
    local s=$(($1%60))
    local m=$(($1/60%60))
    local h=$(($1/60/60%24))
    local d=$(($1/60/60/24))
    printf " took ";
    printf "%ddays,%02dh%02dm%02ds" $d $h $m $s | \
        sed 's/^1days/1day/;s/^0days,\(00[h|m|s]\)*//;s/^0//';
}

trap 'timer_start' DEBUG
PROMPT_COMMAND=timer_stop

if [ $(uname) == Darwin ]; then
    PS1_HEAD="\n$RED($WHITE\u@\h$RED)-($WHITE\w$RED)"
    PS1_TAIL="$RED\n($WHITE\t$RED)\$ $RESET"
else
    PS1_HEAD="\n$PURPLE($WHITE\u@\h$PURPLE)-($WHITE\w$PURPLE)"
    PS1_TAIL="$PURPLE\n($WHITE\t$PURPLE)\$ $RESET"
fi
PS1_GIT="$PURPLE"'$(__git_ps1 "  %s")'
PS1_TIMER="$GRAY"'$(seconds2days ${timer_show})'

PS1=$PS1_HEAD$PS1_GIT$PS1_TIMER$PS1_TAIL
# fzf
##################################################################################################
[ -r ~/.fzf.bash ] && source ~/.fzf.bash
FZF_GIT_COMMAND='git ls-files -c -o --exclude-standard'
FZF_AG_COMMAND='ag -l --nocolor --hidden --ignore-dir=".git" --ignore="*\.swp" -g ""'
FZF_RG_COMMAND="rg --files --color=never --hidden -g '!.git/' -g '!*.swp'"

export FZF_CTRL_T_COMMAND="($FZF_GIT_COMMAND || $FZF_RG_COMMAND || $FZF_AG_COMMAND) 2> /dev/null"

# setxkbmap
##################################################################################################
if command -v setxkbmap >/dev/null 2>&1; then
    setxkbmap -option ""
    # setxkbmap -option "ctrl:nocaps"
    setxkbmap -option "caps:escape"
    setxkbmap -option "shift:both_capslock"
fi

# alias
##################################################################################################
# alias nfs='cd /mnt/nfs/hdmap'
# alias nfsmount='sudo mount -t nfs 172.2.0.231:/mnt/data/wayz-nfs /mnt/nfs'

if [ $(uname) == Darwin ]; then
    alias ls='ls -G'
    alias ll='ls -alFG'
    alias la='ls -AG'
    alias l='ls -CFG'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias nvi='nvim'
alias t='tmux'
alias amax='ssh linji@192.168.6.70'

alias d='cd ~/.config/dotfiles/'
alias v='cd ~/.vim/'
alias h='cd ~'
alias w='cd ~/workspace/'
alias p='cd ~/workspace/phabricator/'
alias o='cd ~/workspace/office/'
alias e='cd ~/workspace/engineer/'
alias m='cd /mnt/sdb1/'
alias n='cd /mnt/nfs/'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pip
##################################################################################################
# pip bash completion start
_pip_completion() {
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
complete -o default -F _pip_completion pip3
complete -o default -F _pip_completion pip3.5
complete -o default -F _pip_completion pip3.7
# pip bash completion end

# pyenv
##################################################################################################
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# tensorflow
##################################################################################################
export TF_XLA_FLAGS=--tf_xla_cpu_global_jit

# bash_completion
##################################################################################################
if [ $(uname) == Darwin ]; then
    [ -r /usr/local/etc/profile.d/bash_completion.sh ] && \
        source /usr/local/etc/profile.d/bash_completion.sh
    function _expand() { :;}
fi

# git
##################################################################################################
source ~/.config/dotfiles/bashrc.git

# neofetch
##################################################################################################
# neofetch 2>/dev/null

# if [[ ! $TERM =~ screen  && ! $VIM ]]; then
#     exec tmux
# fi
# if [ ! $VIM ]; then
#     tmux attach &> /dev/null
#     if [[ ! $TERM =~ screen  && ! $VIM ]]; then
#         exec tmux
#     fi
# fi

# vim:ft=sh
