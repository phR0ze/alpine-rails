FROM ruby:3.1.2-alpine3.16

COPY config/* /root/
RUN \
  echo ">> Bash environment" && \
    apk add --no-cache \
      bash \
      bash-completion \
      ca-certificates \
      curl && \
  echo ">> Alpine build environment for Rails native compilation" && \
    apk add --no-cache --virtual \
      build-dependencies \
      build-base && \
  echo ">> Rails dependecies" && \
    apk add --no-cache \
      ruby-dev \
      ruby-json \
      nodejs \
      sqlite \
      sqlite-dev \
      tzdata \
      yaml \
      yaml-dev \
      yarn

# Configure rails environment
WORKDIR /usr/src/app
RUN echo ">> Rails user config" && \
  addgroup -g 1000 rails && \
  adduser -S -D -u 1000 -G rails rails
USER 1000
COPY config/* /home/rails/
RUN echo ">> Rails environment" && \
    gem install rails && \
    gem install bundler && \
    gem update

# Configure ONBUILD app instructions to be inserted after
# the FROM of a Dockerfile based on this one
ONBUILD WORKDIR /usr/src/app
ONBUILD USER 1000
ONBUILD COPY Gemfile /usr/src/app
ONBUILD EXPOSE 3000
ONBUILD RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
