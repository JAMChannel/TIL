## HTTPS接続

EC2のセキュリティグループ（インバウンド）にHTTPSを追加

#### nginxのconfファイルを編集する

```
# https add config 
proxy_set_header X-FORWARDED_PROTO https;
```


#### Certbotを実装する
```
$ cd 
$ sudo wget -r --no-parent -A 'epel-release-*.rpm' http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/
$ sudo rpm -Uvh dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-*.rpm
$ sudo yum-config-manager --enable epel*
$ sudo yum install -y certbot python2-certbot-nginx
$ sudo certbot --nginx
```