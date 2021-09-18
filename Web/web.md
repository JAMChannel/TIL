

## HTTPについて学んだことを自分の言葉で説明してください。

### そもそもHTTPって何？
Hypertext Transfer Protocol（ハイパーテキスト・トランスファー・プロトコル）の略称になります。日本語でわかりやすく解釈すると***ホームページのファイル等を受け渡しするときに使うお約束事の一つ***になります。<br><br>

約束が守れていたら、webサーバ（webのアプリケーション）から 機器（PC）に情報が届くようにする通信システムと覚えておくと良いですね！！最近だと内容を見てしまうエッチな人もいるので、暗号化（HTTPS）して通信内容をわからないようにするのが主流です。

そうなってくると、通信をやり取りする方法***URL***が必要になります。

## URLとは？
一般的に理解されている文言としてURLとは住所です。先ほど勉強したHTTPが手紙だとすると住所がないと届きません。「URLは送り先の住所」と認識しておくと良いです。


アプリケーションを利用していると「この情報が見たい」と思うことがあると思います。その際に利用されるのが***リクエスト***になります。

## HTTPリクエストとは？
リクエストのイメージとしては「なんか要求されてるなぁ」といった感じです。
HTTPリクエストは実際のwebブラウザからwebサーバに対して「このページ頂戴」とリクエスト（要求）されている状況になります。

以下の画像を確認してみましょう
https://gyazo.com/dae8d8d7a3d2e13bc7f2f403c6aa3c14

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




### リクエストボディ（メッセージボディ）

 getの場合は補足で何か記載がある場合に記載する場所くらいの認識で良いかと思います。
 
 それではリクエストがあるということは***レスポンス***も存在します。
 
 ## HTTPレスポンスとは？
 リクエストにてwebサーバより取得した情報をクライアント（ PCなど）へ送る返却作業を指します。
 
 
 https://gyazo.com/7fd4a05ef270308ba7a536aaa0c027c7
 
 その中でもレスポンスヘッダーは、 HTTP レスポンスで使用できる HTTP ヘッダーで、メッセージの内容には関連しないのが通例とされています。
 
 ### HTTPレスポンスボディとは？
 
リクエストで要求した欲しかった HTMLファイルの中身の場所になります。

 
 
 それではレスポンスで受け取った内容を***ブラウザ***で表示できるはずですが、ブラウザとはなんでしょうか！！
 
 ## ブラウザとは？
 
 簡単にいうとインターネットを閲覧するためのツールの一つです。
 皆さんが利用している「Google Chrome（グーグルクローム）」「Safari（サファリ）」「Internet Explorer（インターネットエクスプローラー）」がそれに該当します。
 
 #### Google Chrome
 Googleが提供しているブラウザアプリ。
 開発環境の場ではよく利用されている印象
 
#### Firefox
PCのブラウザで目にすることが多い。Mozilla Corporationが提供しています。
ウェブ上での動きを追跡されるトラッキングの拒否、プライベートデータの消去などのプライバシー保護を考えた機能を搭載

#### Safari
SafariはiPhoneに標準でインストールされているブラウザアプリです。
SafariはPCで設定されたデザイン描画に強く、ウェブページのデザインが他のブラウザよりも正確に表示されるといわれています。

### サーバーとは

サーバーは、画面の無いPCと覚えておくと良きです。
アプリケーションはどこかのサーバーの中に保存されています。そこに通信することで、サービスが使えます。
ネットワーク（インターネット）を通じてシステム利用しているコンピュータはサーバーは必須です。

通信のやり取りに関しては説明しましたがここでHTTP通信に関して通信の種類が存在するので、通信方法の種類を紹介します。

### HTTPメソッドについて

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



## ステータスコードついて
一番上のレスポンス行で表示される3桁の番号のことです。

```
例
HTTP/1.1 200 OK
```

こちらは通信状況を確認するのによく使うので暗記レベルでおぼえておく価値ありです。

