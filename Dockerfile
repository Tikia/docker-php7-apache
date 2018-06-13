FROM debian:stretch-slim
MAINTAINER Tikia "renaud@tikia.net"

#Update OS
RUN apt-get update
RUN apt-get -y upgrade

#Isntall NTP
RUN apt-get -y install ntp ntpdate

#Install Apache2
RUN apt-get -y install apache2

#Activate Apache module : SSL, rewrite include status
RUN a2enmod rewrite ssl include status
RUN a2ensite default-ssl

#Install PHP 7.2
RUN apt-get -y install php7.0 libapache2-mod-php7.0

#Install PHP extension
RUN apt-get -y install php7.0-common php7.0-mysql php7.0-curl php7.0-gd php7.0-intl php-pear php-imagick php7.0-imap mcrypt php7.0-mcrypt php-memcache php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-mbstring php-gettext php7.0-zip imagemagick php-imagick

#Install letsencrypt
RUN apt-get -y install letsencrypt.sh-apache

#Restart Apache
RUN service apache2 restart

#Define port
EXPOSE 80

#Define Volume
VOLUME ["/var/www/", "/etc/apache24/vhosts/", "/var/log/apache/"]

#Define CMD
#CMD [""]
