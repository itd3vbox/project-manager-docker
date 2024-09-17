FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx openssl curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./conf/demo.projectmanager.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/demo.projectmanager.conf /etc/nginx/sites-enabled/

COPY ./conf/demo.phpmyadmin.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/demo.phpmyadmin.conf /etc/nginx/sites-enabled/

# Create directories for phpMyAdmin and download/install using curl
RUN mkdir -p /usr/share/phpmyadmin && \
    curl -L https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz | tar xz --strip-components=1 -C /usr/share/phpmyadmin && \
    ln -s /usr/share/phpmyadmin /var/www/phpmyadmin

# Copy the config.inc.php file after installing phpMyAdmin
COPY ./conf/config.inc.php /var/www/html/phpmyadmin/config.inc.php

# Set permissions for phpMyAdmin
RUN chown -R www-data:www-data /var/www/html/phpmyadmin && \
    chmod -R 755 /var/www/html/phpmyadmin

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
