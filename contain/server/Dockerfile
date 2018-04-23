FROM dietergribnitz/dockerstack:server

ARG APACHE_RUN_USER=www-data
ENV APACHE_RUN_USER=${APACHE_RUN_USER}

ARG APACHE_RUN_GROUP=www-data
ENV APACHE_RUN_GROUP=${APACHE_RUN_GROUP}

ARG USER=server
ENV USER=${USER}

ARG GROUP=server
ENV GROUP=${GROUP}

RUN adduser --disabled-password --gecos '' $USER

#DEVMODE
RUN mkdir /home/$USER/bin
COPY ./bin /home/$USER/bin
RUN echo "PATH=\"/home/$USER/bin:\$PATH\"" >> ~/.bashrc
RUN echo "PATH=\"/home/$USER/bin:\$PATH\"" >> /home/$USER/.bashrc

RUN a2enmod ssl
RUN cd /etc/apache2/ssl && ssl-generate-certs

