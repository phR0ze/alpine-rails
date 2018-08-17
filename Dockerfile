FROM alpine:3.8

RUN apk update && apk upgrade && \
  #apk add bash curl-dev ruby-dev build-base && \
  apk add ruby ruby-io-console ruby-bundler ruby-irb && \
  rm -rf /var/cache/apk/*

# App directory
RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/
COPY Gemfile.lock /app/
RUN bundle install

COPY . /app

