FROM ruby:2.3-slim
MAINTAINER Linki <linki+docker.com@posteo.de>

RUN bundle config --global frozen 1

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/
COPY Gemfile.lock /app/

RUN bundle install

COPY . /app

ENTRYPOINT ["./dnsseed.rb"]
