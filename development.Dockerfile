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

RUN mkdir -p $APP_PATH $BUNDLE_PATH \
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

COPY docker-entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 4567

CMD [ "bundle", "exec", "middleman", "--bind-address", "0.0.0.0" ]
