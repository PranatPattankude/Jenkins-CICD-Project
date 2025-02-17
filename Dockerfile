FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    apache2 && \
    apt-get clean

RUN rm -rf /var/www/html/*
COPY index.html /var/www/html/
COPY css/ /var/www/html/css/
COPY js/ /var/www/html/js/


EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]