FROM scratch

ENV PHP_FPM_USER=www-data

RUN apt-get update \
 && apt-get install -y php7.0-fpm php7.0-mysql php7.0-curl
 
RUN sed 's/;daemonize = yes/daemonize = no/' -i /etc/php/7.0/fpm/php-fpm.conf

VOLUME /etc/php/7.0/fpm
COPY pool.d/ /etc/php/7.0/fpm/pool.d/
CMD ["/usr/sbin/php-fpm7.0"]

EXPOSE 9000
