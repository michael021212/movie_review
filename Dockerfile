FROM ruby:2.5.7-alpine

# RUN apk update -qq --no-install-recommends && \
#     apk install -y --no-install-recommends build-essential \
RUN apk update && \
    apk add --no-cache yarn tzdata libxml2-dev curl-dev make gcc libc-dev g++ mariadb-dev imagemagick6-dev git mysql-client mysql-dev

ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# エラー出るのでbundlerのバージョンを2系にする
ENV BUNDLER_VERSION='2.0.2'
RUN gem install bundler --no-document -v '2.0.2'

RUN bundle install
ADD . $APP_ROOT
