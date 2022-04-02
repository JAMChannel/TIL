HTTPによるアクセス内容を調べる時に便利なcurlコマンドについて学習します。  
curlコマンドを使うと、シェルコマンドでWebサーバにアクセスして、  
Webページに関するいろいろな情報やデータを取得できます。  


```
curl https://paiza.jp/
```

## バージョン確認
```
curl --version
```

# オプション
-I レスポンスヘッダー

```
curl https://paiza.jp/ -I
```

## curlコマンドの出力を保存
```
 curl https://paiza.jp > paiza.html
```

## 参考
```
curl コマンド 使い方メモ - Qiita
https://qiita.com/yasuhiroki/items/a569d3371a66e365316f

curlコマンドの使い方　～GET、POST、REST（json）の確認と、windowsでの利用手順
https://viral-community.com/security/curl-8263/

cURL - Wikipedia
https://ja.wikipedia.org/wiki/CURL

cURL - Manual - Japanese Translation
http://zaurus.catstar.org/archive/curl_manual_ja.html

curl
https://curl.haxx.se/
```