# Set the ARGs
ARG BASE_IMAGE=ubuntu:18.04

FROM ${BASE_IMAGE}
LABEL maintainer="bsk0130@gmail.com"

ARG PYTHON_VER=3.7.9

ENV USER user
ENV UID 1000
ENV HOME /home/${USER}

RUN apt-get update && apt-get install -y \
    sudo \
    apt-utils \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    git \
    libffi-dev \
    liblzma-dev \
    locales \
    g++ \
    libpcre3-dev \
    tar \
    bash \
    rsync \
    gcc \
    libfreetype6-dev \
    libhdf5-serial-dev \
    libpng-dev \
    libzmq3-dev \
    unzip \
    pkg-config \
    software-properties-common \
    graphviz

# Setting user
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${UID} \
    ${USER}

RUN adduser ${USER} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install Python
USER ${USER}
WORKDIR ${HOME}

ENV PYENV_ROOT ${HOME}/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN git clone https://github.com/pyenv/pyenv.git .pyenv

RUN pyenv install ${PYTHON_VER} && \
    pyenv global ${PYTHON_VER}

RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# Setup pyenv 
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc

USER root
RUN chown -R ${UID} ${HOME}

USER ${USER}
WORKDIR ${HOME}/workspace
