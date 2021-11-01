# ハッシュをループで処理する

```

enemies = {"ザコ" => "スライム", "中ボス" => "ドラゴン", "ラスボス" => "魔王"}

p enemies

enemies.each_value do |enemy|
    puts "#{enemy}が、あらわれた"
end

enemies.each do |rank, enemy|
	puts "#{rank}の#{enemy}が、現れた！"
end
```