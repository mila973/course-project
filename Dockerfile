FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV DIR /course-project

COPY Palemonas-2.1 /usr/share/fonts/truetype/

RUN mkdir $DIR
RUN apt update && \
    apt install -y wget \
        git \
        make \
        apt-transport-https \
        unzip && \
    apt install -y texlive-base \
        biber \
        texlive-latex-extra \
        texlive-latex-recommended \
        fonts-texgyre \
        latexmk

VOLUME $DIR
WORKDIR $DIR
