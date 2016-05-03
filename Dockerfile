FROM nginx
MAINTAINER Afrimadoni Dinata <doenikoe@yahoo.com>
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install curl \
    && echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
    && echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
    && curl https://www.dotdeb.org/dotdeb.gpg > dotdeb.gpg && apt-key add dotdeb.gpg


#Because in every adding any repository it always needed to run apt-get update
RUN apt-get update && apt-get -y install php7.0-fpm php7.0-mysql sed git

RUN sed -i 's/user = www-data/user = nginx/g' /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i 's/group = www-data/group = www-data/g' /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i 's/listen.owner = www-data/listen.owner = nginx/g' /etc/php/7.0/fpm/pool.d/www.conf \
    && echo "daemon off;" >> /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY info.php /usr/share/nginx/html/public/phpinfo.php
COPY init.sh /usr/init.sh

VOLUME ["/usr/share/nginx/html"]

EXPOSE 80 443

CMD ["sh", "/usr/init.sh"]
