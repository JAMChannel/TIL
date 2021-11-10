# ループで配列を処理する

```
team = ["勇者", "戦士", "魔法使い"]
team.each_with_index do |person, i|
    puts "#{i + 1}番目の#{person}が、スライムと戦った"
end

```