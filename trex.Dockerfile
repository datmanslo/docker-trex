ARG UBUNTU_VERSION=focal-20210119
FROM ubuntu:${UBUNTU_VERSION}

ARG TREX_VERSION=v2.88

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    iproute2 \
    iputils-ping \
    nano \
    net-tools \
    netbase \
    pciutils \
    python3 \
    python3-distutils \
    strace \
    wget \
    && apt-get autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://trex-tgn.cisco.com/trex/release/${TREX_VERSION}.tar.gz && \
    tar -zxvf ${TREX_VERSION}.tar.gz -C / && \
    chown root:root /${TREX_VERSION}  && \
    rm ${TREX_VERSION}.tar.gz
COPY trex_cfg.yaml /etc/trex_cfg.yaml
WORKDIR /${TREX_VERSION}

CMD ["./t-rex-64", "-i", "--cfg", "/etc/trex_cfg.yaml"]