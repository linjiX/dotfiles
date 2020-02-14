FROM ubuntu:16.04

WORKDIR /setup
ENV DOCKER=true

COPY ./ubuntu/common/clean.sh ./
COPY ./ubuntu/common/sources.list /etc/apt/sources.list.ustc
COPY ./ubuntu/common/sudo.sh ./
RUN ./sudo.sh ./ && \
    ./clean.sh

ARG NAME=linji
COPY ./ubuntu/common/adduser.sh ./
RUN ./adduser.sh $NAME
USER $NAME

COPY ./ubuntu/common/basic.sh ./
# hadolint ignore=DL3004
RUN ./basic.sh && \
    ./clean.sh

COPY ./ubuntu/common/advanced.sh ./
# hadolint ignore=DL3004
RUN ./advanced.sh && \
    ./clean.sh

COPY ./ubuntu/tools/install_tmux.sh ./
# hadolint ignore=DL3004
RUN ./install_tmux.sh && \
    ./clean.sh

COPY ./ubuntu/tools/install_arcanist.sh ./
RUN ./install_arcanist.sh && \
    ./clean.sh

COPY ./ubuntu/tools/install_fzf.sh ./
RUN ./install_fzf.sh && \
    ./clean.sh

COPY ./ubuntu/tools/install_node.sh ./
# hadolint ignore=DL3004
RUN ./install_node.sh && \
    ./clean.sh

COPY ./ubuntu/tools/install_pyenv.sh ./
# hadolint ignore=DL3004
RUN ./install_pyenv.sh && \
    ./clean.sh

COPY ./ubuntu/customize/vim.sh ./
# hadolint ignore=DL3004
RUN ./vim.sh && \
    ./clean.sh

COPY ./ubuntu/tools/npm.sh ./
# hadolint ignore=DL3004
RUN ./npm.sh && \
    ./clean.sh

COPY ./ubuntu/tools/pip.sh ./
RUN ./pip.sh && \
    ./clean.sh

COPY ./ubuntu/lib ./
# hadolint ignore=DL3004
RUN ./lib.sh && \
    ./clean.sh

COPY ./ubuntu/customize/dotfiles.sh ./
RUN ./dotfiles.sh

# hadolint ignore=DL3004
RUN . ~/.profile  && \
    sudo apt-get update && \
    sudo apt-get -y upgrade && \
    sudo apt-get -y autoremove --purge && \
    ./clean.sh

ENV TERM=xterm-256color \
    LANG=en_US.UTF-8

# hadolint ignore=DL3004
RUN sudo sed -i 's/NOPASSWD: //g' /etc/sudoers
WORKDIR /home/$NAME
