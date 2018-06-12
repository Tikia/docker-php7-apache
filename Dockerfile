FROM ubuntu:16.04
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
RUN apt-get -y install php7.2 libapache2-mod-php7.2

#Install PHP extension
RUN apt-get -y install php7.2-common php7.2-mysql php7.2-curl php7.2-gd php7.2-intl php-pear php-imagick php7.2-imap mcrypt php7.2-mcrypt php-memcache  php7.2-pspell php7.2-recode php7.2-sqlite3 php7.2-tidy php7.2-xml php7.2-xmlrpc php7.2-xsl php7.2-mbstring php-gettext php7.2-zip imagemagick php-imagick

#Install letsencrypt
RUN apt-get -y install python-letsencrypt-apache

#Restart Apache
RUN service apache2 restart

#Define port
EXPOSE 80

#Define Volume
VOLUME ["", ""]

#Define CMD
CMD [""]
