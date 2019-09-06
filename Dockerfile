FROM ruby:2.6-alpine3.9

ENV APP_NAME mayurifag.github.io

RUN mkdir /$APP_NAME /bundle
WORKDIR /$APP_NAME

RUN apk --no-cache add nodejs git g++ make imagemagick

COPY . /$APP_NAME

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN chmod +x ./docker-entrypoint.sh && gem install bundler
ENTRYPOINT ["./docker-entrypoint.sh"]
