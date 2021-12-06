現在のエラー
Webpacker::Manifest::MissingEntryError
現在、手動のデプロイにて本番環境のみ

本番環境
![](https://gyazo.com/a321e39f70db9057a9ec4d5e550b59fd/raw)



エラー部分が
Webpacker::Manifest::MissingEntryError
///省略///
 <%= javascript_pack_tag 'application' %>

現状topページを表示させているだけで何も実装していないため
webAPIなどの影響はなさそう
本番環境に関してはsudo vim /etc/environmentでsecret_key_baseを入れているだけ


仮説
・本番環境に関してはpacksを読み込ませる方法が何かある
・yarnがうまくいっていない

検証したこと
yarnを確認
[ec2-user@ip-172-31-42-156 mandarat-app]$ yarn -v
1.22.15
問題なさそう
yarn installで挙動確認
[ec2-user@ip-172-31-42-156 mandarat-app]$ yarn install
yarn install v1.22.15
[1/4] Resolving packages...
[2/4] Fetching packages...
info fsevents@2.3.2: The platform "linux" is incompatible with this module.
info "fsevents@2.3.2" is an optional dependency and failed compatibility check. Excluding it from installation.
info fsevents@1.2.13: The platform "linux" is incompatible with this module.
info "fsevents@1.2.13" is an optional dependency and failed compatibility check. Excluding it from installation.
error webpack-dev-server@4.6.0: The engine "node" is incompatible with this module. Expected version ">= 12.13.0". Got "10.24.1"
error Found incompatible module.
info Visit https://yarnpkg.com/en/docs/cli/install for documentation about this command.

error webpack-dev-server@4.6.0: The engine “node” is incompatible with this module. Expected version “>= 12.13.0”. Got “10.24.1"
error Found incompatible module.
のエラーが気になる

yarn install --ignore-engines
エラー解決