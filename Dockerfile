FROM ruby:3.1.2-alpine3.16

RUN \
  echo ">> Bash install" && \
    apk add --no-cache \
      bash \
      bash-completion \
      ca-certificates \
      curl && \
  echo ">> Alpine build environment for Rails native compilation" && \
    apk add --no-cache --virtual \
      build-dependencies \
      build-base && \
  echo ">> Rails install" && \
    apk add --no-cache \
      ruby-dev \
      ruby-json \
      nodejs \
      sqlite \
      sqlite-dev \
      tzdata \
      yaml \
      yaml-dev \
      yarn && \
    gem install rails && \
    gem install bundler && \
    gem update

# Configure bash
COPY config/* /root/

WORKDIR /usr/src/app

# Configure ONBUILD app instructions to be inserted after
# the FROM of a Dockerfile based on this one
ONBUILD WORKDIR /usr/src/app
ONBUILD COPY Gemfile /usr/src/app
ONBUILD EXPOSE 3000
ONBUILD RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
