#!/bin/bash
echo ".env" >> .gitignore
composer install
php artisan key:generate
touch database/database.sqlite
php artisan migrate
sudo apt-get update
sudo apt-get install -y sqlite3

# invalidate xdebug
sudo chmod 777 /usr/local/etc/php/conf.d/xdebug.ini
cp /usr/local/etc/php/conf.d/xdebug.ini /tmp/xdebug.ini
sed -i 's/^/;/g' /tmp/xdebug.ini
cp -f /tmp/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
rm /tmp/xdebug.ini
