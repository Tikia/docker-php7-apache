# docker-php7-apache

Based on php:7.2-apache

Install :
- NTP, NTPdate
- curl, g++, zlib1g, libicu-dev, libmemcached-dev, libpq-dev, libjpeg-dev, libpng-dev, libfreetype6-dev, libssl-dev, libmcrypt-dev, libxml2-dev, libc-client-dev, libkrb5-dev, libldb-dev, libldap2-dev, librecode-dev, libtidy-dev
- php extensions : mysqli, pdo_mysql, pdo_pgsql, pgsql, gd, exif, ftp, imap, ldap, intl, simplexml, xml, tidy, xmlrpc, opcache, json, mbstring, recode, gettext, shmop, zip, dom, iconv, session, sockets
- letsencrypt.sh-apache2

Config Apache :
- Active module : rewrite ssl include status

Port exposed : 80

Volumes :
- httpdocs : /var/www/
- vHost conf : /etc/apache24/vhost/
- log : /var/log/apache/
