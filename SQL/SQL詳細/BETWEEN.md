## vbetween

範囲検索を行うにはBETWEENを使う
範囲検索　⇒　上限と下限の値を設定した検索

販売価格が500円から2000円までの商品名を取得
```
SELECT name, selling_price FROM Products
WHERE selling_price > 500 AND selling_price < 2000;
```
