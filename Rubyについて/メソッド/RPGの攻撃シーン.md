# RPGの攻撃シーン

```
def attack(enemy)
    puts  "勇者は、#{enemy}を攻撃した。"
    hit = rand(1..10)
    if hit < 6
        puts "#{enemy}に、#{hit}のダメージを与えた"
    else
        puts "クリティカルヒット！#{enemy}に、100のダメージを与えた！！"
    end
end

enemies = ["スライム", "モンスター", "ドラゴン"]
enemies.each do |enemy|
    # puts  "勇者は、#{enemy}を攻撃した。"
    attack(enemy)
end

```