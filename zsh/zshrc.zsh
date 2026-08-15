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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -U path PATH

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git fzf nvm pyenv)
plugins=(git zsh-syntax-highlighting)

# ZSH COMPLETIONS
# These must be available before Oh My Zsh runs compinit.
if type brew &>/dev/null; then
    FPATH+=":$(brew --prefix)/share/zsh/site-functions"
fi

if [ -d "$HOME/.zfunc" ]; then
    FPATH+=":$HOME/.zfunc"
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

HISTSIZE=10000
SAVEHIST=5000

setopt histignoredups
setopt histignorealldups 
setopt histreduceblanks
setopt nosharehistory

# NVIM
export MANPAGER='nvim +Man!'

# HOMEBREW
eval "$(/opt/homebrew/bin/brew shellenv)"


# MASON
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# FZF
source <(fzf --zsh)
_FZF_GIT_COMMAND='git ls-files --cached --others --exclude-standard'
_FZF_RG_COMMAND="rg --files --color=never --hidden --glob '!.git/' --glob '!*.swp'"

export FZF_CTRL_T_COMMAND="($_FZF_GIT_COMMAND || $_FZF_RG_COMMAND) 2> /dev/null"

# MASON
# export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

_pyenv_has_local_version() {
    local dir=$PWD
    while true; do
        [[ -f "$dir/.python-version" || -L "$dir/.python-version" ]] && return 0
        [[ $dir == / ]] && return 1
        dir=${dir:h}
    done
}

if _pyenv_has_local_version; then
    # A Python project needs the complete integration at startup.
    eval "$(command pyenv init -)"
    eval "$(command pyenv virtualenv-init -)"
else
    # Outside Python projects, keep shims and automatic rehash while delaying
    # shell integration and virtualenv activation until they are needed.
    eval "$(command pyenv init --path)"

    _pyenv_load_full() {
        [[ -n ${_PYENV_FULL_LOADED-} ]] && return

        unset -f pyenv
        eval "$(command pyenv init - --no-rehash)"
        eval "$(command pyenv virtualenv-init -)"
        typeset -g _PYENV_FULL_LOADED=1
        add-zsh-hook -d chpwd _pyenv_maybe_load_full
    }

    _pyenv_maybe_load_full() {
        [[ -n ${_PYENV_FULL_LOADED-} ]] && return
        _pyenv_has_local_version && _pyenv_load_full
    }

    pyenv() {
        _pyenv_load_full
        pyenv "$@"
    }

    _pyenv_lazy_completion() {
        _pyenv_load_full
        _pyenv
    }

    autoload -Uz add-zsh-hook
    add-zsh-hook chpwd _pyenv_maybe_load_full
    compctl -K _pyenv_lazy_completion pyenv
fi

# NVM
export NVM_DIR="$HOME/.nvm"
# Keep the default Node version available without loading nvm at shell startup.
export PATH="$NVM_DIR/versions/node/v22.20.0/bin:$PATH"

# Load nvm and its completion only when they are actually needed.
_load_nvm() {
    [[ -n ${_NVM_LOADED-} ]] && return
    unset -f nvm
    source /opt/homebrew/opt/nvm/nvm.sh
    typeset -g _NVM_LOADED=1
}

_load_nvm_completion() {
    _load_nvm
    [[ -n ${_NVM_COMPLETION_LOADED-} ]] && return
    source /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm
    typeset -g _NVM_COMPLETION_LOADED=1
}

nvm() {
    _load_nvm
    nvm "$@"
}

_nvm_lazy_completion() {
    _load_nvm_completion
    _bash_complete -o default -F __nvm
}

compdef _nvm_lazy_completion nvm

# ALIAS
alias ll="ls -alFG"
alias vim="nvim"
alias nvi="nvim"

alias t="tmux"

alias c="cd ~/.config/"
alias d="cd ~/.config/dotfiles/"
alias v="cd ~/.config/nvim/"
alias w="cd ~/diffus/"
alias g="cd ~/diffus/github/"
alias D="cd ~/Downloads/"
alias S="cd ~/.local/share/"

alias root='cd $(git rev-parse --show-toplevel)'

# Powerlevel10k
# To customize prompt, run `p10k configure` or edit zsh/p10k.zsh in this repository.
[[ ! -f "$HOME/.config/dotfiles/zsh/p10k.zsh" ]] || source "$HOME/.config/dotfiles/zsh/p10k.zsh"
