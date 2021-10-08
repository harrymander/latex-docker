FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y install \
    biber \
    build-essential \
    cmake \
    git \
    make \
    latexmk \
    libpcre3-dev \
    texlive \
    texlive-bibtex-extra \
    texlive-latex-extra \
    texlive-science

# Build and install pplatex
RUN git clone --depth 1 --branch pplatex-1.0-rc3 \
    https://github.com/stefanhepp/pplatex.git /root/pplatex
RUN cmake -S /root/pplatex -B /root/pplatex/build
RUN make -C /root/pplatex/build
RUN mv /root/pplatex/build/src/pplatex /usr/bin
RUN rm -rf /root/pplatex
