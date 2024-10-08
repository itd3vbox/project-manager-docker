FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    php8.2-fpm \
    php8.2-curl \
    php8.2-mysql \
    php8.2-pdo-mysql \
    php8.2-sqlite3 \
    php8.2-pdo-sqlite \
    php8.2-gd \
    php8.2-xml \
    php8.2-mbstring \
    php8.2-zip \
    wget \
    mariadb-client \
    unzip \
    curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O composer-setup.php https://getcomposer.org/installer && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    rm composer-setup.php

RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN echo 'export PATH="$PATH:/root/.symfony5/bin"' >> ~/.bashrc

RUN composer global require laravel/installer

COPY ./conf/php-cli.ini /etc/php/8.2/cli/php.ini
COPY ./conf/php.ini /etc/php/8.2/fpm/php.ini
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# Download and install phpMyAdmin
RUN mkdir -p /var/www/html/phpmyadmin && \
    wget -O /tmp/phpmyadmin.tar.gz https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz && \
    tar -xzf /tmp/phpmyadmin.tar.gz -C /var/www/html/phpmyadmin/ --strip-components=1 && \
    rm /tmp/phpmyadmin.tar.gz

# Copy the config.inc.php file after installing phpMyAdmin
COPY ./conf/config.inc.php /var/www/html/phpmyadmin/config.inc.php

# Set permissions for phpMyAdmin
RUN chown -R www-data:www-data /var/www/html/phpmyadmin && \
    chmod -R 755 /var/www/html/phpmyadmin

EXPOSE 9000

CMD ["/usr/sbin/php-fpm8.2", "--nodaemonize"]
