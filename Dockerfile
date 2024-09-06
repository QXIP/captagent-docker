FROM debian:bookworm
MAINTAINER Lorenzo Mangani
ENV DEBIAN_FRONTEND noninteractive
ENV captagent_version 6.4

RUN apt-get update -qq && apt-get install --no-install-recommends --no-install-suggests -yqq ca-certificates git make m4 automake autoconf libtool libcap-dev libexpat-dev libpcap-dev zlib1g-dev openssl libssl-dev bison flex  libjson-c5 libjson-c-dev libcurl4-gnutls-dev libjson-c-dev libuv1-dev libfl-dev libfl2 libpcre3-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN git clone https://github.com/sipcapture/captagent.git captagent && cd captagent && \
    ./build.sh && \
    ./configure && \
    make && make install

WORKDIR /
COPY run.sh /

EXPOSE 8909
ENTRYPOINT [ "/run.sh" ]
