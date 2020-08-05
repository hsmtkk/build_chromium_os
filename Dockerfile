FROM ubuntu:20.04

RUN apt-get -y update

#RUN apt-get -y install git gitk git-gui subversion curl lvm2 thin-provisioning-tools python-pkg-resources

RUN apt-get -y install curl git gpg python3.8

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

