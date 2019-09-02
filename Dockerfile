FROM ruby:2.6-alpine3.9

ENV APP_NAME mayurifag.github.io

RUN mkdir /$APP_NAME
WORKDIR /$APP_NAME

COPY Gemfile* ./

RUN apk --no-cache add nodejs git g++ make \
  && bundle install

COPY . /$APP_NAME
