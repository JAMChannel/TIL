

## ImageMagickをインストール

```
username:~/environment $ sudo yum -y install libpng-devel libjpeg-devel libtiff-devel gcc
username:~/environment $ cd
username:~ $ git clone https://github.com/ImageMagick/ImageMagick.git ImageMagick-7.0.11
username:~ $ cd ImageMagick-7.0.11
username:~/ImageMagick-7.0.11 $ ./configure
username:~/ImageMagick-7.0.11 $ make
username:~/ImageMagick-7.0.11 $ sudo make install
```

#### ImageMagickがインストールされているか確認
```
vocstartsoft:~/ImageMagick-7.0.11 (main) $ convert -version
```
実行結果に「Version: ImageMagick バージョン名」が出力されていればインストールは成功