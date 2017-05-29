FROM debian
MAINTAINER sameer@damagehead.com

ENV PHP_FPM_USER=www-data

RUN apt-get update \
 && apt-get install -y php7-fpm php7-cli php7-pgsql php7-mysql php7-gd php7-curl \
 && sed 's/;daemonize = yes/daemonize = no/' -i /etc/php7/fpm/php-fpm.conf \
 && rm -rf /var/lib/apt/lists/*

COPY pool.d/ /etc/php7/fpm/pool.d/
CMD ["/usr/sbin/php7-fpm"]

EXPOSE 9000
