FROM php:7.2-apache
MAINTAINER Tikia "renaud@tikia.net"

#Update OS
RUN apt-get update
RUN apt-get -y upgrade

#Install NTP
RUN apt-get -y install ntp ntpdate

# Install dependencies
RUN apt-get install -y \
        curl \
        g++ \
        zlib1g \
        libicu-dev \
        libmemcached-dev \
        libpq-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libssl-dev \
        libmcrypt-dev \
        libxml2-dev \
        libc-client-dev \
        libkrb5-dev \
        libldb-dev \
        libldap2-dev \
        librecode-dev \
        libtidy-dev

# Install the PHP mysqli and pdo_mysql extention
RUN docker-php-ext-install mysqli && docker-php-ext-install pdo_mysql

# Install the PHP pdo_pgsql extention
RUN docker-php-ext-install pdo_pgsql && docker-php-ext-install pgsql

# Install the PHP gd library
RUN docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd

# Install the PHP exif extention
RUN docker-php-ext-install exif

# Install the PHP ftp extention
RUN docker-php-ext-install ftp

# Install the PHP imap extention
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install imap

# Install the PHP ldap extention
#RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so && \
#    ln -s /usr/lib/x86_64-linux-gnu/liblber.so /usr/lib/liblber.so
RUN docker-php-ext-install ldap

# Install the PHP intl extention
RUN docker-php-ext-configure intl && \
    docker-php-ext-install intl

# Install the PHP simplexml extention
RUN docker-php-ext-configure simplexml && \
    docker-php-ext-install simplexml

# Install the PHP xml extention
RUN docker-php-ext-install xml

# Install the PHP tidy extention
RUN docker-php-ext-install tidy

# Install the PHP xmlrpc extention
RUN docker-php-ext-install xmlrpc

# Install the PHP opcache extention
RUN docker-php-ext-install opcache

# Install the PHP json extention
RUN docker-php-ext-install json

# Install the PHP mbstring extention
RUN docker-php-ext-install mbstring

# Install the PHP mbstring extention
RUN docker-php-ext-install recode

# Install the PHP gettext extention
RUN docker-php-ext-install gettext

# Install the PHP shmop extention
RUN docker-php-ext-install shmop

# Install the PHP zip extention
RUN docker-php-ext-install zip

# Install the PHP dom extention
RUN docker-php-ext-install dom

# Install the PHP iconv extention
RUN docker-php-ext-install iconv

# Install the PHP session extention
RUN docker-php-ext-install session

# Install the PHP sockets extention
RUN docker-php-ext-install sockets

#Activate Apache module : SSL, rewrite include status
RUN a2enmod rewrite ssl include status

#Remove symbolics links for logs
RUN rm -f /var/log/apache2/access.log
RUN rm -f /var/log/apache2/error.log
RUN rm -f /var/log/apache2/other_vhosts_access.log

#Install letsencrypt
RUN apt-get -y install letsencrypt.sh-apache2

#Define port
EXPOSE 80

#Define Volume
VOLUME ["/var/www/", "/etc/apache2/sites-enabled/", "/var/log/apache2/"]

#Define workdir
WORKDIR /var/www/html

#Define CMD
CMD ["apache2-foreground"]
