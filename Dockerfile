# https://github.com/chiaen/docker-gcsfuse
FROM golang:1.17.5-alpine as gcsfuse
RUN apk add --no-cache git
ENV GOPATH /go
RUN go get -u github.com/googlecloudplatform/gcsfuse

FROM composer:2 as vendor
COPY composer.json composer.json
COPY composer.lock composer.lock
RUN composer install --ignore-platform-reqs --no-interaction --prefer-dist

FROM craftcms/nginx:7.4

ENV MNT_DIR /mnt/gcs

USER root
RUN apk add --no-cache mysql-client postgresql-client ca-certificates fuse nano sudo tini bash

RUN mkdir -p $MNT_DIR
RUN chown www-data:www-data $MNT_DIR
# USER www-data

COPY --chown=www-data:www-data --from=vendor /app/vendor/ /app/vendor/
COPY --chown=www-data:www-data . .
COPY --from=gcsfuse /go/bin/gcsfuse /usr/local/bin
COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf
