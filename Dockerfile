FROM ubuntu:20.04

RUN apt-get -y update \
 && apt-get --no-install-recommends -y install curl=7.68.0-1ubuntu2.1 git=2.25.1-ubuntu3 gpg=2.2.19-3ubuntu2 python3.8=3.8.2-1ubuntu1.2 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN curl -O https://storage.googleapis.com/git-repo-downloads/repo \
 && chmod 755 repo \
 && mv repo /usr/local/bin/repo \
 && ln -s /usr/bin/python3.8 /usr/bin/python \
 && git config --global user.email a@example.org \
 && git config --global user.name a \
 && git config --global color.ui false

RUN mkdir /usr/local/src/chromium

WORKDIR /usr/local/src/chromium

RUN repo init -u https://chromium.googlesource.com/chromiumos/manifest.git \
 && repo sync

