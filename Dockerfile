FROM ubuntu:16.04
MAINTAINER lebedevsky <an.lebedevsky@gmail.com>

ARG timezone=Europe/Moscow
ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

# update locale
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_TYPE=en_US.UTF-8

# update date time
ENV TZ $timezone

# update OS
RUN apt-get update && apt-get -y full-upgrade

# update packages
RUN apt-get -y install \
    software-properties-common \
    apt-utils \
    curl \
    git

# clean
RUN apt-get autoclean