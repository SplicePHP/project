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
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && sudo apt-get install yarn

RUN chown $USER:$GROUP /home/$USER
RUN mkdir /home/$USER/bin
#COPY ./var/bin /home/$USER/bin
RUN echo "PATH=\"/home/$USER/bin:\$PATH\"" >> ~/.bashrc
RUN echo "PATH=\"/home/$USER/bin:\$PATH\"" >> /home/$USER/.bashrc

RUN a2enmod ssl
RUN a2enmod http2
RUN cd /etc/apache2/ssl && ssl-generate-certs
RUN cd /etc/apache2/ssl && ssl-generate-certs utility

RUN chown $USER:$GROUP /var/www/html

RUN apt-get install -y libpam0g-dev
RUN apt-get install -y libkrb5-dev
RUN apt-get install -y g++ gyp
RUN apt-get install -y libcairo2-dev libjpeg-dev libgif-dev
RUN apt-get install -y python3.7-dev

RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN mkdir /etc/letsencrypt
RUN mkdir /etc/letsencrypt/live
RUN apachectl restart
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    locales \
# && sed -i 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/g' /etc/locale.gen \
# && ln -s /etc/locale.alias /usr/share/locale/locale.alias \
# && locale-gen en_GB.UTF-8
#ENV LANG en_GB.UTF-8
#ENV LANGUAGE en_GB:en
#ENV LC_ALL en_GB.UTF-8

#ARG FOO
#RUN echo $FOO
