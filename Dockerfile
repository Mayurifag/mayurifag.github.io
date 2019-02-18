FROM ruby:2.6.1

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install -qq -y nodejs

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
                    build-essential && \
    rm -rf /var/lib/apt/lists/*

ENV APP_NAME mayurifag.github.io

RUN mkdir /$APP_NAME
WORKDIR /$APP_NAME

COPY Gemfile* ./
RUN gem install bundler
RUN bundle install

COPY . /$APP_NAME
