## seedファイル
jobs テーブル
```
[
  ['医師', 1232],
  ['弁護士', 1028],
  [ 'SE', 515],
  ['会計士', 1024],
  ['薬剤師', 542],
  ['保育士', 341],
  ['大学教授', 1050],
  [ '塾講師', 361],
].each do |name, salary|
  Job.create!(
    { name: name, salary: salary}
  )
end
```
```
mysql> DESC jobs;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | bigint(20)   | NO   | PRI | NULL    | auto_increment |
| name       | varchar(255) | NO   |     | NULL    |                |
| salary     | int(11)      | NO   |     | NULL    |                |
| created_at | datetime     | NO   |     | NULL    |                |
| updated_at | datetime     | NO   |     | NULL    |                |
```

```
[
  ['佐藤', 170.2, 65.2, 60, 4],
  ['鈴木', 151.5, 50.3, 53, 2],
  ['高橋', 182.1, 85.1, 31, 8],
  ['田中', 163.5, 70.6, 36, 3],
  ['渡辺', 157.8, 55.8, 62, 7],
  ['伊藤', 173.0, 65.3, 75, 1],
  ['山本', 166.4, 49.1, 25, 5],
  ['中村', 144.1, 56.9, 45, 7],
  ['小林', 168.7, 90.1, 38, 3],
  [  '加藤', 178.6, 78.5, 26, 6]
].each do |name, height, weight, age, job_id|
  Member.create!(
    { name: name, height: height, weight: weight, age: age, job_id: job_id}
  )
end
```

```
mysql> DESC members;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | bigint(20)   | NO   | PRI | NULL    | auto_increment |
| name       | varchar(255) | NO   |     | NULL    |                |
| height     | float        | NO   |     | NULL    |                |
| weight     | float        | NO   |     | NULL    |                |
| age        | int(11)      | NO   |     | NULL    |                |
| job_id     | int(11)      | NO   |     | NULL    |                |
| created_at | datetime     | NO   |     | NULL    |                |
| updated_at | datetime     | NO   |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
8 rows in set (0.02 sec)
```
## select文練習

```
mysql> SELECT height,weight FROM members;
```

```
Member.select(:height, :weight)
```



## where文練習
- SQL
```
mysql> SELECT name FROM members WHERE height >= 180;
+--------+
| name   |
+--------+
| 高橋   |
+--------+
1 row in set (0.03 sec)
```
- クエリインターフェース

```
Member.where('height >= 180')

?を入れる場合
Member.where('height >= ?',180)

nameカラムのみ取り出したい場合
Member.where('height >= ?',180).select(:name)
```
?はプレースホルダーと呼ばれ、第二引数で指定した値が置き換えられます。
sqlインジェクションに対するセキュリティ面を考慮することが可能

 ## whereテスト
身長が170センチ以上 かつ 体重が70キロ以下のnameを取得

- SQL
```
mysql> SELECT name FROM members WHERE height >= 170 AND weight <= 70;
+--------+
| name   |
+--------+
| 佐藤   |
| 伊藤   |
+--------+
2 rows in set (0.01 sec)
```

- クエリインターフェース
```
Member.where(['height >= 170 and weight <= 70']).select(:name)
```

身長が170センチ以上 もしくは 体重が70キロ以下のnameを取得
- SQL
```
mysql> SELECT name FROM members WHERE height >= 170 OR weight <= 70;
+--------+
| name   |
+--------+
| 佐藤   |
| 鈴木   |
| 高橋   |
| 渡辺   |
| 伊藤   |
| 山本   |
| 中村   |
| 加藤   |
+--------+
8 rows in set (0.02 sec)
```

- クエリインターフェース
```
Member.where("height >= ? or weight <= ?", 180, 70).select(:name)
```
## count練習
- SQL
```
mysql> SELECT COUNT(*) FROM members WHERE age >= 50;
+----------+
| COUNT(*) |
+----------+
|        4 |
+----------+
1 row in set (0.00 sec)
```
- クエリインターフェース
```
Member.where('age >= 50').count
```

## ORDER BY 練習
- SQL
170以上のnameとageを年齢の高い順に取得
```
mysql> SELECT name,age FROM members WHERE height >= 170 ORDER BY age DESC;
+--------+-----+
| name   | age |
+--------+-----+
| 伊藤   |  75 |
| 佐藤   |  60 |
| 高橋   |  31 |
| 加藤   |  26 |
+--------+-----+
4 rows in set (0.00 sec)
```

- クエリインターフェース
```
.order("created_at DESC")
```

## GROUP BY 練習
- SQL
```
mysql> SELECT job_id, COUNT(*) FROM members GROUP BY job_id;
+--------+----------+
| job_id | COUNT(*) |
+--------+----------+
|      1 |        1 |
|      2 |        1 |
|      3 |        2 |
|      4 |        1 |
|      5 |        1 |
|      6 |        1 |
|      7 |        2 |
|      8 |        1 |
+--------+----------+
8 rows in set (0.06 sec)
```


- クエリインターフェース
 ```
 Member.group(:job_id).count
 ```
## GROUP BY 練習
#### GROUP BYで平均身長を割り出す
mysql> SELECT job_id, AVG(height) FROM members GROUP BY job_id;
+--------+--------------------+
| job_id | AVG(height)        |
+--------+--------------------+
|      1 |                173 |
|      2 |              151.5 |
|      3 |  166.0999984741211 |
|      4 |  170.1999969482422 |
|      5 | 166.39999389648438 |
|      6 | 178.60000610351562 |
|      7 | 150.95000457763672 |
|      8 | 182.10000610351562 |
+--------+--------------------+
8 rows in set (0.02 sec)

- クエリインターフェース
 ```
 Member.group(:job_id).average("height")
 ```




