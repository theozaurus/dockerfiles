# couchpotato

FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"   >> /etc/apt/sources.list.d/precise.list
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main multiverse" >> /etc/apt/sources.list.d/precise.list
RUN apt-get update

RUN apt-get install -y git python

RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git /var/sites/couchpotato

RUN cp /var/sites/couchpotato/init/ubuntu /etc/init.d/couchpotato
RUN chmod +x /etc/init.d/couchpotato

ADD couchpotato.default /etc/default/couchpotato
ADD couchpotato.ini /root/couchpotato.ini

ADD start /
RUN chmod +x /start

CMD /start
EXPOSE 5050
