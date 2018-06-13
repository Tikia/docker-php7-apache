FROM php:7.2-apache
MAINTAINER Tikia "renaud@tikia.net"

#Update OS
RUN apt-get update
RUN apt-get -y upgrade

#Install NTP
RUN apt-get -y install ntp ntpdate

# Install "curl", "libmemcached-dev", "libpq-dev", "libjpeg-dev", "libpng12-dev", "libfreetype6-dev", "libssl-dev", "libmcrypt-dev",
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        libmemcached-dev \
        libz-dev \
        libpq-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libssl-dev \
        libmcrypt-dev \
    && rm -rf /var/lib/apt/lists/*

# Install the PHP common extention
RUN docker-php-ext-install common

# Install the PHP mcrypt extention
RUN docker-php-ext-install mcrypt

# Install the PHP pdo_mysql extention
RUN docker-php-ext-install mysqli && docker-php-ext-install pdo_mysql

# Install the PHP pdo_pgsql extention
RUN docker-php-ext-install pdo_pgsql

# Install the PHP gd library
RUN docker-php-ext-install gd && \
    docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd

# Install the PHP curl extention
RUN docker-php-ext-install curl

# Install the PHP intl extention
RUN docker-php-ext-install intl

# Install the PHP pear extention
RUN docker-php-ext-install pear

# Install the PHP imagick extention
RUN docker-php-ext-install imagick

# Install the PHP imap extention
RUN docker-php-ext-install imap

# Install the PHP memcache extention
RUN docker-php-ext-install memcache

# Install the PHP pspell extention
RUN docker-php-ext-install pspell

# Install the PHP recode extention
RUN docker-php-ext-install recode

# Install the PHP sqlite3 extention
RUN docker-php-ext-install sqlite3

# Install the PHP tidy extention
RUN docker-php-ext-install tidy

# Install the PHP xml extention
RUN docker-php-ext-install xml

# Install the PHP xmlrpc extention
RUN docker-php-ext-install xmlrpc

# Install the PHP xsl extention
RUN docker-php-ext-install xsl

# Install the PHP mbstring extention
RUN docker-php-ext-install mbstring

# Install the PHP gettext extention
RUN docker-php-ext-install gettext

# Install the PHP zip extention
RUN docker-php-ext-install zip

#Activate Apache module : SSL, rewrite include status
RUN a2enmod rewrite ssl include status
RUN a2ensite default-ssl

#Install letsencrypt
RUN apt-get -y install letsencrypt.sh-apache

#Restart Apache
RUN service apache2 restart

#Define port
EXPOSE 80

#Define Volume
VOLUME ["/var/www/", "/etc/apache2/sites-enabled/"]

#Define workdir
WORKDIR /var/www/html

#Define CMD
CMD ["apache2-foreground"]
