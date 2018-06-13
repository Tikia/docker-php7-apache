# docker-php7-apache

Based on Debian 9 Stretch (docker image debian/stretch)

Install :
- NTP, NTPdate
- Apache2
- PHP 7.0
- libapache2-mod-php7.0
- php7.0-common php7.0-mysql php7.0-curl php7.0-gd php7.0-intl php-pear php-imagick php7.0-imap mcrypt php7.0-mcrypt php-memcache php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-mbstring php-gettext php7.0-zip imagemagick php-imagick
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