HTTP ２００番台


<table><tbody><tr><th>HTTPステータスコード</th><th>説明</th><th>状態</th></tr><tr><th><strong>200 OK</strong></th><td>リクエストが正常に処理できた</td><td>正常</td></tr><tr><th>201 Created</th><td>リクエストが成功してリソースの作成が完了</td><td>正常</td></tr><tr><th>202 Accepted</th><td>リクエストを受け取ったが処理はされていない</td><td>正常</td></tr><tr><th>203 Non-Authoritative Information</th><td>リクエストが成功したものの、変換プロキシによって<br>元のサーバーの200(OK)レスポンスからペイロードが変更された</td><td>正常</td></tr><tr><th>204 No Content</th><td>リクエストに対して送信するコンテンツは無いがヘッダは有用である</td><td>正常</td></tr><tr><th>205 Reset Content</th><td>クライアントにドキュメントビューをリセットするように指示</td><td>正常</td></tr><tr><th>206 Partial Content</th><td>要求された範囲のデータやリソースの一部分だけのリクエストが成功</td><td>正常</td></tr></tbody></table>

HTTP300番台

<table><tbody><tr><th>HTTPステータスコード</th><th>説明</th><th>状態</th></tr><tr><th><strong>300 Multiple Choice</strong></th><td>リクエストに対して複数のレスポンスがあることを示す</td><td>正常</td></tr><tr><th><strong>301 Moved Permanently</strong></th><td>恒久的に移動する</td><td>正常</td></tr><tr><th>302 Found</th><td>一時的に移動する<br>※ Google検索エンジンの検索リストでは旧URLを示すため<br>将来的に元のURLに戻すなどの時に利用します。</td><td>正常</td></tr><tr><th>304 Not Modified</th><td>更新されていない<br>※正常に処理されていますがブラウザキャッシュの内容を表示している為、<br>サーバからダウンロードをしていません。</td><td>正常</td></tr></tbody></table>


