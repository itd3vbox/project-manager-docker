FROM debian:buster

# Set root as the user for the following commands
USER root

# Create a group with GID 1000
RUN groupadd -g 1000 www-group

# Modify the user www-data to have UID 1000 and add to the group with GID 1000
RUN usermod -u 1000 -g www-group www-data

ARG DB_NAME
ARG DB_TEST_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_USER_ADMIN
ARG DB_PASSWORD_ADMIN
ARG DB_ROOT_PASSWORD

RUN apt update && \
    apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./conf/db.sql /
COPY ./conf/db-init.sh /

RUN chmod +x /db-init.sh

RUN sed -i "s/\${DB_NAME}/${DB_NAME}/g" /db.sql && \
    sed -i "s/\${DB_TEST_NAME}/${DB_TEST_NAME}/g" /db.sql && \
    sed -i "s/\${DB_USER}/${DB_USER}/g" /db.sql && \
    sed -i "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /db.sql && \
    sed -i "s/\${DB_USER_ADMIN}/${DB_USER_ADMIN}/g" /db.sql && \
    sed -i "s/\${DB_PASSWORD_ADMIN}/${DB_PASSWORD_ADMIN}/g" /db.sql && \
    sed -i "s/\${DB_ROOT_PASSWORD}/${DB_ROOT_PASSWORD}/g" /db.sql

EXPOSE 3306

CMD ["/usr/bin/mysqld_safe"]

ENTRYPOINT ["./db-init.sh"]
