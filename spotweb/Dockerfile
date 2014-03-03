# spotweb

FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"   >> /etc/apt/sources.list.d/precise.list
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main multiverse" >> /etc/apt/sources.list.d/precise.list
RUN apt-get update

RUN apt-get install -y git python

RUN apt-get install -y nginx php5-fpm php5-gd php5-curl php5-pgsql php5-cli cron postgresql-client-9.1

RUN sed -i "s/^;date.timezone =.*/date.timezone = Europe\/London/" /etc/php5/*/php.ini

RUN	git clone https://github.com/spotweb/spotweb.git /var/www/spotweb
RUN cd /var/www/spotweb && git checkout tags/v20130826
ADD dbsettings.inc.php /var/www/spotweb/

RUN chown -R www-data:www-data /var/www/spotweb

ADD	spotweb.conf /etc/nginx/sites-enabled/
ADD spotweb.cron /etc/cron.d/spotweb
RUN rm /etc/nginx/sites-enabled/default

#RUN service cron start

ADD start /
RUN chmod +x /start

CMD /start
EXPOSE 8100
