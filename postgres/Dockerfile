# -*- sh -*-

# forked from https://gist.github.com/jpetazzo/5494158

FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"   >> /etc/apt/sources.list.d/precise.list
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main multiverse" >> /etc/apt/sources.list.d/precise.list
RUN apt-get update

RUN apt-get install -y git python

# prevent apt from starting postgres right after the installation
RUN echo "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d; chmod +x /usr/sbin/policy-rc.d

# https://bugs.launchpad.net/ubuntu/+source/lxc/+bug/813398
RUN apt-get -qy install language-pack-en

ENV LANGUAGE en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_ALL en_GB.UTF-8
RUN locale-gen en_GB.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y -q postgresql-9.1 postgresql-contrib-9.1

# allow autostart again
RUN rm /usr/sbin/policy-rc.d

ADD start /
ADD postgresql.conf /etc/postgresql/9.1/main/
RUN chmod +x /start

EXPOSE 5432
CMD /start postgres
