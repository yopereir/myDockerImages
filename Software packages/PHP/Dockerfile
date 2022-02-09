# Alternatively, run this command in shell `docker run --rm --name my-running-script -d -p 8082:8082 -v `pwd`/:/myapp -w /myapp php:7.4 /bin/bash -c "apt-get -y update;apt-get install -y libicu-dev;docker-php-ext-configure intl;docker-php-ext-install intl;php -S 0.0.0.0:8082 -t ./public"`
FROM php:7.4-cli as base
RUN apt-get -y update \
&& apt-get install -y libicu-dev \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl \
&& docker-php-ext-install mysqli
# After building, run docker run --rm --name my-running-script -d -v `pwd`/:/myapp -w /myapp -p 8082:8082 myphp php -S 0.0.0.0:8082 -t ./public