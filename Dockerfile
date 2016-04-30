FROM nginx
MAINTAINER Afrimadoni Dinata <doenikoe@yahoo.com>
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install php5 php5-cli php5-fpm sed git curl 
RUN sed -i 's/cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini
RUN sed -i 's/user = www-data/user = nginx/g' /etc/php5/fpm/pool.d/www.conf
RUN sed -i 's/group = www-data/group = www-data/g' /etc/php5/fpm/pool.d/www.conf
RUN sed -i 's/listen.owner = www-data/listen.owner = nginx/g' /etc/php5/fpm/pool.d/www.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY info.php /usr/share/nginx/html/info.php
COPY init.sh /usr/init.sh

VOLUME ["/usr/share/nginx/html"]

EXPOSE 80 443

CMD ["sh", "/usr/init.sh"]
