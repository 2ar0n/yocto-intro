FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -yq vim \
    build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping \
    libacl1 liblz4-tool locales python3 python3-git python3-jinja2 python3-pexpect python3-pip \
    python3-subunit socat texinfo unzip wget xz-utils zstd \
    && rm -rf /var/lib/apt-lists/*

RUN echo "dash dash/sh boolean false" | debconf-set-selections && dpkg-reconfigure dash

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LANG=en_US.utf8

USER ubuntu
WORKDIR /workspaces
