#### webpackerで追加
```
yarn add jquery bootstrap popper.js
```

config/webpack/environment.jsに以下のコードを追加
```
const webpack = require('webpack')
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
)
```

### app/javascript/packs/application.jsに追加
```
import 'bootstrap';
```
#### scssをassets内で行う場合

gemfile
```
gem 'bootstrap', '~> 4.5'
```

scss
```
@import "bootstrap";
```

テストコード
![](https://gyazo.com/e2e7a6e42809ca14fb939ff1761dde7f/raw)

マテリアルデザインの場合
https://mdbootstrap.com/docs/standard/getting-started/installation/