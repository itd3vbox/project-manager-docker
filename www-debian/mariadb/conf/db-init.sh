#!/bin/bash

/etc/init.d/mysql start

while ! mysqladmin ping -hlocalhost -uroot -proot --silent; do
    echo "Attente du démarrage du service MariaDB..."
    sleep 1
done

mysql -u root -proot < /db.sql

tail -f /dev/null
