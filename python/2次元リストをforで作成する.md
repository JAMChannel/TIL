# coding: utf-8
# Your code here!

# 2次元リストをforで作成する

```
numbers = [i * 2 for i in range(10)]
print(numbers)
print(len(numbers))

numbers2 = [[1 for i in range(3)] for j in range(4)]
numbers2[0][1] = 2
print(numbers2)

```