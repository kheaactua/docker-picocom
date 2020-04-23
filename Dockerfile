ARG UBUNTU_TAG=18.04
FROM ubuntu:${UBUNTU_TAG}

RUN apt-get -q -y update                      \
    && apt-get install -q -y                  \
        build-essential                       \
        autoconf automake libtool libtool-bin \
        git g++ cmake make gcc                \
    && apt-get -q -y autoremove               \
    && apt-get -q -y clean

LABEL                                                                \
  org.label-schema.description="picocom"                             \
  org.label-schema.name="kheaactua/picocom"                          \
  org.label-schema.schema-version="1.0"                              \
  org.label-schema.url="https://github.com/kheaactua/docker-picocom" \
  org.label-schema.vendor="Matthew Russell"                          \
  org.label-schema.version="0.1"

ARG PICOCOM_TAG=master

WORKDIR /usr/local/src
RUN git clone https://github.com/npat-efault/picocom.git \
    && cd picocom                                        \
    && git checkout ${PICOCOM_TAG}                       \
    && make                                              \
    && strip picocom                                     \
    && cp picocom /usr/local/bin                         \
    && cp picocom.1 /usr/share/man/man1/
RUN cp picocom/bash_completion/picocom /etc/bash_completion.d

ENTRYPOINT ["/usr/local/bin/picocom"]

# vim: ts=4 sw=4 expandtab ff=unix :
