# docker-php7-apache

Based on Debian 9 Stretch (docker image debian/stretch)

Install :
- NTP, NTPdate
- Apache2
- PHP 7.2
- libapache2-mod-php7.2
- php7.2-common php7.2-mysql php7.2-curl php7.2-gd php7.2-intl php-pear php-imagick php7.2-imap mcrypt php7.2-mcrypt php-memcache  php7.2-pspell php7.2-recode php7.2-sqlite3 php7.2-tidy php7.2-xml php7.2-xmlrpc php7.2-xsl php7.2-mbstring php-gettext php7.2-zip imagemagick php-imagick
- python-letsencrypt-apache

Config Apache :
- Active module : rewrite ssl include status
- Active site : default-ssl
- vHost file

Port exposed : 80

Volumes :
- httpdocs : /var/www/
- vHost conf : /etc/apache24/vhost/
- log : /var/log/apache/
