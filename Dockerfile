FROM ubuntu:22.04

ENV FACTOR_VERSION 0.99

RUN apt-get update && \
    apt-get install -y wget && \
    mkdir -p /opt/factor && \
    cd /opt/factor && \
    wget https://downloads.factorcode.org/releases/$FACTOR_VERSION/factor-linux-x86-64-$FACTOR_VERSION.tar.gz \
        -O factor.tar.gz && \
    tar xzf factor.tar.gz --strip-components=1 factor/factor factor/factor.image && \
    rm -f /bin/factor /usr/bin/factor && \
    cp factor factor.image /usr/local/bin

WORKDIR /code

COPY bin .

CMD "./run.sh"