## HTTPについて学んだことを自分の言葉で説明してください。

### そもそもHTTPって何？
Hypertext Transfer Protocol（ハイパーテキスト・トランスファー・プロトコル）の略称になります。日本語でわかりやすく解釈すると***ホームページのファイル等を受け渡しするときに使うお約束事の一つ***になります。<br><br>

約束が守れていたら、webサーバ（webのアプリケーション）から 機器（PC）に情報が届くようにする通信システムと覚えておくと良いですね！！最近だと内容を見てしまうエッチな人もいるので、暗号化（HTTPS）して通信内容をわからないようにするのが主流です。

そうなってくると、通信をやり取りする方法***URL***が必要になります。


## HTTPリクエストとは？
リクエストのイメージとしては「なんか要求されてるなぁ」といった感じです。
HTTPリクエストは実際のwebブラウザからwebサーバに対して「このページ頂戴」とリクエスト（要求）されている状況になります。

以下の画像を確認してみましょう


 ![](https://gyazo.com/dae8d8d7a3d2e13bc7f2f403c6aa3c14/raw)

私は今回「https://www.google.com/」の情報を頂戴とリクエストしました。
ネットワークタブをみてみるとGETにてリクエストされているのが確認取れますね！！

そうなると少し画像の中にある内容を解説します。

```
:authority: www.google.com
:method: GET
:path: /
:scheme: https
accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
accept-encoding: gzip, deflate, br
accept-language: ja,en-US;q=0.9,en;q=0.8
///省略
sec-fetch-mode: navigate

}

```

### リクエストヘッダー（メッセージヘッダー）


ネットワークタブだけみるとよくわからないという印象ですが、簡潔にまとめるとhttpリクエストに対して「決まり事」「お願いごと」をしている詳細的な情報を持っている場所になります。



<table><tbody><tr><td>ヘッダフィールドの種類</td><td>HTTPバージョン</td><td>意味</td></tr><tr><td>1.0</td><td>1.1</td></tr><tr><td>ジェネラル・ヘッダ</td><td>&nbsp;</td><td>&nbsp;</td><td>要求と応答の双方で使われるヘッダ・フィールド</td></tr><tr><td>Date</td><td>○</td><td>○</td><td>作成された日付</td></tr><tr><td>Pragma</td><td>○</td><td>○</td><td>データのキャシュの許容などの通信オプション。no-cacheなる値はサーバがフレッシュな情報をかえすことを示す</td></tr><tr><td>Cache-Control</td><td>&nbsp;</td><td>○</td><td>キャシュを制御するための情報</td></tr><tr><td>Connection</td><td>&nbsp;</td><td>○</td><td>応答送信後にTCPコネクションを切断するか否かなどの通信オプションConnection: close行は応答の後にTCP切断を指示.Connection: KeepAliveはコネクションの継続を支持</td></tr><tr><td>Transfer-Encoding</td><td>&nbsp;</td><td>○</td><td>ボディ部分のエンコーディング方式</td></tr><tr><td>Upgrade</td><td>&nbsp;</td><td>○</td><td>HTTP/1.1以外のプロトコルに切り替える</td></tr><tr><td>Via</td><td>&nbsp;</td><td>○</td><td>伝達途中で経由したノードが記録</td></tr><tr><td>MIME-Version</td><td>△</td><td>&nbsp;</td><td>Content-Typeなどで使うMIMEのバージョン</td></tr><tr><td>要求ヘッダ</td><td>&nbsp;</td><td>&nbsp;</td><td>要求の付加情報として使われるヘッダ・フィールド</td></tr><tr><td>Authorization</td><td>○</td><td>○</td><td>ユーザ認証用データ。サーバからのWWW-Authenticateヘッダに応える</td></tr><tr><td>From</td><td>○</td><td>○</td><td>要求送信元のメールアドレス</td></tr><tr><td>If-Modified-Since</td><td>○</td><td>○</td><td>ここに指定された日付以降に更新された情報のみを要求</td></tr><tr><td>Referer</td><td>○</td><td>○</td><td>現在のページを取得するときにユーザが使ったリンクを含むページのURL</td></tr><tr><td>User-Agent</td><td>○</td><td>○</td><td>ブラウザのタイプ、ブラウザ固有のコンテンツを返すときに有用</td></tr><tr><td>Accept</td><td>△</td><td>○</td><td>そのブラウザが欲しいMIMEのタイプ</td></tr><tr><td>Accept-Charset</td><td>△</td><td>○</td><td>そのブラウザが期待する文字セット</td></tr><tr><td>Accept-Encoding</td><td>△</td><td>○</td><td>そのブラウザがデコードできるデータのエンコーディング（gzipなど）。大きなファイルのダウンロードに有効</td></tr><tr><td>Accept-Language</td><td>△</td><td>○</td><td>そのブラウザが予期している言語。サーバが多国語に対応しているときなどに使う</td></tr><tr><td>Host</td><td>&nbsp;</td><td>○</td><td>もとのURLにリストされているホストとポート</td></tr><tr><td>If-Match</td><td>&nbsp;</td><td>○</td><td>Etag参照</td></tr><tr><td>If-None-Match</td><td>&nbsp;</td><td>○</td><td>Etag参照</td></tr><tr><td>If-Range</td><td>&nbsp;</td><td>○</td><td>情報が更新されていないときはRangeで指定した範囲の情報を、層でなければ全体を要求</td></tr><tr><td>If-Unmodified-Since</td><td>&nbsp;</td><td>○</td><td>指定された日時以降更新されていなかったときに応答を返す</td></tr><tr><td>Max-Forwards</td><td>&nbsp;</td><td>○</td><td>TRACEメソッドとともに使う。経由するポートの最大数指定</td></tr><tr><td>Proxy-Authorization</td><td>&nbsp;</td><td>○</td><td>Proxy-Authenticateに対応して、プロキシにユーザ認証情報を通知</td></tr><tr><td>Range</td><td>&nbsp;</td><td>○</td><td>データの一部を要求する</td></tr><tr><td>応答ヘッダ</td><td>&nbsp;</td><td>&nbsp;</td><td>応答の付加情報として使われるヘッダ・フィールド</td></tr><tr><td>Location</td><td>○</td><td>○</td><td>絶対URLで正確な情報の位置を通知</td></tr><tr><td>Server</td><td>○</td><td>○</td><td>サーバ・ソフトの名称やバージョンに関する情報</td></tr><tr><td>WWW-Authenticate</td><td>○</td><td>○</td><td>ユーザ認証用のデータを返す</td></tr><tr><td>Accept-Ranges</td><td>○</td><td>○</td><td>Range要求があったときに対応可能か通知</td></tr><tr><td>Age</td><td>&nbsp;</td><td>○</td><td>キャッシュされたデータが古くなっていないかの判断用データ</td></tr><tr><td>Proxy-Authenticate</td><td>&nbsp;</td><td>○</td><td>WWW-Authenticateと等価だがプロキシからクライアントに送る</td></tr><tr><td>Public</td><td>&nbsp;</td><td>○</td><td>対応するメソッドの一覧をクライアントに通知</td></tr><tr><td>Retry-After</td><td>△</td><td>○</td><td>現在サービスできないので指定時刻または指定経過時間後の再要求を要請</td></tr><tr><td>Vary</td><td>&nbsp;</td><td>○</td><td>言語、文字コードなど複数の表現形式が許されている場合のネゴシエーションで、サーバがどれを選択したか通知</td></tr><tr><td>Warning</td><td>&nbsp;</td><td>○</td><td>応答のステータス番号の付加情報で、警告</td></tr><tr><td>Alternates</td><td>&nbsp;</td><td>△</td><td>言語、文字コードなど他に許されるものが無いか問い合わせる</td></tr><tr><td>エンティティ・ヘッダ</td><td>&nbsp;</td><td>&nbsp;</td><td>エンティティ（ボディ部分の情報）の付加情報として使われるヘッダ・フィールド</td></tr><tr><td>Allow</td><td>○</td><td>○</td><td>指定したURIで使用可能なメソッド</td></tr><tr><td>Content-Encoding</td><td>○</td><td>○</td><td>圧縮などのエンコーディングが使われているときに、使われている方式</td></tr><tr><td>Content-Length</td><td>○</td><td>○</td><td>エンティティの長さをバイトで示す</td></tr><tr><td>Content-Type</td><td>○</td><td>○</td><td>MIME仕様で定義されているコンテントの形式</td></tr><tr><td>Expires</td><td>○</td><td>○</td><td>コンテントの有効期限</td></tr><tr><td>Last-Modified</td><td>○</td><td>○</td><td>今テントの最終更新日時</td></tr><tr><td>Content-Base</td><td>&nbsp;</td><td>○</td><td>Content-Locationなどが相対位置で示されているときのベース</td></tr><tr><td>Content-Language</td><td>&nbsp;</td><td>○</td><td>使われている言語ja(日本語)やen（英語）など</td></tr><tr><td>Content-Location</td><td>&nbsp;</td><td>○</td><td>サーバ上の今テントの位置をURIで示す</td></tr><tr><td>Content-MD5</td><td>&nbsp;</td><td>○</td><td>MD5のアルゴリズムで生成した改ざんやエラー検出情報</td></tr><tr><td>Content-Range</td><td>&nbsp;</td><td>○</td><td>一部分が要求されたときにどの部分が返されているかを知らせる</td></tr><tr><td>Etag</td><td>&nbsp;</td><td>○</td><td>前回の応答と今回の応答とを関連付ける情報。前回の応答でサーバが特定の値をクライアントに渡し、その値でIf-Match、If-Non-Match、If-Rangeなどでクライアントが要求してきたら前回の継続とサーバが識別できる。（セッション管理に使える）</td></tr><tr><td>Content-Version</td><td>&nbsp;</td><td>△</td><td>エンティティのバージョン</td></tr><tr><td>Derived-From</td><td>&nbsp;</td><td>△</td><td>PUTやPATCHメソッドで情報を更新するとき、更新の元となったバージョンを示す</td></tr><tr><td>Link</td><td>&nbsp;</td><td>△</td><td>複数の情報間の関連</td></tr><tr><td>URI</td><td>△</td><td>△</td><td>現在使われず</td></tr><tr><td>Title</td><td>△</td><td>&nbsp;</td><td>情報のタイトル</td></tr></tbody></table>

余談ですが
```
$ curl --http1.1 --get -v https://www.google.com/    
///省略
*  SSL certificate verify ok.
> GET / HTTP/1.1
> Host: www.google.com
> User-Agent: curl/7.71.1
> Accept: */*
///省略
```

### HTTPメソッドについて
HTTPメソッドはいくつかの種類があり、それぞれが「特定のリソース」に
対するアクションに対応しています。

代表格はこちら
```
GET
GET メソッドは、指定したリソースの表現をリクエストします。 GET を使用するリクエストは、データの取り込みに限ります。

HEAD
HEAD メソッドは GET リクエストと同じレスポンスを求めますが、レスポンス本文はありません。

POST
POST は指定したリソースに実体を送信するために使用するメソッドであり、サーバー上の状態を変更したり、副作用が発生したりすることがよくあります。

PUT
PUT メソッドは対象リソースの現在の表現の全体を、リクエストのペイロードで置き換えます。

DELETE
DELETE メソッドは、指定したリソースを削除します。

CONNECT
CONNECT メソッドは、対象リソースで識別されるサーバーとの間にトンネルを確立します。
OPTIONS
OPTIONS メソッドは、対象リソースの通信オプションを示すために使用します。
TRACE
TRACE メソッドは、対象リソースへのパスに沿ってメッセージのループバックテストを実行します。

PATCH
PATCH メソッドは、リソースを部分的に変更するために使用します。
```
