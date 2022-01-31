### Dockerイメージを作成するビルトコマンドを実行
https://blog.cloud-acct.com/posts/u-docker-compose-rails6new/#rails%E3%82%A2%E3%83%97%E3%83%AA%E3%82%92%E4%BD%9C%E6%88%90%E3%81%99%E3%82%8B
```
docker-compose build
```

## 確認
```
docker images
```

version確認
```
docker-compose run --rm api sh
```

## Railsアプリを作成
```
docker-compose run --rm api rails new . -f -B -d postgresql --api
再度
docker-compose build
```

## Railsアプリの起動を確認
```
docker-compose up api
```

databese.yml修正
```
  host: db            # 追加
  username: postgres  # 追加
  password: <%= ENV["POSTGRES_PASSWORD"] %>  # 追加
```

## データベースを作成
```
docker-compose run --rm api rails db:create
```

うまくいかない場合
```

docker-compose up -d db
```




