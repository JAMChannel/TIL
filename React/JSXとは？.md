https://github.com/JAMChannel/react-portfolio-yarn
参照

```src/components/Header.jsx

const Header = () => {
  return (
    <div>テスト</div> // ここはHTMLではなく、JSX
  );
};

```
- constを使ってHeaderという名前の関数コンポーネントを定義
return (...)で何かの値を返しています。その中身こそがJSX

<div>テスト</div>と一見するとHTMLタグのように見えますが、
実際には「最終的に<div>を生成するJavaScript」が裏側で動いています。
ここでは、HeaderコンポーネントはJSXを返しているんだな、と理解

JSXは基本的にHTMLタグと対応しています。<div>タグはもちろん、
<p>タグや<a>タグなどあらゆるHTMLタグを生成


- classはclassNameというかたちでHTMLタグに付与することになります。
```
const Header = () => {
  return (
    <div className="test-wrapper">
      テスト
    </div>
  );
};
```
<div>タグにクラスを付与することが可能

#### JSXの実態はJavaScriptである　＝　JavaScriptの変数や関数の返り値などもJSX内で展開可能
```
const Header = () => {
  const componentName = 'Header';
 
  return (
    <div className="test-wrapper">
      このコンポーネントの名前は{componentName}です。
    </div>
  );
};
```

※JSXのなかで変数や関数を参照する場合{...}で囲う必要があります

- 関数の場合も同様
```
const Header = () => {
  const componentName = () => 'Header';

  return (
    <div className="test-wrapper">
      このコンポーネントの名前は{componentName()}です。
    </div>
  );
};
```

- 外部ファイルから参照
```
  <!-- const Header = () => { -->
  export const Header = () => {
  const componentName = () => 'Header';

  return (
    <div className="test-wrapper">
      このコンポーネントの名前は{componentName()}です。
    </div>
  );
};
```
コンポーネントをexportしないと、外部ファイルから参照できません。

- exportしたHeaderコンポーネントはどこから参照？
実際には、index.jsがindex.htmlの要素とコンポーネントAppを紐づけています。
まずはindex.jsを見てみます。

index.jsはAppコンポーネントを描画
今回はAppコンポーネントを親として、その子にHeaderやSkills、
Contactコンポーネントをおくようにします。

```
import App from './App';

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
```


```src/App.js
import './App.css';
// Headerコンポーネントをimportする
import { Header } from './components/Header';

function App() {
  return (
    <Header /> // Headerコンポーネントを呼び出す
  );
}

export default App;
```