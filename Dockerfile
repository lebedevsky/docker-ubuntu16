FROM ubuntu:16.04
MAINTAINER an.lebedevsky@gmail.com

ARG timezone=Europe/Moscow
ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

# update OS
RUN apt update && apt -y full-upgrade

# update packages
RUN	apt -y install \
    software-properties-common \
    apt-utils 

# clean
RUN	apt-get autoclean