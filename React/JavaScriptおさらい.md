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