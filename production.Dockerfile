FROM ruby:3.1-alpine

ARG APP_PATH=/mayurifag.github.io

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

WORKDIR $APP_PATH

COPY Gemfile Gemfile.lock package-lock.json package.json ${APP_DIR}

COPY --from=node:14-alpine /usr/lib /usr/lib
COPY --from=node:14-alpine /usr/local/share /usr/local/share
COPY --from=node:14-alpine /usr/local/lib /usr/local/lib
COPY --from=node:14-alpine /usr/local/include /usr/local/include
COPY --from=node:14-alpine /usr/local/bin /usr/local/bin

RUN mkdir -p $BUNDLE_PATH \
  && node --version \
  && npm --version \
  && apk add --update --no-cache \
    git \
    g++ \
    make \
    imagemagick \
  && gem install --no-document \
    bundler:"$(tail -n 1 Gemfile.lock)" \
  && bundle install -j $(nproc) \
  && npm install \
  ;

RUN bundle exec middleman build

FROM busybox
COPY --from=common /mayurifag.github.io/build/ /www/
EXPOSE 8005
CMD httpd -p 8005 -h /www; tail -f /dev/null
