

```
nam = [3, 1, 4, 1, 5]
res = []

nam.each do |item|
    res.push(item * 10)
end

p res
```


## mapメソッド

```
nam = [3, 1, 4, 1, 5]
res = nam.map do |item|
    item * 10
end
p res
```