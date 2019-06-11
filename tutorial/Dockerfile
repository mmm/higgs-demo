FROM ubuntu:bionic
MAINTAINER Mark Mims <mark.mims@gmail.com>

ENV SHELL /bin/bash
#ENV HOME /workspace

ENV DEBIAN_FRONTEND=non-interactive
ENV LC_ALL=C
ENV LANG=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8

## expose ports for flask
#EXPOSE 5000
## expose ports for jupyter notebook
#EXPOSE 8888

VOLUME /workspace

#COPY policy-rc.d /usr/sbin

COPY scripts/* /tmp/
RUN bash /tmp/010-packages
RUN bash /tmp/071-gcloud-sdk

RUN apt-get -qq update \
  && apt-get -yqq install \
    python3-pip \
  && apt-get -qqy clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install -r /workspace/requirements.txt

WORKDIR /workspace
