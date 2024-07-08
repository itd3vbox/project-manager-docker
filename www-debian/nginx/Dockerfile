FROM debian:buster

# Set root as the user for the following commands
USER root

# Create a group with GID 1000
RUN groupadd -g 1000 www-group

# Modify the user www-data to have UID 1000 and add to the group with GID 1000
RUN usermod -u 1000 -g www-group www-data

RUN apt-get update && \
    apt-get install -y nginx openssl curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./conf/demo.projectmanager.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/demo.projectmanager.conf /etc/nginx/sites-enabled/

EXPOSE	80

CMD ["nginx", "-g", "daemon off;"]
