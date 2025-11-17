FROM ghcr.io/dkfz-unite/docker-rdev-biocmanager:latest AS base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM base AS install
COPY ./src /tmp
RUN Rscript /tmp/install.R && \
    rm /tmp/install.R && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
