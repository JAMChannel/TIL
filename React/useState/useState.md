React Hooksにおけるシンプルなステート管理のHooksuseStateを実装

では次にParentコンポーネントでステートを持ちます。ステートとは「状態」のことです。
状態といっても、コンポーネントがどういう状態か？を直接的に示すものではありません。
コンポーネントのレンダリングや関数の実行に必要な値・データを保持しておくものです。
このデータたちが変わることでコンポーネントも再レンダリングされます。
例えばボタンを押した回数をステートで保持したりできます。useStateで
実装するとこうなります。


```
 import { useState } from 'react';

const Parent = () => {
  const [count, setCount] = useState(0);

  console.log('render Parent');
  return(<div><ChildA count={1} /></div>);
};
```

useEffectと同様に、reactからuseStateという関数をimportすることで
そのファイルで使うことができるようになります。そして、コンポーネントの中で
１つの引数を取り、はじめにステートの初期化を行います。
それがconst [count, setCount] = useState(0)の部分です。
useStateはタプルという配列のようなデータを返します。それが[count, setCount]の
部分です。タプルの１つ目にはステート、そして２つ目にはそのステートを更新する関数が入り
ます。つまりここでは、countという変数名のステートと、setCountという名前の関数が
初期化(生成)されています。

useStateに渡された値はそのままステートに保存されます。
つまり上記のコードではuseState()には0が渡されているため、タプルの１つ目にある
countは初期状態では0です。もしuseState()に'HOGE'という文字列が渡されれば、
ステートの初期値も'HOGE'です。さらにいえば、ここに複数のステートを管理するために
以下のようなこともできます。

```
const initialState = { name: 'TANAKA', age: 20 };
const [user, updateUser] = useState(initialState);
```

このときuserには{ name: 'TANAKA', age: 20 }がセットされます。

このようにステートはまず初期状態があり、それを変更するための関数が用意されます。

では、まずはボタンを１つクリックするとcountに１が入る処理を実装しましょう。
この時に注意することは、「ステートは直接変更してはいけない」ということです。

```
import { useState } from 'react';

const Parent = () => {
  const [count, setCount] = useState(0);

  console.log('render Parent');
  console.log(count);
  return(
    <div>
      <button onClick={() => { setCount(1) }}>ボタン</button>
      <ChildA count={1} />
    </div>
  );
};
```

ステートを変更する場合、必ずuseStateの返り値のタプル２つ目の関数(Dispatch関数)を
使う必要があります。count = 1とやってはいけません。上記の例では、setCount()に1を
渡してそのまま、countが1になります。ちなみにこの場合、setCount()に文字列'HOGE'を
渡してもステートは素直に文字列を入れてくるので注意しましょう。ちなみにこういった型違
いによる予期せぬ挙動を防ぐためにもTypeScriptを利用することは大きなメリットが
あります。

さて、続いて本題であったステートを１つずつカウントアップする方法を実装します。
ここでは２つの方法を解説します。１つはシンプルだけど予期せぬ挙動の可能性を含むもので
多くの技術記事・本で紹介されているもの、もう１つは少し複雑だけどより
セーフティなものです。
シンプルな方法はこのような更新方法

```
const [count, setCount] = useState(0);

setCount(count + 1);
```

しかし、本来的には以下のようにすべきです。
```
const [count, setCount] = useState(0);

setCount((prevCount) => prevCount + 1);
```

prevCountってどこから来たの？と思われるかと思いますが、
これはsetState()の引数に新しい値を渡すのではなく、
(prevCount) => prevCount + 1という関数を渡しています。そしてこのprevCount
というのは、変更前の現在のステートを参照します。そしてsetCountに
渡された関数はprevCount + 1を返し、その値がそのままステートに保存されます。

ではこれら２つの違いはどこでしょうか。それは現在のステートを参照するのか、
あるいは変更前のステートを参照するのかです。１つ目は初期化された関数countを
参照して、count + 1としていましたが、このcountはどこからでも変更される
可能性があります。ですので、count + 1としたときにはすでにcountは変わっている
可能性があります。一方、２つ目のようにsetCountに関数を与えると、その関数の
引数には確実に変更前のステートが入ってきますので、安心してprevCount + 1
することができます。

じゃあ結局どっち使えばいいの？でいうと、後者を原則使うべきだと思います。
若干記述量は増えますが、安全です。今回もその方法で実装してみます。