FROM debian:jessie
MAINTAINER Lorenzo Mangani
ENV DEBIAN_FRONTEND noninteractive
ENV captagent_version 6.1

RUN apt-get update -qq && apt-get install --no-install-recommends --no-install-suggests -yqq ca-certificates git make m4 automake autoconf libtool libcap-dev libexpat-dev libpcap-dev zlib1g-dev openssl libssl-dev bison flex  libjson0 libjson0-dev libcurl4-gnutls-dev libjson-c-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
ENV captagent_sha1 cf757a2e0bb883146e0178d15ee3659c03d9fd6c
RUN git clone https://github.com/sipcapture/captagent.git captagent && cd captagent && git reset --hard $captagent_sha1

WORKDIR /usr/src/captagent
RUN ./build.sh
RUN ./configure
RUN make && make install

# RUN mkdir -p /usr/lib64; \
#    ln -sf /usr/local/lib/captagent /usr/lib64/captagent ; \
#    ln -sf /usr/local/etc/captagent /etc ; \
#    ln -sf /usr/src/captagent/conf/database_hash.xml /etc/captagent/database_hash.xml

WORKDIR /
COPY run.sh /

EXPOSE 8909
ENTRYPOINT [ "/run.sh" ]
