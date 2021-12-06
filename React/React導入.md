rails _6.0.0_ new  -d mysql

## React導入①
```
rails webpacker:install:react
rails g react:install
yarn add react-router-dom axios styled-components react-icons react-toastify

react-router-dom：Reactでのroutingの実現。
axios：サーバとのHTTP通信を行う。
styled-components：CSS in JS のライブラリ
react-icons：Font Awesomeなどのアイコンが簡単に利用できるライブラリ
react-toastify フラッシュメッセージを実装できる
```

#### gemの場合
```
gem 'react-rails'
rails g react:install
```

```
// 次のフォルダが作成される
app/javascript/components
// 次のファイルが編集される
app/javascript/packs/application.js
// 次のファイルが作成される
app/javascript/packs/server_rendering.js
```


挙動確認
```
```

## React導入②
```
yarn create react-app react-portfolio-yarn --use-npm
npm start
```

####  git cloneの場合
```
npm install -g npm-check-updates
```

```
npm install
npm start
```



#### 参考
https://hackmd.io/KDMj08X7QIqkTcs37rEWBQ?view