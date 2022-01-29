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


### 再起動
```
sudo systemctl restart nginx
```

### cronを設定する
```
sudo crontab -u root -e

00 01 01 * * root  certbot renew --force-renew --post-hook "sudo systemctl restart nginx"
```

### config/environments/production.rbの50行目付近、
```
config.force_ssl=true
```

### 確認
```
 sudo crontab -u root -l
```