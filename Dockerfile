# Build and install pplatex
FROM ubuntu:22.04 AS pplatex-build
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get -y install \
    build-essential \
    cmake \
    git \
    libpcre3-dev \
    make

RUN git clone --depth 1 --branch pplatex-1.0-rc3 \
    https://github.com/stefanhepp/pplatex.git /root/pplatex
RUN mkdir /root/pplatex-build
RUN cmake -S /root/pplatex -B /root/pplatex-build
RUN make -C /root/pplatex-build

FROM ubuntu:22.04
COPY --from=pplatex-build /root/pplatex-build/src/pplatex /usr/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get -y install \
    biber \
    cm-super \
    inkscape \
    latexmk \
    libpcre3-dev \
    make \
    texlive \
    texlive-bibtex-extra \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-science
