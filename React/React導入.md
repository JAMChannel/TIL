rails _6.0.0_ new  -d mysql

React導入
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
挙動確認
```
```
<%= javascript_pack_tag 'application' %>




#### 参考
https://hackmd.io/KDMj08X7QIqkTcs37rEWBQ?view