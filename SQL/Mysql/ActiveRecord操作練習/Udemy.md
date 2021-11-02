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

#### 式を導入した場合
```
mysql> SELECT height/100 FROM members;
```








