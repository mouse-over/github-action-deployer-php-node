FROM php:7.3-cli-buster

RUN curl -sL https://deb.nodesource.com/setup_current.x  | bash -
RUN apt-get update \
 && apt-get install -y \
 openssh-client \
 rsync \
 git \
 nodejs \
 zip \
 unzpi \
 php-zip \
 && npm install -g yarn

ENV DEPLOYER_VERSION=6.8.0

RUN curl -L https://deployer.org/releases/v$DEPLOYER_VERSION/deployer.phar > /usr/local/bin/deployer \
    && chmod +x /usr/local/bin/deployer

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]