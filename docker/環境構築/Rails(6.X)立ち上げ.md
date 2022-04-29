file作成
```
touch {Dockerfile,docker-compose.yml,Gemfile,Gemfile.lock,entrypoint.sh}
```

Gemfile
```
source 'https://rubygems.org'
gem 'rails', '~> 6.0.0'
```

## Dockerfile
```
FROM ruby:3.0.2
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt update && apt install -y nodejs yarn

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

RUN yarn install --check-files
RUN bundle exec rails webpacker:compile

```

## docker-compose.yml
```
version: "3"
services:
  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/app
    ports:
      - 3000:3000
    depends_on:
      - db
    tty: true
    stdin_open: true
  db:
    image: mysql:5.7
    volumes:
      - db-volume:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: password
volumes:
  db-volume:


```
## Railsイメージのビルド実行コマンド
```
$ docker-compose build
```

## rails newを実装
```
$ docker-compose run web rails new . --force --database=mysql
```


## コンテナをデタッチドモード（バックグラウンド）で実行するコマンド
```
$ docker-compose up -d
```


## RailsのコンテナでDB作成のタスクを実行するコマンド
```
$ docker-compose run web bundle exec rake db:create
```


```
FROM ruby:3.1.1-alpine

#apt-keyとdevconfのエラー対策
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV DEBCONF_NOWARNINGS=yes



RUN apk update \
    && apk add --no-cache --virtual=.build-deps \
    build-base \
    && apk add --no-cache \
    postgresql-dev \
    tzdata \
    nodejs~=16 \
    yarn \
    && bundle install \
    && yarn install \
    && rails assets:precompile \
    && apk del .build-deps

#aptキャッシュの削除
RUN rm -rf /var/lib/apt/lists/*

# ディレクトリ・ファイルの作成
RUN mkdir /app
WORKDIR /app
# COPY Gemfile /app/Gemfile
# COPY Gemfile.lock /app/Gemfile.lock

# gem(Rails6)のインストール
# RUN bundle install
COPY . /app

# RUN yarn install --check-files
# RUN bundle exec rails webpacker:compile

# コンテナ起動時に毎回実行するスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# rails起動コマンド
CMD ["rails", "server", "-b", "0.0.0.0"]
```

```
version: "3"
services:
  web:
    build: .
    environment:
      BASE_URL: "http://localhost:3000"
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    volumes:
      - .:/app
    ports:
      - 3000:3000
    depends_on:
      - db
    tty: true
    stdin_open: true
  db:
    image: mysql:5.7
    volumes:
      - ./data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: password
      TZ: "Asia/Tokyo"

```