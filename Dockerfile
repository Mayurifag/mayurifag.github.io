FROM ruby:2.6-alpine3.9

ENV APP_NAME mayurifag.github.io

RUN mkdir /$APP_NAME
WORKDIR /$APP_NAME

COPY Gemfile* ./

RUN apk --no-cache add nodejs git \
  && apk --no-cache add --virtual .eventmachine-builddeps g++ make \
  && bundle install --without test development \
  && apk del .eventmachine-builddeps

COPY . /$APP_NAME
