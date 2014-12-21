FROM phusion/baseimage:0.9.15
MAINTAINER Jez

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN apt-get update
RUN apt-get install python2.7 -y
RUN apt-get install make zlib1g-dev libicu-dev build-essential git -y
RUN apt-get install ruby1.9.1 ruby1.9.1-dev -y

# Clean up APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install gollum
RUN gem install redcarpet
RUN gem install asciidoctor

EXPOSE 4567
RUN mkdir -p /local/gollum

# Set correct environment variables.
ENV HOME /root
WORKDIR /local/gollum

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
