# headphones

FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"   >> /etc/apt/sources.list.d/precise.list
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main multiverse" >> /etc/apt/sources.list.d/precise.list
RUN apt-get update

RUN apt-get install -y git python

RUN git clone https://github.com/rembo10/headphones.git /var/sites/headphones

RUN cp /var/sites/headphones/init.ubuntu /etc/init.d/headphones
RUN chmod +x /etc/init.d/headphones

ADD headphones.default /etc/default/headphones
ADD config.ini /root/data/config.ini

ADD start /
RUN chmod +x /start

CMD /start
EXPOSE 5050
