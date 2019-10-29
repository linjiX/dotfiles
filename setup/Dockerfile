FROM ubuntu:16.04

WORKDIR /setup

ENV TERM=xterm-256color \
    LANG=en_US.UTF-8 \
    DOCKER=true
COPY ./ubuntu/sources.list /etc/apt/sources.list.ustc
COPY ./ubuntu/sudo.sh ./
RUN ./sudo.sh ./ && \
    rm -rf /var/lib/apt/lists/*

ARG NAME=linji
COPY ./ubuntu/adduser.sh ./
RUN ./adduser.sh $NAME
USER $NAME

COPY ./ubuntu/basic.sh ./
# hadolint ignore=DL3004
RUN ./basic.sh && \
    sudo rm -rf /var/lib/apt/lists/*

COPY ./ubuntu/advanced.sh ./
# hadolint ignore=DL3004
RUN ./advanced.sh && \
    sudo rm -rf /var/lib/apt/lists/*

COPY ./ubuntu/tmux.sh ./
# hadolint ignore=DL3004
RUN ./tmux.sh && \
    sudo rm -rf /var/lib/apt/lists/*

COPY ./ubuntu/pyenv.sh ./
# hadolint ignore=DL3004
RUN ./pyenv.sh && \
    rm -rf ~/.cache && \
    rm -rf /tmp/* && \
    sudo rm -rf /var/lib/apt/lists/*

COPY ./ubuntu/vim.sh ./
# hadolint ignore=DL3004
RUN ./vim.sh && \
    rm ~/.wget-hsts && \
    rm ~/.viminfo && \
    rm -rf ~/.vim/setup/ctags && \
    rm -rf ~/.vim/setup/global-* && \
    sudo rm -rf /tmp/* && \
    sudo rm -rf /var/lib/apt/lists/*

COPY ./ubuntu/dotfiles.sh ./
RUN ./dotfiles.sh

COPY ./ubuntu/applications.sh ./
# hadolint ignore=DL3004
RUN ./applications.sh && \
    rm -rf ~/.vim/setup/ccls && \
    rm -rf ~/.vim/setup/cppcheck-* && \
    rm -rf ~/.npm && \
    rm -rf /tmp/* && \
    sudo rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3004
RUN . ~/.profile  && \
    sudo apt-get update && \
    sudo apt-get -y upgrade && \
    sudo apt-get -y autoremove --purge && \
    sudo rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3004
RUN sudo sed -i 's/NOPASSWD: //g' /etc/sudoers
WORKDIR /home/$NAME
