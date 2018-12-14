FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y vim git gcc zip wget nodejs npm

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

# work dir
RUN mkdir /root/work
WORKDIR /root/work