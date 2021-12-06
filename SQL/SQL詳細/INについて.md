ORで複数の条件式をつなぐ必要がある場合はINを使うとスッキリ書ける

ORを使った場合
```
SELECT name, selling_price FROM Products
WHERE selling_price = 100
   OR selling_price = 2300
   OR selling_price = 9800;
```

INを使った場合
```
SELECT name, selling_price FROM Products
WHERE selling_price IN (100, 2300, 9800);
```

反対に、販売価格が100円、2300円、9800円以外の
商品を選択したいときはNOT INを使う

例：販売価格が100円、2300円、9800円以外の商品の名前と値段を取得する
INを使った場合

```
SELECT name, selling_price FROM Products
WHERE selling_price NOT IN (100, 2300, 9800);
```