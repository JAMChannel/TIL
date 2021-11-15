# pandas関数について

```
# importし pandas をpdという名前で使用できるようにします。
import pandas as pd
# pandasのDataFrame関数を呼び出し
df = pd.DataFrame({'国語': [90, 60, 70]})
print (df)
```
## DataFrame()
データフレームの新規作成。
ただし、ファイルやクリップボードなどからデータを読み込む際は後述の別関数を使用します。
使いどころ（例）
ファイルからではなくdict型やndarray型のデータをデータフレームに変換する時。

<table><tbody><tr><th>引数名</th><th>初期値</th><th>説明</th><th>サンプル</th></tr><tr><td>data</td><td>None</td><td>データフレームに登録するデータ</td><td>data = {'名前': ['A', 'B'], '国語': [90, 60], '数学': [70, 100]}</td></tr><tr><td>index</td><td>None</td><td>作成するデータフレームに設定する行番号</td><td>index = ['AA', 'BB']</td></tr><tr><td>columns</td><td>None</td><td>作成するデータフレームに設定する列名</td><td>columns = ['name', 'lang', 'math']</td></tr></tbody></table>

## index

```
df = pd.DataFrame(data = {'name':['A', 'B'], '国語':[90, 60], '数学': [70, 100]}, index=['a', 'b'])
print (df)
```
