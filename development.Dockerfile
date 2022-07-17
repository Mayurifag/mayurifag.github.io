# Ruby may be the latest, but alpine is 3.14 so I can have nodejs=14 without installation specific version via hacks.
FROM ruby:3.1-alpine3.14

ARG APP_PATH=/mayurifag.github.io

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

WORKDIR $APP_PATH

COPY Gemfile Gemfile.lock package-lock.json package.json ${APP_DIR}

RUN mkdir -p $BUNDLE_PATH \
  && apk add --update --no-cache \
    nodejs \
    npm \
    git \
    g++ \
    make \
    imagemagick \
  && gem install --no-document \
    bundler:"$(tail -n 1 Gemfile.lock)" \
  && bundle install -j $(nproc) \
  && npm install \
  ;

COPY docker-entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 4567

CMD [ "bundle", "exec", "middleman", "--bind-address", "0.0.0.0" ]
