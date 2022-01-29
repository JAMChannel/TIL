## ％wについて

```
[1] pry(main)> ['文', '字']
=> ["文", "字"]
```

```
[2] pry(main)> %W[文 字]
=> ["文", "字"]
```

## each活用
```
[5] pry(main)> %w[あ い う].each do |str|
[5] pry(main)*   puts str
[5] pry(main)* end  
あ
い
う
=> ["あ", "い", "う"]
```
## each でblankしたい場合
```
[6] pry(main)> %w[あ い う].each do |str|
[6] pry(main)*   break if str == "う"
[6] pry(main)*   puts str
[6] pry(main)* end  
あ
い
=> nil
```

## eachで一部スキップさせたい場合
```
[8] pry(main)> %w[あ い う].each do |str|
[8] pry(main)*   next if str == "い"  
[8] pry(main)*   puts str  
[8] pry(main)* end  
あ
う
=> ["あ", "い", "う"]
```

## 追加の場合
```
[10] pry(main)> %w[あ い う].map{|str| "(#{str})"}
=> ["(あ)", "(い)", "(う)"]
```
