FROM ubuntu:bionic
MAINTAINER Mark Mims <mark.mims@gmail.com>

ARG HOST_UID
ARG HOST_GID
ARG WHO

RUN groupadd ${WHO} -g ${HOST_GID}
RUN useradd -u ${HOST_UID} -g ${HOST_GID} -m -d /home/${WHO} -s /bin/bash ${WHO}

ENV SHELL /bin/bash

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=C
ENV LANG=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8

#COPY policy-rc.d /usr/sbin

COPY scripts/* /tmp/
RUN bash /tmp/010-packages
RUN bash /tmp/071-gcloud-sdk

RUN echo "${WHO} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${WHO} \
  && chmod 440 /etc/sudoers.d/${WHO}

COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

COPY docker-entrypoint /usr/bin/
RUN chown -Rf ${WHO}:${WHO} /usr/bin/docker-entrypoint \
  && chmod +x /usr/bin/docker-entrypoint

## expose ports for flask
#EXPOSE 5000
## expose ports for jupyter notebook
#EXPOSE 8888

USER ${WHO}

#ENV HOME /workspace
VOLUME /workspace
WORKDIR /workspace

ENTRYPOINT ["/usr/bin/docker-entrypoint"]
