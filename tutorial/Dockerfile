FROM ubuntu:bionic
MAINTAINER Mark Mims <mark.mims@gmail.com>

ENV SHELL /bin/bash

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=C
ENV LANG=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8

#COPY policy-rc.d /usr/sbin

COPY scripts/* /tmp/
RUN bash /tmp/010-packages
RUN bash /tmp/071-gcloud-sdk

COPY docker-entrypoint /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint

## expose ports for flask
#EXPOSE 5000
## expose ports for jupyter notebook
#EXPOSE 8888

#ENV HOME /workspace
VOLUME /workspace
WORKDIR /workspace

ENTRYPOINT ["/usr/bin/docker-entrypoint"]
