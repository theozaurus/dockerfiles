# sabnzbd

FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"   >> /etc/apt/sources.list.d/precise.list
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main multiverse" >> /etc/apt/sources.list.d/precise.list
RUN apt-get update

RUN apt-get install -y git python

RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:jcfp/ppa
RUN apt-get update
RUN apt-get install -y sabnzbdplus unrar par2

ADD sabnzbdplus /etc/default/
ADD sabnzbd.ini /root/sabnzbd.ini

ADD start /
RUN chmod +x /start

CMD /start
EXPOSE 8080
