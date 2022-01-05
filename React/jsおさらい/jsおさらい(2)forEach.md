# forEach

```
const numList = [1,2,3];

numList.forEach(n => console.log(n));
// 1
// 2
// 3
```


## Promise
まず、Promiseとは非同期処理が正常に完了したこと、エラーが発生したことを検知するためのオブジェクト

```
// Aと表示する
console.log('A');

// 0.5秒後にBと表示する
setTimeout(() => {
  console.log('B');
}, 500);

// Cと表示する
console.log('C');
```

「A -> C -> B」の順番で処理されたのがわかると思います。本来的には'B'のところで0.5秒待ってから
「B -> C」と処理が続きそうなものです。しかし、JavaScriptの場合これらは「非同期的」に処理が行われます。

非同期処理の結果を「成功」と「失敗」に分けて擬似的に同期的処理を作り出すのがPromiseです。

Promiseには３つの状態があります。
- pending: 結果を待っている状態(成功/失敗どちらでもない)
- fulfilled: 処理が成功した状態
- rejected: 処理が失敗した状態