HTTP400番台
<table><tbody><tr><th>HTTPステータスコード</th><th>説明</th><th>状態</th></tr><tr><th>400 Bad Request</th><td>一般的なクライアントエラー</td><td>エラー</td></tr><tr><th>401 Unauthorized</th><td>アクセス権が無い、または認証に失敗</td><td>エラー</td></tr><tr><th>402 Payment Required</th><td>料金の支払いをするまでリクエストを処理できない状態</td><td>エラー</td></tr><tr><th><strong>403 Forbidden</strong></th><td>閲覧権限が無いファイルやフォルダ</td><td>エラー</td></tr><tr><th><strong>404 Not Found</strong></th><td>Webページが見つからない</td><td>エラー</td></tr><tr><th>405 Method Not Allowed</th><td>送信するクライアント側のメソッドが許可されていない</td><td>エラー</td></tr><tr><th>406 Not Acceptable</th><td>サーバ側が受付不可能な値（ファイルの種類など）であり提供できない状態</td><td>エラー</td></tr><tr><th>407 Proxy Authentication Required</th><td>プロキシサーバ経由で通信を行う際にプロキシサーバの認証情報が不足している</td><td>エラー</td></tr><tr><th>408 Request Timeout</th><td>リクエスト送信後のやり取りに時間が長すぎるため時間切れ</td><td>エラー</td></tr><tr><th>409 Conflict</th><td>サーバに既に存在しているデータが競合しているためリクエストを完了できない</td><td>エラー</td></tr><tr><th>410 Gone</th><td>ファイルが削除されたため、ほぼ永久的にWebページが存在しない</td><td>エラー</td></tr><tr><th>411 Length Required</th><td>Content-Lengthとはリクエストヘッダに送るデータ容量が書いてある項目<br>サーバの方でContent-Lengthヘッダが無いためアクセスを拒否した</td><td>エラー</td></tr><tr><th>412 Precondition Failed</th><td>ヘッダで定義された前提条件が満たされていない場合にアクセス拒否される</td><td>エラー</td></tr><tr><th>413 Payload Too Large</th><td>ファイルをアップロードする際にサーバで定めたファイル容量の<br>上限を超えてしまった為アクセス拒否された</td><td>エラー</td></tr><tr><th>414 URI Too Long</th><td>指定したURLが長すぎる</td><td>エラー</td></tr><tr><th>415 Unsupported Media Type</th><td>サーバで許可していないリクエストの種類の為アクセス拒否された</td><td>エラー</td></tr><tr><th>416 Range Not Satisfiable</th><td>サーバーがリクエストされた範囲（容量）を提供できない</td><td>エラー</td></tr><tr><th>417 Expectation Failed</th><td>サーバが拡張されたステータスコードを返すことが出来ない</td><td>エラー</td></tr><tr><th>422 Unprocessable Entity</th><td>WebDAVの拡張ステータスコード<br>リクエストは適正だが意味が異なるためサーバが返すことが出来ない</td><td>エラー</td></tr><tr><th>423 Locked</th><td>WebDAVの拡張ステータスコード<br>リクエスト内容がロックされているためサーバが返すことが出来ない</td><td>エラー</td></tr><tr><th>425 Too Early</th><td>サーバが繰り返し処理が発生される可能性のあるリクエストと判断したため<br>処理が出来ないと判断した<br>※ 無限ループでサーバに高負荷がかかるリスクの可能性がある為</td><td>エラー</td></tr><tr><th>426 Upgrade Required</th><td>Upgrading to TLS Within HTTP/1.1の拡張ステータスコード<br>HTTP/1.1にアップグレードが必要な為、サーバが処理できない</td><td>エラー</td></tr><tr><th>429 Too Many Requests</th><td>一定時間内にリクエスト数が多すぎるためアクセスを拒否した<br>※ DDos攻撃によるサーバダウンのリスクを回避する為</td><td>エラー</td></tr><tr><th>431 Request Header Fields Too Large</th><td>リクエストヘッダーが長すぎるためサーバ処理が拒否した</td><td>エラー</td></tr></tbody></table>

HTTP500番台

<table><tbody><tr><th>HTTPステータスコード</th><th>説明</th><th>状態</th></tr><tr><th>500 Internal Server Error</th><td>何らかのサーバ内で起きたエラー</td><td>エラー</td></tr><tr><th>501 Not Implemented</th><td>サーバーがリクエストに満たすのに必要な機能をサポートしていない</td><td>エラー</td></tr><tr><th>502 Bad Gateway</th><td>ゲートウェイ・プロキシサーバが不正なリクエストを受け取り拒否した</td><td>エラー</td></tr><tr><th>503 Service Unavailable</th><td>一時的にサーバにアクセスが出来ない</td><td>エラー</td></tr><tr><th>504 Gateway Timeout</th><td>リクエストを送ったサーバからの適切なレスポンスがなくタイムアウトした</td><td>エラー</td></tr><tr><th>505 HTTP Version Not Supported</th><td>HTTP バージョンがサーバによってサポートされていない</td><td>エラー</td></tr><tr><th>506 Variant Also Negotiates</th><td>Transparent Content Negotiation in HTTPで定義されている拡張ステータスコード<br>URLを返すコンテンツで配置ミスなどによる内部サーバエラー</td><td>エラー</td></tr><tr><th>507 Insufficient Storage</th><td>WebDAV拡張ステータスコード<br>サーバで処理するためのストレージ容量不足</td><td>エラー</td></tr><tr><th>508 Loop Detected</th><td>主に開発中のプログラム処理で、無限ループに陥ったためサーバーが操作を終了</td><td>エラー</td></tr><tr><th>510 Not Extended</th><td>主に静的ファイルへのアクセス集中による一時的に表示されるエラー</td><td>エラー</td></tr><tr><th>511 Network Authentication Required</th><td>ネットワーク認証が必要</td><td>エラー</td></tr></tbody></table>