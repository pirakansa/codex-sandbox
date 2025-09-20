FROM rust:1-slim-bullseye

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=C.UTF-8

RUN apt update -y && \
    apt install -y curl git sudo zstd && \

    curl -L https://github.com/openai/codex/releases/download/rust-v0.36.0/codex-x86_64-unknown-linux-musl.zst \
    | zstd -d -o /usr/local/bin/codex && \
    chmod a+x /usr/local/bin/codex && \

    rustup component add rustfmt clippy


ARG CONTAINER_USERNAME=builder
ARG CONTAINER_USERID=1000

RUN useradd -u ${CONTAINER_USERID} -s /bin/bash -m ${CONTAINER_USERNAME} && \
    install --owner=${CONTAINER_USERNAME} --directory /work && \
    echo "${CONTAINER_USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/container && \
    chmod 440 /etc/sudoers.d/container && \

    apt clean && \
    rm -rf /var/log/* ; \
    rm -rf /tmp/*

###### login user
USER ${CONTAINER_USERNAME}

###### working directory
WORKDIR /work
