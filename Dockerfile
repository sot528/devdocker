FROM ubuntu:latest

RUN apt-get update --fix-missing
RUN apt-get install -y software-properties-common
RUN apt-get update
RUN apt-get install -y vim git gcc zip wget curl \
  nodejs npm \
  golang

# python
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN apt-get install -y python3-pip
RUN python3 get-pip.py

# Rust, WASM
ENV RUST_VERSION stable
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUST_VERSION}
ENV PATH $PATH:/root/.cargo/bin
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
RUN cargo install cargo-generate

# work dir
RUN mkdir /root/work
WORKDIR /root/work

RUN ln -fs /usr/bin/python3 /usr/bin/python