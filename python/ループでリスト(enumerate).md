# ループでリストを処理する


```
team = ["勇者", "戦士", "魔法使い"]
print(team)
print(team[0])

for parson in team:
    print(parson)
    
for (i, person) in enumerate(team):
    print(str(i + 1) + "番目の" + person + "が、スライムと戦った")
```