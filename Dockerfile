FROM ubuntu:latest

RUN apt-get update --fix-missing
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get update
RUN apt-get install -y vim git gcc zip wget curl \
  nodejs npm \
  golang \
  ethereum

# python
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

# Rust
ENV RUST_VERSION stable
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUST_VERSION}
ENV PATH $PATH:/root/.cargo/bin

# work dir
RUN mkdir /root/work
WORKDIR /root/work