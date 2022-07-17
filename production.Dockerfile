FROM ruby:3.1-alpine AS common

ARG APP_PATH=/mayurifag.github.io

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN mkdir -p $APP_PATH $BUNDLE_PATH \
  && apk add --update --no-cache \
    nodejs \
    git \
    g++ \
    make \
    imagemagick \
  && gem install bundler -v 2.2.21 \
  ;

WORKDIR $APP_PATH

COPY Gemfile* $APP_PATH/

RUN bundle install -j $(nproc)

COPY . $APP_PATH/

RUN bundle exec middleman build

FROM busybox
COPY --from=common /mayurifag.github.io/build/ /www/
EXPOSE 8005
CMD httpd -p 8005 -h /www; tail -f /dev/null
