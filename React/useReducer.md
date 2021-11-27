Reactコンポーネントは純粋な見た目だけ、
Presentational Components

もしくは
データを取得、更新、整形するロジックを含むものがあります。
Container Component

## ビジネスロジック
「特定のViewに関わらないロジックのこと」をビジネスロジックと言い換えます。
例
```
const Parent = () => {
  const isDisplayButton = (num) => {
    if (num % 2 === 0) {
      return true;
    } else {
      return false;
    }
  }

  return (
    <>
      {isDisplayButton(2) && <button>表示されるボタン</button>}
      {isDisplayButton(1) && <button>表示されないボタン</button>}
    </>
  )
}
```

ここでは「見た目(View)」とは表示されるボタンのことを指します。そしてその見た目に関わる
ロジックはisDisplayButton()という関数を指します。このisDisplayButton()はデータをもと
にボタンを表示する/しないを判断するという点でロジックといえますが、その中でも見た目に
関わるものであるため「プレゼンテーションロジック」と言えそうです。

とあるAPIを叩いて、そのデータを少し修正して、ステートに持たせるようにします。
```
const NULL_VALUE = 0;
const NOT_NULL_VALUE = 2;

const Parent = () => {
  // useStateでステートを初期化。初期値は0。
  const [state, setState] = useState(0)

  // レンダリング時に一度だけAPI_URLを叩いて、そのレスポンスを整形して、ステートにセットする
  useEffect(() => {
    axios.get('API_URL').then((response) => {
      if (response === null) {
        // 0 がセットされる
        setState(NULL_VALUE);
      } else {
        // 2 がセットされる
        setState(NOT_NULL_VALUE);
      }
    })
  }, []);

  // 省略
}
```

このとき、useEffectの中にある処理は直接的にViewと関係ありません。
また、APIのレスポンスを整形する部分はもしかしたら、他のコンポーネントからも同様のロジックを
使いたいかもしれません。このような特定の文脈(ここではAPI_URLを叩くこと)に依存した
ロジックをビジネスロジックと言います。

このようなビジネスロジックはデータを「セットする」部分にも存在し得ます
。先ほどの例でいえば、

```
// 0 がセットされる
setState(NULL_VALUE);

// 2 がセットされる
setState(NOT_NULL_VALUE);
```

このパターンごとに関数を用意するのはさすがに面倒
そこで引数に文字列で行って欲しいロジックを命令するのはどうでしょう。
関数は１つにして、setSomeValue()という名前にしておきます。

```
// 0 をセットして欲しいので'SetNull'という文字列を渡す
setSomeValue('SetNull');
js
// 2 をセットして欲しいので'SetTwo'という文字列を渡す
setSomeValue('SetTwo');
```

setSomeValue()関数は１つで良くなり、使う側で一定の文字列を渡すだけで良くなります。
setSomeValue()の中身は以下のように、switch ... caseを使ってこのように定義できそうです。

```
const setSomeValue = (str) => {
  switch (str) {
    case 'SetNull':
      setState(0);
    case 'SetTwo':
      setState(2);
    default:
      throw new Error();
  }
}
```

ステートが増えた場合は以下のように変更
```
const setSomeValue = (str) => {
  switch (str) {
    case 'SetNull':
      setState(0);
      setState({ value: 0, otherValue: false });
    case 'SetTwo':
      setState(2);
      setState({ value: 2, otherValue: true });
    default:
      throw new Error();
  }
}
```

## useReducerでステートの変更
ステートの一括更新はuseReducerというHooksで実現可能です。
useReducerはuseStateの大体Hooksで、ステートとdispatchを提供
```
const [state, dispatch] = useReducer(reducer, 0);
```
dispatchはuseStateの返り値のものとは違い、引数にオブジェクトを受け取り、
そのオブジェクトの内容をもとに、特定のステートを返却する(=ステートにセットする)という役割を
果たしています。このように使われます。

```
dispatch({ type: 'SetNull' });

dispatch({ type: 'SetTwo' });
```

先ほどのsetSomeValue()と同じことをuseReducerで書き換えてみましょう。

まず初期化はこのようになります。initialStateというオブジェクトをセット
```
const initialState = { value: 0, otherValue: false };

const [state, dispatch] = useReducer(reducer, initialState);
```

reducerは以下のような関数
```
const reducer = (state, action) => {
  switch (action.type) {
    case 'SetNull':
      return { value: 0, otherValue: false };
    case 'SetTwo':
      return { value: 2, otherValue: true };
    default:
      return state;
  }
}
```

第一引数にはstateをとり、第二引数にactionというオブジェクト受け取ります。
このactionは一般的に以下のような構造
```
const action = {
  type: 'SetNull',
  payload: { num: 3 }
}
```

まずtypeは文字列です。この文字列は特定のアクションの識別子で、ステートの更新に一意の文字列を与えます。
ここではSetNullやSetTwoをaction.typeに与えています。

またpayloadは特定のアクションに与える引数のようなものです。
必ずしもpayloadという名前にしなければいけないわけではなく、
慣例的に使われることが多いためそのようなkey名にしています。
このpayloadにはオブジェクトを与えることで、様々なデータをreducerに与えることができます

```
const reducer = (state, action) => {
  switch (action.type) {
    case 'SetNull':
      return { value: 0, otherValue: false };
    case 'SetTwo':
      return { value: 2, otherValue: true };
    case 'SetAny':
      return { value: action.payload.num, otherValue: true };
    default:
      return state;
  }
}
```

ここではaction.payload.numで値を参照し、それをvalueに渡しています。

そして、ここからが大事なのですが、useReducerの第一引数に与えられるreducer関数はただ文字列を見て、
それに対応する新たなステートを返却することしかしません。これが何を意味するか、というと、
このreducer関数の中に特定の文脈 + ステートが閉じ込められているということです。'
SetNull'という文字列を与えれば{ value: 0, otherValue: false }がステートにセットされ、
また'SetTwo'であれば{ value: 2, otherValue: true }が...
というように決まったルールの中でステートが更新されます。

このようにステートの変更とそれに伴うロジックをreducer関数の中に入れておくことで、
ロジックの汎用性が高くなるという利点があります。これをコンポーネントファイルの中で行うと、
似たようなロジックを使いたい別コンポーネントが現れたときに困ってしまいます。



