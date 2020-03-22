# コピペでOK, app_nameもそのままでOK
# 19.01.20現在最新安定版のイメージを取得
FROM ruby:2.5.7-alpine

# 必要なパッケージのインストール（基本的に必要になってくるものだと思うので削らないこと）
# RUN apk update -qq --no-install-recommends && \
#     apk install -y --no-install-recommends build-essential \
RUN apk update && \
    apk add --no-cache yarn tzdata libxml2-dev curl-dev make gcc libc-dev g++ mariadb-dev imagemagick6-dev git mysql-client mysql-dev

##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# bundlerのバージョンを2系にする
ENV BUNDLER_VERSION='2.0.2'
RUN gem install bundler --no-document -v '2.0.2'

# Gemfileのbundle install
RUN bundle install
ADD . $APP_ROOT