FROM debian

ENV PHP_FPM_USER=www-data

RUN apt-get update \
 && echo 'deb http://packages.dotdeb.org jessie all' > /etc/apt/sources.list.d/dotdeb.list \
 && apt-get install -y apt-transport-https \
 && curl http://www.dotdeb.org/dotdeb.gpg | apt-key add - \
 && apt-get update \
 && apt-get install -y php7.0-fpm php7.0-mysql php7.0-curl
 
RUN sed 's/;daemonize = yes/daemonize = no/' -i /etc/php/7.0/fpm/php-fpm.conf

VOLUME /etc/php/7.0/fpm
COPY pool.d/ /etc/php/7.0/fpm/pool.d/
CMD ["/usr/sbin/php-fpm7.0"]

EXPOSE 9000
