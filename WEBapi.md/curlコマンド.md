# 全部取得
```
curl https://paiza.jp/paijo_charactors
```

# 名前を指定して取得
```
curl https://paiza.jp/paijo_charactors?name=kirishima
```

# 存在しない名前の場合は、404
```
curl https://paiza.jp/paijo_charactors?name=kiri
curl -i https://paiza.jp/paijo_charactors?name=kiri
```

# いいねを追加
```
curl https://paiza.jp/paijo_charactors/like -X POST -d "name=rokumura"
```

# いいね：存在しない名前の場合は、404
```
curl https://paiza.jp/paijo_charactors/like -X POST -d "name=neko"
curl https://paiza.jp/paijo_charactors/like -i -X POST -d "name=neko"

```

## kk