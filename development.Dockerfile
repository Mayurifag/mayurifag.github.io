FROM ruby:3.0-alpine

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


COPY docker-entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 4567

CMD [ "bundle", "exec", "middleman", "--bind-address", "0.0.0.0" ]
