FROM scratch
MAINTAINER sameer@damagehead.com

ENV PHP_FPM_USER=www-data

RUN apt-get update \
 && apt-get install -y php7.0-fpm php7.0-cli php7.0-pgsql php7.0-mysql php7.0-gd php7.0-curl \
 && sed 's/;daemonize = yes/daemonize = no/' -i /etc/php7.0/fpm/php-fpm.conf \
 && rm -rf /var/lib/apt/lists/*

VOLUME /etc/php7.0/fpm
COPY pool.d/ /etc/php7.0/fpm/pool.d/
CMD ["/usr/sbin/php7.0-fpm"]

EXPOSE 9000
