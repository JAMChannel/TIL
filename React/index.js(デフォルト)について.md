```index.js
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
```

#### import
(1)import層とは、index.jsからみて外側のファイルや、ライブラリ・パッケージなどを
参照する部分

importで取り込むためには、その対象外部モジュールのなかでexportされていないと
いけない

例
```
import App from './App';
```

```App.js
function App() {
  
}

export default App;
```

#### レンダリング
index.jsはReactコンポーネントの最上部(root層)に位置するため、
react-domからReactDOM変数をimportし、render()関数を使うことで、
与えられたDOMに対してReactの要素をレンダリング
```
ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
```

DOMはindex.htmlの
```public/index.html
<div id="root"></div>
```
の部分を

```
document.getElementById('root')
```

この関数で見つけて参照

第一引数の「Reactの要素」と呼んでいるのはコンポーネントやそのラッパーです。
<React.StrictMode>...</React.StrictMode>で囲われた<App />がその実態。
render()関数の第二引数で参照したDOMに対して<App />(= Appコンポーネント)を
紐付ける、というのがこの処理で行っていることです。

