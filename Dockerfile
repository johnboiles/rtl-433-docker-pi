FROM arm32v7/debian:buster-slim as builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    # to build and install \
    ca-certificates libtool libusb-1.0-0-dev librtlsdr-dev build-essential autoconf cmake pkg-config git-core \
    # necessary for running \
    rtl-sdr \
    # cleanup \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove

RUN git clone https://github.com/merbanan/rtl_433.git && \
    cd rtl_433 && \
    mkdir build && \
    cd build && \
    cmake ../ && \
    make && \
    make install && \
    cd / && \
    rm -rf /tmp

FROM arm32v7/debian:buster-slim

COPY --from=builder /usr/local/bin/rtl_433 /usr/local/bin/rtl_433

RUN apt-get update && apt-get install -y --no-install-recommends \
    # librtlsdr0 and libusb-1.0-0 are necessary for running rtl_433 \
    rtl-sdr \
    # cleanup \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove

WORKDIR /

ENTRYPOINT ["rtl_433"]
