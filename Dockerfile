FROM ubuntu:25.10
MAINTAINER Aaron Lelouvier <aaron.lelouvier@pm.me>

ARG DEBIAN_FRONTEND=noninteractive

RUN \
        dpkg --add-architecture i386 && \
        apt-get update && \
        apt-get install -yq sudo build-essential git vim \
          python3-yaml python3 man bash diffstat gawk chrpath wget cpio \
          texinfo lzop apt-utils bc screen libncurses5-dev locales \
          libc6-dev-i386 doxygen libssl-dev dos2unix xvfb x11-utils \
          g++-multilib libssl-dev:i386 zlib1g-dev:i386 \
          libtool libtool-bin procps pigz socat \
          zstd iproute2 lz4 iputils-ping \
          curl net-tools xterm rsync u-boot-tools unzip zip \
          debianutils file gcc libacl1 python3-git \
          python3-jinja2 python3-pexpect python3-pip python3-subunit \
          xz-utils librsvg2-bin make python3-saneyaml python3-sphinx-rtd-theme sphinx \
          && rm -rf /var/lib/apt-lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LANG en_US.utf8

RUN useradd -ms /bin/bash -p build build -u 1028 -g 1000 && \
        usermod -aG sudo build && \
        echo "build:build" | chpasswd
USER build

WORKDIR /home/build
