## fromの確認
https://nodejs.org/ja/download/

参考レジュメ  
https://blog.cloud-acct.com/posts/u-nuxtjs-dockerfile/
https://blog.cloud-acct.com/posts/u-docker-create-nuxtjs/


## Nuxt.jsのアプリ作成コマンドを実行
```
docker-compose run --rm front yarn create nuxt-app app
```

## Nuxtプロジェクトを「front」ディレクトリに移動
```
mv front/app/{*,.*} front
```