FROM ubuntu:latest
MAINTAINER an.lebedevsky@gmail.com

# update OS
RUN apt update && apt -y full-upgrade

# add public DNS
RUN	echo 'nameserver 8.8.8.8' > /etc/resolv.conf && \
	  echo 'nameserver 8.8.4.4' >> /etc/resolv.conf

# update packages
RUN	apt -y install \
		software-properties-common \
		apt-utils 

# clean
RUN	apt-get autoclean
