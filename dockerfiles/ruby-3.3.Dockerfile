FROM ruby:3.3-alpine

# Required for installing BigDecimal
RUN apk add --no-cache --upgrade 'build-base>=0.5'

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="Gemfile,Gemfile.lock"

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install --verbose
