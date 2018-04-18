FROM resin/rpi-raspbian:stretch-20180411
LABEL maintainer="Sid Verma <me@sidverma.io>"

RUN apt-get update \
  && apt-get upgrade

ADD https://github.com/prometheus/prometheus/releases/download/v2.2.1/prometheus-2.2.1.linux-armv7.tar.gz /prometheus.tar.gz

RUN mkdir /prometheus && \
  tar -xvf prometheus.tar.gz -C /prometheus/ --strip-components=1 && \
  rm prometheus.tar.gz

EXPOSE 9090

ENTRYPOINT ["/bin/bash"]

ENTRYPOINT ["/prometheus/prometheus", "--config.file=/prometheus/prometheus.yml"]
