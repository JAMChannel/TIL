# 2次元配列をmapで作成する
```
numbers = Array.new(10 ,1)
p numbers

numbers2 = Array.new(4 ,Array.new(3, 1))
numbers2[0][1] = 2
p numbers2

numbers3 = Array.new(4).map{Array.new(3, 1)}
numbers3[0][1] = 2
p numbers3

```

## 出力

```
[1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
[[1, 2, 1], [1, 2, 1], [1, 2, 1], [1, 2, 1]]
[[1, 2, 1], [1, 1, 1], [1, 1, 1], [1, 1, 1]]
```