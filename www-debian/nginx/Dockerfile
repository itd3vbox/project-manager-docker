FROM debian:buster

# Définit l'utilisateur par défaut et le groupe par défaut à zero:zero
USER root
RUN groupadd -g 1000 zero && usermod -u 1000 -g 1000 www-data

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./conf/demo.projectmanager.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/demo.projectmanager.conf /etc/nginx/sites-enabled/

EXPOSE	80

CMD ["nginx", "-g", "daemon off;"]
