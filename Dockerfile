FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y install \
    biber \
    make \
    latexmk \
    texlive \
    texlive-bibtex-extra \
    texlive-latex-extra \
    texlive-science \
