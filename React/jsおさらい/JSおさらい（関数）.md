## ES6について
変数を宣言する(箱に名前をつける)ことにおいて、
JavaScriptでは主に３つの方法があります。

- var
- let
- const

#### 原則としてconstを使う
constで宣言した変数は再代入、再宣言できません。
```
const hoge = 1;
hoge;
// 1

hoge = 2;
// Uncaught TypeError: Assignment to constant variable.
```

#### 再代入・再宣言したい場合にはletを使う

varとletの大きな違いである「スコープ」にあります
- varはその適用範囲であるスコープが関数スコープ
(functionなどで宣言された関数の中すべてに適用されること)

- letはブロックスコープ({}で囲われたブロックの中すべてに適用されること)の違いにあります
ブロックスコープのほうが閉じられたスコープであり、バグを生みにくいということから、varよりletが好まれます。

## データ型
```
String(文字列): テキストなど('Hoge'など)
Number(数値): 整数、浮動小数点数(12や1.23など)
Boolean(真偽値): trueまたはfalse
null: nullであることを表す
undefined: 未定義であることを表す
https://developer.mozilla.org/ja/docs/Web/JavaScript/Data_structures
```

## 関数
関数を宣言する方法はいくつかあります。まずはfunction文です。

#### function文
```
function diff(bigNum, smallNum) {
  return bigNum - smallNum;
};

diff(2, 1);
// 1

diff(15, 10);
// 5
```

#### 「アロー関数」
理由はアロー関数の方が端的に書ける

```
// argという引数を受け取って、 => のあとに処理を記述します
(arg) => arg + 1;


const sum = (arg) => arg + 1;

sum(3);
// 4
```

ちなみに先ほどfunctionではreturnを書くことで、値が出力されると説明しましたが、
アロー関数では{}を付けない場合returnは省略されます。つまり上記のsumは以下と同じです。

```
const sum = (arg) => {
  return arg + 1;
};
```

#### map, forEach
JavaScriptは他の言語と同様にArrayクラスを持ちます。
```
// [ と ]の間に値を , で区切って入れる
const arr = ['A',true,9];

// arrの中身を取り出すときは[]の中に整数値の添字を入れます
// 添字は先頭から0,1,2...となります
arr[0];
// 'A'
arr[1];
// true
arr[2];
// 9
```

もちろん配列に値を追加(push)したり、むしろ削除(pop)したりすることもできます

```
const numArr = [10, 11, 12];

// 末尾に追加
numArr.push(13);
// [10, 11, 12, 13]

// 末尾から削除
numArr.pop();
// [10, 11, 12]

// 配列に入っているデータの数、長さを取得
numArr.length;
// 3
```
#### map
mapはこの配列を新たに生成するメソッドです。そして、mapは引数に関数を受け取ります。具体的にみていきます。
```
const simpleNum = [1,2,3];
// mapは配列のデータを先頭から舐めていき、numという引数に渡します
simpleNum.map(num => num + 1);
// [2,3,4]
```

##### function文で定義した関数
```

function sumNums(num) {
  return num + 1;
};

// 引数は省略されます
simpleNum.map(sumNums);

```

こうしてみると分かりやすい
```
const simpleNum = [1,2,3];

const summedNum = simpleNum.map(num => num + 1);

console.log(simpleNum);
// [1,2,3]

console.log(summedNum);
// [2,3,4]
```