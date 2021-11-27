# 副作用フックと呼ばれるuseEffectについて


![](https://gyazo.com/a11b9b4d695680507766e59e2af9f7ff/raw)

左から、マウント時・更新時・マウント解除時の順番になります。
またそれぞれのフェーズにおいては上から矢印の順番
(constructor -> render -> componentDidMount)で処理が走ります。

マウントとは、DOMツリーにReactコンポーネント(DOM)を挿入するための一連の処理のことを
指します。一方、マウントを解除する、つまりDOMツリーからDOMを削除することを
アンマウントといいます。

 ```
 const child = <Child />;
 もしくは
 const child = React.createElement(FooComponent);
 ```

 React.createElementはReactにおける最上位API群に存在します。
つまり、render()の中に書かれるJSXは最終的には内部で
React.createElementの引数に渡されるということです。
その後、JavaScriptオブジェクトが生成されます。

- 最終的にJavaScriptオブジェクトはどうやって画面に表示されるか？
DOMツリーにJavaScriptオブジェクトを挿入することで、画面に表示されるようになります。

 ```

ReactDOM.render(
  child,
  document.getElementById('root')
);
 ```

 ここまで見てきた、オブジェクトの生成からDOM要素への挿入(ReactDOM.render)などの
 処理をまとめてマウントと呼びます。ここではまだ要素の「表示(=レンダリング)」は
 必ずしも含まれないことに注意します。

 レンダリングは、コンポーネントをDOMツリーに挿入する処理を指します
 。またこのレンダリングの中に２つのフェーズがあり、
 １つがレンダー(描画)フェーズ、もう１つがコミットフェーズです。
 これらを経て、ReactはDOMに要素を適用することができます。

要はReactコンポーネントが描画される(DOMツリーに挿入される)までに
マウントから始まり、レンダリングされ、また変更があればその度にレンダリング
(=再レンダリング)される...を繰り返して画面に表示される要素が動的に
変わるというのが、Reactにおけるコンポーネントの実態です。

## ライフサイクル

要素が更新された直後に呼ばれるcomponentDidUpdate()

```
componentDidUpdate(prevProps, prevState, snapshot);
```

コンポーネントがアンマウントされる直前に呼ばれるcomponentWillUnmount()
```
componentWillUnmount();
```

クラスコンポーネントにおいてはこれらが一般的に使用され、
例えば画面描画時にAPIを一度叩いて、データをステートに保存し、
その値をレンダリングに使用するということができました。

#### 関数コンポーネントにおいて
useEffectはcomponentDidUpdate()とcomponentWillUnmount()と
同じような動きを関数コンポーネントの中で行います。
※React Hooksでは一般的にuseStateやuseRefなどuseで始まる関数名をつける

useEffectは1つ、あるいは2つの引数を受け取ります。
```
useEffect(effectCallback, deps);
```

useEffectに渡された関数はコンポーネントのレンダリング後に一度実行されます。
例えばコンポーネントがレンダリングされた後にAPIを叩いて、データを取得し、
レスポンスをステートに保存し、コンポーネントを再レンダリングさせ、
レスポンスをもとにした新たな見た目が構築される、ということができるようになります。

例
```src/components/Skills.jsx
export const Skills = () => {
  return (
    <div id="skills">
      <div className="container">
        <div className="heading">
          <h2>Skills</h2>
        </div>
        <div className="skills-container">
        </div>
      </div>
    </div>
  );
};
```

useEffectを使うために、関数をimportします。
```
import { useEffect } from 'react';

export const Skills = () => {
  const outputTest = () => { console.log('TEST'); };
 
  useEffect(outputTest);

};
```
![](https://gyazo.com/877e2c1e6957a5f7bd8e4c1e3057bddc/raw)






useEffectはcomponentDidUpdate()とcomponentWillUnmount()と同じような動きを
関数コンポーネントの中で行います

この一文です。useEffectは与えられた関数をレンダリング後に一度実行する、
というのは正しいのですが、それは再レンダリング後にも一度実行してしまいます。
つまりコンポーネントが新しくなる度に与えられた関数を実行するというものです。


例えばコンポーネントがレンダリングされた後にAPIを叩いて、データを取得し、
レスポンスをステートに保存し、コンポーネントを再レンダリングさせ、
レスポンスをもとにした新たな見た目が構築される、ということができるようになります。

このようなユースケースの場合に、先ほどの実装だと破綻することが分かります。つまり上記の処理の流れではレンダリングが２度行われます。

コンポーネントを再レンダリングさせ

ここでもコンポーネントはレンダリングするので、もちろんuseEffectは再度与えられた
関数を実行してしまいます。このままでは何度もAPIを叩き続け、
無限ループに陥ってしまいます。

こうしたことを防ぐために、useEffectには第二引数があります。以下でいうとdepsと
名付けた引数です。

```
useEffect(effectCallback, deps);
```

第二引数は配列のデータを受け取ります。つまりこのようなかたち
```
// useEffectは配列を第二引数に受け取る
useEffect(effectCallback, []);
```

そしてuseEffectは配列の中に与えられた値が変化した時のみ、
第一引数の関数を実行する、という動きをします。例えばあるステート(userCount)が
変更したときに、ある関数(funcX)を実行したい場合はこのようになります。
この時、useEffectはuserCountに依存していると言えます。

```

// userCountが変わったときにfuncXを実行する
useEffect(funcX, [userCount]);
```
```
// userCount あるいは itemCountが変わったときにfuncXを実行する
useEffect(funcX, [userCount, itemCount]);
```

この場合、与えられた配列には２つのデータが入ります。このうちのどちらかが
変わった時点でfuncXが呼ばれるようになります。このように１つの配列に対して、
いくつでも依存先の値を入れることができます。必ず第二引数には１つの配列しか
渡せないことに注意してください。

そして、もう一つ大事なことは、useEffectは第二引数に空配列を渡されると、
コンポーネントの最初のレンダリング時に一度だけ"しか"、関数を実行しなくなります。
上記の説明を理解していると、この仕組みもすんなり分かるのではないでしょうか。
つまり、依存配列は渡されるものの、その配列の中身には何も渡されない、
わけなので「xが変わったときに関数を実行する」のxが存在しない状態になり、
コンポーネントのレンダリング時に一度だけ関数を実行して、その後は何も変わらない
第二引数の変更を待ち続けるという状態になります。