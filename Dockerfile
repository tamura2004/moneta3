FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    sudo

RUN useradd -m -s /bin/bash moneta
