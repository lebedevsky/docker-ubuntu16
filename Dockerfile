FROM ubuntu:latest
MAINTAINER an.lebedevsky@gmail.com

ARG timezone=Europe/Moscow
ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TZ $timezone

# update OS
RUN apt update && apt -y full-upgrade

# add public DNS
RUN echo 'nameserver 8.8.8.8' > /etc/resolv.conf && \
    echo 'nameserver 8.8.4.4' >> /etc/resolv.conf

# update packages
RUN	apt -y install \
    software-properties-common \
    apt-utils 

# clean
RUN	apt-get autoclean