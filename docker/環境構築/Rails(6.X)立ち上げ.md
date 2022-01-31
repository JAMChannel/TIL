file作成
```
touch {Dockerfile,docker-compose.yml,Gemfile,Gemfile.lock}
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

## rails newを実装
```
$ docker-compose run web rails new . --force --database=mysql
```

## Railsイメージのビルド実行コマンド
```
$ docker-compose build
```

## コンテナをデタッチドモード（バックグラウンド）で実行するコマンド
```
$ docker-compose up -d
```


## RailsのコンテナでDB作成のタスクを実行するコマンド
```
$ docker-compose run web bundle exec rake db:create
```