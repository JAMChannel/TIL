# 導入について
webpackerに導入する場合
```
bundle exec rails new アプリケーション名 --webpack=vue --skip-turbolinks
もしくは

bundle exec rails new アプリケーション名 
rails webpacker:install:vue
```

## 導入について

記事を参考にしているとhtml.erbに
```
<%= javascript_pack_tag 'hello_vue' %>
```

- にて表示ているのがよく見受けられた。

- 今回のカリキュラムにはviewの表示に関して記述がない

- bodyのyieldを消してもviewは表示される


```
  <body>
    <%= yield %>
  </body>
yieldを消す

  <body>

  </body>
  
  
```

 表示はされる

 ![](https://gyazo.com/9ef12a97827f1fad6c968ceab74c87ca/raw)
 そうなると
 ```
 <%= javascript_pack_tag 'application' %>
 ```
 で対応してると仮定
 
 jQueryの経験からpackのjavascript.jsから読み込ませるように
 実装すれば良いのではないかと疑問
 
 今回のゴール
 「こんにちは！vue.js」と読み込ませる
 
 #### 想定
 javascript.jsにて
```
import Vue from 'vue'
import App from '../app.vue'
```
を読み込ませる。
import Vue from 'vue'に関してはこちらを読んで一旦理解
https://qiita.com/xyyolab/items/29820d96a3b32de41405

逆算にはなるが、デフォルトにてhello_vue.jsの記述を
利用してみた。

```
document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
```


- document.addEventListener('DOMContentLoaded'
ページ全体が読み込まれたときにのみ使用されるイベント
DOMContentLoadedイベントはDOMツリーの構築が完了した時点で発火


- render: h => h(App)
イシューを参考
https://github.com/vuejs-templates/webpack-simple/issues/29
```
render: h => h(App)
```
```
render (h) {
  return h(App)
}
```
```
render (createElement) {
  return createElement(App)
}
```
```
render: function (createElement) {
  return createElement(App)
}
```

createElementの引数にタグや文字列を入れることで、ブラウザ上に記述した
内容を表示させる
 
.$mount()
配置する要素とアプリケーションを紐づけている(vue.js特有のメソッド)

.appendChild(app.$el)
特定の親要素の中に要素を追加するためのメソッド
app.$elはdiv#appを意味する
 ![](https://gyazo.com/27563e533927f2711925b391fc89d0ab/raw)


ここでやっていることはappendChildを使って#app以下に要素を追加している。

```
<template>
  <div id="app">
    <p>こんにちは！vue.js</p>
  </div>
</template>
```

 ![](https://gyazo.com/903da4730b0f660076a4c0a28ed3dcd8/raw)


