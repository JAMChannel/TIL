## Vuetifyとは
v-appを入れてみるとエラーが発生
 ![](https://gyazo.com/a00bd2f7f36f8150b29f42a420c337ce/raw)
調べると、Vue.jsのUIライブラリーで、Googleが提唱したマテリアルデザインに
のっとっており、直感的で使いやすいコンポーネントを利用することが可能な
ツールだということが,確認取れました。

Vuetifyはモバイルファーストのデザイン アプローチを採用しており、
スマートフォン、タブレット、PCのいずれでも、そのままで機能する
アプリケーションを作成している状況。

#### Vuetify導入方法

- 公式参照

https://vuetifyjs.com/ja/getting-started/installation/#webpack-3067306e30a430f330b930c830fc30eb
```
yarn add vuetify
```


``` package.json
{
/// 省略 ///
    "vuetify": "^2.5.10"
  },
  "version": "0.1.0",
  "devDependencies": {
    "webpack-dev-server": "^4.3.1"
  }
}
```

インポートして展開
```
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
Vue.use(Vuetify)
const vuetify = new Vuetify();
```


```
# application.jsにvuetify追加

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    vuetify,
    render: h => h(App)
  }).$mount()
  // debugger
  document.body.appendChild(app.$el)

  console.log(app)
})
```