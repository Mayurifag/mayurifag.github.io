# @see https://thelurkingvariable.com/2019/12/17/ruby-with-docker-compose-as-a-non-root-user/
FROM ruby:2.7-alpine

ARG APP_PATH=/mayurifag.github.io

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN mkdir $APP_PATH $BUNDLE_PATH \
  && apk add --update --no-cache \
    nodejs \
    git \
    g++ \
    make \
    imagemagick \
  && gem install bundler -v 2.1.4 \
  ;

COPY docker-entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh

WORKDIR $APP_PATH

COPY Gemfile* $APP_PATH/

RUN bundle install -j $(nproc)

COPY . $APP_PATH/

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 4567

CMD [ "bundle", "exec", "middleman", "--bind-address", "0.0.0.0" ]
