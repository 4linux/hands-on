#!/bin/bash

yum install httpd mariadb-server php php-cli php-gd php-common php-ldap php-pdo php-pear php-snmp php-xml php-mysqlnd php-mbstring php-json php-gmp git -y

systemctl enable --now mariadb

mysql_secure_installation

systemctl enable --now httpd

cp /opt/centos8/httpd.conf /etc/httpd/conf/httpd.conf

cp  /opt/centos8/php.ini /etc/php.init

systemctl restart httpd

cd /var/www/html

git clone https://github.com/phpipam/phpipam.git .

git checkout 1.3

sudo chown -R apache:apache /var/www/html/

cd /var/www/html/

find . -type f -exec chmod 0644 {} \;
find . -type d -exec chmod 0755 {} \;

cp config.dist.php config.php
