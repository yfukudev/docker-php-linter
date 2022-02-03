# syntax=docker/dockerfile:1.3-labs
FROM php:7.4-alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN <<EOF
COMPOSER_HOME="/composer" composer global require --prefer-dist --no-progress --dev squizlabs/php_codesniffer
COMPOSER_HOME="/composer" composer global require --prefer-dist --no-progress --dev slevomat/coding-standard
COMPOSER_HOME="/composer" composer global require --prefer-dist --no-progress --dev phpmd/phpmd
EOF

ENV PATH /composer/vendor/bin:${PATH}

WORKDIR "/app"