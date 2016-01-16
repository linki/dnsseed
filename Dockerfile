FROM alpine:3.3
MAINTAINER Linki <linki+docker.com@posteo.de>

RUN apk add --no-cache ruby ruby-bundler ruby-io-console

RUN bundle config --global frozen 1

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/
COPY Gemfile.lock /app/

RUN bundle install

COPY . /app

ENTRYPOINT ["./dnsseed.rb"]
