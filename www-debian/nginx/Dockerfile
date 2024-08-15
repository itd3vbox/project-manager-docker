FROM debian:buster

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
